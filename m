Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC403845B5
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Apr 2026 13:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775221514; cv=none; b=dHcjJaROJ8A2ySajP6oQYaiI+icwp/wnq/RhnMu7zvI+L9QOyH9nXVswLFHiSSsr62SiCg/ir7KXhgYJhWURac2RGpziIX1dWlMl1ywA0Wk9saIDkM19OvdWJnjbZBaxbFr6ujwgWfWoPb3fhgY1bMpvJpnba+ACpj4TsQzbRIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775221514; c=relaxed/simple;
	bh=cU4zrVihhAyukwAPUendYFq1CBw7lqCe9U7oQrapWrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VK/RJBKFeV1+zbw2j8oXuwcsDaQ1r7fdSJAIacL6uksyM79Pg+rHkNZDH7JiFCkB5MpkScovIaiVNSlqF/M7/Lm7gxAdYaU32biBnMg+kb+mzfxlg7mkKgtXPFKE9EySX704XDgYaN9tmUgn/NpMCW+r4oNLGrxeYhTxJplLBzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d556c1a79eso2221688a34.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2026 06:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775221510; x=1775826310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSJuyXivPnv8jUYTe5aVcM1VjUEpcQKUQGG47CduFdU=;
        b=sVXsFf3MOH5iiJWccVzDMZMFem+jFPvZBglmdxcxTChvc5eI2V5ElueuUHG9x7xVGd
         pxsiNuwGyrCjvLTdwBsk3bVlBm/rbeLrEhcminqjFQsJvELwehry2zuZuL3Vpr3/70bb
         7bZ+Me1f3un567Kg8aSSp+JHYAjEtUhpbVUQ+G4KK8hmHH+PHu/LMOzLo7YOw6FzWfEV
         0a0e0PUDDc6xEJIOm2vF/30vbiiyfKNJ3QETm9qc1NkR+oRNHiSF5uI4uQBZLLqUrao5
         dIGqGN6gdze5R7tyPivYsbHDhePUWnvegVvkcD60PRRrJcabgJuohTDjle9MetjTt+yG
         W1fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWoVYfSkckPWx74DoVPfGcXdbXnXBJ4ETkeMXp8M9r5Sn0u2Sc+qcf2neoO5Je4Zq/0G5GHwdyAipNbNhT7ei2ycjQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwBRWez8tu0EkteDd3xk4RYusJ8fiA1AD1lQGZtaXx9OLWfzerg
	vG2WZ+xm/mA+GymnQjth1IbPsUYZN/K5eCKwISloqThWeMBpScARZoDrYCgKq8p3
X-Gm-Gg: ATEYQzw8uiB8MBJWCRaKWYNpcVZTeWw6iYH3qMzoQsfu8Ni6CZc5bsfuDx0RfC4BgqR
	3KPaoaC0MjkmCisodwXU0LXGQxnsUzJ2ZNozQnuULOeZbAEVDoB5znJidHb8BmbLf2DtWsXm03P
	BNYOowmvlaYnZLZmBVEbsIUXcUbLmvUMLSa6fixhuCDR3K9SkIwB0EsoqtS8K+2chzAXiGEHIv+
	sL7PgLuF38lxgVi6OYWkbsijz3WEgGk5cZgk9HQmULG5XsZzRaUHxrjus6FJ+7Ddtlpnx7d5Ip+
	25uQAUz2e5NBC+c+HGwRwqzhs8SdPh22OT82OxvYx8zyGhpJuJwWoN5F18MSqA+lWhxjfC179EO
	yaX4d+cZqqd00dCa3aRpt/IyDI/TmM4brS2NxFboQgoXoBscQnqvD6q5it7S2EQmIh5dhnSG03/
	pXG7zuIbxvhkxqaLzr8KXglRq8PPIlfxNYigNmSVz/VN3HDv1NkiYFXXAQUyk7kB0li74=
X-Received: by 2002:a05:6830:2e14:b0:7db:b7ae:ef05 with SMTP id 46e09a7af769-7dbb7aef5cdmr1026239a34.4.1775221509564;
        Fri, 03 Apr 2026 06:05:09 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dbb40b1507sm2331488a34.21.2026.04.03.06.05.09
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 06:05:09 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-45f053b7b90so1062983b6e.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2026 06:05:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4HK9zPS1mMzDjJZOjV5BmC2R6gz3YBKsCXq02PJwsabBVwfPNgzCoStDVLJXikbsTpm01FGJ5cYnkYLoTDhhjDTYp@vger.kernel.org
X-Received: by 2002:a05:6808:302a:b0:467:1c9e:213d with SMTP id
 5614622812f47-46ef54f5656mr1439389b6e.10.1775221509038; Fri, 03 Apr 2026
 06:05:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8e55cf70-5147-849a-ad5c-24a32727e620@linux.intel.com> <20260326031506.35280-1-ayaanmirzabaig85@gmail.com>
