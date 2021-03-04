Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD57C433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 13:29:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E84D864F2C
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 13:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241098AbhCDN2T (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Mar 2021 08:28:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47525 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241272AbhCDN1u (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 08:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614864384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OIAoO0m20JO/JcrsDigzaLhR/DprzftkeX4MMponqo0=;
        b=J0AYyS02vk+0PfjbERunNFVywsz/B9CY5W6fepax8yyxA2J9fDQP5lajrIKuBSvgUdZ3/H
        818IhWwjpfHKuWBwRf4JxtBVCOwFmCw97Msj6M+xU0YMTHIXP5REegDNlSOxp6hzfRFmIQ
        oom6wRXxYKOFuZpOR3x1BwhgEX9OrDg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-PKdesTbsOp6zbeFrte-_BA-1; Thu, 04 Mar 2021 08:26:22 -0500
X-MC-Unique: PKdesTbsOp6zbeFrte-_BA-1
Received: by mail-ej1-f71.google.com with SMTP id k16so7946965ejg.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 05:26:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OIAoO0m20JO/JcrsDigzaLhR/DprzftkeX4MMponqo0=;
        b=GmU+eNH0NT6thAWzl6tonvyn1TC9KK5LJLd0dI42Lr4WIhb7gqe5DxXicpDM5/6/pl
         ovRg1i1Wpv6QD/dN2gf5zW4zvOJDB6CO3v5pmdLuFW+Rqj79QgOLAjI2+LAJWrYHrBJn
         CrI5W1oDvCddQ+tKPZ7LK7Ki/UeJKbajElBGIhOQUc4v+qNJYRQQ67UA9zvEuCFRC/4J
         AA0Pai+rT2PXX0ptIqmHSldGPAwWLqeRd6NObjoUK8tQfBnYgnTomzqStfJxvUxsUUBp
         5Z3izYKN49x71WG1nD2y212vobyJT9+pO78USiUxKAaksEapJUIyb7PZEiJfCzrEme4P
         yEvg==
X-Gm-Message-State: AOAM531Z78YJc0YwYTu42/PnqCwePwrO5INYS3ptegmpIq4+Qn/A19cz
        xT4vgAneC+b7p/lq69S+oj/hsWbv1070doHJ5kjXWBW/EvdayqIEs+V9+wvIEVSk2p5V5b7z2s4
        pqWf2VnZ36Rh/6oJH+dIy9GUMmYSETWNAgw==
X-Received: by 2002:a17:906:719:: with SMTP id y25mr4156516ejb.180.1614864381458;
        Thu, 04 Mar 2021 05:26:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIrtmR5Mep4xXyAK0fSjTcl1jQ/YxpnqllGttPA25ksLe8WqhZzZ/+Dz056cHaVpp69EUz0Q==
X-Received: by 2002:a17:906:719:: with SMTP id y25mr4156505ejb.180.1614864381310;
        Thu, 04 Mar 2021 05:26:21 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e26sm9342136edj.29.2021.03.04.05.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 05:26:19 -0800 (PST)
Subject: Re: [PATCH 1/2] platform/x86: hp-wmi: rename "thermal policy" to
 "thermal profile"
To:     Elia Devito <eliadevito@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210221210256.68198-1-eliadevito@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e31a5de6-b446-8d73-7200-8bbbde6341a2@redhat.com>
Date:   Thu, 4 Mar 2021 14:26:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221210256.68198-1-eliadevito@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/21/21 10:02 PM, Elia Devito wrote:
> rename "thermal policy" with the more appropriate term "thermal profile"
> 
> Signed-off-by: Elia Devito <eliadevito@gmail.com>

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
> index e94e59283ecb..6d7b91b8109b 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -85,7 +85,7 @@ enum hp_wmi_commandtype {
>  	HPWMI_FEATURE2_QUERY		= 0x0d,
>  	HPWMI_WIRELESS2_QUERY		= 0x1b,
>  	HPWMI_POSTCODEERROR_QUERY	= 0x2a,
> -	HPWMI_THERMAL_POLICY_QUERY	= 0x4c,
> +	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
>  };
>  
>  enum hp_wmi_command {
> @@ -869,19 +869,19 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
>  	return err;
>  }
>  
> -static int thermal_policy_setup(struct platform_device *device)
> +static int thermal_profile_setup(struct platform_device *device)
>  {
>  	int err, tp;
>  
> -	tp = hp_wmi_read_int(HPWMI_THERMAL_POLICY_QUERY);
> +	tp = hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
>  	if (tp < 0)
>  		return tp;
>  
>  	/*
> -	 * call thermal policy write command to ensure that the firmware correctly
> +	 * call thermal profile write command to ensure that the firmware correctly
>  	 * sets the OEM variables for the DPTF
>  	 */
> -	err = hp_wmi_perform_query(HPWMI_THERMAL_POLICY_QUERY, HPWMI_WRITE, &tp,
> +	err = hp_wmi_perform_query(HPWMI_THERMAL_PROFILE_QUERY, HPWMI_WRITE, &tp,
>  							   sizeof(tp), 0);
>  	if (err)
>  		return err;
> @@ -900,7 +900,7 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  	if (hp_wmi_rfkill_setup(device))
>  		hp_wmi_rfkill2_setup(device);
>  
> -	thermal_policy_setup(device);
> +	thermal_profile_setup(device);
>  
>  	return 0;
>  }
> 

