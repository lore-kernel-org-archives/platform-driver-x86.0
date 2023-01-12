Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8883C61DB3
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 19:21:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240318AbjALTVb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 14:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239946AbjALTU0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 14:20:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D470B5F72
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 11:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673550477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4BzmFbsLubmzTqEPhiP9KY1e4AEwUTzVk7BNPE5oksc=;
        b=ido5tqyG+7iCT7LVP+v2/cKFC2J9n8Vi3sn7VNlowsdlXcMmLNkQxFjT71typk4ZvxJCST
        eewOxJrByYDNgV5711kjpQZpXptHRa0Ii8GGWKniJNyC+/uOh1GKIfIJx9DhixohbXC99s
        fthK6L5FO38ymQp98iQjpwfCtDPVAPc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-aObNnpNKMOunPRu2aj_Mzw-1; Thu, 12 Jan 2023 14:07:53 -0500
X-MC-Unique: aObNnpNKMOunPRu2aj_Mzw-1
Received: by mail-ej1-f69.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fso13356295ejb.14
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 11:07:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4BzmFbsLubmzTqEPhiP9KY1e4AEwUTzVk7BNPE5oksc=;
        b=R3gF6J+r/MFIEKxpT7jud3K6RT6PnN7OfLgZt05FJzWbki95+7qT3mOopDRCp3kK+Q
         OygTepIM0IrWNT/CcySZOoljirnAuN7XY6p2nnpmjR8D9+LMaC81vLF4lt6Rx7lLuKG7
         NL+ozdcu+C+zJBNLQXulOXwm+oOi+3/oOBzYSh+28tx0s/+aAh/Dtg6hbqmxOpOO2pgu
         wZVfZlUWieJOfTQfFbfpb92Lar1zk9hwI5CjUuKlQhmsy3WaxWPZjbHHH4fHKdDM0HJv
         /bo0ItW/69rbdZa8U/xe7lpz7UxLJlznxXNJkxaPzg+10SokAV7rN2GSicFEqudA11Bl
         l8eQ==
X-Gm-Message-State: AFqh2kq9UaZASiiN5cIP2rZx/K2enxDzZ8AvTcva60Cbgk6/YMRnbI+s
        srOGl/9P0edo6ACiuUMVF6PQMIp0aB2YMPHv/AOFyQTVCmsWrHkhj9dvNcMhU1H0w+tZWX94ah1
        Vaq9xkesF+v1Ksl7nR8kE6Vg5t+ACLHif6A==
X-Received: by 2002:a17:907:8dcb:b0:840:c37d:b5e4 with SMTP id tg11-20020a1709078dcb00b00840c37db5e4mr92340441ejc.16.1673550471423;
        Thu, 12 Jan 2023 11:07:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtpEaLKZ2PAA2ir4Ss9efOHjSXGA70ddCWJ8F4MTEouP2BkrjVCC7yp2lOrf1w4sqDVTEDnXA==
X-Received: by 2002:a17:907:8dcb:b0:840:c37d:b5e4 with SMTP id tg11-20020a1709078dcb00b00840c37db5e4mr92340430ejc.16.1673550471232;
        Thu, 12 Jan 2023 11:07:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x25-20020a170906b09900b0080345493023sm7601553ejy.167.2023.01.12.11.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 11:07:50 -0800 (PST)
Message-ID: <a41ebfef-e589-dbff-c93c-eb7c197d28f0@redhat.com>
Date:   Thu, 12 Jan 2023 20:07:50 +0100
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

Thank you for reaching out. I'm currently catching up with
quite a big patch/bug backlog after being on holiday for
2 weeks. I'll get back to you on this, but please give
me some time.

If you have not heard back from me in 2 weeks, feel free
to ping me about this.

Regards,

Hans

 


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
> 
> Which method do you prefer writing to EC memory for older models? With ioremap or outb? 
>     - To use ioremap one needs to get the start address. It is
>       different on Intel vs AMD. It is the same as a OperationRegion
>       in the ACPI tables, e.g. "OperationRegion (ERAX, SystemMemory,  
>       0xFE00D400, 0xFF)". However, I have found no kernel functions  
>       to get the address (here 0xFE00D400) of a  OperationRegion.  
>       One could also hardcode it for each model/firmware.
>     - alternative (which I am currently using) is sending commands    
>       to IO ports 0x4E/0x4F (Super IO controller). 
> 
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
>     - newer models (2022): these provide ACPI/WMI methods  
>       setFanCurve/getFanCurve to write to these regions. However, I  
>       have implemented that and have no models for testing
> 
> The driver works for the models 2020-2022. The code layout is heavily inspired by the ideapad_laptop driver.
> 
> Best regards,
> 
> John Martens
> 

