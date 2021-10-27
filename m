Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B948FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 14:08:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98E4D60EC0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 14:08:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242414AbhJ0OKm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Oct 2021 10:10:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40179 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237728AbhJ0OKl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Oct 2021 10:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635343696;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r+HnDLX+drr+E9HuPxXIta+DEpzDrHQiUhqwmqxZrjs=;
        b=VmsGveAnbgE8Y5U1TUMAaOGr2XwqX8993kuqUHitSFrhAfCrH84OjSou3RVMYrthhltUXR
        QmAH4hzSue5akHaYkWiikfwKD3MFMoD0/9MckTzp1ztv1Ja1Ar2dBAMqfPVSGBO+8RXb7Z
        4dEGd0wVzLnHM7ulVwLU9FOeKp6cuBM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-mcia-DJ5NGOzirJ1FrZqkA-1; Wed, 27 Oct 2021 10:08:15 -0400
X-MC-Unique: mcia-DJ5NGOzirJ1FrZqkA-1
Received: by mail-ed1-f69.google.com with SMTP id u10-20020a50d94a000000b003dc51565894so2373418edj.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Oct 2021 07:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r+HnDLX+drr+E9HuPxXIta+DEpzDrHQiUhqwmqxZrjs=;
        b=rWCwLSlNVyoT3A0W1uRR+mS6qSBt+rb1TcBRlplpLfn7rEYHr9HYKMvbVYMzj12Owt
         xwmT7EPZiJ3Q3nmelTextQao50FqMR3RUcfAFAn0UpnOOxvdqumENAyG8jr5+/6fTn9c
         YlvRWwloxlaA0+N/1bz4crh1X9NuxaBJf4OSy7SPDHOs7pJKWOszfb0aRLE1zq3Oa9Nu
         YB3hDGa4U8iJmOLBPuMLyX2GgREQeR2vqLGG1z2VAiDGlJvn44Rf99NL94Y3j6rRnmKs
         hmF9XQ8VAnbmfCzcgERhCkVvpQEsZuZPOHP/SkJ13e4NmD2CIz1ESiecMbzyN0L49VyM
         gNpg==
X-Gm-Message-State: AOAM532/z75KOBBonxekkZDMHe7oWb+RBZDDZptMc47LCqT6vNmjOA5j
        KWTBSDz9qdTYmoumu8t+JX67PEDn4xmw3diq2/V8styWrDmxReGrqy98fduuiBnf45aGXmlR5gs
        uPw4Q6xcdDcFH8bZ/QMaW7vWOQmOYkEc5Mw==
X-Received: by 2002:a05:6402:13d4:: with SMTP id a20mr44364813edx.309.1635343690723;
        Wed, 27 Oct 2021 07:08:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwybMPvf0VnxlouBqE5MDq1acp/YpHPytQi7J6RsARiGbzFNfjenE+X1Acx1MYrkZOIu/llew==
X-Received: by 2002:a05:6402:13d4:: with SMTP id a20mr44364786edx.309.1635343690409;
        Wed, 27 Oct 2021 07:08:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id hv9sm5324ejc.51.2021.10.27.07.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 07:08:10 -0700 (PDT)
Message-ID: <6af92c49-ecec-a54f-e2f7-d3ef3527427f@redhat.com>
Date:   Wed, 27 Oct 2021 16:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 1/3] platform/x86: hp-wmi: rename platform_profile_*
 function symbols
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>
Cc:     "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>, markpearson@lenovo.com,
        linux-acpi@vger.kernel.org
References: <20211026190835.10697-1-mario.limonciello@amd.com>
 <20211026190835.10697-2-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211026190835.10697-2-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/26/21 21:08, Mario Limonciello wrote:
> An upcoming change to platform profiles will export `platform_profile_get`
> as a symbol that can be used by other drivers. Avoid the collision.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

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
>  drivers/platform/x86/hp-wmi.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 8e31ffadf894..48a46466f086 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -1061,8 +1061,8 @@ static int thermal_profile_set(int thermal_profile)
>  							   sizeof(thermal_profile), 0);
>  }
>  
> -static int platform_profile_get(struct platform_profile_handler *pprof,
> -				enum platform_profile_option *profile)
> +static int hp_wmi_platform_profile_get(struct platform_profile_handler *pprof,
> +					enum platform_profile_option *profile)
>  {
>  	int tp;
>  
> @@ -1087,8 +1087,8 @@ static int platform_profile_get(struct platform_profile_handler *pprof,
>  	return 0;
>  }
>  
> -static int platform_profile_set(struct platform_profile_handler *pprof,
> -				enum platform_profile_option profile)
> +static int hp_wmi_platform_profile_set(struct platform_profile_handler *pprof,
> +					enum platform_profile_option profile)
>  {
>  	int err, tp;
>  
> @@ -1147,8 +1147,8 @@ static int thermal_profile_setup(void)
>  		if (err)
>  			return err;
>  
> -		platform_profile_handler.profile_get = platform_profile_get;
> -		platform_profile_handler.profile_set = platform_profile_set;
> +		platform_profile_handler.profile_get = hp_wmi_platform_profile_get;
> +		platform_profile_handler.profile_set = hp_wmi_platform_profile_set;
>  	}
>  
>  	set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
> 

