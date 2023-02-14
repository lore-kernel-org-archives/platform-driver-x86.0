Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B4DC05027
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Feb 2023 13:02:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbjBNNCX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Feb 2023 08:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbjBNNCW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Feb 2023 08:02:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B91B171D
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Feb 2023 05:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676379698;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o/bdjIitu+CUAi54VFm23s9vTuMwzAyu/muxTHLe2Aw=;
        b=V3MdWWDrp7chHrP+lbwOTJNsvnc8WOd3C9b+TtHmo6s1BKmnddXZY8n1FavWj18JVrMBDf
        tn8pEf+FbAdjVVpQHTlQG8eVXSpfC06MlWbqTSePin3CxNgllh+oDPMCqSpXUpBHAxhEDY
        4TaO71PSmtBa+3cUPJ0ywDC3gcIAP0M=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-208-5xgLhqT9Nta1izxpOifEcQ-1; Tue, 14 Feb 2023 08:01:36 -0500
X-MC-Unique: 5xgLhqT9Nta1izxpOifEcQ-1
Received: by mail-ej1-f71.google.com with SMTP id jo5-20020a170906f6c500b008b133fc52e9so790247ejb.22
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Feb 2023 05:01:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/bdjIitu+CUAi54VFm23s9vTuMwzAyu/muxTHLe2Aw=;
        b=deTNUKZ2Vh49B8HTXZDGCkMJU7JYCnG6de59qsq53Mlug1phyj1IbCJ4fzzP9HSxq0
         GY7432TO+w6ySZaWB/l+VSGd/ozLh0fwyT/a+Fo7eAYOpvAqJNPWI8t8FtInE5FjGU0g
         Vbwwcjfz3B4Sb43JLy/uB52+115CflAnv71jc+LujuroJ0X2X18M/F1kvHM+0xXNEYJl
         IXD2EesTygP3rWUWbffVoQI0JbHF4LRZhjZDw5HB67Q9BkkwehHRD1vUB4cvSRkGszGY
         Yw0zuKqfCN9Q6e+dqoOoftmDDFDqzAKvbUdHtydO0Bfu/v/BnSNmMmGgCb+3tfpY6EM5
         zIlA==
X-Gm-Message-State: AO0yUKVOSSYsju4pCqH7eyuErdc7R1vQ9ocACpIjX4sbJKbMQN1/RLFq
        qKF8HzKyI23PxXHe44jclFMYNTc8u/sh0Uru8Dutnhb0p8SVPZyOgG7f/5GTdUtxYpKPYXxSmyk
        LOU9J8bsV1PLvaoW8SSkkyNI5cCb57Dq/Vw==
X-Received: by 2002:a17:906:34cf:b0:8af:1a8c:f13f with SMTP id h15-20020a17090634cf00b008af1a8cf13fmr3233901ejb.71.1676379695085;
        Tue, 14 Feb 2023 05:01:35 -0800 (PST)
X-Google-Smtp-Source: AK7set/Ji9eFYxRQ9Yotzpof60P9xgX5gxqky6EMIhNEPcnOWWw61f2cHAg08iTY76J/P4pEjDTDkQ==
X-Received: by 2002:a17:906:34cf:b0:8af:1a8c:f13f with SMTP id h15-20020a17090634cf00b008af1a8cf13fmr3233868ejb.71.1676379694757;
        Tue, 14 Feb 2023 05:01:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j9-20020a1709066dc900b008b1294f7f63sm1148226ejt.221.2023.02.14.05.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 05:01:34 -0800 (PST)
Message-ID: <3362328b-07ae-0a33-bfdc-cbf4ce4e2e8f@redhat.com>
Date:   Tue, 14 Feb 2023 14:01:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Add msi-ec driver, known EC configurations and battery
 thresholds
Content-Language: en-US, nl
To:     Nikita Kravets <teackot@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20230208165853.374993-1-teackot@gmail.com>
 <6fdf3db8-4d84-6998-ffe5-4cde225264a7@redhat.com>
 <CAPXvF074t=NLgozJNQrVPEd7==QbgaQvcd-Hu9f6kSZwNdPn_w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAPXvF074t=NLgozJNQrVPEd7==QbgaQvcd-Hu9f6kSZwNdPn_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/13/23 19:45, Nikita Kravets wrote:
> Hi Hans,
> 
> I've just sent you an updated patch with a better commit message, could you please check it?