In-Reply-To: <20260326031506.35280-1-ayaanmirzabaig85@gmail.com>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Fri, 3 Apr 2026 15:04:57 +0200
X-Gmail-Original-Message-ID: <CAMF+KeaTRH2JGs53VSJ_WMFJQMBW4wDbCkW6u3=ySxkPknDvpQ@mail.gmail.com>
X-Gm-Features: AQROBzCD1liV_n1jedVrHBXlSk37KHjXExt4M2fNrcwTnleC6OIJIUYYhMKFPTA
Message-ID: <CAMF+KeaTRH2JGs53VSJ_WMFJQMBW4wDbCkW6u3=ySxkPknDvpQ@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: samsung-galaxybook: Handle ACPI hotkey notifications
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Cc: ilpo.jarvinen@linux.intel.com, ayaanmirza788@gmail.com, 
	josh@joshuagrisham.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ayaan, first of all thank you for taking the time to figure this
out and send in the patch!! Few notes from my side inline below :)

Den ons 25 mars 2026 kl 22:45 skrev Ayaan Mirza Baig
<ayaanmirzabaig85@gmail.com>:
>
> On Samsung Galaxy Book 5 (SAM0430), the keyboard backlight, microphone
> mute, and camera block hotkeys do not generate i8042 scancodes.
> Instead they arrive as ACPI notifications 0x7d, 0x63, and 0x6f
> respectively, all of which previously fell through to the default
> "unknown" warning in galaxybook_acpi_notify().
>
> Add handling for these three events:
>
> - 0x7d (Fn+F9, keyboard backlight): schedule the existing
>   kbd_backlight_hotkey_work which cycles brightness.
>
> - 0x6e (Fn+F10, microphone mute): register a new hotkey input device
>   and emit KEY_MICMUTE.
>
> - 0x6f (Fn+F11, camera block): if block_recording is active use the
>   existing block_recording_hotkey_work; otherwise emit KEY_CAMERA via the
>   hotkey input device on models where the block_recording ACPI feature is
>   not supported

Just out of curiosity, are you sure KEY_CAMERA is the right key that
should be sent here? I think this is typically interpreted as a
"camera shutter" kind of event, and in some desktop environments or
apps it will actually cause a picture to be captured from the webcam.
I think better would be to toggle the camera shutter switch
(camera_lens_cover_switch) I already created in this driver
specifically to indicate this? You can see how this works in
block_recording_acpi_set() -- basically there it is both sending the
ACPI command (for models that support this) to actually disable the
camera, but also setting the value of the switch input
(input_report_switch + input_sync), so I guess you could always just
update the switch value without sending the ACPI command?

But, alas, just setting the status of a switch does not actually "do"
anything, but instead more correctly tries to report the status to the
right interface. Out of curiosity, do you know if there are any of the
Galaxy Book devices which report this camera switch hotkey over ACPI
and do not also support the Samsung ACPI sub function (sasb) to
enable/disable the camera (GB_SASB_BLOCK_RECORDING) ? It would be
interesting to see how they behaved and if it were possible to cover
that case in a clear way so that everything works right for them.

>
> Tested on Samsung Galaxy Book 5 (SAM0430).
>

I will try to build and load this on my Galaxy Book2 Pro and 3 Pro as
well just to rule out any potential regressions but from a quick
glance it looks like it should be fine :)

> Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
> ---
>  drivers/platform/x86/samsung-galaxybook.c | 47 +++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
> index 755cb82bdb60..fe549e224c17 100644
> --- a/drivers/platform/x86/samsung-galaxybook.c
> +++ b/drivers/platform/x86/samsung-galaxybook.c
> @@ -54,6 +54,7 @@ struct samsung_galaxybook {
>
>         struct work_struct block_recording_hotkey_work;
>         struct input_dev *camera_lens_cover_switch;
> +       struct input_dev *hotkey_dev;
>
>         struct acpi_battery_hook battery_hook;
>
> @@ -197,6 +198,9 @@ static const guid_t performance_mode_guid =
>  #define GB_ACPI_NOTIFY_DEVICE_ON_TABLE          0x6c
>  #define GB_ACPI_NOTIFY_DEVICE_OFF_TABLE         0x6d
>  #define GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE  0x70
> +#define GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT  0x7d
> +#define GB_ACPI_NOTIFY_HOTKEY_CAMERA         0x6f
> +#define GB_ACPI_NOTIFY_HOTKEY_MICMUTE        0x6e
>

Just a minor nit but the spacing for the values on these last 3 new
lines is not aligned with the existing lines above it (it might fail
checkpatch? have not tried myself...).

>  #define GB_KEY_KBD_BACKLIGHT_KEYDOWN    0x2c
>  #define GB_KEY_KBD_BACKLIGHT_KEYUP      0xac
> @@ -1223,6 +1227,22 @@ static void galaxybook_i8042_filter_remove(void *data)
>         cancel_work_sync(&galaxybook->block_recording_hotkey_work);
>  }
>
> +static int galaxybook_hotkey_init(struct samsung_galaxybook *galaxybook)
> +{
> +       galaxybook->hotkey_dev = devm_input_allocate_device(&galaxybook->platform->dev);
> +       if (!galaxybook->hotkey_dev)
> +               return -ENOMEM;
> +
> +       galaxybook->hotkey_dev->name = "Samsung Galaxy Book hotkeys";
> +       galaxybook->hotkey_dev->phys = DRIVER_NAME "/input1";
> +       galaxybook->hotkey_dev->id.bustype = BUS_HOST;
> +
> +       input_set_capability(galaxybook->hotkey_dev, EV_KEY, KEY_MICMUTE);
> +       input_set_capability(galaxybook->hotkey_dev, EV_KEY, KEY_CAMERA);
> +
> +       return input_register_device(galaxybook->hotkey_dev);
> +}
> +
>  static int galaxybook_i8042_filter_install(struct samsung_galaxybook *galaxybook)
>  {
>         int err;
> @@ -1260,6 +1280,28 @@ static void galaxybook_acpi_notify(acpi_handle handle, u32 event, void *data)
>                 if (galaxybook->has_performance_mode)
>                         platform_profile_cycle();
>                 break;
> +       case GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT:
> +               if (galaxybook->has_kbd_backlight)
> +                       schedule_work(&galaxybook->kbd_backlight_hotkey_work);
> +               break;
> +       case GB_ACPI_NOTIFY_HOTKEY_MICMUTE:
> +               if (galaxybook->hotkey_dev) {
> +                       input_report_key(galaxybook->hotkey_dev, KEY_MICMUTE, 1);
> +                       input_sync(galaxybook->hotkey_dev);
> +                       input_report_key(galaxybook->hotkey_dev, KEY_MICMUTE, 0);
> +                       input_sync(galaxybook->hotkey_dev);
> +               }
> +               break;
> +       case GB_ACPI_NOTIFY_HOTKEY_CAMERA:
> +               if (galaxybook->has_block_recording) {
> +                       schedule_work(&galaxybook->block_recording_hotkey_work);
> +               } else if (galaxybook->hotkey_dev) {
> +                       input_report_key(galaxybook->hotkey_dev, KEY_CAMERA, 1);
> +                       input_sync(galaxybook->hotkey_dev);
> +                       input_report_key(galaxybook->hotkey_dev, KEY_CAMERA, 0);
> +                       input_sync(galaxybook->hotkey_dev);

Here is where I was talking about from above. Maybe this should
instead be something more like (with correct spacing etc):

input_report_switch(galaxybook->camera_lens_cover_switch, 1);
input_sync(galaxybook->camera_lens_cover_switch);

Also I guess it would need to keep track somehow if the lens is
"covered" / blocked (value = 1) vs not (value = 0) and toggle between
those values each time the key is pressed?

> +               }
> +               break;
>         default:
>                 dev_warn(&galaxybook->platform->dev,
>                          "unknown ACPI notification event: 0x%x\n", event);
> @@ -1397,6 +1439,11 @@ static int galaxybook_probe(struct platform_device *pdev)
>                 return dev_err_probe(&galaxybook->platform->dev, err,
>                                      "failed to initialize firmware-attributes\n");
>
> +       err = galaxybook_hotkey_init(galaxybook);
> +       if (err)
> +               return dev_err_probe(&galaxybook->platform->dev, err,
> +                                        "failed to initialize hotkey input device\n");
> +
>         err = galaxybook_i8042_filter_install(galaxybook);
>         if (err)
>                 return dev_err_probe(&galaxybook->platform->dev, err,
> --
> 2.53.0
>

Otherwise for me everything else seems pretty reasonable. Nice finds!
The only other thing I am thinking about is if someone comes and looks
at this with fresh eyes, it might be confusing why there are multiple
different hotkeys that seem to do the same thing (why they are there
and what is the difference between them). My gut reaction is this
should be written down somewhere, but I'm not sure if the preference
would be to update the docs vs some comments in the code -- any
feedback from maintainers on preference for that? :)

And of course any other input from maintainers is also welcome!

Thanks again and best regards,
Joshua
