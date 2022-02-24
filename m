Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF6FC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Feb 2022 16:50:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbiBXQvE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Feb 2022 11:51:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbiBXQuz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 11:50:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EAA431C4B07
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 08:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645721398;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5d5v5g/KURDWe0uo4rDGLo8uToSqpP6+d3Aa5ejBoSQ=;
        b=Goi8cLif2GFLXTP7sdykQjOOJxcucI/EC1Tya2pRYF5GFYgLmrcvD+88ccTLVmNL5WyS4v
        yv7/JEmSi4CPMkBig0h6H0SVqYUWdSI2dC+AepJJBT3lJULd4lgkYuROMGnfpumxtDfvHv
        UlbolWAzXOBniwAZuJrYSK2V4OiJS3M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-L4wykrbvO12pGIGyDigHwQ-1; Thu, 24 Feb 2022 11:49:56 -0500
X-MC-Unique: L4wykrbvO12pGIGyDigHwQ-1
Received: by mail-ed1-f71.google.com with SMTP id dy17-20020a05640231f100b00412897682b4so971395edb.18
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 08:49:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5d5v5g/KURDWe0uo4rDGLo8uToSqpP6+d3Aa5ejBoSQ=;
        b=V5xwLNxFUIqk9bATQv3+iZ2SOVuy85Dm2G96ap3AABfV9KWtei1XVw35nzV3FcJYOk
         yBsM8PM8O1fU8zIBwt/EX/ocmLcXY45SdIqHciQTpbIHaVsOQuppK3hTKMGfcUYrhXiw
         YaPuHDc0vMYuiB8l7n5p1Z6+Do5Y8N22JfvPKJQ97ZnpzvfjkdAwTYHE5NGZBOA3QgL4
         u9l9XLReafqqdK9muE+QEG3KgvyWaxxWGvFxYcSEWq43tYB+cc+C74HrA2ku8SjsV6w4
         sfPSR6mJPsPb+Sp7MiAF/2Ifk/gIZNf4Xoe+VQs5bM/A1C/xsR3WZAT/FT9xOrJvzVL4
         RREg==
X-Gm-Message-State: AOAM530UtROlE7kTXKHBbqc1CzFYejrPRQl4G6Ho5BUWru2QEg4Tmdck
        Y6EAGLdxDNBH0K1waes/GRPwc1/D/SfVwuTM2vgRa0SktLhyeOzzqicnmg0X/yJTIO/O1II1xTF
        1TI+S/3aDZU5iMkmPCI1hzBt2jVK/3r5Eag==
X-Received: by 2002:a05:6402:2686:b0:412:d1cb:a6d8 with SMTP id w6-20020a056402268600b00412d1cba6d8mr3179179edd.280.1645721395634;
        Thu, 24 Feb 2022 08:49:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNAeM7yFukA4NuAEUTFYRdZ7RxfC7vPutD0j3WScBbyg5USbJ/ySiwnAhgD7kEpDtRKpx/Ug==
X-Received: by 2002:a05:6402:2686:b0:412:d1cb:a6d8 with SMTP id w6-20020a056402268600b00412d1cba6d8mr3179166edd.280.1645721395484;
        Thu, 24 Feb 2022 08:49:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id b2sm1626913edr.44.2022.02.24.08.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 08:49:54 -0800 (PST)
Message-ID: <85474eb8-8fe3-2aa7-5619-fd7ee98da498@redhat.com>
Date:   Thu, 24 Feb 2022 17:49:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/5] platform/x86: x86-android-tablets: Fix EBUSY error
 when requesting IOAPIC IRQs
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20220223133153.730337-1-hdegoede@redhat.com>
 <20220223133153.730337-3-hdegoede@redhat.com>
 <YhZLI40Vukgv+PPO@smile.fi.intel.com>
 <9cda0c14-8108-fb42-4464-36a2fde0ffda@redhat.com>
 <YhZU6rDSYPG3pUbx@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YhZU6rDSYPG3pUbx@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/23/22 16:38, Andy Shevchenko wrote:
> On Wed, Feb 23, 2022 at 04:16:42PM +0100, Hans de Goede wrote:
>> On 2/23/22 15:56, Andy Shevchenko wrote:
>>> On Wed, Feb 23, 2022 at 02:31:50PM +0100, Hans de Goede wrote:
> 
> ...
> 
>>>>  	case X86_ACPI_IRQ_TYPE_APIC:
>>>> +		/*
>>>> +		 * The DSDT may already reference the GSI in a device skipped by
>>>> +		 * acpi_quirk_skip_i2c_client_enumeration(). Unregister the GSI
>>>> +		 * to avoid EBUSY errors in this case.
>>>> +		 */
>>>> +		acpi_unregister_gsi(data->index);
>>>
>>> Perhaps a warning (or at least debug) message?
>>
>> The function returns void, so we cannot check if it did anything or not.
> 
> Another approach may be to try to register GSI and if fail, try unregister
> and register again?

Since we only run this on boards where it is specifically enabled and it
thus has been tested to be safe I believe that that needlessly complicates
things, so I'm just going to merge this as is.

Regards,

Hans

