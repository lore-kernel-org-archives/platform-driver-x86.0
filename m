Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D37B3CFF68
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Apr 2026 16:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775232385; cv=none; b=bGc8gX8ByZuem4MiEIYhskmqJ2+ayy2X0u4zGL59hJvmJ1ixjnvjL9l12aHfGZcmNwI/RUTUEMJ4DFsoeev2oDLxTbpEm9QWphj4G0Cgwi+Feazue64O2jaf0IyjthdgQ/gTl880XW43MRavbak78VmHQU19wSFbX+1mJtsIwXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775232385; c=relaxed/simple;
	bh=/e19wTdAUp7lNaUGkzjCLAZrNizC1rTOjawrk30aYh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fZyJur9jmsS2TRhIEKSOd5vHtqOL1OcH5yb+xwojet0MqMYePf6sFuW6jY/dI2yqyj7XtebSPHono/Yb/rV7saT+WebFR+2SvCiLlzz09MXVXuvxb/EnytPqGQs5UktMi77ArrEJhICduwVONmJ7wgMw9q7ZkeKS9nT9dBh39kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d556c1a79eso2422926a34.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2026 09:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775232382; x=1775837182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGR4rvm5wOX/CPEFslcg5gu6MYGswFyS9wKmlMTNTXQ=;
        b=KEv0Pg0oEO/ROYZKGJwhmcKUC8UlGwzWCWFfkcphOfK8IFQ4E3h+OJT+LKNKGBA0Qt
         seR8k+v6jzF6RgTaUZS8PWR9KFFAySvqczEPdpjkfhCwRn0iQNQrROQNRGmvGREPRhta
         uQ75OCgKpjvndQcJY2U7jXcOcoqEjoZYdePZBFGspDj6aEQ4yXHgCtlHpGOCP5HqkAg2
         JuFHCtQH3zDApO/e9e3dVNOAllET4NTXRSGdWIwwdGWfrIULlRx7RcpWIu8gkrQhYyD/
         6pnU4OOq7RTyC74U+wrc70I44RZDXc6oDbspVuJJO9PyJE0IARSMX0uPzy++ulI1SKi5
         v5uA==
X-Forwarded-Encrypted: i=1; AJvYcCW7fVdx5hn2Pezvafpe+b5jlLi6vGlEKwRc/P1mWzZh0VH1mjZaXkUM7UXii3Ak7AGyUiT+ctzEk0J0556fBYQHj3VA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz05YincVMlWf6mi/M8ZMy1xOA/oUTK7+goQfdCk+2FhuXlgUOX
	G9aZwEXVPjJZO7ch+bjXJRhdNaz+CyYsHXKe5VvdrE9yJ/MllFYZcKR82gPOwlff
X-Gm-Gg: ATEYQzyNX3uVSrPGtXSRucIhbMLzrHjOh9ckTBSvbiLC09KO4z4NYqObvybpiPlWQO7
	sb7lZTZQq5rkMp9b273P8y3+piz7eSRg0O33wNUgE9mxZZuNlCzpCCoiEOdAZ55uVZqgiJ9K8Sw
	HNJdaZdrk/Foub8HI8IYqnAOzxJ2EwkeouB+yig8b+aJdDgYBV3Rvr2czoP+YP03usLEIfANTIP
	jyy5ws2MMsQTT7Zjq0yzVMq2WZ3Ka6Q2xBDBaUa9/SsnYU+m/ZVlcPd42WRma703GJzYCS4g1RQ
	rp7MxX/oIifzK2AoUBNNZg8Z7hlGkG5AtWiDIS8GuqcKWYX2T0ze1QuR3QLO9YSe50vCaTgsngA
	2Bio9GVBh/2dYOe1Q50OlD7Zmj5CY4Xb8hG3GWNV+vR4BgnJR6oxJ2LOlyOgLkwr8HArhG5fg4F
	vxLh5t38URKdDxb/j1LPHz8T7Hqqw/zAi7C6rM7yZ7Xgq/JZWv3x3LR6CZ6XnXT3U=
