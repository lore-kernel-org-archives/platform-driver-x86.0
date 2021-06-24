Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6D4C48BDF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Jun 2021 10:25:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58946613FB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Jun 2021 10:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhFXK1e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Jun 2021 06:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbhFXK1e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Jun 2021 06:27:34 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70523C061574
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Jun 2021 03:25:14 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id e33so4357115pgm.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Jun 2021 03:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/jH6JuQVg6/tY+2v2AhmiGVhr9zU1SR9oOoBaVm1p5E=;
        b=fvxJg6UcIM+l4o7jnYGA8oSlv766IidCj/HcO4u7eaiF4aL5akpiRlXssBhqiMhgp0
         bQKpJNi7mC5enGV8rDPDgBRdgle8BWj2c6Ble4LREAZSvaSfeBUzw09c00DGXdR0624N
         a9R1Hw4+p4csTtut4OQYSTkygpjXqOkLSxVI6BORkEIQHzMpNToyBsU66Uj6y3jsSoDZ
         niJx+rpBpvoqmg4hB+TTh3xvZbSjtxgA35jfAWFKKj6njEIjSF/M94x1LOOKiOwEac6E
         zO/eDHQTpEOv4z8Fk7anzB5rEa8esqg87ZpVnE7SYNM6KMVTz4Ks1s7z5pKNerO7prDN
         oLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/jH6JuQVg6/tY+2v2AhmiGVhr9zU1SR9oOoBaVm1p5E=;
        b=nXewBvAA+VxhudYnYBVfcoqbd6bK4rMCzizB0I4ZymceLnjtIL9B4jPTMc54/S5qwu
         SCHYZRy3z4emXDsm2oIxe+FQ8QCSgZgqNyg6eHlaAu1Byn9EwS1gFbhlmSUZmzZefE36
         z3sAsLzSjJ/bKf8FQvLTdQT3gxjDx0TtjMRAVequWZed4c8AGKPDh+DdDr1tWRh/735O
         O+ZXyodHva5p9Qi0xqyTd7dHcoSzYAfyy2S2P8xZ59VqEeO6+zPAdGL1m3zjIE0OwPwb
         Uqu9fIUdhzsmkfD85jxeEWhoGWIBv7KhPpFfTa3OqS+AAIPZ7+2QZC1YJdMazKBhmLbo
         2UGg==
X-Gm-Message-State: AOAM531ziFa0X2Xk8+z+/wENN1YHISt4mBHQqIPnias3DaE/pfLD1c9m
        lr0yIuJDFwBPx/51OEvV141591Soqefnp1yz+Rs=
X-Google-Smtp-Source: ABdhPJw29Eju/mf+UBNolvga8WEi4rYpxsE6v9Md2rn4aZF0IA/2bXdHTQMTu4Lf8HqzRq23zeKDKpXEP2DMe2mxSFM=
X-Received: by 2002:a63:df10:: with SMTP id u16mr4165925pgg.4.1624530313737;
 Thu, 24 Jun 2021 03:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210510074016.31627-1-s.shravan@intel.com> <20210510074016.31627-2-s.shravan@intel.com>
In-Reply-To: <20210510074016.31627-2-s.shravan@intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 24 Jun 2021 13:24:36 +0300
Message-ID: <CAHp75Ve_=mv5MbLvqxGwu8GAuxAjBLpRHE9KNua-yvmzUNKuKw@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] [x86]: BIOS Dynamic SAR driver for Intel M.2 Modem
To:     Shravan S <s.shravan@intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "An, Sudhakar" <sudhakar.an@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 23, 2021 at 5:04 PM Shravan S <s.shravan@intel.com> wrote:

Besides the fact of missed documentation, this code is far from the
upstream-ready quality.
Send a new version to our internal mailing list for the detailed review.

And as I said, the interface should be provided by WWAN subsystem (or
whatever subsystem(s) for this will be suitable *), while this should
be a driver between actual implementation and the abstract interface.
I believe this kind of feature will be needed (if not used already) by
non-Intel hardware and we should have a more unified interface from
day 1. Is it possible?

*) maybe you need to introduce a layer which will provide a common
interface between subsystems and hardware blocks for this kind of
functionality. Either way, lack of documentation is perceptible.

> V2 :
> * Changes to the remove netlink and introduce sysfs to communicate to Userspace via notify
> * Handled review comments by changing ioctl calls to sysfs
> * "sar" name change for platform_device_id to "intc1092"
> * sar_init and sar_exit is modified as per review to minimal initialization
> * Inclusion of debug only enabling of device mode change parameters

You mixed up changelog / commit message / cover letter altogether.
...

> +config INTEL_SAR
> +       tristate "Intel Specific Absorption Rate Driver"
> +       depends on ACPI
> +       help
> +         This driver limit the exposure of human body to RF frequency by informing
> +         the Intel M.2 modem to regulate the RF power based on SAR data obtained
> +         from the sensorscaptured in the BIOS. ACPI interface exposes this data

sensors captured

> +         from the BIOS to SAR driver. The front end application in userspace
> +         will interact with SAR driver to obtain information like the device mode,
> +         Antenna index,baseband index, SAR table index and use available communication
> +         like MBIM interface to enable data communication to modem for RF power regulation.

...

> +static void sar_send_notify(void)
> +{
> +               if (!context) {

> +                       pr_alert("%s: context is null\n", __func__);

Is it dead code?

> +                       return;
> +               }
> +               pr_debug("%s: %d, %d, %d, %d\n", __func__, context->sar_data.device_mode,
> +                        context->sar_data.bandtable_index, context->sar_data.antennatable_index,
> +                        context->sar_data.sartable_index);
> +               sysfs_notify(context->sar_kobject, NULL, "intc_data");
> +}

...

> +static void update_sar_data(void)
> +{
> +               pr_debug("%s: Update SAR data\n", __func__);
> +               if (context->config_data[context->reg_value].device_mode_info &&
> +                   context->sar_data.device_mode <=
> +                   context->config_data[context->reg_value].total_dev_mode) {
> +                       context->sar_data.antennatable_index =
> +                       context->config_data[context->reg_value]
> +                       .device_mode_info[context->sar_data.device_mode].antennatable_index;
> +                       context->sar_data.bandtable_index =
> +                       context->config_data[context->reg_value]
> +                       .device_mode_info[context->sar_data.device_mode].bandtable_index;
> +                       context->sar_data.sartable_index =
> +                       context->config_data[context->reg_value]
> +                       .device_mode_info[context->sar_data.device_mode].sartable_index;

Oy vey, this is quite hard to read, use temporary variables.

> +                       pr_debug("bandtable_index: %d\n", context->sar_data.bandtable_index);
> +                       pr_debug("antennatable_index : %d\n", context->sar_data.antennatable_index);
> +                       pr_debug("sartable_index: %d\n", context->sar_data.sartable_index);

No way. Drop debug prints from production code.


> +               } else {
> +                       pr_err("%s: sar data not assigned! Dev mode: %d, total_dev_mode: %d\n",
> +                              __func__, context->sar_data.device_mode,
> +                              context->config_data[context->reg_value].total_dev_mode);
> +               }
> +}


--
With Best Regards,
Andy Shevchenko
