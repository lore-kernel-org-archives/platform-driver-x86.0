Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDFAC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 21:35:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232350AbiKJVfN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 16:35:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232353AbiKJVfL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 16:35:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF40167ED
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 13:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668116049;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qGq2aqvFk/urSwdIN4KIfJO6NUgNb1K5ak9OotOPtfU=;
        b=H+nEGEuT2iHm9+gqzvy7LMjO3qvYZHjY8J3rDPuutsVR0IH7z6BaBodRxWr9RqCz8tCs4v
        t4nzrl0FFV3cxej5KslZUYTqq1gNsq9Ro1CChYw+UgAx4UdbsFwMZKJRgHWIp5UCLVilL5
        v851IcrcHh7hWF8SdR2BRrdJBGjzzKs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-191-wwead0YjOzy6KchslbnCiw-1; Thu, 10 Nov 2022 16:34:06 -0500
X-MC-Unique: wwead0YjOzy6KchslbnCiw-1
Received: by mail-ej1-f72.google.com with SMTP id sh31-20020a1709076e9f00b007ae32b7eb51so1914175ejc.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 13:34:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qGq2aqvFk/urSwdIN4KIfJO6NUgNb1K5ak9OotOPtfU=;
        b=Qa60PUOd/zMzFXf6iuEibPFKwGXDcOHMaAWOuky4rnH79Ak81Gz5m/YdLG2P213VCq
         rgPJ+lxyKu0k2JsyzkSwrOz5a5k/CFYzJjfGLONE5ZjYhVGFCpRB9nyNhiLI+AV1KXRX
         +qMyulAMYkmaJ43ZGN/We1mnFRdDncyT4bsmof5rNQn3+2OKXj3siGiGYmiGppgVYjLU
         nd7Qsdyx4YchWPhF9WrvmTIV+WZBz7OY6u0YppTaZ18sunAhHsjcTsbOHcSZzfSMxxKP
         ubdFVwJI0jO52tILl4m+WXGdCbxDjlRuu7/8FvBZMscwjK8N1vPejMJpxlKTqTkmB/qW
         0qOA==
X-Gm-Message-State: ACrzQf2fCnrI8c0MG3AD0sapPi0HrOA0vQNT+tAiwveX2KWNxOmc2anG
        vnDJYPpaHrI6fvYsdXkYddsvajyhQbx1SGc9lMFYpn4yzgwJ8z4PeQZ3CWa5xAaYv1tQdNn0lmm
        t353V8C852FJ0Pvm3o4QbJZqBl2uOxB9dDA==
X-Received: by 2002:a05:6402:c8d:b0:460:7413:5d46 with SMTP id cm13-20020a0564020c8d00b0046074135d46mr3579564edb.47.1668116045462;
        Thu, 10 Nov 2022 13:34:05 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4GapEdBzGG5QBFJAeIp0VGj5YCHVjerCZbIsaJ0p+/SU6lOYT9dCpExb/V2/Jl3tN20W345A==
X-Received: by 2002:a05:6402:c8d:b0:460:7413:5d46 with SMTP id cm13-20020a0564020c8d00b0046074135d46mr3579556edb.47.1668116045249;
        Thu, 10 Nov 2022 13:34:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id lb17-20020a170907785100b00734bfab4d59sm139507ejc.170.2022.11.10.13.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 13:34:04 -0800 (PST)
Message-ID: <72b7481b-8b69-d091-a097-ee6c9fbb92f8@redhat.com>
Date:   Thu, 10 Nov 2022 22:34:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 14/14] Revert "platform/x86/intel/ifs: Mark as BROKEN"
Content-Language: en-US, nl
To:     Jithu Joseph <jithu.joseph@intel.com>, markgross@kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        gregkh@linuxfoundation.org, ashok.raj@intel.com,
        tony.luck@intel.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, patches@lists.linux.dev,
        ravi.v.shankar@intel.com, thiago.macieira@intel.com,
        athenas.jimenez.gonzalez@intel.com, sohil.mehta@intel.com
References: <20221021203413.1220137-1-jithu.joseph@intel.com>
 <20221107225323.2733518-1-jithu.joseph@intel.com>
 <20221107225323.2733518-15-jithu.joseph@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221107225323.2733518-15-jithu.joseph@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/7/22 23:53, Jithu Joseph wrote:
> Issues with user interface [1] to load scan test images
> has been addressed, so the following can be reverted.
> commit c483e7ea10fa ("platform/x86/intel/ifs: Mark as BROKEN")
> 
> Link: https://lore.kernel.org/lkml/26102aca-a730-ddf8-d024-2e7367696757@redhat.com/ [1]
> 
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/intel/ifs/Kconfig | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/ifs/Kconfig b/drivers/platform/x86/intel/ifs/Kconfig
> index 89152d46deee..3eded966757e 100644
> --- a/drivers/platform/x86/intel/ifs/Kconfig
> +++ b/drivers/platform/x86/intel/ifs/Kconfig
> @@ -1,9 +1,6 @@
>  config INTEL_IFS
>  	tristate "Intel In Field Scan"
>  	depends on X86 && CPU_SUP_INTEL && 64BIT && SMP
> -	# Discussion on the list has shown that the sysfs API needs a bit
> -	# more work, mark this as broken for now
> -	depends on BROKEN
>  	help
>  	  Enable support for the In Field Scan capability in select
>  	  CPUs. The capability allows for running low level tests via

