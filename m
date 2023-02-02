Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE4DC05027
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Feb 2023 14:45:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232466AbjBBOpk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Feb 2023 09:45:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232481AbjBBOpi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Feb 2023 09:45:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2469B8660F
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Feb 2023 06:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675349093;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cYohsSU33VaUpeQ+uQ51lUIjtJ3+reB1iAMUDAsj1eQ=;
        b=BZ4nlR/8Af3UusXa/bP0hr/a1Oh235UJceTFRhyyfJBV7+l6lcQe+A5uftYcoiboaIqLnL
        5Cefi2zx/jab2683jFGcWr+Kl3rVEUGmc1C/ctPGb8OxjmMkok6sDwILfvOYbaUvs9ZyO8
        jFy07PrESg48UDFbahW7pD/W5w8/9Wk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-b4Y574O9PFetk-ycBa7AMw-1; Thu, 02 Feb 2023 09:44:52 -0500
X-MC-Unique: b4Y574O9PFetk-ycBa7AMw-1
Received: by mail-ed1-f69.google.com with SMTP id k17-20020aa7c051000000b004a89bd76ca1so23886edo.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Feb 2023 06:44:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cYohsSU33VaUpeQ+uQ51lUIjtJ3+reB1iAMUDAsj1eQ=;
        b=1vz/tqxlxsXrAqpSuDOjXKBat2Y5Ro3vXg9kzNqJG4BFu5WUWR8PY7qqzJhlFLFygx
         psCrxowB13LYKA6gkKAbm+WYQiLkncZy2Yr8GOKbpMfy2K/r5v3Ok7MvCaU6bE/UYteV
         AvTsso95zpbQHRuTZ47VhmahPwvIfmR0LLL5SaeFd0ROxPXwXEjMHznWvGflHL69MW3M
         uoPSoeG8Ue3o+mhzfzYqZxwqXNXsHwH3MFRJIMba7aIP4CnfWfnAZ9aB8fgu3NQZKiNK
         N+RtkR6VHFsVxcnxoBRYYwXOOtJNi5UnUoPuEhzMyTesZ8ECyuUV2XPKJFhTPln5WJ1h
         dGPA==
X-Gm-Message-State: AO0yUKVa8KbMNoaGk2igECpw6DibuGMB3+rtU5VS2xXLiiI/ksRlFWtA
        c5tQS7zOi3jTau5jNraXKC1dHFNJuqbg7F3qs8+37wN3jHiimYjGNtnBjDFLRsYvE+Zm6/u7n/u
        XCL9+i5fvl7T5fgJOZRipO1bWiRSmkwe6Gg==
X-Received: by 2002:a05:6402:2cb:b0:4a2:311e:5834 with SMTP id b11-20020a05640202cb00b004a2311e5834mr6330000edx.6.1675349091102;
        Thu, 02 Feb 2023 06:44:51 -0800 (PST)
X-Google-Smtp-Source: AK7set8qqztC5aWyryC3aF6naHuP5XRm7lpOpmcNL+RTl7PmTLcp+5ymbbblarYFyI4VJYLv3MkbLg==
X-Received: by 2002:a05:6402:2cb:b0:4a2:311e:5834 with SMTP id b11-20020a05640202cb00b004a2311e5834mr6329989edx.6.1675349090906;
        Thu, 02 Feb 2023 06:44:50 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a66-20020a509ec8000000b00482e0c55e2bsm3355915edf.93.2023.02.02.06.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 06:44:50 -0800 (PST)
Message-ID: <6b004430-4c11-f669-55c0-84df6d39d6ab@redhat.com>
Date:   Thu, 2 Feb 2023 15:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: New Lenovo Legion Fan, Temperature, Power Mode Driver
Content-Language: en-US, nl
To:     John Martens <john.martens4@proton.me>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "ike.pan@canonical.com" <ike.pan@canonical.com>
References: <cchW8yA1BnN-yMnXp0EY8oKubzPC721jNMylHVzSVuf5C0YAhC7gYkSjhxIpZMv7K9hMw4ezLbxGEtEd7Gs_bAIoDizRSQG2V3Ql5nl5G_0=@proton.me>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cchW8yA1BnN-yMnXp0EY8oKubzPC721jNMylHVzSVuf5C0YAhC7gYkSjhxIpZMv7K9hMw4ezLbxGEtEd7Gs_bAIoDizRSQG2V3Ql5nl5G_0=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi John,