This looks ready for submission to the mailinglist, please
resend it with platform-driver-x86@vger.kernel.org added
to the Cc.

Then I will do a detailed review when I can make some time for this.

Regards,

Hans






> 
> 
> On Mon, Feb 13, 2023 at 5:42 PM Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> 
>     Hi Nikita,
> 
>     You need to write something of a detailed commit message here. Right
>     now your commit message is just:
> 
>     "Add msi-ec driver, known EC configurations and battery thresholds"
> 
>     This should change to something like this:
> 
>     """
>     platform/x86: Add new msi-ec driver
> 
>     Add a new driver to allow various MSI laptops' functionalities to be
>     controlled from userspace..
> 
>     This driver contains EC memory configurations for different firmware
>     versions and exports battery charge thresholds to userspace.
> 
>     Link: https://github.com/BeardOverflow/msi-ec/ <https://github.com/BeardOverflow/msi-ec/>
>     Signed-off-by: Nikita Kravets <teackot@gmail.com <mailto:teackot@gmail.com>>
>     """
> 
>     Note the Signed-off-by at the end has a special meaning.
>     I can only accept patches with such a Signed-off-by line in the commit-message.
> 
>     By adding this line you indicate that you are the author of the code and
>     are submitting it under the existing license for the file which you are
>     modifying (typically GPL-2.0) or that you have permission from the other
>     authors to submit it under this license. See:
> 
>     https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin>
> 
>     Since the existing msi-ec.c already has a:
> 
>     "// SPDX-License-Identifier: GPL-2.0-or-later"
> 
>     line at the top, there is no problem here, adding the S-o-b is just
>     a formality indicating the code was submitted by you to me and then I'll
>     add my own S-o-b below yours before submitting it to Linus Torvalds.
> 
>     If you change your commit message as suggested above (or to something
>     similar) then git send-email will use the first line for the Subject of
>     the email and put the rest in the body of the email, above the '---'
>     line which it puts just before the patch starts.
> 
>     Regards,
> 
>     Hans
> 
> 
> 
> 
>     On 2/8/23 17:58, Nikita Kravets wrote:
>     > ---
>     >  drivers/platform/x86/Kconfig  |   7 +
>     >  drivers/platform/x86/Makefile |   1 +
>     >  drivers/platform/x86/msi-ec.c | 528 ++++++++++++++++++++++++++++++++++
>     >  drivers/platform/x86/msi-ec.h | 119 ++++++++
>     >  4 files changed, 655 insertions(+)
>     >  create mode 100644 drivers/platform/x86/msi-ec.c
>     >  create mode 100644 drivers/platform/x86/msi-ec.h
>     >
>     > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>     > index 5692385e2d26..4534d11f9ca5 100644
>     > --- a/drivers/platform/x86/Kconfig
>     > +++ b/drivers/platform/x86/Kconfig
>     > @@ -644,6 +644,13 @@ config THINKPAD_LMI
>     > 
>     >  source "drivers/platform/x86/intel/Kconfig"
>     > 
>     > +config MSI_EC
>     > +     tristate "MSI EC Extras"
>     > +     depends on ACPI
>     > +     help
>     > +       This driver allows various MSI laptops' functionalities to be
>     > +       controlled from userspace, including battery charge threshold.
>     > +
>     >  config MSI_LAPTOP
>     >       tristate "MSI Laptop Extras"
>     >       depends on ACPI
>     > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>     > index 1d3d1b02541b..7cc2beca8208 100644
>     > --- a/drivers/platform/x86/Makefile
>     > +++ b/drivers/platform/x86/Makefile
>     > @@ -71,6 +71,7 @@ obj-$(CONFIG_THINKPAD_LMI)  += think-lmi.o
>     >  obj-y                                += intel/
>     > 
>     >  # MSI
>     > +obj-$(CONFIG_MSI_EC)         += msi-ec.o
>     >  obj-$(CONFIG_MSI_LAPTOP)     += msi-laptop.o
>     >  obj-$(CONFIG_MSI_WMI)                += msi-wmi.o
>     > 
>     > diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
>     > new file mode 100644
>     > index 000000000000..b32106445bf6
>     > --- /dev/null
>     > +++ b/drivers/platform/x86/msi-ec.c
>     > @@ -0,0 +1,528 @@
>     > +/* SPDX-License-Identifier: GPL-2.0-or-later */
>     > +
>     > +/*
>     > + * msi-ec: MSI laptops' embedded controller driver.
>     > + *
>     > + * This driver allows various MSI laptops' functionalities to be
>     > + * controlled from userspace.
>     > + *
>     > + * It contains EC memory configurations for different firmware versions
>     > + * and exports battery charge thresholds to userspace.
>     > + *
>     > + * Copyright (C) 2023 Jose Angel Pastrana <japp0005@red.ujaen.es <mailto:japp0005@red.ujaen.es>>
>     > + * Copyright (C) 2023 Aakash Singh <mail@singhaakash.dev <mailto:mail@singhaakash.dev>>
>     > + * Copyright (C) 2023 Nikita Kravets <teackot@gmail.com <mailto:teackot@gmail.com>>
>     > + */
>     > +
>     > +#include "msi-ec.h"
>     > +
>     > +#include <acpi/battery.h>
>     > +#include <linux/acpi.h>
>     > +#include <linux/init.h>
>     > +#include <linux/kernel.h>
>     > +#include <linux/module.h>
>     > +#include <linux/platform_device.h>
>     > +#include <linux/proc_fs.h>
>     > +#include <linux/seq_file.h>
>     > +
>     > +static const char *const SM_ECO_NAME       = "eco";
>     > +static const char *const SM_COMFORT_NAME   = "comfort";
>     > +static const char *const SM_SPORT_NAME     = "sport";
>     > +static const char *const SM_TURBO_NAME     = "turbo";
>     > +
>     > +static const char *ALLOWED_FW_0[] __initdata = {
>     > +     "14C1EMS1.101",
>     > +     NULL,
>     > +};
>     > +
>     > +static struct msi_ec_conf CONF0 __initdata = {
>     > +     .allowed_fw = ALLOWED_FW_0,
>     > +     .charge_control = {
>     > +             .address      = 0xef,
>     > +             .offset_start = 0x8a,
>     > +             .offset_end   = 0x80,
>     > +             .range_min    = 0x8a,
>     > +             .range_max    = 0xe4,
>     > +     },
>     > +     .webcam = {
>     > +             .address       = 0x2e,
>     > +             .block_address = 0x2f,
>     > +             .bit           = 1,
>     > +     },
>     > +     .fn_super_swap = {
>     > +             .address = 0xbf,
>     > +             .bit     = 4,
>     > +     },
>     > +     .cooler_boost = {
>     > +             .address = 0x98,
>     > +             .bit     = 7,
>     > +     },
>     > +     .shift_mode = {
>     > +             .address = 0xf2,
>     > +             .modes = {
>     > +                     { SM_ECO_NAME,     0xc2 },
>     > +                     { SM_COMFORT_NAME, 0xc1 },
>     > +                     { SM_SPORT_NAME,   0xc0 },
>     > +             },
>     > +             .modes_count = 3,
>     > +     },
>     > +     .super_battery = {
>     > +             .supported = false,
>     > +     },
>     > +     .fan_mode = {
>     > +             .address = 0xf4,
>     > +     },
>     > +     .cpu = {
>     > +             .rt_temp_address       = 0x68,
>     > +             .rt_fan_speed_address  = 0x71,
>     > +             .rt_fan_speed_base_min = 0x19,
>     > +             .rt_fan_speed_base_max = 0x37,
>     > +             .bs_fan_speed_address  = 0x89,
>     > +             .bs_fan_speed_base_min = 0x00,
>     > +             .bs_fan_speed_base_max = 0x0f,
>     > +     },
>     > +     .gpu = {
>     > +             .rt_temp_address      = 0x80,
>     > +             .rt_fan_speed_address = 0x89,
>     > +     },
>     > +     .leds = {
>     > +             .micmute_led_address = 0x2b,
>     > +             .mute_led_address    = 0x2c,
>     > +             .bit                 = 2,
>     > +     },
>     > +     .kbd_bl = {
>     > +             .bl_mode_address  = 0x2c, // ?
>     > +             .bl_modes         = { 0x00, 0x08 }, // ?
>     > +             .max_mode         = 1, // ?
>     > +             .bl_state_address = 0xf3,
>     > +             .state_base_value = 0x80,
>     > +             .max_state        = 3,
>     > +     },
>     > +};
>     > +
>     > +static const char *ALLOWED_FW_1[] __initdata = {
>     > +     "17F2EMS1.106",
>     > +     NULL,
>     > +};
>     > +
>     > +static struct msi_ec_conf CONF1 __initdata = {
>     > +     .allowed_fw = ALLOWED_FW_1,
>     > +     .charge_control = {
>     > +             .address      = 0xef,
>     > +             .offset_start = 0x8a,
>     > +             .offset_end   = 0x80,
>     > +             .range_min    = 0x8a,
>     > +             .range_max    = 0xe4,
>     > +     },
>     > +     .webcam = {
>     > +             .address       = 0x2e,
>     > +             .block_address = 0x2f,
>     > +             .bit           = 1,
>     > +     },
>     > +     .fn_super_swap = {
>     > +             .address = 0xbf,
>     > +             .bit     = 4,
>     > +     },
>     > +     .cooler_boost = {
>     > +             .address = 0x98,
>     > +             .bit     = 7,
>     > +     },
>     > +     .shift_mode = {
>     > +             .address = 0xf2,
>     > +             .modes = {
>     > +                     { SM_ECO_NAME,     0xc2 },
>     > +                     { SM_COMFORT_NAME, 0xc1 },
>     > +                     { SM_SPORT_NAME,   0xc0 },
>     > +                     { SM_TURBO_NAME,   0xc4 },
>     > +             },
>     > +             .modes_count = 4,
>     > +     },
>     > +     .super_battery = {
>     > +             .supported = false,
>     > +     },
>     > +     .fan_mode = {
>     > +             .address = 0xf4,
>     > +     },
>     > +     .cpu = {
>     > +             .rt_temp_address       = 0x68,
>     > +             .rt_fan_speed_address  = 0x71,
>     > +             .rt_fan_speed_base_min = 0x19,
>     > +             .rt_fan_speed_base_max = 0x37,
>     > +             .bs_fan_speed_address  = 0x89,
>     > +             .bs_fan_speed_base_min = 0x00,
>     > +             .bs_fan_speed_base_max = 0x0f,
>     > +     },
>     > +     .gpu = {
>     > +             .rt_temp_address      = 0x80,
>     > +             .rt_fan_speed_address = 0x89,
>     > +     },
>     > +     .leds = {
>     > +             .micmute_led_address = 0x2b,
>     > +             .mute_led_address    = 0x2c,
>     > +             .bit                 = 2,
>     > +     },
>     > +     .kbd_bl = {
>     > +             .bl_mode_address  = 0x2c, // ?
>     > +             .bl_modes         = { 0x00, 0x08 }, // ?
>     > +             .max_mode         = 1, // ?
>     > +             .bl_state_address = 0xf3,
>     > +             .state_base_value = 0x80,
>     > +             .max_state        = 3,
>     > +     },
>     > +};
>     > +
>     > +static const char *ALLOWED_FW_2[] __initdata = {
>     > +     "1552EMS1.118",
>     > +     NULL,
>     > +};
>     > +
>     > +static struct msi_ec_conf CONF2 __initdata = {
>     > +     .allowed_fw = ALLOWED_FW_2,
>     > +     .charge_control = {
>     > +             .address      = 0xd7,
>     > +             .offset_start = 0x8a,
>     > +             .offset_end   = 0x80,
>     > +             .range_min    = 0x8a,
>     > +             .range_max    = 0xe4,
>     > +     },
>     > +     .webcam = {
>     > +             .address       = 0x2e,
>     > +             .block_address = 0x2f,
>     > +             .bit           = 1,
>     > +     },
>     > +     .fn_super_swap = {
>     > +             .address = 0xe8,
>     > +             .bit     = 4,
>     > +     },
>     > +     .cooler_boost = {
>     > +             .address = 0x98,
>     > +             .bit     = 7,
>     > +     },
>     > +     .shift_mode = {
>     > +             .address = 0xf2,
>     > +             .modes = {
>     > +                     { SM_ECO_NAME,     0xc2 },
>     > +                     { SM_COMFORT_NAME, 0xc1 },
>     > +                     { SM_SPORT_NAME,   0xc0 },
>     > +             },
>     > +             .modes_count = 3,
>     > +     },
>     > +     .super_battery = {
>     > +             .supported = true,
>     > +             .address   = 0xeb,
>     > +             .mask      = 0x0f,
>     > +     },
>     > +     .fan_mode = {
>     > +             .address = 0xd4,
>     > +     },
>     > +     .cpu = {
>     > +             .rt_temp_address       = 0x68,
>     > +             .rt_fan_speed_address  = 0x71,
>     > +             .rt_fan_speed_base_min = 0x19,
>     > +             .rt_fan_speed_base_max = 0x37,
>     > +             .bs_fan_speed_address  = 0x89,
>     > +             .bs_fan_speed_base_min = 0x00,
>     > +             .bs_fan_speed_base_max = 0x0f,
>     > +     },
>     > +     .gpu = {
>     > +             .rt_temp_address      = 0x80,
>     > +             .rt_fan_speed_address = 0x89,
>     > +     },
>     > +     .leds = {
>     > +             .micmute_led_address = 0x2c,
>     > +             .mute_led_address    = 0x2d,
>     > +             .bit                 = 1,
>     > +     },
>     > +     .kbd_bl = {
>     > +             .bl_mode_address  = 0x2c, // ?
>     > +             .bl_modes         = { 0x00, 0x08 }, // ?
>     > +             .max_mode         = 1, // ?
>     > +             .bl_state_address = 0xd3,
>     > +             .state_base_value = 0x80,
>     > +             .max_state        = 3,
>     > +     },
>     > +};
>     > +
>     > +static const char *ALLOWED_FW_3[] __initdata = {
>     > +     "1592EMS1.111",
>     > +     "E1592IMS.10C",
>     > +     NULL,
>     > +};
>     > +
>     > +static struct msi_ec_conf CONF3 __initdata = {
>     > +     .allowed_fw = ALLOWED_FW_3,
>     > +     .charge_control = {
>     > +             .address      = 0xef,
>     > +             .offset_start = 0x8a,
>     > +             .offset_end   = 0x80,
>     > +             .range_min    = 0x8a,
>     > +             .range_max    = 0xe4,
>     > +     },
>     > +     .webcam = {
>     > +             .address       = 0x2e,
>     > +             .block_address = 0x2f,
>     > +             .bit           = 1,
>     > +     },
>     > +     .fn_super_swap = {
>     > +             .address = 0xe8,
>     > +             .bit     = 4,
>     > +     },
>     > +     .cooler_boost = {
>     > +             .address = 0x98,
>     > +             .bit     = 7,
>     > +     },
>     > +     .shift_mode = {
>     > +             .address = 0xd2,
>     > +             .modes = {
>     > +                     { SM_ECO_NAME,     0xc2 },
>     > +                     { SM_COMFORT_NAME, 0xc1 },
>     > +                     { SM_SPORT_NAME,   0xc0 },
>     > +             },
>     > +             .modes_count = 3,
>     > +     },
>     > +     .super_battery = {
>     > +             .supported = true,
>     > +             .address   = 0xeb,
>     > +             .mask      = 0x0f,
>     > +     },
>     > +     .fan_mode = {
>     > +             .address = 0xd4,
>     > +     },
>     > +     .cpu = {
>     > +             .rt_temp_address       = 0x68,
>     > +             .rt_fan_speed_address  = 0xc9,
>     > +             .rt_fan_speed_base_min = 0x19,
>     > +             .rt_fan_speed_base_max = 0x37,
>     > +             .bs_fan_speed_address  = 0x89, // ?
>     > +             .bs_fan_speed_base_min = 0x00,
>     > +             .bs_fan_speed_base_max = 0x0f,
>     > +     },
>     > +     .gpu = {
>     > +             .rt_temp_address      = 0x80,
>     > +             .rt_fan_speed_address = 0x89,
>     > +     },
>     > +     .leds = {
>     > +             .micmute_led_address = 0x2b,
>     > +             .mute_led_address    = 0x2c,
>     > +             .bit                 = 1,
>     > +     },
>     > +     .kbd_bl = {
>     > +             .bl_mode_address  = 0x2c, // ?
>     > +             .bl_modes         = { 0x00, 0x08 }, // ?
>     > +             .max_mode         = 1, // ?
>     > +             .bl_state_address = 0xd3,
>     > +             .state_base_value = 0x80,
>     > +             .max_state        = 3,
>     > +     },
>     > +};
>     > +
>     > +static struct msi_ec_conf *CONFIGURATIONS[] __initdata = {
>     > +     &CONF0,
>     > +     &CONF1,
>     > +     &CONF2,
>     > +     &CONF3,
>     > +     NULL,
>     > +};
>     > +
>     > +static struct msi_ec_conf conf; // current configuration
>     > +
>     > +// ============================================================ //
>     > +// Helper functions
>     > +// ============================================================ //
>     > +
>     > +static int ec_read_seq(u8 addr, u8 *buf, int len)
>     > +{
>     > +     int result;
>     > +     u8 i;
>     > +     for (i = 0; i < len; i++) {
>     > +             result = ec_read(addr + i, buf + i);
>     > +             if (result < 0)
>     > +                     return result;
>     > +     }
>     > +     return 0;
>     > +}
>     > +
>     > +static int ec_get_firmware_version(u8 buf[MSI_EC_FW_VERSION_LENGTH + 1])
>     > +{
>     > +     int result;
>     > +
>     > +     memset(buf, 0, MSI_EC_FW_VERSION_LENGTH + 1);
>     > +     result = ec_read_seq(MSI_EC_FW_VERSION_ADDRESS,
>     > +                          buf,
>     > +                          MSI_EC_FW_VERSION_LENGTH);
>     > +     if (result < 0)
>     > +             return result;
>     > +
>     > +     return MSI_EC_FW_VERSION_LENGTH + 1;
>     > +}
>     > +
>     > +// ============================================================ //
>     > +// Sysfs power_supply subsystem
>     > +// ============================================================ //
>     > +
>     > +static ssize_t charge_control_threshold_show(u8 offset, struct device *device,
>     > +                                          struct device_attribute *attr,
>     > +                                          char *buf)
>     > +{
>     > +     u8 rdata;
>     > +     int result;
>     > +
>     > +     result = ec_read(conf.charge_control.address, &rdata);
>     > +     if (result < 0)
>     > +             return result;
>     > +
>     > +     return sprintf(buf, "%i\n", rdata - offset);
>     > +}
>     > +
>     > +static ssize_t charge_control_threshold_store(u8 offset, struct device *dev,
>     > +                                           struct device_attribute *attr,
>     > +                                           const char *buf, size_t count)
>     > +{
>     > +     u8 wdata;
>     > +     int result;
>     > +
>     > +     result = kstrtou8(buf, 10, &wdata);
>     > +     if (result < 0)
>     > +             return result;
>     > +
>     > +     wdata += offset;
>     > +     if (wdata < conf.charge_control.range_min ||
>     > +         wdata > conf.charge_control.range_max)
>     > +             return -EINVAL;
>     > +
>     > +     result = ec_write(conf.charge_control.address, wdata);
>     > +     if (result < 0)
>     > +             return result;
>     > +
>     > +     return count;
>     > +}
>     > +
>     > +static ssize_t
>     > +charge_control_start_threshold_show(struct device *device,
>     > +                                 struct device_attribute *attr, char *buf)
>     > +{
>     > +     return charge_control_threshold_show(conf.charge_control.offset_start,
>     > +                                          device, attr, buf);
>     > +}
>     > +
>     > +static ssize_t
>     > +charge_control_start_threshold_store(struct device *dev,
>     > +                                  struct device_attribute *attr,
>     > +                                  const char *buf, size_t count)
>     > +{
>     > +     return charge_control_threshold_store(conf.charge_control.offset_start,
>     > +                                           dev, attr, buf, count);
>     > +}
>     > +
>     > +static ssize_t charge_control_end_threshold_show(struct device *device,
>     > +                                              struct device_attribute *attr,
>     > +                                              char *buf)
>     > +{
>     > +     return charge_control_threshold_show(conf.charge_control.offset_end,
>     > +                                          device, attr, buf);
>     > +}
>     > +
>     > +static ssize_t charge_control_end_threshold_store(struct device *dev,
>     > +                                               struct device_attribute *attr,
>     > +                                               const char *buf, size_t count)
>     > +{
>     > +     return charge_control_threshold_store(conf.charge_control.offset_end,
>     > +                                           dev, attr, buf, count);
>     > +}
>     > +
>     > +static DEVICE_ATTR_RW(charge_control_start_threshold);
>     > +static DEVICE_ATTR_RW(charge_control_end_threshold);
>     > +
>     > +static struct attribute *msi_battery_attrs[] = {
>     > +     &dev_attr_charge_control_start_threshold.attr,
>     > +     &dev_attr_charge_control_end_threshold.attr,
>     > +     NULL,
>     > +};
>     > +
>     > +ATTRIBUTE_GROUPS(msi_battery);
>     > +
>     > +static int msi_battery_add(struct power_supply *battery,
>     > +                        struct acpi_battery_hook *hook)
>     > +{
>     > +     if (device_add_groups(&battery->dev, msi_battery_groups))
>     > +             return -ENODEV;
>     > +     return 0;
>     > +}
>     > +
>     > +static int msi_battery_remove(struct power_supply *battery,
>     > +                           struct acpi_battery_hook *hook)
>     > +{
>     > +     device_remove_groups(&battery->dev, msi_battery_groups);
>     > +     return 0;
>     > +}
>     > +
>     > +static struct acpi_battery_hook battery_hook = {
>     > +     .add_battery = msi_battery_add,
>     > +     .remove_battery = msi_battery_remove,
>     > +     .name = MSI_EC_DRIVER_NAME,
>     > +};
>     > +
>     > +// ============================================================ //
>     > +// Module load/unload
>     > +// ============================================================ //
>     > +
>     > +static int __init load_configuration(void)
>     > +{
>     > +     int result;
>     > +
>     > +     // get firmware version
>     > +     u8 fw_version[MSI_EC_FW_VERSION_LENGTH + 1];
>     > +     result = ec_get_firmware_version(fw_version);
>     > +     if (result < 0) {
>     > +             return result;
>     > +     }
>     > +
>     > +     // load the suitable configuration, if exists
>     > +     for (int i = 0; CONFIGURATIONS[i]; i++) {
>     > +             for (int j = 0; CONFIGURATIONS[i]->allowed_fw[j]; j++) {
>     > +                     if (strcmp(CONFIGURATIONS[i]->allowed_fw[j], fw_version) == 0) {
>     > +                             memcpy(&conf, CONFIGURATIONS[i], sizeof(struct msi_ec_conf));
>     > +                             conf.allowed_fw = NULL;
>     > +                             return 0;
>     > +                     }
>     > +             }
>     > +     }
>     > +
>     > +     pr_err("Your firmware version is not supported!\n");
>     > +     return -EOPNOTSUPP;
>     > +}
>     > +
>     > +static int __init msi_ec_init(void)
>     > +{
>     > +     int result;
>     > +
>     > +     if (acpi_disabled) {
>     > +             pr_err("Unable to init because ACPI needs to be enabled first!\n");
>     > +             return -ENODEV;
>     > +     }
>     > +
>     > +     result = load_configuration();
>     > +     if (result < 0)
>     > +             return result;
>     > +
>     > +     battery_hook_register(&battery_hook);
>     > +
>     > +     pr_info("msi-ec: module_init\n");
>     > +     return 0;
>     > +}
>     > +
>     > +static void __exit msi_ec_exit(void)
>     > +{
>     > +     battery_hook_unregister(&battery_hook);
>     > +
>     > +     pr_info("msi-ec: module_exit\n");
>     > +}
>     > +
>     > +MODULE_LICENSE("GPL");
>     > +MODULE_AUTHOR("Jose Angel Pastrana <japp0005@red.ujaen.es <mailto:japp0005@red.ujaen.es>>");
>     > +MODULE_AUTHOR("Aakash Singh <mail@singhaakash.dev <mailto:mail@singhaakash.dev>>");
>     > +MODULE_AUTHOR("Nikita Kravets <teackot@gmail.com <mailto:teackot@gmail.com>>");
>     > +MODULE_DESCRIPTION("MSI Embedded Controller");
>     > +
>     > +module_init(msi_ec_init);
>     > +module_exit(msi_ec_exit);
>     > diff --git a/drivers/platform/x86/msi-ec.h b/drivers/platform/x86/msi-ec.h
>     > new file mode 100644
>     > index 000000000000..4de6bba363ff
>     > --- /dev/null
>     > +++ b/drivers/platform/x86/msi-ec.h
>     > @@ -0,0 +1,119 @@
>     > +/* SPDX-License-Identifier: GPL-2.0-or-later */
>     > +
>     > +/*
>     > + * msi-ec: MSI laptops' embedded controller driver.
>     > + *
>     > + * Copyright (C) 2023 Jose Angel Pastrana <japp0005@red.ujaen.es <mailto:japp0005@red.ujaen.es>>
>     > + * Copyright (C) 2023 Aakash Singh <mail@singhaakash.dev <mailto:mail@singhaakash.dev>>
>     > + * Copyright (C) 2023 Nikita Kravets <teackot@gmail.com <mailto:teackot@gmail.com>>
>     > + */
>     > +
>     > +#ifndef _MSI_EC_H_
>     > +#define _MSI_EC_H_
>     > +
>     > +#include <linux/types.h>
>     > +
>     > +#define MSI_EC_DRIVER_NAME "msi-ec"
>     > +
>     > +// Firmware info addresses are universal
>     > +#define MSI_EC_FW_VERSION_ADDRESS 0xa0
>     > +#define MSI_EC_FW_DATE_ADDRESS    0xac
>     > +#define MSI_EC_FW_TIME_ADDRESS    0xb4
>     > +#define MSI_EC_FW_VERSION_LENGTH  12
>     > +#define MSI_EC_FW_DATE_LENGTH     8
>     > +#define MSI_EC_FW_TIME_LENGTH     8
>     > +
>     > +struct msi_ec_charge_control_conf {
>     > +     int address;
>     > +     int offset_start;
>     > +     int offset_end;
>     > +     int range_min;
>     > +     int range_max;
>     > +};
>     > +
>     > +struct msi_ec_webcam_conf {
>     > +     int address;
>     > +     int block_address;
>     > +     int bit;
>     > +};
>     > +
>     > +struct msi_ec_fn_super_swap_conf {
>     > +     int address;
>     > +     int bit;
>     > +};
>     > +
>     > +struct msi_ec_cooler_boost_conf {
>     > +     int address;
>     > +     int bit;
>     > +};
>     > +
>     > +struct msi_ec_mode {
>     > +     const char *name;
>     > +     int value;
>     > +};
>     > +
>     > +struct msi_ec_shift_mode_conf {
>     > +     int address;
>     > +     struct msi_ec_mode modes[5]; // fixed size for easier hard coding
>     > +     int modes_count;
>     > +};
>     > +
>     > +struct msi_ec_super_battery_conf {
>     > +     bool supported;
>     > +     int address;
>     > +     int mask;
>     > +};
>     > +
>     > +struct msi_ec_fan_mode_conf {
>     > +     int address;
>     > +};
>     > +
>     > +struct msi_ec_cpu_conf {
>     > +     int rt_temp_address;
>     > +     int rt_fan_speed_address; // realtime
>     > +     int rt_fan_speed_base_min;
>     > +     int rt_fan_speed_base_max;
>     > +     int bs_fan_speed_address; // basic
>     > +     int bs_fan_speed_base_min;
>     > +     int bs_fan_speed_base_max;
>     > +};
>     > +
>     > +struct msi_ec_gpu_conf {
>     > +     int rt_temp_address;
>     > +     int rt_fan_speed_address; // realtime
>     > +};
>     > +
>     > +struct msi_ec_led_conf {
>     > +     int micmute_led_address;
>     > +     int mute_led_address;
>     > +     int bit;
>     > +};
>     > +
>     > +#define MSI_EC_KBD_BL_STATE_MASK 0x3
>     > +struct msi_ec_kbd_bl_conf {
>     > +     int bl_mode_address;
>     > +     int bl_modes[2];
>     > +     int max_mode;
>     > +
>     > +     int bl_state_address;
>     > +     int state_base_value;
>     > +     int max_state;
>     > +};
>     > +
>     > +struct msi_ec_conf {
>     > +     const char **allowed_fw;
>     > +
>     > +     struct msi_ec_charge_control_conf charge_control;
>     > +     struct msi_ec_webcam_conf         webcam;
>     > +     struct msi_ec_fn_super_swap_conf  fn_super_swap;
>     > +     struct msi_ec_cooler_boost_conf   cooler_boost;
>     > +     struct msi_ec_shift_mode_conf     shift_mode;
>     > +     struct msi_ec_super_battery_conf  super_battery;
>     > +     struct msi_ec_fan_mode_conf       fan_mode;
>     > +     struct msi_ec_cpu_conf            cpu;
>     > +     struct msi_ec_gpu_conf            gpu;
>     > +     struct msi_ec_led_conf            leds;
>     > +     struct msi_ec_kbd_bl_conf         kbd_bl;
>     > +};
>     > +
>     > +#endif // _MSI_EC_H_
> 

