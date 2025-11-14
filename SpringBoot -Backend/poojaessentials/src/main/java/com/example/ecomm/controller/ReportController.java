package com.example.ecomm.controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.ecomm.repository.ReportRepository;
import com.example.ecomm.dto.ReportDto;
import java.util.*;

@RestController
@RequestMapping("/api/reports")
@CrossOrigin("*")
public class ReportController {

    @Autowired
    private ReportRepository reportRepository;

    @GetMapping("/daily")
    public List<ReportDto> getDailyReport() {
        return convert(reportRepository.findDailyReport());
    }
    @GetMapping("/weekly")
    public List<ReportDto> getWeeklyReport() {
        return convert(reportRepository.findWeeklyReport());
    }


    @GetMapping("/monthly")
    public List<ReportDto> getMonthlyReport() {
        return convert(reportRepository.findMonthlyReport());
    }

    @GetMapping("/yearly")
    public List<ReportDto> getYearlyReport() {
        return convert(reportRepository.findYearlyReport());
    }

    private List<ReportDto> convert(List<Object[]> rows) {
        List<ReportDto> reports = new ArrayList<>();
        for (Object[] row : rows) {
            Long id = ((Number) row[0]).longValue();
            String name = row[1].toString();
            Long totalQuantity = ((Number) row[2]).longValue();
            reports.add(new ReportDto(id, name, totalQuantity));
        }
        return reports;
    }
}
