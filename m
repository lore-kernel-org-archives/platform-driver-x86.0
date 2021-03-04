Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54205C433E6
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 13:29:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2455164F21
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 13:29:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241272AbhCDN2T (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Mar 2021 08:28:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43938 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241274AbhCDN2B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 08:28:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614864396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=x2kgzCDzJBnOwlfEuzuqiVgYC23L9oOT+TkY8j2SMrQ=;
        b=Tx9TVI/vXNkhoqSa5YMLF8g/dR/u0dJGHP5UoVFoj5QF5LpdtziAytJ0WAO1xN8U7PnWnZ
        2X0ecgmtCNlPC+FBEn7n6EI/iZA4gtfHQSnwYTm+8ehvfIpRaSfiBQtapxg3pawe6JXomY
        ee1lTdmUpTudJZEKZ/VjGw4QlXN3CRA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535--ucXSWaHPHqVtywhU2wBkQ-1; Thu, 04 Mar 2021 08:26:34 -0500
X-MC-Unique: -ucXSWaHPHqVtywhU2wBkQ-1
Received: by mail-ej1-f71.google.com with SMTP id rl7so6784756ejb.16
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 05:26:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x2kgzCDzJBnOwlfEuzuqiVgYC23L9oOT+TkY8j2SMrQ=;
        b=kPcBL+tdr5T3LsNolMsdg9bKMvRkJFqInXaN57755fSBGCygnIWehFZAO38ZGZ/2BS
         EEVqwshsbkpJxKJqjA7bFmbN/vwUoHh5qq+C2lUsm/hgcnE1k77w5AnRIspjzRZupSyz
         sP3cEVMvnB7Ahlrzw0KJb5Gnd+kTLwSvLcLvLHJZEC2kMWfTt4OZA0p9qh758eGMOk/M
         9jGSyysuXPDrDW6zpxJnArkuTMIagsDTJZD1L/53OzRZlm+QSUk8Qn7gqqWzwGuO8Rhy
         dHwR24FldIu/zIv6q+xMs2MWr7PsiEpXd+K3E/vtz9GWAs+2t2p9tl7P9CumY7T2Wl/1
         K9iA==
X-Gm-Message-State: AOAM530BRviPuaZk4+EzCa4Ql5pgLIJ/FQuNCZbJY7RO9dMadbmjOPcJ
        wSH3rjLkWt7C8fb+SzpxB+9jyUXy6yHjcFz3z67wssxUp68DL00nIrg8bQdBMf9LL3e2B51+6fP
        6QM2cyovUR7hO7x2TRJNI6Q+kRp6daoHF+w==
X-Received: by 2002:a17:906:8408:: with SMTP id n8mr4107746ejx.152.1614864393548;
        Thu, 04 Mar 2021 05:26:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvcBUb2v3ZTdyfJlSiDJ+vJVf3ql5spX5kk+5B7sPZ0l6gbyFxTAVvccE+Jcbzo6Tsye0TPg==
X-Received: by 2002:a17:906:8408:: with SMTP id n8mr4107728ejx.152.1614864393344;
        Thu, 04 Mar 2021 05:26:33 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v9sm26368005edj.89.2021.03.04.05.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 05:26:32 -0800 (PST)
Subject: Re: [PATCH v3 2/2] platform/x86: hp-wmi: add platform profile support
To:     Elia Devito <eliadevito@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <nVb9zC39HBbC5-iweNmNol7ymCjT4iD91ydsZVuo_Upqh2_3eVKaF1X1rbYpZGva-NyrGUW_W2uJIc5RHu1KhBGy7-ejGNYZJyRttjhJT-s=@protonmail.com>
 <20210221221339.12395-1-eliadevito@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <21dc7fd4-9075-6b76-bc74-57a7d3b3b126@redhat.com>
Date:   Thu, 4 Mar 2021 14:26:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221221339.12395-1-eliadevito@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/21/21 11:13 PM, Elia Devito wrote:
> Implement support for cool, balanced and performance thermal profile
> 
> Signed-off-by: Elia Devito <eliadevito@gmail.com>
> ---
> the "quiet" profile will be implemented with a further patch
> 
> v2: added platform_profile_remove() missing call
> v3: apply Barnabás suggestions

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



> 
>  drivers/platform/x86/hp-wmi.c | 97 +++++++++++++++++++++++++++++++++--
>  1 file changed, 92 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 6d7b91b8109b..027a1467d009 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -21,6 +21,7 @@
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
>  #include <linux/platform_device.h>
> +#include <linux/platform_profile.h>
>  #include <linux/acpi.h>
>  #include <linux/rfkill.h>
>  #include <linux/string.h>
> @@ -119,6 +120,12 @@ enum hp_wireless2_bits {
>  	HPWMI_POWER_FW_OR_HW	= HPWMI_POWER_BIOS | HPWMI_POWER_HARD,
>  };
>  
> +enum hp_thermal_profile {
> +	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
> +	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
> +	HP_THERMAL_PROFILE_COOL			= 0x02
> +};
> +
>  #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) != HPWMI_POWER_FW_OR_HW)
>  #define IS_SWBLOCKED(x) !(x & HPWMI_POWER_SOFT)
>  
> @@ -159,6 +166,8 @@ static const struct key_entry hp_wmi_keymap[] = {
>  
>  static struct input_dev *hp_wmi_input_dev;
>  static struct platform_device *hp_wmi_platform_dev;
> +static struct platform_profile_handler platform_profile_handler;
> +static bool platform_profile_support;
>  
>  static struct rfkill *wifi_rfkill;
>  static struct rfkill *bluetooth_rfkill;
> @@ -869,11 +878,74 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
>  	return err;
>  }
>  
> -static int thermal_profile_setup(struct platform_device *device)
> +static int thermal_profile_get(void)
> +{
> +	return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
> +}
> +
> +static int thermal_profile_set(int thermal_profile)
> +{
> +	return hp_wmi_perform_query(HPWMI_THERMAL_PROFILE_QUERY, HPWMI_WRITE, &thermal_profile,
> +							   sizeof(thermal_profile), 0);
> +}
> +
> +static int platform_profile_get(struct platform_profile_handler *pprof,
> +				enum platform_profile_option *profile)
> +{
> +	int tp;
> +
> +	tp = thermal_profile_get();
> +	if (tp < 0)
> +		return tp;
> +
> +	switch (tp) {
> +	case HP_THERMAL_PROFILE_PERFORMANCE:
> +		*profile =  PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	case HP_THERMAL_PROFILE_DEFAULT:
> +		*profile =  PLATFORM_PROFILE_BALANCED;
> +		break;
> +	case HP_THERMAL_PROFILE_COOL:
> +		*profile =  PLATFORM_PROFILE_COOL;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int platform_profile_set(struct platform_profile_handler *pprof,
> +				enum platform_profile_option profile)
>  {
>  	int err, tp;
>  
> -	tp = hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
> +	switch (profile) {
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		tp =  HP_THERMAL_PROFILE_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		tp =  HP_THERMAL_PROFILE_DEFAULT;
> +		break;
> +	case PLATFORM_PROFILE_COOL:
> +		tp =  HP_THERMAL_PROFILE_COOL;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	err = thermal_profile_set(tp);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static int thermal_profile_setup(void)
> +{
> +	int err, tp;
> +
> +	tp = thermal_profile_get();
>  	if (tp < 0)
>  		return tp;
>  
> @@ -881,11 +953,23 @@ static int thermal_profile_setup(struct platform_device *device)
>  	 * call thermal profile write command to ensure that the firmware correctly
>  	 * sets the OEM variables for the DPTF
>  	 */
> -	err = hp_wmi_perform_query(HPWMI_THERMAL_PROFILE_QUERY, HPWMI_WRITE, &tp,
> -							   sizeof(tp), 0);
> +	err = thermal_profile_set(tp);
>  	if (err)
>  		return err;
>  
> +	platform_profile_handler.profile_get = platform_profile_get,
> +	platform_profile_handler.profile_set = platform_profile_set,
> +
> +	set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED, platform_profile_handler.choices);
> +	set_bit(PLATFORM_PROFILE_PERFORMANCE, platform_profile_handler.choices);
> +
> +	err = platform_profile_register(&platform_profile_handler);
> +	if (err)
> +		return err;
> +
> +	platform_profile_support = true;
> +
>  	return 0;
>  }
>  
> @@ -900,7 +984,7 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  	if (hp_wmi_rfkill_setup(device))
>  		hp_wmi_rfkill2_setup(device);
>  
> -	thermal_profile_setup(device);
> +	thermal_profile_setup();
>  
>  	return 0;
>  }
> @@ -927,6 +1011,9 @@ static int __exit hp_wmi_bios_remove(struct platform_device *device)
>  		rfkill_destroy(wwan_rfkill);
>  	}
>  
> +	if (platform_profile_support)
> +		platform_profile_remove();
> +
>  	return 0;
>  }
>  
> 

