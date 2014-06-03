// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//

//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require RecordRTC
//= require i18n
//= require i18n/translations
//= require bootstrap-wysihtml5
//= require_tree .


document.observe('dom:loaded',function() {
  
  $('#start-rec').on('click', function (e) {
    recordVideo();
  });

  $('#myTab a:first').tab('show');

  $('.wysihtml5').each(function(i, elem) {
    $(elem).wysihtml5();
  });
});

for (var i=0;i<$$('#myTab a').length;i++) {
  $$('#myTab a')[i].click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  })
}

function remove_fields (link) {
    $(link).previous("input[type=hidden]:first").value = '1';
    $(link).up(".fields").hide();

}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).up().insert({
        before : content.replace(regexp, new_id)
    });

}



function recordVideo() {
  var video = document.querySelector('video');

  function successCallback(stream) {

      var options = {
         type: 'video',
         video: {
            width: 320,
            height: 240
         },
         canvas: {
            width: 320,
            height: 240
         }
      };
      var recordRTC = RecordRTC(stream, options);
      recordRTC.startRecording();
      recordRTC.stopRecording(function(videoURL) {
         window.open(videoURL);
      });
      // Set the source of the video element with the stream from the camera
      //if (video.mozSrcObject !== undefined) {
      //    video.mozSrcObject = stream;
      //} else {
      //    video.src = (window.URL && window.URL.createObjectURL(stream)) || stream;
      //}
      //video.play();
  }

  function errorCallback(error) {
      console.error('An error occurred: [CODE ' + error.code + ']');
      // Display a friendly "sorry" message to the user
  }

  navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
  window.URL = window.URL || window.webkitURL || window.mozURL || window.msURL;

  // Call the getUserMedia method with our callback functions
  if (navigator.getUserMedia) {
      navigator.getUserMedia({video: true}, successCallback, errorCallback);
  } else {
      console.log('Native web camera streaming (getUserMedia) not supported in this browser.');
      // Display a friendly "sorry" message to the user
  }
}


