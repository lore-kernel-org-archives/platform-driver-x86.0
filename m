Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954AEC4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 09:06:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8123F61178
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 09:06:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239389AbhHYJHR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Aug 2021 05:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232302AbhHYJHQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Aug 2021 05:07:16 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE1BC061757
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Aug 2021 02:06:31 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id oa17so16116157pjb.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Aug 2021 02:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tP1ciR5QtwCMOWkolPVb5fk9hxc8x8wX1Wk+cWTWESA=;
        b=AEbifustmXm6o8vn8qcNo5kMrGYIWkbxKW6Q+Dkg2GWaQDTgmTQZvsvf6lTQZcxctm
         s3uZmRclysxpJGcb1DaxWGSIoWlF6xhRPq0UP1nhjgmU5MMGognqRDOrxv8ZZlAnrbTb
         +gyFH4zJ1+QEObERbCV1WqD228V9xeO4fxjtdqZKE/nB8o8HvwS/eoOn/0ovFne78IFF
         3AlZ9AGYNGXwk30v70VS+y/5iMoBTKCm2wjdNoLPMxeakwvZyopRyGPfPsZfEpbND2/M
         bFTsMxRl5GObk9ZVFF7CAb4AjiFUIjJ9eS9wWiF8wPx/yGVzUh6DQMlQNrchIcuI2Ljp
         zB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tP1ciR5QtwCMOWkolPVb5fk9hxc8x8wX1Wk+cWTWESA=;
        b=cQGRJRXhBndbH/rHmuKk/6OMjQ/eQCv0gsKOVEgipGyfA65DJI59NKAlQRgJWVWUh8
         bqDnNvaalvCINZBkoV7cLHFjEVjMXH5OKPYdi9gn5SOkaU2kTTeumKfmYmp3+T4uiH+y
         ZHP0aEs+o57rulCPwIK69kT/FQNeM2Ky1tUn4zho/SZwWEetpHik3PsGTnkHFxqGSW9d
         4xLM8tu2Dqn7hX4YIvpIUkmY1yglPuYKwCowG3zw2o8ZTJS6yFlX6NQJO6Dji1fkAM2x
         vTGuI6/OmnqJaiEShaQlaImVgFwnkmufWGRra0reMh9i1X4RICufzwykA61ZntIm5NRI
         UTtA==
X-Gm-Message-State: AOAM530vGsWaigNp1j5WkNJfObPh9OhNnxqYyoc81rwUnY6/6Bh2Z+kM
        Jx9fbIzXasUNL7zJnSXf4LJ3sJivnuu6PAoL3PA=
X-Google-Smtp-Source: ABdhPJx+I869Dn5zt+VrP+dw+Pxytbvb3AgXzD/hwSYagfF9mH3ad2x1VAkuD6DQdM3Busjj8EtGdegrQaqWrFx3qxs=
X-Received: by 2002:a17:902:d709:b0:130:6b05:be3e with SMTP id
 w9-20020a170902d70900b001306b05be3emr25465427ply.21.1629882390848; Wed, 25
 Aug 2021 02:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <877ae34b-dcbb-a0a4-7d76-d9d78d12fd00@redhat.com> <20210824220437.14175-1-ddadap@nvidia.com>
In-Reply-To: <20210824220437.14175-1-ddadap@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 25 Aug 2021 12:05:54 +0300
Message-ID: <CAHp75VfjSrq7vF=ry1dTHJWbKLF9AqK8kZbddO-1A3FQ5pCvhQ@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     Daniel Dadap <ddadap@nvidia.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        mario.limonciello@outlook.com, pobrn@protonmail.org,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Aaron Plattner <aplattner@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Aug 25, 2021 at 1:09 AM Daniel Dadap <ddadap@nvidia.com> wrote:
>
> A number of upcoming notebook computer designs drive the internal
> display panel's backlight PWM through the Embedded Controller (EC).
> This EC-based backlight control can be plumbed through to an ACPI
> "WMAA" method interface, which in turn can be wrapped by WMI with
> the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.
>
> Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
> backlight class driver to control backlight levels on systems with
> EC-driven backlights.

I tried to avoid repetition of the comments given by others.

So, mine below.

...

> +config WMAA_BACKLIGHT_WMI
> +       tristate "ACPI WMAA Backlight Driver"
> +       depends on ACPI_WMI
> +       depends on BACKLIGHT_CLASS_DEVICE
> +       help
> +         This driver provides a sysfs backlight interface for notebook
> +         systems which expose the WMAA ACPI method and an associated WMI
> +         wrapper to drive LCD backlight levels through the system's
> +         Embedded Controller.

Please, add a sentence to tell how the module will be called. There
are plenty of examples in the kernel.

...

> +struct wmaa_args {
> +       u32 set;
> +       u32 val;
> +       u32 ret;
> +       u32 ignored[3];
> +};

I guess this structure deserves a kernel doc.

...

> +static const struct wmi_device_id wmaa_backlight_wmi_id_table[] = {
> +       { .guid_string = WMAA_WMI_GUID },

> +       { },

No comma for termination.

> +};

...

> +static int wmaa_backlight_get_brightness(struct backlight_device *bd)
> +{
> +       u32 level;
> +       int ret;
> +
> +       ret = wmaa_get_brightness(&level);

> +       WARN_ON(ret != 0);

Why?

> +       return ret == 0 ? level : 0;
> +}

...

> +static int wmaa_backlight_wmi_probe(struct wmi_device *w, const void *ctx)
> +{
> +       struct backlight_properties props = {0};

{} is slightly better.

> +       struct wmi_wmaa_priv *priv;
> +       u32 source;
> +       int ret;
> +
> +       priv = devm_kmalloc(&w->dev, sizeof(*priv), GFP_KERNEL);
> +       if(!priv)
> +               return -ENOMEM;

> +       wdev = w;

I'm wondering if it's possible to avoid having a global variable.

> +       ret = wmaa_get_brightness_source(&source);
> +       if (ret)
> +               goto done;
> +
> +       if (source != WMAA_SOURCE_EC) {
> +               ret = -ENODEV;
> +               goto done;
> +       }
> +
> +       // Register a backlight handler
> +       props.type = BACKLIGHT_PLATFORM;
> +       ret = wmaa_get_max_brightness(&props.max_brightness);
> +       if (ret)
> +               goto done;
> +
> +       ret = wmaa_get_brightness(&props.brightness);
> +       if (ret)
> +               goto done;
> +
> +       priv->backlight = backlight_device_register("wmaa_backlight",
> +               NULL, NULL, &wmaa_backlight_ops, &props);
> +       if (IS_ERR(priv->backlight))
> +               return PTR_ERR(priv->backlight);
> +
> +       dev_set_drvdata(&w->dev, priv);

> +done:

Useless. Return directly.

> +       return ret;
> +}

...

> +static struct wmi_driver wmaa_backlight_wmi_driver = {
> +       .driver = {
> +               .name = "wmaa-backlight",
> +       },
> +       .probe = wmaa_backlight_wmi_probe,
> +       .remove = wmaa_backlight_wmi_remove,
> +       .id_table = wmaa_backlight_wmi_id_table,
> +};

> +

Redundant blank line.

> +module_wmi_driver(wmaa_backlight_wmi_driver);

...

> +
> +MODULE_ALIAS("wmi:"WMAA_WMI_GUID);

Can you move this closer to GUID? But I'm not sure what is the
preferred style. Hans?

-- 
With Best Regards,
Andy Shevchenko
