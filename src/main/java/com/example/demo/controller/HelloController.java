package com.example.demo.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
public class HelloController {

    @GetMapping("/health")
    public ResponseEntity<Map<String, String>> health() {
        return ResponseEntity.ok(Map.of("status", "UP"));
    }

    @PostMapping("/hello")
    public ResponseEntity<Map<String, String>> hello(@RequestBody Map<String, String> request) {
        String name = request.get("name");
        return ResponseEntity.ok(Map.of("data", "Hello " + name));
    }
} 