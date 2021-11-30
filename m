Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0CBC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Nov 2021 15:46:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234525AbhK3Pt0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Nov 2021 10:49:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51861 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231895AbhK3PtZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Nov 2021 10:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638287166;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CMTbZV3vrqGIxi/ftCnm6bqhnvJPGnNTEQXDEsfdXrc=;
        b=LthvOV6wdkYpqi0j1LMl9DItRyYZFUu+2HOtlL3lfDIItkewW2g1oDmaCuEwOKqF0IkzDB
        PP7VMH9H9f0YFt9aJ1iAgreayYwmhWphByHZ7BBx8+JbesC/ga7eWRoulTqToo4i5fi1kS
        RMN4LEc2e4Fq3cUltmvqg+AqfmCX/EA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-VT-iO0XNNvydiukSc_krnA-1; Tue, 30 Nov 2021 10:46:04 -0500
X-MC-Unique: VT-iO0XNNvydiukSc_krnA-1
Received: by mail-ed1-f70.google.com with SMTP id q17-20020aa7da91000000b003e7c0641b9cso17320133eds.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2021 07:46:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CMTbZV3vrqGIxi/ftCnm6bqhnvJPGnNTEQXDEsfdXrc=;
        b=NW1PdcdXcG6oidUjGgQeXTFbMv44va0AfkJ5jeeGpA3oRtGhDqdMpqhPVxoLRQuj80
         1sZ2O4OpThEliKl8GupaWUSPTf1sOPi1RVssPHwQL8ziEPSzrhtaNoo42sPNoxkpwJds
         jbslme9Bn4IPHmSIM6pxAPc1MYbiM9Ah0E40E5kOsuO2Jdr08uGNxpGlRtMjKIVFAwVa
         4jDHN2aiWe1uyLr6UMSO8G3aFV8cZsf5XQr952CEU8fjLKHStnnT+cy3HSJiT5r0X6/O
         Breuyng2N1uqA8nf8cEjRfHEjMarWNBphZ/hroo3orseSNpS/QR2FneIIsHkx5CqJUF4
         8Egw==
X-Gm-Message-State: AOAM530utfRpm496ZUE6yJQgZKhOyohWAY0rgG0aVKcrO6kRtvW8fcqS
        zqW7HliENEhx9z5KKzjbCQgWtjHEGL5HHNISaT2Hfyh37OUbG6V0RZsF+7Qx9pSRt3I7o8jXBuo
        JynzxamiTaFUX7dh/lvAELK3vLRaDQRfzMA==
X-Received: by 2002:a05:6402:8:: with SMTP id d8mr86627494edu.61.1638287163118;
        Tue, 30 Nov 2021 07:46:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWay/Z9FKRIftiPBjq20KazV4H8MNljUC3xlQmQuyQyn2QB4DovmWc3Y5vyQs1L+z7SCxS3g==
X-Received: by 2002:a05:6402:8:: with SMTP id d8mr86627470edu.61.1638287162914;
        Tue, 30 Nov 2021 07:46:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id j17sm11878295edj.0.2021.11.30.07.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 07:46:02 -0800 (PST)
Message-ID: <b5bd85b9-5cbf-0774-3638-cea660159dec@redhat.com>
Date:   Tue, 30 Nov 2021 16:46:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/1] amd-pmu: fix s2idle failures on certain AMD laptops
Content-Language: en-US
To:     Fabrizio Bertocci <fabriziobertocci@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <CADtzkx7TdfbwtaVEXUdD6YXPey52E-nZVQNs+Z41DTx7gqMqtw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CADtzkx7TdfbwtaVEXUdD6YXPey52E-nZVQNs+Z41DTx7gqMqtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/30/21 05:15, Fabrizio Bertocci wrote:
> On some AMD hardware laptops, the system fails communicating with the
> PMU when entering s2idle and the machine is battery powered.
> 
> Hardware description: HP Pavilion Aero Laptop 13-be0097nr
> CPU: AMD Ryzen 7 5800U with Radeon Graphics
> GPU: 03:00.0 VGA compatible controller [0300]: Advanced Micro Devices,
> Inc. [AMD/ATI] Device [1002:1638] (rev c1)
> 
> Detailed description of the problem (and investigation) here:
> https://gitlab.freedesktop.org/drm/amd/-/issues/1799
> 
> Patch is a single line: reduce the polling delay in half, from 100uSec
> to 50uSec when waiting for a change in state from the PMC after a
> write command operation.
> 
> Tested on kernel tree detached at tag 5.14
> (7d2a07b769330c34b4deabeed939325c77a7ec2f)
> After changing the delay, I did not see a single failure on this
> machine (I have this fix for now more than one week and s2idle worked
> every single time on battery power).
> 
> Signed-off-by: Fabrizio Bertocci <fabriziobertocci@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index b7e50ed050a8..841c44cd64c2 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -76,7 +76,7 @@
>  #define AMD_CPU_ID_CZN                 AMD_CPU_ID_RN
>  #define AMD_CPU_ID_YC                  0x14B5
> 
> -#define PMC_MSG_DELAY_MIN_US           100
> +#define PMC_MSG_DELAY_MIN_US           50
>  #define RESPONSE_REGISTER_LOOP_MAX     20000
> 
>  #define SOC_SUBSYSTEM_IP_MAX   12
> ---
> 

