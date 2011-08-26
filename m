From: David Herrmann <dh.herrmann@googlemail.com>
Subject: Re: [PATCH] Platform: Brightness quirk for samsung laptop driver
Date: Fri, 26 Aug 2011 13:31:38 +0200
Message-ID: <CANq1E4SgFWtMyps18c7MZp87uTCZO0T2q21FZ3eqR1TehNA-YQ@mail.gmail.com>
References: <1314115527-6063-1-git-send-email-dh.herrmann@googlemail.com>
	<20110824231053.GA7697@kroah.com>
	<4E55C11E.8000704@gmail.com>
	<20110826000348.GB1314@kroah.com>
	<4E576E50.4070500@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:63094 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751433Ab1HZLbj convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 26 Aug 2011 07:31:39 -0400
Received: by vws1 with SMTP id 1so2806025vws.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2011 04:31:39 -0700 (PDT)
In-Reply-To: <4E576E50.4070500@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jason Stubbs <jasonbstubbs@gmail.com>
Cc: Greg KH <greg@kroah.com>, platform-driver-x86@vger.kernel.org, mjg@redhat.com

On Fri, Aug 26, 2011 at 11:58 AM, Jason Stubbs <jasonbstubbs@gmail.com>=
 wrote:
> From: Jason Stubbs <jasonbstubbs@gmail.com>
>
> On some Samsung laptops the brightness regulation works slightly diff=
erent.
> All SABI commands except for set_brightness work as expected. The beh=
aviour
> of set_brightness is as follows:
>
> - Setting a new brightness will only step one level toward the new br=
ightness
> =A0level. For example, setting a level of 5 when the current level is=
 2 will
> =A0result in a brightness level of 3.
> - A spurious KEY_BRIGHTNESS_UP or KEY_BRIGHTNESS_DOWN event is also g=
enerated
> =A0along with the change in brightness.
> - Neither of the above two issues occur when changing from/to brightn=
ess
> =A0level 0.
>
> This patch adds detection and a non-intrusive workaround for the abov=
e issues.
>
> Signed-off-by: Jason Stubbs <jasonbstubbs@gmail.com>
>
> ---
>
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform=
/x86/samsung-laptop.c
> index ee68c1c..b193bf0 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -226,6 +226,7 @@ static struct backlight_device *backlight_device;
> =A0static struct mutex sabi_mutex;
> =A0static struct platform_device *sdev;
> =A0static struct rfkill *rfk;
> +static bool has_stepping_quirk;
>
> =A0static int force;
> =A0module_param(force, bool, 0);
> @@ -382,6 +383,17 @@ static void set_brightness(u8 user_brightness)
> =A0{
> =A0 =A0 =A0 =A0u8 user_level =3D user_brightness + sabi_config->min_b=
rightness;
>
> + =A0 =A0 =A0 if (has_stepping_quirk && user_level !=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* short circuit if the specified lev=
el is what's already set
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* to prevent the screen from flicker=
ing needlessly
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (user_brightness =3D=3D read_brightn=
ess())
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sabi_set_command(sabi_config->commands.=
set_brightness, 0);
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0sabi_set_command(sabi_config->commands.set_brightness,=
 user_level);
> =A0}
>
> @@ -390,6 +402,34 @@ static int get_brightness(struct backlight_devic=
e *bd)
> =A0 =A0 =A0 =A0return (int)read_brightness();
> =A0}
>
> +static void check_for_stepping_quirk(void)
> +{
> + =A0 =A0 =A0 u8 initial_level =3D read_brightness();
> + =A0 =A0 =A0 u8 check_level;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Some laptops exhibit the strange behaviour of step=
ping toward
> + =A0 =A0 =A0 =A0* (rather than setting) the brightness except when c=
hanging to/from
> + =A0 =A0 =A0 =A0* brightness level 0. This behaviour is checked for =
here and worked
> + =A0 =A0 =A0 =A0* around in set_brightness.
> + =A0 =A0 =A0 =A0*/
> +
> + =A0 =A0 =A0 if (initial_level <=3D 2)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 check_level =3D initial_level + 2;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 check_level =3D initial_level - 2;
> +
> + =A0 =A0 =A0 has_stepping_quirk =3D false;
> + =A0 =A0 =A0 set_brightness(check_level);
> +
> + =A0 =A0 =A0 if (read_brightness() !=3D check_level) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 has_stepping_quirk =3D true;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_info("enabled workaround for brightn=
ess stepping quirk\n");
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 set_brightness(initial_level);
> +}
> +
> =A0static int update_status(struct backlight_device *bd)
> =A0{
> =A0 =A0 =A0 =A0set_brightness(bd->props.brightness);
> @@ -796,6 +836,9 @@ static int __init samsung_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 /* Check for stepping quirk */
> + =A0 =A0 =A0 check_for_stepping_quirk();
> +
> =A0 =A0 =A0 =A0/* knock up a platform device to hang stuff off of */
> =A0 =A0 =A0 =A0sdev =3D platform_device_register_simple("samsung", -1=
, NULL, 0);
> =A0 =A0 =A0 =A0if (IS_ERR(sdev))
>
>

Thank you, Jason.
Tested-by: David Herrmann <dh.herrmann@googlemail.com>

And Greg, could you actually "git add" the new samsung patches in your
repository? You added them to "series" but didn't submit the actual
patch files. That would be great.

Thank you and cheers
David
