Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3660FC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Nov 2021 11:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbhK3LbU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Nov 2021 06:31:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42787 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231402AbhK3LbP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Nov 2021 06:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638271676;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZI0EqIJxMMw6xZ1nOqCVcGIiK10rxLlVfbQRFN9dX7Y=;
        b=CScL8q1HO2shfeYSI1SIowSaarJ1MFKxW5nHwTu2xE1oAUq9CCeyfdwTMvcCZ3xEeWGYNe
        2D8Xslu2QivV5F2QFe3LEAVnSxZORvdhOeMzg8x68zB3QP+poFNH4y3eGwod2HKqP5rVBJ
        j9JF5UEE/kSQnbJB/mFSkwwPt3L308Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-94zCuGBXPeKln4-UhLxejg-1; Tue, 30 Nov 2021 06:27:55 -0500
X-MC-Unique: 94zCuGBXPeKln4-UhLxejg-1
Received: by mail-ed1-f69.google.com with SMTP id bx28-20020a0564020b5c00b003e7c42443dbso16595142edb.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2021 03:27:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZI0EqIJxMMw6xZ1nOqCVcGIiK10rxLlVfbQRFN9dX7Y=;
        b=Bg+/4woptl/BavKa0V6AUMsGHg9oW8yFoEcbpto7cnBfS1w80qhj8yjuIOG71p1ExH
         PydL/g+FKM3qySO+qPRjND2TK5wFbp9AAop3PxV1IE3KoLdCRn4048siBja+h52BINqD
         4aWNI/+0eNZWwBCwtUm5CdhYjkyx6+jkoMMSVat3YqmZL+n9iBy/SSrg7WeQyWJd8iO9
         wS8jkL3wrh5Jt4l9gbfwYuhOamTLJOejUh+t0szwzb4Uwg+XCG2c9LnGyCprHui+6jxy
         tv2FUnhIuhQyXU9kIsV+MUo/7z3toiRFYbql4Cn6qUkJAm+wMjH/zW04tbXg8F+NAFlK
         NQYg==
X-Gm-Message-State: AOAM532YCje3pakYBtb7fQMAijgXMEo7dlXXvodw9xMTIGpTSSwM3QND
        VqBCvZ9CvPGna26Pm8Ocsj3v7MlNcJ6c7BsjUEWIo1sDo2VgCDv74OEH3C5oQEnwD3PhRE6Ly5D
        7oTcX1+JcB7+09CczRnXLZ3oCDHSiMnyDog==
X-Received: by 2002:a17:906:5209:: with SMTP id g9mr68056858ejm.145.1638271674188;
        Tue, 30 Nov 2021 03:27:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynJJzu/Jbk2Z+XGzlFr6LPlDOUe/N4GBdgsYfIWyibDDsPNoSUXzkrFpuuC0iAL7eg+zUS2w==
X-Received: by 2002:a17:906:5209:: with SMTP id g9mr68056840ejm.145.1638271674021;
        Tue, 30 Nov 2021 03:27:54 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q7sm10892184edr.9.2021.11.30.03.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 03:27:53 -0800 (PST)
Message-ID: <4a3d55d0-c53d-d0dc-8023-c059ddffc84c@redhat.com>
Date:   Tue, 30 Nov 2021 12:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/1] amd-pmu: fix s2idle failures on certain AMD laptops
Content-Language: en-US
To:     Fabrizio Bertocci <fabriziobertocci@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>
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

Thank you for your patch. I've added a couple of AMD developers who
work on this driver to the Cc.

AMD folks, can you review/ack this patch please?

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

