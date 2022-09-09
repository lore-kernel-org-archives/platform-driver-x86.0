Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E9AECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Sep 2022 18:01:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbiIISBX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Sep 2022 14:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbiIISBJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Sep 2022 14:01:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568A8B656C
        for <platform-driver-x86@vger.kernel.org>; Fri,  9 Sep 2022 11:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662746467;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3D26A95ux8AtSyHj3kN5yWBRCCyIa3I2ao1wuKJQdY0=;
        b=TXCuEcYTyaYOYwAfdEOGJ7KGupGJkpmP15U2i92Fs5Lo6AYIFF2hPXM2Tgz2h9J8gKZ4bR
        yDHC+tRgPfNJjNJ7TbnztuPzPkXVbyZd2F+QexXcW0OwmtZFxkCFY2ni9S/WekQj4l0vzD
        IVuFotN6Kjisby/4JbLPR1CTuyrfLDc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-CUL4k7BnONStwYNPTL54Lw-1; Fri, 09 Sep 2022 14:01:05 -0400
X-MC-Unique: CUL4k7BnONStwYNPTL54Lw-1
Received: by mail-ej1-f70.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fso1393509ejb.14
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Sep 2022 11:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3D26A95ux8AtSyHj3kN5yWBRCCyIa3I2ao1wuKJQdY0=;
        b=4Sw4jFLzJcTO0lc0B/Szl2NK/+9CUnoh2cDT0RiKMXBXV3w08pPg0GrWYtC2vKe3r1
         eufbA4J2OSHr5H7iAHpAwrbfJU9f1YDU9D1qM1b6k0kQHl96qgM/Gsd2zIqk+TnsXoI/
         vHBZ/VVy0uQito3coOKc1Fti2Q04fq95oqUUB++toNlhucKerFw4iIQhFcJQNZ3+6MIi
         02PArM7dUqlnuyxu8PtBB//r7ciAxAi3pLRXiVlMVrouNjjUpbAgY5Zi1ZCKdouxUFgs
         MTITfA5S5XmS0sO2BtKikyhBmUbrC51bE3t3eXRTuxOqqsaZAk1P14Gf7SdKxbthplV7
         H0VQ==
X-Gm-Message-State: ACgBeo3egFPWfczEdKAvTAzIlypB6d8clezHlKh9huCfbID4r3Yo/J0V
        JSS7ww1Cnqpn7eplhydgDwZYY2Cd/gNYct1htKe1xHyz7pQB5rX2PlQHfbqoAm9rDJQoslYvjmR
        6hAO3V7OMV02K2dzFEslMKoVqz24oR6fxIQ==
X-Received: by 2002:a17:907:60c7:b0:739:52ba:cbd0 with SMTP id hv7-20020a17090760c700b0073952bacbd0mr10772619ejc.152.1662746464574;
        Fri, 09 Sep 2022 11:01:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR518PPyB3tBg1mbTu+yRfNwrJ4KjUBwnlEw1t78r+948rsIep6kuQmUdGiNT/jfsXGkqYojzg==
X-Received: by 2002:a17:907:60c7:b0:739:52ba:cbd0 with SMTP id hv7-20020a17090760c700b0073952bacbd0mr10772611ejc.152.1662746464382;
        Fri, 09 Sep 2022 11:01:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id 7-20020a170906308700b0072b1bc9b37fsm578447ejv.22.2022.09.09.11.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 11:01:03 -0700 (PDT)
Message-ID: <1d2d7da9-3046-b5fc-da6f-7615aa8a8285@redhat.com>
Date:   Fri, 9 Sep 2022 20:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 1/1] hp-wmi: Setting thermal profile fails with 0x06
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>, balalic.enver@gmail.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     markgross@kernel.org
References: <20220906170239.30384-1-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220906170239.30384-1-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge,

On 9/6/22 19:02, Jorge Lopez wrote:
> Error 0x06 (invalid command parameter) is reported by hp-wmi module
> when reading the current thermal profile and then proceed to set it
> back. The failing condition occurs in Linux NixOS after user
> configures the thermal profile to ‘quiet mode’ in Windows.  Quiet Fan
> Mode is supported in Windows but was not supported in hp-wmi module.
> 
> This fix adds support for PLATFORM_PROFILE_QUIET in hp-wmi module for
> HP notebooks other than HP Omen series.  Quiet thermal profile is not
> supported in HP Omen series notebooks.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

Thank you for looking into this!



> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  drivers/platform/x86/hp-wmi.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index bc7020e9df9e..f5c13df35af0 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -177,7 +177,8 @@ enum hp_thermal_profile_omen_v1 {
>  enum hp_thermal_profile {
>  	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
>  	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
> -	HP_THERMAL_PROFILE_COOL			= 0x02
> +	HP_THERMAL_PROFILE_COOL			= 0x02,
> +	HP_THERMAL_PROFILE_QUIET		= 0x03,
>  };
>  
>  #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) != HPWMI_POWER_FW_OR_HW)
> @@ -1194,6 +1195,9 @@ static int hp_wmi_platform_profile_get(struct platform_profile_handler *pprof,
>  	case HP_THERMAL_PROFILE_COOL:
>  		*profile =  PLATFORM_PROFILE_COOL;
>  		break;
> +	case HP_THERMAL_PROFILE_QUIET:
> +		*profile = PLATFORM_PROFILE_QUIET;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1216,6 +1220,10 @@ static int hp_wmi_platform_profile_set(struct platform_profile_handler *pprof,
>  	case PLATFORM_PROFILE_COOL:
>  		tp =  HP_THERMAL_PROFILE_COOL;
>  		break;
> +	case PLATFORM_PROFILE_QUIET:
> +		tp = HP_THERMAL_PROFILE_QUIET;
> +		break;
> +
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -1266,6 +1274,7 @@ static int thermal_profile_setup(void)
>  	}
>  
>  	set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
> +	set_bit(PLATFORM_PROFILE_QUIET, platform_profile_handler.choices);

In the commit msg you say that quiet profile is only supported on the non Omen
models, should this then not be inside the else branch of the:

if (is_omen_thermal_profile()) { ... } else { ... }

just above this code block ?

>  	set_bit(PLATFORM_PROFILE_BALANCED, platform_profile_handler.choices);
>  	set_bit(PLATFORM_PROFILE_PERFORMANCE, platform_profile_handler.choices);
>  


Regards,

Hans