On 1/10/23 14:26, John Martens wrote:
> Dear Kernel devs, Mr. Hans de Goede, Mr. Ike Panhc,
> 
> I am currently working on a driver for fan control, fan speed, temperature sensors, and power mode (platform profile) for Lenovo Legion Laptops. Switching iGPU/dGPU could also be possible. It is a port of the closed and open tools in Windows LenovoLegionToolkit, Vantage, LegionFanControl. I am testing it on different laptops with the help of a forum/chat and its working quite good.
> 
> There is a README (https://github.com/johnfanv2/LenovoLegionLinux) and code (https://github.com/johnfanv2/LenovoLegionLinux/blob/main/kernel_module/legion-laptop.c).
> 
> I would be interested to get your opinion.
> 
> Questions
> 
> Should this extend ideapad_laptop.c or a new file?
>     - pro:
>         - both access parts of the same hardware
>     - con:
>         - both files are already quite large
>         - it only works on Lenovo Legion laptops that have this 
>           custom control firmware in the embedded controller (EC)
>         - there is almost no reuse of code

As you say there is almost 0 code re-use so I don't think that
adding this to ideapad_laptop.c is worth the trouble, ideapad_laptop.c
already is big enough as is.

I do see that you bind to the PNP0C09 or VPC2004 device. Since you
poke the EC RAM and don't make any ACPI calls AFAICT it would be
best to just create your own lenovo_legion platform_device to
bind to, using platform_create_bundle() which will create
a platform_device + platform_driver for you in one go.

This will avoid conflicts with other drivers binding to
the VPC2004 device such as ideapad_laptop.

And you can then also specify the used superio mem or io-ports
as resources (and claim then in your probe()) so that these
properly show up in /proc/ioports and so that conflicts
with other drivers also banging on these ports get detected.

> Which method do you prefer writing to EC memory for older models? With ioremap or outb? 
>     - To use ioremap one needs to get the start address. It is
>       different on Intel vs AMD. It is the same as a OperationRegion
>       in the ACPI tables, e.g. "OperationRegion (ERAX, SystemMemory,  
>       0xFE00D400, 0xFF)". However, I have found no kernel functions  
>       to get the address (here 0xFE00D400) of a  OperationRegion.  
>       One could also hardcode it for each model/firmware.

These addresses sometimes change at boot-time when different BIOS
options are enabled/disabled so I would advice against
hardcoding them.

Have you looked in:

sudo cat /proc/iomem

To see if the range is perhaps known to the kernel somehow already ?

>     - alternative (which I am currently using) is sending commands    
>       to IO ports 0x4E/0x4F (Super IO controller). 

I wonder if these ports are not already in use by some other driver
causing possible conflicts. Are they not listed in "sudo cat /proc/ioports" /

> Background
> 
> The laptops come with an embedded controller (EC) from ITE. These usually come with a 3 point fan curve in ROM, but also can be flashed with a small additional custom program. Lenovo implemented implemented a 10 point fan curve. The program is also shipped with each EFI update.
> 
> The fan curve can be edited by writing to some memory locations in the EC. These locations are
> 
> The driver works by:
> - directly writing/reading embedded controller memory
>     - older models (2020-2021): there are two possibilities
>         - the EC memory is already memory mapped, so one can 
>           use ioremap
>         - one can use outb/inb and write sequenc of commands to 
>           port 0x43, 0x4F (super IO ports)
>         - ideapad_laptop.c writes to some parts of EC memory 
>           with ACPI methods VPCR, VPCW. However, these do not seem  
>           to work in the memory region with the fan curve.

Ok, so lets see of we can figure out a better way to get the EC
memory address and if not I guess outb/inb it is.

>     - newer models (2022): these provide ACPI/WMI methods  
>       setFanCurve/getFanCurve to write to these regions. However, I  
>       have implemented that and have no models for testing

From the sound of it we should definitely use this new methods
on these newer models, this should protect us against the
EC RAM layout changing.  This might be best done in separate
driver, that depends on how much code we can re-use if we
put support for the new models inside the same driver.

Regards,

Hans


