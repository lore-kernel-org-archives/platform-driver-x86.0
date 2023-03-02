Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242F9C678D4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Mar 2023 09:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjCBJFe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Mar 2023 04:05:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbjCBJF2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2023 04:05:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B948015883
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 01:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677747774;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TlVfN0P5CKyDg1R2VL26O9A7BMyZXcfHAYywGAXDTrs=;
        b=YCV4HJ6cMY8cgOrFOwn0HiKFEcaKeZ6GVVS3GBAXGZ6YkqnPrXxFm7NdcQ0J13JtVw5hor
        y12ZDY92FZgkNxx46aoqj49vxxxSbVw4GvJm80c1W2/SFidz0WNxKhKKyZR9oYB4tTCXYR
        Nmq8E0oXvF2fxTQuo0pVIRORwO2g4Zs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-182-1gijnoZsMF2gjRd3hj83JA-1; Thu, 02 Mar 2023 04:02:53 -0500
X-MC-Unique: 1gijnoZsMF2gjRd3hj83JA-1
Received: by mail-ed1-f72.google.com with SMTP id i42-20020a0564020f2a00b004c10b218caaso654596eda.10
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Mar 2023 01:02:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlVfN0P5CKyDg1R2VL26O9A7BMyZXcfHAYywGAXDTrs=;
        b=3Rqrto3TuUK3VQY1c3U9HNwX1ThkQUpdVGY+Pb24/XQF1gb3DTbaN/R8zjzie49ix9
         2uizOnLqz6Ph4kea7dVD6euXkjvims1GItmJLF7WMPqRhoNxahwS2jtEc8Y+JhjCRJPZ
         mNITfPfYeeAGhVL89+3XcBKCMpH+wJU1zFoQN6Ldrp3BMCRIj+a0f4dmZPxXd4btgXCj
         BEfTXalt3Ptsx7m8OyerD+uOIy0nuU8i4eCA9I4BM5HvMKZAMyRHnVN4dDptmjvDkN2n
         FWRCZBnfcU8DhAZM1OSVV8cppEHGrlzHYhcTXfnrO+ZUY7+NXwmGQjlSVe9G0lYatQh8
         JyUg==
X-Gm-Message-State: AO0yUKUlmE4mZ7cwOiawJUCn67Smi6vDxPUGoXfYFwIy66Rd6NsgpfX6
        2p8gxU8WHq6ALAjjVfs+5U6f/ggaz33JFspk90d/SImp5RSghtaQyz5Kw+ZrIdcBNa6PWZRqIY2
        9j6ESG+Rx2GJjz+6E40f1hRdo8pRDYu76kw==
X-Received: by 2002:a05:6402:120f:b0:4ad:66b:84a5 with SMTP id c15-20020a056402120f00b004ad066b84a5mr9906838edw.22.1677747772598;
        Thu, 02 Mar 2023 01:02:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8XlkFFOKD9qpmhdRM8AFLH4f/Dy7wDns1LtyFfGwFSrJ/fIHM2tvkGHM/R/a5GX1AxbWiMbg==
X-Received: by 2002:a05:6402:120f:b0:4ad:66b:84a5 with SMTP id c15-20020a056402120f00b004ad066b84a5mr9906816edw.22.1677747772276;
        Thu, 02 Mar 2023 01:02:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t19-20020a50d713000000b004af73333d6esm6641517edi.53.2023.03.02.01.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 01:02:51 -0800 (PST)
Message-ID: <bfa3ede3-8cc0-ca6c-8e88-17e374aedcb6@redhat.com>
Date:   Thu, 2 Mar 2023 10:02:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/3] leds: simatic-ipc-leds-gpio: introduce more
 Kconfig switches
Content-Language: en-US, nl
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20230301170215.23382-1-henning.schild@siemens.com>
 <20230301170215.23382-4-henning.schild@siemens.com>
 <a6281345-95e1-3e8d-b6fb-146c1852373f@redhat.com>
 <20230302094728.563c04ce@md1za8fc.ad001.siemens.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230302094728.563c04ce@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/2/23 09:47, Henning Schild wrote:
> Am Wed, 1 Mar 2023 19:04:01 +0100
> schrieb Hans de Goede <hdegoede@redhat.com>:
> 
>> Hi,
>>
>> On 3/1/23 18:02, Henning Schild wrote:
>>> To describe the dependency chain better and allow for potential
>>> fine-grained config tuning, introduce Kconfig switch for the
>>> individual GPIO based drivers.
>>>
>>> Signed-off-by: Henning Schild <henning.schild@siemens.com>
>>> ---
>>>  drivers/leds/simple/Kconfig  | 31 ++++++++++++++++++++++++++++---
>>>  drivers/leds/simple/Makefile |  7 +++----
>>>  2 files changed, 31 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/leds/simple/Kconfig
>>> b/drivers/leds/simple/Kconfig index fd2b8225d926..44fa0f93cb3b
>>> 100644 --- a/drivers/leds/simple/Kconfig
>>> +++ b/drivers/leds/simple/Kconfig
>>> @@ -1,11 +1,36 @@
>>>  # SPDX-License-Identifier: GPL-2.0-only
>>>  config LEDS_SIEMENS_SIMATIC_IPC
>>>  	tristate "LED driver for Siemens Simatic IPCs"
>>> -	depends on LEDS_GPIO  
>>
>> Since it is simatic-ipc-leds-gpio-core.c which actually registers
>> the LEDs GPIO platform device, this one should stay IMHO.
> 
> No this one is now only for the port-IO based driver. The GPIO core is
> built under the two new switches only.

You are right, I thought this would enable building
simatic-ipc-leds-gpio-core.o into its own .ko which would
then be used by both other gpio LED drivers. But upon a closer
look at the Makefile changes I see that is not the case.

Note that with your current solution you are linking that into
the kernel twice.

As long this is build into modules that is fine. But if both are builtin
I *think* you may get linker errors because of duplicate symbols?

I believe this is why Andy asked to try a build with all 3 options set to Y.

>>>  	depends on SIEMENS_SIMATIC_IPC
>>>  	help
>>>  	  This option enables support for the LEDs of several
>>> Industrial PCs from Siemens.
>>>  
>>> -	  To compile this driver as a module, choose M here: the
>>> modules
>>> -	  will be called simatic-ipc-leds and
>>> simatic-ipc-leds-gpio.
>>> +	  To compile this driver as a module, choose M here: the
>>> module
>>> +	  will be called simatic-ipc-leds.
>>> +
>>> +config LEDS_SIEMENS_SIMATIC_IPC_APOLLOLAKE
>>> +	tristate "LED driver for Siemens Simatic IPCs based on
>>> Intel Apollo Lake GPIO"
>>> +	depends on LEDS_GPIO  
>>
>> And then it can be dropped here.
>>
>>> +	depends on PINCTRL_BROXTON  
>>
>>> +	depends on SIEMENS_SIMATIC_IPC  
>>
>> This should be "depends on LEDS_SIEMENS_SIMATIC_IPC" since it
>> actually uses symbol from that module.
> 
> Same as above, the GPIO based drivers do not depend on the port-IO
> based driver.

Ack.

Regards,

Hans






>>> +	default LEDS_SIEMENS_SIMATIC_IPC
>>> +	help
>>> +	  This option enables support for the LEDs of several
>>> Industrial PCs
>>> +	  from Siemens based on Apollo Lake GPIO i.e. IPC127E.
>>> +
>>> +	  To compile this driver as a module, choose M here: the
>>> module
>>> +	  will be called simatic-ipc-leds-gpio-apollolake.
>>> +
>>> +config LEDS_SIEMENS_SIMATIC_IPC_F7188X
>>> +	tristate "LED driver for Siemens Simatic IPCs based on
>>> Nuvoton GPIO"
>>> +	depends on LEDS_GPIO  
>>
>> Idem.
>>
>>> +	depends on GPIO_F7188X
>>> +	depends on SIEMENS_SIMATIC_IPC  
>>
>> Idem.
>>
>>> +	default LEDS_SIEMENS_SIMATIC_IPC
>>> +	help
>>> +	  This option enables support for the LEDs of several
>>> Industrial PCs
>>> +	  from Siemens based on Nuvoton GPIO i.e. IPC227G.
>>> +
>>> +	  To compile this driver as a module, choose M here: the
>>> module
>>> +	  will be called simatic-ipc-leds-gpio-f7188x.
>>> diff --git a/drivers/leds/simple/Makefile
>>> b/drivers/leds/simple/Makefile index ed9057f7b6da..e3e840cea275
>>> 100644 --- a/drivers/leds/simple/Makefile
>>> +++ b/drivers/leds/simple/Makefile
>>> @@ -1,5 +1,4 @@
>>>  # SPDX-License-Identifier: GPL-2.0
>>> -obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+= simatic-ipc-leds.o
>>> -obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)  +=
>>> simatic-ipc-leds-gpio-core.o
>>> -obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+=
>>> simatic-ipc-leds-gpio-apollolake.o
>>> -obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+=
>>> simatic-ipc-leds-gpio-f7188x.o
>>> +obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)			+=
>>> simatic-ipc-leds.o
>>> +obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC_APOLLOLAKE)	+=
>>> simatic-ipc-leds-gpio-core.o simatic-ipc-leds-gpio-apollolake.o
>>> +obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC_F7188X)		+=
>>> simatic-ipc-leds-gpio-core.o simatic-ipc-leds-gpio-f7188x.o  
>>
>> Regards,
>>
>> Hans
>>
> 

