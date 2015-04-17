From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH] toshiba_acpi: Do not register vendor backlight when
 acpi_video bl is available
Date: Fri, 17 Apr 2015 10:58:46 -0600
Message-ID: <CAGdLNWF1KXJWzcREHU2d3KycdH3YGPYbkY4ccMa_xLf-7-MXkQ@mail.gmail.com>
References: <1429107117-7608-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:38692 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932997AbbDQQ6r (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 17 Apr 2015 12:58:47 -0400
Received: by wiun10 with SMTP id n10so27276332wiu.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2015 09:58:46 -0700 (PDT)
In-Reply-To: <1429107117-7608-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi there,

Sorry for the late reply, I've been a bit overwhelmed with work related stuff,
and to top it off I was having issues with one of my systems, but anyway,
on to the patch :-)

2015-04-15 8:11 GMT-06:00 Hans de Goede <hdegoede@redhat.com>:
> commit a39f46df33c6 ("toshiba_acpi: Fix regression caused by backlight extra
> check code") causes the backlight to no longer work on the Toshiba Z30,
> reverting that commit fixes this but restores the original issue fixed
> by that commit.
>
> Looking at the toshiba_acpi backlight code for a fix for this I noticed that
> the toshiba code is the only code under platform/x86 which unconditionally
> registers a vendor acpi backlight interface, without checking for acpi_video
> backlight support first.
>
> This commit adds the necessary checks bringing toshiba_acpi in line with the
> other drivers, and fixing the Z30 regression without needing to revert the
> commit causing it.
>
> Chances are that there will be some Toshiba models which have a non working
> acpi-video implementation while the toshiba vendor backlight interface does
> work, this commit adds an empty dmi_id table where such systems can be added,
> this is identical to how other drivers handle such systems.
>
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1206036
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=86521
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/Kconfig        |  1 +
>  drivers/platform/x86/toshiba_acpi.c | 23 +++++++++++++++++++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 9752761..f9f205c 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -614,6 +614,7 @@ config ACPI_TOSHIBA
>         depends on INPUT
>         depends on RFKILL || RFKILL = n
>         depends on SERIO_I8042 || SERIO_I8042 = n
> +       depends on ACPI_VIDEO || ACPI_VIDEO = n
>         select INPUT_POLLDEV
>         select INPUT_SPARSEKMAP
>         ---help---
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index dbcb7a8..2da716c 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -51,6 +51,7 @@
>  #include <linux/acpi.h>
>  #include <linux/dmi.h>
>  #include <linux/uaccess.h>
> +#include <acpi/video.h>
>

Is this patch intended for 4.1 (or later)? If so, you will need to
re-include <linux/dmi.h> as
commit a2b3471b5b13b81c5975d8f88db65694d7b69f56 dropped it.


>  MODULE_AUTHOR("John Belmonte");
>  MODULE_DESCRIPTION("Toshiba Laptop ACPI Extras Driver");
> @@ -281,6 +282,14 @@ static const struct key_entry toshiba_acpi_alt_keymap[] = {
>  };
>
>  /*
> + * List of models which have a broken acpi-video backlight interface and thus
> + * need to use the toshiba (vendor) interface instead.
> + */
> +static const struct dmi_system_id toshiba_vendor_backlight_dmi[] = {
> +       {}
> +};
> +
> +/*
>   * Utility
>   */
>
> @@ -2541,6 +2550,20 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
>         ret = get_tr_backlight_status(dev, &enabled);
>         dev->tr_backlight_supported = !ret;
>
> +       /*
> +        * Tell acpi-video-detect code to prefer vendor backlight on all
> +        * systems with transflective backlight and on dmi matched systems.
> +        */
> +       if (dev->tr_backlight_supported ||
> +           dmi_check_system(toshiba_vendor_backlight_dmi))
> +               acpi_video_dmi_promote_vendor();
> +
> +       if (acpi_video_backlight_support())
> +               return 0;
> +
> +       /* acpi-video may have loaded before we called dmi_promote_vendor() */
> +       acpi_video_unregister_backlight();
> +
>         memset(&props, 0, sizeof(props));
>         props.type = BACKLIGHT_PLATFORM;
>         props.max_brightness = HCI_LCD_BRIGHTNESS_LEVELS - 1;
> --
> 2.3.5
>

I've tested this on my (current) devices (Satellite X205, Qosmio X505 & X75),
an taking the above comment into consideration, you can add:

Reviewed-and-Tested-by: Azael Avalos <coproscefalo@gmail.com>


Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
