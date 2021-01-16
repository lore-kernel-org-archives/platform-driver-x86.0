Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6B0C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 19:47:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5296823107
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 19:47:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbhAPTrM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 14:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbhAPTrM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 14:47:12 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27F7C061573
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 11:46:31 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id m5so7167389pjv.5
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 11:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=s9WMDKSMaGaAb0W2c3/hiLCgdcSXW69E8Ks0OU8vJZM=;
        b=MwQoVqKR4cPRxiCH7NO+i/kIo31E7kqgDiUxSbzdiys4D0EXolFauviPw5PqUpAQcB
         zGAj9rqSaUTmRxLCAQFi+G+n9/rQHl98vUqD0ClwLdS7DB3+nVAEePLZiVRpIo79PAjE
         mwTjNyOe7peMMKQtJz9XqHWdZM6C5iOXisgzf8AtVdWBpDuzNTypCF1FfUpBUA/CA0bX
         9m9WuFaAsqUmmzz/2hkUxvdwDjm34ky5ncuLlK2905ZymYrMUWlvCWLUA5Y8PaDayw5j
         uNZgWrQ1VzJpcgrwrEv8KPmXkwoO+AHjhh/Vt5IaAzzq9SjlA/+GYV25KlfDowgS3WV1
         712g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=s9WMDKSMaGaAb0W2c3/hiLCgdcSXW69E8Ks0OU8vJZM=;
        b=i6y4uxPPwRAuQ6IBxNIkMWIM6caoAEMwrEHM7fJB7cRU9tgdXHvKNnG4Bd7Sxjtijb
         r5xotca4dQw34+l3pTyZGYC9d4X+EPOS1W2GiAScT8l7oTyU47f8Zbc+NbiU3qLsAGbM
         5wCZKhtbfcNf2l6S6clIuqykRk3Bbm3bN7oroIe9Mn7N11fiKr3GCGWwFTY3NA1R08KE
         OqbH2xNgqqnMQjrtmf/9T7hSzyZNhBortFT9XuhyqC4ooL6t0krgWoMhtjMSaMIT5AK4
         yPqdBiJ1G1WhH/cAWpc3KVsDAeRdoaPQJmdm8CxligkjvCFp7m70on2TF+dObORtQGgU
         7dRA==
X-Gm-Message-State: AOAM530ltKMJf4PwUnscH2D31ASVoq+VxR5hXNQ4cinfd5WQj8hbQkJr
        fEi7ESPU+JZS2xT127e78Emz04hTJauBr4R5Vz4=
X-Google-Smtp-Source: ABdhPJwXUS0X7LqHIRAxU5Ee/chr712kdf8Opr0L6t0z2cQAPdOi5tyCmCzmVp1I+KzoryI8Yg9ZC1sTOox1gW/l8XQ=
X-Received: by 2002:a17:90a:1050:: with SMTP id y16mr17629994pjd.181.1610826391350;
 Sat, 16 Jan 2021 11:46:31 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-1-pobrn@protonmail.com> <20210113182016.166049-8-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-8-pobrn@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 16 Jan 2021 21:46:14 +0200
Message-ID: <CAHp75VfjDCAqPpPsaDiRCBDrq7VwyiZpOMpr-VvebPe+3b3w9A@mail.gmail.com>
Subject: Re: [PATCH v2 07/24] platform/x86: ideapad-laptop: use dev_{err,warn}
 or appropriate variant to display log messages
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jan 13, 2021 at 8:22 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Having the device name in the log message makes it easier to determine in
> the context of which device the message was printed, so utilize the
> appropriate variants of dev_{err,warn,...} when printing log messages.

This doesn't explain transitions like pr_err() -> dev_warn() or
pr_info() -> dev_warn().
Care to elaborate in the commit message?

> Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86=
/ideapad-laptop.c
> index 174edbfc52dc..b0d8e332b48a 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -203,7 +203,7 @@ static int read_ec_data(acpi_handle handle, int cmd, =
unsigned long *data)
>                         return 0;
>                 }
>         }
> -       pr_err("timeout in %s\n", __func__);
> +       acpi_handle_err(handle, "timeout in %s\n", __func__);
>         return -1;
>  }
>
> @@ -225,7 +225,7 @@ static int write_ec_cmd(acpi_handle handle, int cmd, =
unsigned long data)
>                 if (val =3D=3D 0)
>                         return 0;
>         }
> -       pr_err("timeout in %s\n", __func__);
> +       acpi_handle_err(handle, "timeout in %s\n", __func__);
>         return -1;
>  }
>
> @@ -696,13 +696,15 @@ static int ideapad_input_init(struct ideapad_privat=
e *priv)
>
>         error =3D sparse_keymap_setup(inputdev, ideapad_keymap, NULL);
>         if (error) {
> -               pr_err("Unable to setup input device keymap\n");
> +               dev_err(&priv->platform_device->dev,
> +                       "Unable to setup input device keymap\n");
>                 goto err_free_dev;
>         }
>
>         error =3D input_register_device(inputdev);
>         if (error) {
> -               pr_err("Unable to register input device\n");
> +               dev_err(&priv->platform_device->dev,
> +                       "Unable to register input device\n");
>                 goto err_free_dev;
>         }
>
> @@ -756,7 +758,8 @@ static void ideapad_check_special_buttons(struct idea=
pad_private *priv)
>                         ideapad_input_report(priv, 64);
>                         break;
>                 default:
> -                       pr_info("Unknown special button: %lu\n", bit);
> +                       dev_warn(&priv->platform_device->dev,
> +                                "Unknown special button: %lu\n", bit);
>                         break;
>                 }
>         }
> @@ -822,7 +825,8 @@ static int ideapad_backlight_init(struct ideapad_priv=
ate *priv)
>                                               &ideapad_backlight_ops,
>                                               &props);
>         if (IS_ERR(blightdev)) {
> -               pr_err("Could not register backlight device\n");
> +               dev_warn(&priv->platform_device->dev,
> +                        "Could not register backlight device\n");
>                 return PTR_ERR(blightdev);
>         }
>
> @@ -934,7 +938,8 @@ static void ideapad_acpi_notify(acpi_handle handle, u=
32 event, void *data)
>                          */
>                         break;
>                 default:
> -                       pr_info("Unknown event: %lu\n", bit);
> +                       dev_warn(&priv->platform_device->dev,
> +                                "Unknown event: %lu\n", bit);
>                 }
>         }
>  }
> @@ -942,12 +947,15 @@ static void ideapad_acpi_notify(acpi_handle handle,=
 u32 event, void *data)
>  #if IS_ENABLED(CONFIG_ACPI_WMI)
>  static void ideapad_wmi_notify(u32 value, void *context)
>  {
> +       struct ideapad_private *priv =3D context;
> +
>         switch (value) {
>         case 128:
> -               ideapad_input_report(context, value);
> +               ideapad_input_report(priv, value);
>                 break;
>         default:
> -               pr_info("Unknown WMI event %u\n", value);
> +               dev_warn(&priv->platform_device->dev,
> +                        "Unknown WMI event: %u\n", value);
>         }
>  }
>  #endif
> --
> 2.30.0
>


--=20
With Best Regards,
Andy Shevchenko
