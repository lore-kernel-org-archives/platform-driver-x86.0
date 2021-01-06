Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB58AC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 12:33:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9102D205F4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 12:33:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbhAFMdV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Jan 2021 07:33:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58199 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726308AbhAFMdU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Jan 2021 07:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609936313;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=hNC7fGuAHLdLTCHh50Knb0xeK117OKEfP5RFQW5xt7s=;
        b=EloDgkUaAgdAAxVizzV2n3TCVXYBMzZHi1sJZRqnc1ro/c4iQlxj4ZTLImxqnLknKhS757
        AzGJloppYonDoFdB9sYwH/s7fjT4O2be+9S3SOwu3OQP2PotOKKdWuaB0rcw4dCYUS2Yjq
        UczXNRCJxJ+EnsmU2xi0RYEQmeEYbpo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-XvChu_uPN5WSoikoISq5sA-1; Wed, 06 Jan 2021 07:31:49 -0500
X-MC-Unique: XvChu_uPN5WSoikoISq5sA-1
Received: by mail-ed1-f69.google.com with SMTP id g14so1881732edt.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Jan 2021 04:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=hNC7fGuAHLdLTCHh50Knb0xeK117OKEfP5RFQW5xt7s=;
        b=fdVx+lJNMh0Lkx+3YjHKAJfujoeuO2ZNV/tdfdad/KMmOy4O/fu/HNFmrF7dWB+9yj
         PZ0qjoX24mfRXNDlrjkF5G9o97vhLgi9UIdUX6qVrhSwX2T7pyVzKOYlor8M+K5sf+gL
         BRMwTWwxqFF3lLnG308IDLHIZpgsZP5JFZ3sIuY1Yzh6lz6O/fIbyTtS7g2NQkA/Nbjm
         N94u/fgkW7WXsmiUbWeRQnPtFWhOGgZljLu0i42x3XGYCpxf4F7qA9rCYDBLJ6IZU5k+
         aoOwytQ4xUpwxwhYQaMTCuSrdvm7VujppnbSwQ6+MwHz8jhcUsyauTLtZaq6kXpZ4ypz
         VEbQ==
X-Gm-Message-State: AOAM533u7PYm9cNkepLfyhm+RYVtnBkBpFPecMWMRWuKr9GiEu4KmzGC
        +AwBnIjx/J+HonnpRgNPUPSNvgqOpcjcmWUqGkdOrahlIbSB5GMKJ1u0hpvuuZeAQOnWasO1Ydk
        QcI2EPZmAv0jXzABD6eogWnRI3LN1PlzSGmJ2Se0Or8ExJOM+sGpp5QRrMELLXBqmyRskDkaafO
        DAcjWfEGDRDg==
X-Received: by 2002:a50:b586:: with SMTP id a6mr3836472ede.206.1609936308257;
        Wed, 06 Jan 2021 04:31:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXu409zDlILrFHdgW9Ot4OtDnpZpCDLR0OErS8iHdk6Anaj52W8RRwkkUPK1cEOTAwBY5Ehg==
X-Received: by 2002:a50:b586:: with SMTP id a6mr3836451ede.206.1609936307847;
        Wed, 06 Jan 2021 04:31:47 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id ca4sm1392626edb.80.2021.01.06.04.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 04:31:46 -0800 (PST)
To:     Andy Shevchenko <andy@infradead.org>
Cc:     linux-acpi@vger.kernel.org, x86@kernel.org,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: How to detect Cherry Trail vs Brasswell inside the kernel ?
Message-ID: <37906985-e026-48d3-cda8-6e63696e72aa@redhat.com>
Date:   Wed, 6 Jan 2021 13:31:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

I've 2 different kernel bugs where the fix requires differentiating between
Cherry Trail vs Brasswell, just checking the CPU model does not allow to
differentiate between these 2 since they are both using Airmont cores.

I have the same issue with the Bay Trail laptop SoCs vs the
Bay Trail-T tablet SoCs, but for now lets focus on
Cherry Trail vs Brasswell since that is less confusing:

https://ark.intel.com/content/www/us/en/ark/products/codename/46629/cherry-trail.html
https://ark.intel.com/content/www/us/en/ark/products/codename/66094/braswell.html

So I see a number of possible solutions here:

1) Do a (substring) check on the CPU model-name checking for "x5-Z8" and "x7-Z8"
2) Check for presence of some embedded peripheral which is present on one but not the
other. E.g. The Braswell devices have HDA audio where as the Cherry Trail devices
use the "Low Power Engine (LPE) Audio Controller"
3) Check for acpi_gbl_reduced_hardware, but I'm not sure if that is a reliable
indicator of running on the tablet versions of the SoCs.

1 and 2 will work but neither is very pretty, I guess I could try to spend some
more time investigating 3. But I only have limited access to the non tablet versions
of the Bay Trail and I'm not sure if I have any Braswell devices at all. 

So I was wondering if anyone else has any better ideas here?

Regards,

Hans


p.s.

Just FYI the 2 issues which I want to resolve are:

1. Prevent drivers/platform/x86/intel_int0002_vgpio.c binding on Braswell
(non "tablet") SoCs. The INT0002 ACPI device is used for some wakeup
events (from S2idle) on the tablet (Cherry Trail) versions of the SoC.

The current code will also bind to the INT0002 ACPI device (if present) on
Braswell, this is causing suspend/resume issues on some devices.
ATM we are working around this by setting the IRQCHIP_SKIP_SET_WAKE on
the irq-chip for the INT0002 vGPIO pin. But this in turn is breaking wakeup
by USB peripherals on Cherry Trail devices. If we can just stop the driver
from binding on Braswell devices all together then that would be better.

2. Deal with non functional /sys/class/backlight/acpi_video[0-7] devices
showing up on BYT/CHT based media-boxes / hdmi-sticks. These devices do
not have a LCD panel, so there will be no "native" backlight driver causing
drivers/acpi/video-detect.c to select acpi_backlight_video as backlight-type.
drivers/acpi/acpi-video.c tries to avoid registering non-functional
/sys/class/backlight/acpi_video devices in cases like this, but that depends
on a DMI chassis-type check (to avoid suppressing the backlight interface
on laptops where we likely do want it) and many of these media-boxes /
hdmi-sticks are derived from BYT/CHT tablet designs and often the DMI
chassis type still says "Tablet". Actual Cherry Trail devices with a LCD
panel always use the native intel_backlight interface, but I guess some
Braswell based devices might use the acpi_video interface.

I would like to be able to add some code the the ACPI video code which
simply ignores the broken acpi_video interface on Cherry Trail devices,
while still using its normal detection logic on Brasswell devices.
The alternative would be an ever growing list of DMI based quirks which
is undesirable.

