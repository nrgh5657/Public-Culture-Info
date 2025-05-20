package com.project.service;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import com.project.domain.PerformanceVO;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class PerformanceService {

	public List<PerformanceVO> fetchPerformances() {
        List<PerformanceVO> list = new ArrayList<>();

        try {
            String apiUrl = "http://openapi.seoul.go.kr:8088/6b6159777a6b796f37364c66715763/json/culturalEventInfo/1/20/"; // 실제 API 주소로 변경

            URL url = new URL(apiUrl);
            BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }

            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(sb.toString());
            
            JsonNode items = root.path("culturalEventInfo").path("row");

            for (JsonNode node : items) {
                PerformanceVO vo = new PerformanceVO();
                vo.setEventName(node.path("TITLE").asText());
                vo.setCategory(node.path("CODENAME").asText());
                vo.setPlace(node.path("PLACE").asText());
                vo.setImage(node.path("MAIN_IMG").asText());
                vo.setPeriod(node.path("DATE").asText()); // "기간"
                vo.setPaid(node.path("IS_FREE").asText()); // "무료" / "유료"
                list.add(vo);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
