// 공연 목록 + 페이지네이션 불러오기 함수
function loadPerformanceList(pageNum) {
  const listContainer = document.getElementById("performanceList");
  const paginationContainer = document.getElementById("performancePagination");
  
  listContainer.innerHTML = "<p>불러오는 중...</p>";
  paginationContainer.innerHTML = "";

  fetch(`/performance/performanceListJson?pageNum=${pageNum}&amount=5`)
    .then(response => response.json())
    .then(data => {
      const list = data.performanceList;
      if (!list || list.length === 0) {
        listContainer.innerHTML = "<p>공연 정보가 없습니다.</p>";
        return;
      }

      // 공연 목록 테이블 생성
      let html = `<table border="1" style="width: 100%; border-collapse: collapse;">
                    <thead>
                      <tr>
                        <th>이미지</th>
                        <th>분류</th>
                        <th>공연명</th>
                        <th>장소</th>
                        <th>기간</th>
                      </tr>
                    </thead>
                    <tbody>`;
      list.forEach(performance => {
        html += `<tr class="performance-item" data-img="${performance.image}" data-imgkey="${performance.imgKey}" 
        data-title="${performance.eventName}"  data-category="${performance.category}" data-place="${performance.place}">
                  <td><img src="${performance.image}" alt="포스터" width="80"></td>
                  <td>${performance.category}</td>
                  <td>${performance.eventName}</td>
                  <td>${performance.place}</td>
                  <td>${performance.period}</td>
                </tr>`;
      });
      html += `</tbody></table>`;
      listContainer.innerHTML = html;

      // 페이징 계산
      const totalCount = data.totalCount;
      const amount = data.amount;
      const totalPages = Math.ceil(totalCount / amount);

      // 페이지네이션 버튼 생성
		const maxButtons = 10; // 한 번에 보여줄 최대 페이지 버튼 개수
		let startPage = Math.max(1, pageNum - Math.floor(maxButtons / 2));
		let endPage = startPage + maxButtons - 1;
		
		if (endPage > totalPages) {
		  endPage = totalPages;
		  startPage = Math.max(1, endPage - maxButtons + 1);
		}
		
		if (totalPages > 1) {
		  // 이전 버튼
		  if (pageNum > 1) {
		    const prevBtn = document.createElement("button");
		    prevBtn.textContent = "Prev";
		    prevBtn.style.margin = "0 5px";
		    prevBtn.addEventListener("click", () => loadPerformanceList(pageNum - 1));
		    paginationContainer.appendChild(prevBtn);
		  }
		
		  // 숫자 버튼들
		  for(let i = startPage; i <= endPage; i++) {
		    const btn = document.createElement("button");
		    btn.textContent = i;
		    btn.style.margin = "0 5px";
		    if (i === pageNum) btn.disabled = true;
		    btn.addEventListener("click", () => loadPerformanceList(i));
		    paginationContainer.appendChild(btn);
		  }
		
		  // 다음 버튼
		  if (pageNum < totalPages) {
		    const nextBtn = document.createElement("button");
		    nextBtn.textContent = "Next";
		    nextBtn.style.margin = "0 5px";
		    nextBtn.addEventListener("click", () => loadPerformanceList(pageNum + 1));
		    paginationContainer.appendChild(nextBtn);
		  }
		}

      // 공연 선택 시 데이터 반영 및 모달 닫기
      document.querySelectorAll(".performance-item").forEach(row => {
        row.style.cursor = "pointer";
        row.addEventListener("click", function() {
          const img = this.getAttribute("data-img");
          const imgKey = this.getAttribute("data-imgkey");
          const title = this.getAttribute("data-title");
          const place = this.getAttribute("data-place");
		  const category = this.getAttribute("data-category");

          // 폼 필드에 반영
          const imgInput = document.querySelector('input[name="img"]');
          const imgKeyInput = document.querySelector('input[name="imgKey"]');
          const titleInput = document.querySelector('input[name="title"]');
          const placeInput = document.querySelector('input[name="place"]');
          const categoryInput = document.querySelector('input[name="category"]');

          if(imgInput) imgInput.value = img;
          if(imgKeyInput) imgKeyInput.value = imgKey;
          if(titleInput) titleInput.value = title;
          if (placeInput) placeInput.value = place;
		  if (categoryInput) categoryInput.value = category;

          // 모달 닫기
          document.getElementById("performanceModal").style.display = "none";

          // 미리보기 이미지 갱신
          const imgPreview = document.querySelector(".imgUrl");
          if (imgPreview) {
            imgPreview.src = img;
            imgPreview.alt = title;
          }
        });
      });
    })
    .catch(err => {
      listContainer.innerHTML = "<p>데이터를 불러오는 중 오류가 발생했습니다.</p>";
      console.error(err);
    });
}

document.addEventListener("DOMContentLoaded", function() {
  // 모달 열기 버튼
  document.getElementById("selectPerformanceBtn").addEventListener("click", function() {
    document.getElementById("performanceModal").style.display = "block";
    loadPerformanceList(1);
  });

  // 모달 닫기 버튼
  document.querySelector("#performanceModal .close").addEventListener("click", function() {
    document.getElementById("performanceModal").style.display = "none";
  });

  // 모달 외부 클릭 시 닫기
  window.addEventListener("click", function(event) {
    const modal = document.getElementById("performanceModal");
    if (event.target === modal) {
      modal.style.display = "none";
    }
  });
});
