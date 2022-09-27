Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6951C6FA86
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Sep 2022 10:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbiI0KYR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Sep 2022 06:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbiI0KYQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Sep 2022 06:24:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 679F4CDCE1
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 03:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664274254;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vtppSfdS90FQVmy8GIcYXEx/tNoips+R+XlwTcYEVeY=;
        b=C44dRXqrIQYDz6Qw1WA98b574qPgr0lQOPDeS1dXrmsXarphF9BzhZMScDTiiLAWyyG7Eo
        JYSI78uylOYPp7AxCBP247LiJ2NsIi8pimOTlvARTnRTGgWklReA1MvOPJUFmZ41Jtr8Vq
        OLygjT7mSQBw0yn9X41WNIKU2zFwQf4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-376-bfQzXGOwPgG_DgUO77Qcmw-1; Tue, 27 Sep 2022 06:24:13 -0400
X-MC-Unique: bfQzXGOwPgG_DgUO77Qcmw-1
Received: by mail-ed1-f72.google.com with SMTP id h13-20020a056402280d00b004528c8400afso7296049ede.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 03:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=vtppSfdS90FQVmy8GIcYXEx/tNoips+R+XlwTcYEVeY=;
        b=k8+mU7DbOvJcsjmEuUaSl1GHzRMjKiJkEM+E7S59fF0ILDzwiBaZWFGL26r3ZcJh0j
         nRpV4uMMB+mtgZpWru7XCQzDH0+B9vg3d7rS2Bzq1m106SV8V+NXG0X+h9nd/F8Rf2qi
         0hgn+7n4QZK8IcN/bMAzPA8GGeq8eoX7Qig4DTeo5F4IophAHueX2Td/3vOUyoXumq+7
         sZGKKX4Y6zOEvEr3OqcGOH1nG1cD8rotcWZGH0noppmmdgEmJSKWaZkVuZjgYwaz5b1z
         p4H/UTwMXGwv3qi+6aD3L4JKnyYWGFsCcZ35RtuHW4W5mhP4KIr3lISpCVcLw9cq2Oni
         T30g==
X-Gm-Message-State: ACrzQf25PtYzvFCPgECu7cf3QG8bSU5aDp/mXN3vOrszRwFY8RQrAwhU
        WPGsrxrp/K4OezzZyvh5S0tzoj2zGFParwjKOhPxYYzUuMGge7DBJJD7jH1r2gN+ccGFwVZ/lGV
        APDj/wX+IHUdyG1SyI5hrkY91g9CDH9NRGQ==
X-Received: by 2002:a50:eb05:0:b0:457:c6f5:5f65 with SMTP id y5-20020a50eb05000000b00457c6f55f65mr915784edp.311.1664274251715;
        Tue, 27 Sep 2022 03:24:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5nHTutcOEpSSFxZFCYQ0WiJpE/5gFNF29v5O+oWNXYbCl0nV6/Wu2u1cyXqRZ9yP7aTMOegA==
X-Received: by 2002:a50:eb05:0:b0:457:c6f5:5f65 with SMTP id y5-20020a50eb05000000b00457c6f55f65mr915766edp.311.1664274251525;
        Tue, 27 Sep 2022 03:24:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id l1-20020a1709060cc100b0077fbef08212sm585480ejh.22.2022.09.27.03.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 03:24:11 -0700 (PDT)
Message-ID: <1cb582a3-c372-5f6b-b228-523ad45ed8e9@redhat.com>
Date:   Tue, 27 Sep 2022 12:24:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] platform/x86: hp-wmi: add support for quiet thermal
 profile
Content-Language: en-US
To:     Elia Devito <eliadevito@gmail.com>,
        Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     Philippe Rouquier <bonfire-app@wanadoo.fr>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925204244.53506-1-eliadevito@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220925204244.53506-1-eliadevito@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Elia,

On 9/25/22 22:42, Elia Devito wrote:
> The quiet profile is available only on models without dGPU,
> so we enable it when the device has only one GPU onboard.
> 
> Signed-off-by: Elia Devito <eliadevito@gmail.com>
> Tested-by: Philippe Rouquier <bonfire-app@wanadoo.fr>

Thank you for your patch.

I have just landed a very similar patch form Jorge from HP:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=for-next&id=00b1829294b7c88ecba92c661fbe6fe347b364d2

The first 3 hunks of the patch are the same, only the conditions
under which the:

	set_bit(PLATFORM_PROFILE_QUIET, platform_profile_handler.choices);

call is made are different, Jorge's patch does this essentially like this:
	
	if (!is_omen_thermal_profile())
		set_bit(PLATFORM_PROFILE_QUIET, platform_profile_handler.choices);

which seems a bit cleaner to me and hopefully works just as well
or maybe even better.

Regards,

Hans




> ---
>  drivers/platform/x86/hp-wmi.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index bc7020e9df9e..3e0e67be8001 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -177,7 +177,8 @@ enum hp_thermal_profile_omen_v1 {
>  enum hp_thermal_profile {
>  	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
>  	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
> -	HP_THERMAL_PROFILE_COOL			= 0x02
> +	HP_THERMAL_PROFILE_COOL			= 0x02,
> +	HP_THERMAL_PROFILE_QUIET			= 0x03,
>  };
>  
>  #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) != HPWMI_POWER_FW_OR_HW)
> @@ -1194,6 +1195,9 @@ static int hp_wmi_platform_profile_get(struct platform_profile_handler *pprof,
>  	case HP_THERMAL_PROFILE_COOL:
>  		*profile =  PLATFORM_PROFILE_COOL;
>  		break;
> +	case HP_THERMAL_PROFILE_QUIET:
> +		*profile =  PLATFORM_PROFILE_QUIET;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1216,6 +1220,9 @@ static int hp_wmi_platform_profile_set(struct platform_profile_handler *pprof,
>  	case PLATFORM_PROFILE_COOL:
>  		tp =  HP_THERMAL_PROFILE_COOL;
>  		break;
> +	case PLATFORM_PROFILE_QUIET:
> +		tp =  HP_THERMAL_PROFILE_QUIET;
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -1230,6 +1237,8 @@ static int hp_wmi_platform_profile_set(struct platform_profile_handler *pprof,
>  static int thermal_profile_setup(void)
>  {
>  	int err, tp;
> +	unsigned int n_gpu = 0;
> +	const struct dmi_device *dev = NULL;
>  
>  	if (is_omen_thermal_profile()) {
>  		tp = omen_thermal_profile_get();
> @@ -1263,6 +1272,16 @@ static int thermal_profile_setup(void)
>  
>  		platform_profile_handler.profile_get = hp_wmi_platform_profile_get;
>  		platform_profile_handler.profile_set = hp_wmi_platform_profile_set;
> +
> +		/*
> +		 * The quiet profile is available only on models without dGPU,
> +		 * so we enable it when the device has only one GPU onboard.
> +		 */
> +		while ((dev = dmi_find_device(DMI_DEV_TYPE_VIDEO, NULL, dev)))
> +			n_gpu++;
> +
> +		if (n_gpu == 1)
> +			set_bit(PLATFORM_PROFILE_QUIET, platform_profile_handler.choices);
>  	}
>  
>  	set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);

