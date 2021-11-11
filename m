Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0633C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Nov 2021 09:53:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC60761267
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Nov 2021 09:53:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231928AbhKKJ4O (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Nov 2021 04:56:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56189 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230021AbhKKJ4M (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Nov 2021 04:56:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636624403;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+qvQtHczzG1MfYZk8oGNUIA3UOWGJnPKv08a/xUeA9I=;
        b=O5bmT9wTJnSeBtgoJ0FDJGMeBALVY8Q5EU2h13/4YYfrwyEwxBeVZCfI9mxJeRMoSOIMQy
        ZnlAAJRzIDPEb3UgjH3bY76dEpdPTRhCZfRN/44yq2E+8SOEn+glFgXO5/TmyhrLiZXOEO
        ufIkR26y1Xlp4jjwHsy71sXD1S7wp8w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-RfubstmION2RkdJqsyQUAA-1; Thu, 11 Nov 2021 04:53:21 -0500
X-MC-Unique: RfubstmION2RkdJqsyQUAA-1
Received: by mail-ed1-f71.google.com with SMTP id t20-20020a056402525400b003e2ad6b5ee7so4961917edd.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Nov 2021 01:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+qvQtHczzG1MfYZk8oGNUIA3UOWGJnPKv08a/xUeA9I=;
        b=b0xiAmsZQ+WB+ioifmuoa/x51hUwyw5RXy7pAz1lS5xQIHNxDTlUfLc05EjjHxZcwR
         jIyGCwcMJ5clavQ/ybu1uyYWvokqct6eYq3oVg3sthTDBqDlFScpi7MHlXMPwlKa8Dwx
         TrPeyvv1pGHYZotkA7NDRnJN/hr4x9sCcHk3UN/5a+77H7WcH3rJtdY7gH02e/NYIqvT
         P3Di/YKYj/HppgGAouUym9Il+ozAteC8X6rij613YFfo42vGAsdYzuoiqv+IklR4k+jE
         z6kVD2yKthCM1ahVwbPELZfOD7TV4X/MOEArDe3S4LuY+OP8rmUbs1gBG7KWxH9spWAy
         vNYQ==
X-Gm-Message-State: AOAM530kBbxCaKuTlZJjJQX0bQvk/my+Ay+RoxmP3CoEktduUKgCHv+D
        xMmZvn+lfOrb0Jq//YVHKZdDFppp2bbiirZ1Ox5SKXbgP2ZnzkP0UiiBTtOWTipv47y66cRMHh2
        kBSQQSJFoESXKMso/o8QkqS/RJr/EAy8BTg==
X-Received: by 2002:a05:6402:190d:: with SMTP id e13mr8092827edz.339.1636624400203;
        Thu, 11 Nov 2021 01:53:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzp74fhV+A0BlicDRmgQzd2ZzPgKl37hWijytHEwGPVHnxogi3w6VW/NOe4TlP9qnF8BXHLNQ==
X-Received: by 2002:a05:6402:190d:: with SMTP id e13mr8092803edz.339.1636624400033;
        Thu, 11 Nov 2021 01:53:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z7sm1258687edj.51.2021.11.11.01.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 01:53:19 -0800 (PST)
Message-ID: <27e86396-63cd-be69-e344-bc3229b91a9b@redhat.com>
Date:   Thu, 11 Nov 2021 10:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2] standardized attributes for powersupply charge behaviour
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        linux-pm@vger.kernel.org
Cc:     nicolopiazzalunga@gmail.com, linrunner@gmx.net,
        platform-driver-x86@vger.kernel.org, smclt30p@gmail.com,
        sre@kernel.org
References: <20211108192852.357473-1-linux@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211108192852.357473-1-linux@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/8/21 20:28, Thomas Weißschuh wrote:
> This a revised version of
> "[RFC] add standardized attributes for force_discharge and inhibit_charge" [0],
> incorporating discussion results.
> 
> The biggest change is the switch from two boolean attributes to a single
> enum attribute.
> 
> [0] https://lore.kernel.org/platform-driver-x86/21569a89-8303-8573-05fb-c2fec29983d1@gmail.com/

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  Documentation/ABI/testing/sysfs-class-power | 14 ++++++++++++++
>  drivers/power/supply/power_supply_sysfs.c   |  1 +
>  include/linux/power_supply.h                |  7 +++++++
>  3 files changed, 22 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
> index ca830c6cd809..2f58cfc91420 100644
> --- a/Documentation/ABI/testing/sysfs-class-power
> +++ b/Documentation/ABI/testing/sysfs-class-power
> @@ -455,6 +455,20 @@ Description:
>  			      "Unknown", "Charging", "Discharging",
>  			      "Not charging", "Full"
>  
> +What:		/sys/class/power_supply/<supply_name>/charge_behaviour
> +Date:		November 2021
> +Contact:	linux-pm@vger.kernel.org
> +Description:
> +		Represents the charging behaviour.
> +
> +		Access: Read, Write
> +
> +		Valid values:
> +			================ ====================================
> +			auto:            Charge normally, respect thresholds
> +			inhibit-charge:  Do not charge while AC is attached
> +			force-discharge: Force discharge while AC is attached
> +
>  What:		/sys/class/power_supply/<supply_name>/technology
>  Date:		May 2007
>  Contact:	linux-pm@vger.kernel.org
> diff --git a/drivers/power/supply/power_supply_sysfs.c b/drivers/power/supply/power_supply_sysfs.c
> index c3d7cbcd4fad..26c60587dca1 100644
> --- a/drivers/power/supply/power_supply_sysfs.c
> +++ b/drivers/power/supply/power_supply_sysfs.c
> @@ -172,6 +172,7 @@ static struct power_supply_attr power_supply_attrs[] = {
>  	POWER_SUPPLY_ATTR(CHARGE_CONTROL_LIMIT_MAX),
>  	POWER_SUPPLY_ATTR(CHARGE_CONTROL_START_THRESHOLD),
>  	POWER_SUPPLY_ATTR(CHARGE_CONTROL_END_THRESHOLD),
> +	POWER_SUPPLY_ENUM_ATTR(CHARGE_BEHAVIOUR),
>  	POWER_SUPPLY_ATTR(INPUT_CURRENT_LIMIT),
>  	POWER_SUPPLY_ATTR(INPUT_VOLTAGE_LIMIT),
>  	POWER_SUPPLY_ATTR(INPUT_POWER_LIMIT),
> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
> index 9ca1f120a211..70c333e86293 100644
> --- a/include/linux/power_supply.h
> +++ b/include/linux/power_supply.h
> @@ -132,6 +132,7 @@ enum power_supply_property {
>  	POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX,
>  	POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD, /* in percents! */
>  	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD, /* in percents! */
> +	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
>  	POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
>  	POWER_SUPPLY_PROP_INPUT_VOLTAGE_LIMIT,
>  	POWER_SUPPLY_PROP_INPUT_POWER_LIMIT,
> @@ -202,6 +203,12 @@ enum power_supply_usb_type {
>  	POWER_SUPPLY_USB_TYPE_APPLE_BRICK_ID,	/* Apple Charging Method */
>  };
>  
> +enum power_supply_charge_behaviour {
> +	POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO = 0,
> +	POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE,
> +	POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE,
> +};
> +
>  enum power_supply_notifier_events {
>  	PSY_EVENT_PROP_CHANGED,
>  };
> 
> base-commit: 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f
> 

