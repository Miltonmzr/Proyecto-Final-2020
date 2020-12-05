function onSignIn(googleUser)
{
    var profile=googleuser.getBasicProfile();
    $(".g-signin2").css("display","none");
    $(".data").css("display","block");
    $("#pic").attr('src',profile.getImgeUrl());
    $("#email").text(profile.getEmail());
}
