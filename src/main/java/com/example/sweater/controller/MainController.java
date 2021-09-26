package com.example.sweater.controller;

import com.example.sweater.domain.dao.MessageRepository;
import com.example.sweater.domain.entity.Message;
import com.example.sweater.domain.entity.User;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {
    private final MessageRepository messageRepository;

    @Value("${upload.path}")
    private String uploadPath;

    public MainController(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    @GetMapping("/")
    public String main(@RequestParam(required = false, defaultValue = "") String filter,
                       Map<String, Object> model) {

        if (filter != null && !filter.isEmpty()) model.put("messages", messageRepository.findByTag(filter));
        else model.put("messages", messageRepository.findAll());

        model.put("filter", filter);

        return "main";
    }

    @PostMapping
    public String addMessage(@AuthenticationPrincipal User user,
                             @RequestParam String text,
                             @RequestParam String tag,
                             @RequestParam("file") MultipartFile file) throws IOException {

        Message message = new Message(text, tag, user);

        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadFolder = new File(uploadPath);

            if (!uploadFolder.exists()) uploadFolder.mkdir();

            String uuid = UUID.randomUUID().toString();
            String resultFilename = uuid + "." + file.getOriginalFilename();

            message.setFilename(resultFilename);

            file.transferTo(new File(uploadPath + "/" + resultFilename));
        }

        messageRepository.save(message);

        return "redirect:/";
    }
}
