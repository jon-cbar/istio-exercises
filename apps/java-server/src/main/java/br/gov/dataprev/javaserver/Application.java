package br.gov.dataprev.javaserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class Application {

  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String hello() {
    return "here I am";
  }

  @RequestMapping(value = "/auth", method = RequestMethod.POST)
  public String auth() {
    return "this is me again";
  }

  public static void main(String[] args) {
    SpringApplication.run(Application.class, args);
  }

}