X-Received: by 2002:a05:6830:6383:b0:7d7:c911:1829 with SMTP id 46e09a7af769-7dbb75178famr2662764a34.16.1775232382060;
        Fri, 03 Apr 2026 09:06:22 -0700 (PDT)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com. [209.85.161.45])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dba71279b9sm4844487a34.5.2026.04.03.09.06.21
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 09:06:21 -0700 (PDT)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6836ab45d84so16279eaf.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2026 09:06:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCp56ZP07itY+u8ycOxc0z8jjdL2XI39WTRLY5OX7fckbLO8LLuOowgPx8eSSkEKH65r6ncgtiHSlfZMvUdSzlj1G1@vger.kernel.org
X-Received: by 2002:a05:6820:6602:b0:67c:1689:c388 with SMTP id
 006d021491bc7-68220a45f32mr1154496eaf.56.1775232381308; Fri, 03 Apr 2026
 09:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMF+KeaTRH2JGs53VSJ_WMFJQMBW4wDbCkW6u3=ySxkPknDvpQ@mail.gmail.com>
 <20260403155620.14276-1-josh@joshuagrisham.com>
In-Reply-To: <20260403155620.14276-1-josh@joshuagrisham.com>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Fri, 3 Apr 2026 18:06:09 +0200
X-Gmail-Original-Message-ID: <CAMF+KeaOEBcCkP=QOootiVdLRKNUTPRyg6YhYiPU3qfwev0duA@mail.gmail.com>
X-Gm-Features: AQROBzA3EbGLV8QaSkcdXuo0zxaQNZCZas3hnRgLTF8SJibL4cneX6IjTu2JSp0
Message-ID: <CAMF+KeaOEBcCkP=QOootiVdLRKNUTPRyg6YhYiPU3qfwev0duA@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Handle ACPI hotkey notifications
To: ayaanmirzabaig85@gmail.com
Cc: ilpo.jarvinen@linux.intel.com, josh@joshuagrisham.com, 
	ayaanmirza788@gmail.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi again Ayaan,

I went ahead and made the updates to your patch like I wrote above,
but also included to just refactor the existing "camera lens cover
switch" input device to a generic one that we can use for anything (so
both this switch and the new keyboard key events). Also I switched
from using KEY_CAMERA key event to using SW_CAMERA_LENS_COVER switch
event -- hope that is all ok with you and I just went ahead and took
it upon myself to update and send as a new version of your patch!!

I have been testing as well on my GB2Pro and so far so good but can
report back in case I see any issues.

Thanks again!
Joshua

