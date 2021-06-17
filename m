Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B26BC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 14:28:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 597CC613D6
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 14:28:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbhFQOaj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Jun 2021 10:30:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58803 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231656AbhFQOai (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Jun 2021 10:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623940110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fN8zChWjxz+4YJvxVWTdHmnXufHDC08YSOysrrslprE=;
        b=KDWoxzzocMXvWwWM3dg0HClzUVbwJDg5Pcgjhpfa5qaVqB4YXCocS9HMNsCd3Qk/ZOnvjo
        5QJ98/YugilVluzBKoL0+OVMVVhOIw75Djejy5fXQJgMhqEZulKO2pFOBiRQpLZ5cbVdry
        s1EbzhOfxrwL08oPyCR2SnkhT2n4Eko=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-t_kHVTSzMuaLt3oecraBYQ-1; Thu, 17 Jun 2021 10:28:29 -0400
X-MC-Unique: t_kHVTSzMuaLt3oecraBYQ-1
Received: by mail-ej1-f69.google.com with SMTP id 16-20020a1709063010b029037417ca2d43so2319796ejz.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Jun 2021 07:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fN8zChWjxz+4YJvxVWTdHmnXufHDC08YSOysrrslprE=;
        b=IkyZjrh4MmRMbcR0xwfbLjzUY52g1ZINmv5n0jOIR0xc/cZTn1ToFSnRfClpRQmZBA
         3Nystv2OeDtGJ4Mz4/Q2dJ9Pk10rRfUCUtKrTviJ7Gyw3ZQLdZVfyBoVpZjFVQspdAb4
         2qAC/xNc9s1xHRZtGIMwSo7qpDATxU/40lXOGsikskxJSq1jcPyLf8JxmwqeUCqnwYPx
         rPeGjza4yHw//HK3FfAwkV+XCWKVncdpSTRpkaTrNFejCDXzFd4J4mAjGDgrj3WAXKXP
         ygyXuYhdUOY2HJ8m6OHIA+amYTKwUV/jRe1Kc2r1+Wqow/Oc+zM3FNNUGcwiH7NmKV8+
         Clvw==
X-Gm-Message-State: AOAM533aAIcKUMLxuoImQ8gCfdUt4Q1sL5Xo6nyldkY4tT2FZ5zrX/4t
        7A1yneA7czgLBKqRz1Wf5Am1huVpYTDRkFliRHnfBE71+9zTuMRGzzxq4LdOi0IebaG3GxLsbI0
        2GJoyOeplO0PxlwIqPAgY/1oCW+mb+7RXBQ==
X-Received: by 2002:a17:906:2844:: with SMTP id s4mr5495927ejc.263.1623940108152;
        Thu, 17 Jun 2021 07:28:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKxAh2mmEH2aPQlU0I8e0jUjCBHE88XRuuBPgUXgFAupEGSmfxTTd6wclnkkjpF/mVoKNfxQ==
X-Received: by 2002:a17:906:2844:: with SMTP id s4mr5495902ejc.263.1623940107882;
        Thu, 17 Jun 2021 07:28:27 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h6sm4557480edj.91.2021.06.17.07.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 07:28:27 -0700 (PDT)
Subject: Re: [PATCH 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems
To:     Shravan S <s.shravan@intel.com>, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     sudhakar.an@intel.com
References: <20210428032224.8299-1-s.shravan@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ab991a6d-e973-9e16-8e8c-382c27f41368@redhat.com>
Date:   Thu, 17 Jun 2021 16:28:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210428032224.8299-1-s.shravan@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shravan,

On 4/28/21 5:22 AM, Shravan S wrote:
> SAR (Specific Absorption Rate) driver is a host driver implemented for Linux
> or chrome platform to limit the exposure of human body to RF frequency by informing
> the Intel M.2 modem to regulate the RF power based on SAR data obtained from the sensors
> captured in the BIOS. ACPI interface exposes this data from the BIOS to SAR driver. The
> front end application in userspace ( eg: Modem Manager) will interact with SAR driver 
> to obtain information like the device mode (Example: tablets, laptops, etx), Antenna index,
> baseband index, SAR table index and use available communication like MBIM interface to enable
> data communication to modem for RF power regulation.
> 
> The BIOS gets notified about device mode changes through Sensor Driver. This information is 
> given to a (newly created) WWAN ACPI function driver when there is a device mode change. 
> The driver then uses a _DSM method to retrieve the required information from BIOS. 
> This information is then forwarded/multicast to the User-space using the NETLINK interface.
> A lookup table is maintained inside the BIOS which suggests the SAR Table index and Antenna 
> Tuner Table Index values for individual device modes.
> 
> The SAR parameters to be used on the Modem differs for each Regulatory Mode like FCC, CE and ISED.
> Hence, the SAR parameters are stored separately in the SMBIOS table in the OEM BIOS, 
> for each of the Regulatory mode. Regulatory modes will be different based on the region and network
> available in that region.

If I'm reading the above correct then this code is really doing 2
things in 1 driver:

1. Listening to some sensors, which readings may impact the maximum amount
of tx power which the modem may use. What kind of sensors are these ?
Currently chrome-os based devices are using iio for proximity sensors,
with specific labels added to each sensor to tell userspace that they
indicate a human is close to one of the antennas:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/ABI/testing/sysfs-bus-iio?id=6505dfab33c519368e54ae7f3ea1bf4d9916fdc5

Would it be possible to use this standardized userspace interface for
your use case ?

2. Exporting a table with various information from the BIOS tables
to userspace. We do probably need a new userspace API for this,
but I'm not sure netlink is the right answer here.

Maybe just use a binary sysfs attribute under
/sys/bus/platform/devices/INTC1092:00 ?
That will make the interface non-generic, but I assume that the
table contents are going to be Intel specific anyways so that
should be fine. This will also allow simply exporting the table
without the kernel needing to parse it.

Using netlink is highly unusual for a driver living under
platform/drivers/x86; and if you really want to use netlink for
this then you should first define a generic protocol which is
also going to work for other vendors' modems, which is
impossible ATM because we don't know yet what other vendor's
modems will need...

Regards,

Hans







> 
> Hence the entire SAR functionality handling is divided into 2 parts:
> 
> •	A ACPI function driver implemented that uses a dedicated ACPI node for WWAN device. 
>     sends notifications whenever there is change in Device Mode. (each OEM has different mechanism
>     of updating this DEVICE Mode info). This is notified to User-space applications using 
>     the RT-NETLINK interface.
> •	WWAN Device Service listens for RT-NETLINK messages and routes them to Modem using MBIM. 
> 
> Shravan S (1):
>   [x86]: BIOS Dynamic SAR driver for Intel M.2 Modem
> 
>  drivers/platform/x86/Kconfig                |  12 +
>  drivers/platform/x86/Makefile               |   1 +
>  drivers/platform/x86/intel-sar.c            | 589 ++++++++++++++++++++
>  include/linux/platform_data/x86/intel-sar.h | 118 ++++
>  4 files changed, 720 insertions(+)
>  create mode 100644 drivers/platform/x86/intel-sar.c
>  create mode 100644 include/linux/platform_data/x86/intel-sar.h
> 
> 
> base-commit: cd1245d75ce93b8fd206f4b34eb58bcfe156d5e9
> 

