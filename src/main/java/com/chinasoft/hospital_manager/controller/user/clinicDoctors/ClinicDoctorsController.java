package com.chinasoft.hospital_manager.controller.user.clinicDoctors;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.HttpCookie;

/**
 * Created by Jack on 2020/2/9 2:05
 */
@Controller
@RequestMapping("/admin/doctorsController")
public class ClinicDoctorsController {

    @RequestMapping("/loadDoctorsInfo")
    public void loadDoctorsInfo(HttpServletRequest request,HttpServletResponse response) throws IOException {
        ModelAndView andView=new ModelAndView();



/*        <div class="row">
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="..." alt="...">
      <div class="caption">
        <h3>Thumbnail label</h3>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
      </div>
    </div>
  </div>
</div>*/

    }
}