Den fre 3 apr. 2026 kl 17:56 skrev Joshua Grisham <josh@joshuagrisham.com>:
>
> From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
>
> On Samsung Galaxy Book 5 (SAM0430), the keyboard backlight, microphone
> mute, and camera block hotkeys do not generate i8042 scancodes.
> Instead they arrive as ACPI notifications 0x7d, 0x63, and 0x6f
> respectively, all of which previously fell through to the default
> "unknown" warning in galaxybook_acpi_notify().
>
> This patch refactors the existing camera lens cover input device to a
> generic input device and adds handling for these three ACPI events:
>
> - 0x7d (Fn+F9, keyboard backlight): schedule the existing
>   kbd_backlight_hotkey_work which cycles brightness.
>
> - 0x6e (Fn+F10, microphone mute): emit KEY_MICMUTE to the driver's
>   input device.
>
> - 0x6f (Fn+F11, camera block): if block_recording is active use the
>   existing block_recording_hotkey_work; otherwise emit a toggle of the
>   SW_CAMERA_LENS_COVER switch event to the driver's input device.
>
> Tested on Samsung Galaxy Book 5 (SAM0430) and Samsung Galaxy Book2 Pro
> (SAM0429).
>
> Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
> Co-developed-by: Joshua Grisham <josh@joshuagrisham.com>
> Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>
>
> ---
>
> v3->v4: Joshua's update to Ayaan's patch with the following changes:
> - refactor the camera lens cover input device to a generic input device
> - use this input device for both existing camera lens cover switch and
>   the new KEY_MICMUTE event
> - toggle SW_CAMERA_LENS_COVER instead of emitting KEY_CAMERA event in
>   case device does not support block_recording
> - small comments and spacing tweaks
> ---
>  drivers/platform/x86/samsung-galaxybook.c | 89 ++++++++++++++++-------
>  1 file changed, 63 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
> index 755cb82bdb60..360bfc1e52a9 100644
> --- a/drivers/platform/x86/samsung-galaxybook.c
> +++ b/drivers/platform/x86/samsung-galaxybook.c
> @@ -35,6 +35,7 @@
>  struct samsung_galaxybook {
>         struct platform_device *platform;
>         struct acpi_device *acpi;
> +       struct input_dev *input;
>
>         struct device *fw_attrs_dev;
>         struct kset *fw_attrs_kset;
> @@ -50,10 +51,9 @@ struct samsung_galaxybook {
>         /* block in case brightness updated using hotkey and another thread */
>         struct mutex kbd_backlight_lock;
>
> -       void *i8042_filter_ptr;
> -
>         struct work_struct block_recording_hotkey_work;
> -       struct input_dev *camera_lens_cover_switch;
> +
> +       void *i8042_filter_ptr;
>
>         struct acpi_battery_hook battery_hook;
>
> @@ -198,12 +198,19 @@ static const guid_t performance_mode_guid =
>  #define GB_ACPI_NOTIFY_DEVICE_OFF_TABLE         0x6d
>  #define GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE  0x70
>
> +/* ACPI hotkey notifications for devices with SAM0430 or higher */
> +#define GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT  0x7d
> +#define GB_ACPI_NOTIFY_HOTKEY_CAMERA         0x6f
> +#define GB_ACPI_NOTIFY_HOTKEY_MICMUTE        0x6e
> +
> +/* Keyboard hotkey notifications for devices prior to SAM0430 */
>  #define GB_KEY_KBD_BACKLIGHT_KEYDOWN    0x2c
>  #define GB_KEY_KBD_BACKLIGHT_KEYUP      0xac
>  #define GB_KEY_BLOCK_RECORDING_KEYDOWN  0x1f
>  #define GB_KEY_BLOCK_RECORDING_KEYUP    0x9f
> -#define GB_KEY_BATTERY_NOTIFY_KEYUP     0xf
> -#define GB_KEY_BATTERY_NOTIFY_KEYDOWN   0x8f
> +
> +#define GB_KEY_BATTERY_NOTIFY_KEYUP    0xf
> +#define GB_KEY_BATTERY_NOTIFY_KEYDOWN  0x8f
>
>  /*
>   * Optional features which have been determined as not supported on a particular
> @@ -859,9 +866,9 @@ static int block_recording_acpi_set(struct samsung_galaxybook *galaxybook, const
>         if (err)
>                 return err;
>
> -       input_report_switch(galaxybook->camera_lens_cover_switch,
> -                           SW_CAMERA_LENS_COVER, value ? 1 : 0);
> -       input_sync(galaxybook->camera_lens_cover_switch);
> +       input_report_switch(galaxybook->input, SW_CAMERA_LENS_COVER,
> +                           value ? 1 : 0);
> +       input_sync(galaxybook->input);
>
>         return 0;
>  }
> @@ -887,24 +894,9 @@ static int galaxybook_block_recording_init(struct samsung_galaxybook *galaxybook
>                 return GB_NOT_SUPPORTED;
>         }
>
> -       galaxybook->camera_lens_cover_switch =
> -               devm_input_allocate_device(&galaxybook->platform->dev);
> -       if (!galaxybook->camera_lens_cover_switch)
> -               return -ENOMEM;
> -
> -       galaxybook->camera_lens_cover_switch->name = "Samsung Galaxy Book Camera Lens Cover";
> -       galaxybook->camera_lens_cover_switch->phys = DRIVER_NAME "/input0";
> -       galaxybook->camera_lens_cover_switch->id.bustype = BUS_HOST;
> -
> -       input_set_capability(galaxybook->camera_lens_cover_switch, EV_SW, SW_CAMERA_LENS_COVER);
> -
> -       err = input_register_device(galaxybook->camera_lens_cover_switch);
> -       if (err)
> -               return err;
> -
> -       input_report_switch(galaxybook->camera_lens_cover_switch,
> -                           SW_CAMERA_LENS_COVER, value ? 1 : 0);
> -       input_sync(galaxybook->camera_lens_cover_switch);
> +       input_report_switch(galaxybook->input, SW_CAMERA_LENS_COVER,
> +                           value ? 1 : 0);
> +       input_sync(galaxybook->input);
>
>         return 0;
>  }
> @@ -1120,6 +1112,23 @@ static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybook)
>   * Hotkeys and notifications
>   */
>
> +static int galaxybook_input_init(struct samsung_galaxybook *galaxybook)
> +{
> +       galaxybook->input =
> +               devm_input_allocate_device(&galaxybook->platform->dev);
> +       if (!galaxybook->input)
> +               return -ENOMEM;
> +
> +       galaxybook->input->name = "Samsung Galaxy Book Extra Inputs";
> +       galaxybook->input->phys = DRIVER_NAME "/input0";
> +       galaxybook->input->id.bustype = BUS_HOST;
> +
> +       input_set_capability(galaxybook->input, EV_KEY, KEY_MICMUTE);
> +       input_set_capability(galaxybook->input, EV_SW, SW_CAMERA_LENS_COVER);
> +
> +       return input_register_device(galaxybook->input);
> +}
> +
>  static void galaxybook_kbd_backlight_hotkey_work(struct work_struct *work)
>  {
>         struct samsung_galaxybook *galaxybook =
> @@ -1260,6 +1269,29 @@ static void galaxybook_acpi_notify(acpi_handle handle, u32 event, void *data)
>                 if (galaxybook->has_performance_mode)
>                         platform_profile_cycle();
>                 break;
> +       case GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT:
> +               if (galaxybook->has_kbd_backlight)
> +                       schedule_work(&galaxybook->kbd_backlight_hotkey_work);
> +               break;
> +       case GB_ACPI_NOTIFY_HOTKEY_MICMUTE:
> +               input_report_key(galaxybook->input, KEY_MICMUTE, 1);
> +               input_sync(galaxybook->input);
> +               input_report_key(galaxybook->input, KEY_MICMUTE, 0);
> +               input_sync(galaxybook->input);
> +               break;
> +       case GB_ACPI_NOTIFY_HOTKEY_CAMERA:
> +               if (galaxybook->has_block_recording) {
> +                       schedule_work(&galaxybook->block_recording_hotkey_work);
> +               } else {
> +                       /* toggle switch on+off; actual state is unknown */
> +                       input_report_switch(galaxybook->input,
> +                                           SW_CAMERA_LENS_COVER, 1);
> +                       input_sync(galaxybook->input);
> +                       input_report_switch(galaxybook->input,
> +                                           SW_CAMERA_LENS_COVER, 0);
> +                       input_sync(galaxybook->input);
> +               }
> +               break;
>         default:
>                 dev_warn(&galaxybook->platform->dev,
>                          "unknown ACPI notification event: 0x%x\n", event);
> @@ -1360,6 +1392,11 @@ static int galaxybook_probe(struct platform_device *pdev)
>         galaxybook->platform = pdev;
>         galaxybook->acpi = adev;
>
> +       err = galaxybook_input_init(galaxybook);
> +       if (err)
> +               return dev_err_probe(&galaxybook->platform->dev, err,
> +                                    "failed to initialize input device\n");
> +
>         /*
>          * Features must be enabled and initialized in the following order to
>          * avoid failures seen on certain devices:
> --
> 2.53.0
>
