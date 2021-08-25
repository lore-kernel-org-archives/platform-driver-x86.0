Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F48C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 10:40:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDDEF6108F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 10:40:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240037AbhHYKlR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Aug 2021 06:41:17 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58274
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239993AbhHYKlP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Aug 2021 06:41:15 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 404AE406F6
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Aug 2021 10:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629888029;
        bh=BomR5qRxPE9FmaYF/P5LDWKwqrGGLdAmhXQWLWzg0l0=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=irwJaa1CZdNMQt35wuXupM5ZtSeC7ydcKu+p/c1GNoydmvApzkAqlMXiAoFS/NVdx
         LL8ej2/RLC1HsPl6v237wuWLPWklaqgJEd7RAxtl/+fulqiV3hHmpwwnfllIr3XXZx
         53E8mrVCdkGC2IS8QgaBuku80E117j8i+09WQTufJVcE7UBOVkBciC7Kg64dETHTJQ
         dJWaelXrzoUkEImlOtEi1zIOQeHWkjZq1ixeTxqSLQM6NFC8swmM2OtXc5vjqSnvL2
         sMAxBQiLO0qsK/Jxk71jnbfJuMIPkVkyyDx4aq+/h9cjzDnXN5CTyk5OVpMh5AD+7T
         FE1acWH6P6WMA==
Received: by mail-ed1-f72.google.com with SMTP id s8-20020a508dc8000000b003c19f7fe952so6620015edh.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Aug 2021 03:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BomR5qRxPE9FmaYF/P5LDWKwqrGGLdAmhXQWLWzg0l0=;
        b=hNSjRQoZn7DvumWSH9opwoUCS6W/pdcLcS9dF1PirHsfiQFygQw+toS3KGxlfk8zZ3
         9W5L9LjBJ3XIa+ZjUvNUHkXCk1jd9EbJ8cL8R0dG0Pma2J759237OQrgyjeYDIgqDu9Z
         3KMC9o9bi0Kkk4+xYT/fldhcfWDYIbvqIAHpykArzv7XnebYULsQAfWRzJ6/8a2BcRAH
         14Iac7LDEyafhhWUF9/DUnK6QuY4Pi7OvH6uu5vI4HO2EJcRTiO0lG9FT24S/0MJtg9f
         X0eCchPLQpyDrIrCUuAP1oRw4OXg2bK0AfmkZOHMIGu8iktavvgoJ4LFQae6g7sVurGm
         Pqkw==
X-Gm-Message-State: AOAM530T/Z4oXIOufPWC0DA6AHYF9Ro4yClyCrByvSGFQ9ZhkFvWSV10
        FHOgAEiJBLDu8r6gGupsHQMbJJUz5wzIZMgcqGdQnLnG0FQHTxlRwGFOsPoX3WMqNr+eUdpElGz
        s2ns7lH5G/dzV5sKRcJBToH2u5Lv7+CNmKvXWY9ctN5SgBeSLLt2UAZCFLOCGPWAaEPc=
X-Received: by 2002:a05:6402:2806:: with SMTP id h6mr7230491ede.259.1629888028887;
        Wed, 25 Aug 2021 03:40:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3J92grIs8eAex3JG6UT4nm5rpzCKGGwTa2YeXadSKAkBhivX3M5tMV45HAAIGsp70yCKOBhAU9PMdDoSl8Nc=
X-Received: by 2002:a05:6402:2806:: with SMTP id h6mr7230476ede.259.1629888028645;
 Wed, 25 Aug 2021 03:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210823093222.19544-1-andriy.shevchenko@linux.intel.com> <20210823093222.19544-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210823093222.19544-2-andriy.shevchenko@linux.intel.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Wed, 25 Aug 2021 18:40:17 +0800
Message-ID: <CAAd53p5V2BcjG=Sds==qdOomZpCJON94B93DRU+fPkzTffGCyQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: hp_accel: Remove _INI method call
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Eric Piel <eric.piel@tremplin-utc.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Aug 23, 2021 at 5:32 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> According to ACPI specification the _INI method must be called
> when device is enumerated first time. After that there is no need
> to repeat the procedure. Convert the lis3lv02d_acpi_init() to be
> a stub (Note, we may not remove it because it is called unconditionally
> by the accelerometer main driver).
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The lis3lv02d still works after boot and after resume.

Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

> ---
>  drivers/misc/lis3lv02d/lis3lv02d.h |  1 -
>  drivers/platform/x86/hp_accel.c    | 14 +-------------
>  2 files changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/drivers/misc/lis3lv02d/lis3lv02d.h b/drivers/misc/lis3lv02d/lis3lv02d.h
> index 7ac788fae1b8..c394c0b08519 100644
> --- a/drivers/misc/lis3lv02d/lis3lv02d.h
> +++ b/drivers/misc/lis3lv02d/lis3lv02d.h
> @@ -271,7 +271,6 @@ struct lis3lv02d {
>         int                     regs_size;
>         u8                      *reg_cache;
>         bool                    regs_stored;
> -       bool                    init_required;
>         u8                      odr_mask;  /* ODR bit mask */
>         u8                      whoami;    /* indicates measurement precision */
>         s16 (*read_data) (struct lis3lv02d *lis3, int reg);
> diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
> index 8c0867bda828..54a4addc7903 100644
> --- a/drivers/platform/x86/hp_accel.c
> +++ b/drivers/platform/x86/hp_accel.c
> @@ -78,23 +78,14 @@ static const struct acpi_device_id lis3lv02d_device_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, lis3lv02d_device_ids);
>
> -
>  /**
> - * lis3lv02d_acpi_init - ACPI _INI method: initialize the device.
> + * lis3lv02d_acpi_init - initialize the device for ACPI
>   * @lis3: pointer to the device struct
>   *
>   * Returns 0 on success.
>   */
>  static int lis3lv02d_acpi_init(struct lis3lv02d *lis3)
>  {
> -       struct acpi_device *dev = lis3->bus_priv;
> -       if (!lis3->init_required)
> -               return 0;
> -
> -       if (acpi_evaluate_object(dev->handle, METHOD_NAME__INI,
> -                                NULL, NULL) != AE_OK)
> -               return -EINVAL;
> -
>         return 0;
>  }
>
> @@ -359,7 +350,6 @@ static int lis3lv02d_add(struct acpi_device *device)
>         }
>
>         /* call the core layer do its init */
> -       lis3_dev.init_required = true;
>         ret = lis3lv02d_init_device(&lis3_dev);
>         if (ret)
>                 return ret;
> @@ -407,14 +397,12 @@ static int lis3lv02d_suspend(struct device *dev)
>
>  static int lis3lv02d_resume(struct device *dev)
>  {
> -       lis3_dev.init_required = false;
>         lis3lv02d_poweron(&lis3_dev);
>         return 0;
>  }
>
>  static int lis3lv02d_restore(struct device *dev)
>  {
> -       lis3_dev.init_required = true;
>         lis3lv02d_poweron(&lis3_dev);
>         return 0;
>  }
> --
> 2.32.0
>
