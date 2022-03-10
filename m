Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D01C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Mar 2022 13:59:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242590AbiCJOAG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Mar 2022 09:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbiCJOAF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Mar 2022 09:00:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 04293132950
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 05:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646920743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=witWEpyp7FhjgX5CPs+i/yo052vLQXTNyB7o1kFw4Pg=;
        b=igWL08pm8/enPmrUuRjEAB84zQfEV+PORbUDBK4RIfsS3g+9S1HNWAaiS86YVLwo3nRybR
        sg+IJ+8L8kdmMi98ar4APyhF28DgyOGIPrn952i9KOURfVwh6Bmd6TqJVZQZ1LnoHLiqbP
        okdS9n1FAWqayevEv5t6g3DhDep6vP4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-NB-4bdoBNgCA8tBnEiirNg-1; Thu, 10 Mar 2022 08:59:00 -0500
X-MC-Unique: NB-4bdoBNgCA8tBnEiirNg-1
Received: by mail-ej1-f71.google.com with SMTP id m12-20020a1709062acc00b006cfc98179e2so3162176eje.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 05:58:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=witWEpyp7FhjgX5CPs+i/yo052vLQXTNyB7o1kFw4Pg=;
        b=ej7FPLeSEpbJ4qFdNjg8f7+8s2SsOsgM9AQGBYyOsocz4siar6TJd00dwU/f8rTmor
         6zGQbW5NGwpuzgTv1IBno9q/owhmqOp+NdUXEFS20uUwlzunglLz9qb99yo0M4xZvRR2
         GSF11nXzhN101NHLdOzpntYjv4kJkp363WodLP2piXFa0ABJ14GuAy5W7YXPM3WqWfZu
         b+EstXlwbrgr8yRVAvOeInrVGhlcTl/0kgPZVll3M7iGSUIxrK1xxb9RAx+A/ryy6Yrk
         5OU9edggiyKwtBoJ1iLm3HTexQJ5Gl4JOmJ5nSegL2uqvSkLmiJYDn3Vth//kGRyMsjp
         apTg==
X-Gm-Message-State: AOAM533+qB8XxdS1FGkSJugRaJ/jg/HBK/WSvf6ex5CJilX4/QSL8wdk
        g7TMZo/jLf7qCBuvhXpkB2+PGnspar4uFDUca5oGRQmGsglX4euGPzMUYTGgK97jqHpKHtS3Ffa
        gXPcldayL7yqKl/hekzhdVkj3WMiE8fl3MQ==
X-Received: by 2002:aa7:dc0b:0:b0:413:ce06:898e with SMTP id b11-20020aa7dc0b000000b00413ce06898emr4530175edu.244.1646920738600;
        Thu, 10 Mar 2022 05:58:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHlSzcX+fRFtBDXhUkmRp5e/YL23tvLXGdCG1T3gpHF6NZeeRO2t/DLB4sE+oNhLvy+/Fiwg==
X-Received: by 2002:aa7:dc0b:0:b0:413:ce06:898e with SMTP id b11-20020aa7dc0b000000b00413ce06898emr4529945edu.244.1646920734588;
        Thu, 10 Mar 2022 05:58:54 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id uz4-20020a170907118400b006dab1ea6e3asm1820365ejb.51.2022.03.10.05.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 05:58:54 -0800 (PST)
Message-ID: <f6c2d3a2-b455-735b-533e-22af0a1883d5@redhat.com>
Date:   Thu, 10 Mar 2022 14:58:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/3] Fix 0x05 error code reported by several WMI calls
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20220307220932.23607-1-jorge.lopez2@hp.com>
 <20220307220932.23607-3-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220307220932.23607-3-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/7/22 23:09, Jorge Lopez wrote:
> Several WMI queries leverage hp_wmi_read_int function to read their data.
> hp_wmi_read_int function was corrected in a previous patch.  Now, this
> function invokes hp_wmi_perform_query with input parameter of size zero
> and the output buffer of size 4.
> 
> WMI commands calling hp_wmi_perform_query with input buffer size value
> of zero are listed below.
> 
> HPWMI_DISPLAY_QUERY
> HPWMI_HDDTEMP_QUERY
> HPWMI_ALS_QUERY
> HPWMI_HARDWARE_QUERY
> HPWMI_WIRELESS_QUERY
> HPWMI_BIOS_QUERY
> HPWMI_FEATURE_QUERY
> HPWMI_HOTKEY_QUERY
> HPWMI_FEATURE2_QUERY
> HPWMI_WIRELESS2_QUERY
> HPWMI_POSTCODEERROR_QUERY
> HPWMI_THERMAL_PROFILE_QUERY
> HPWMI_FAN_SPEED_MAX_GET_QUERY
> 
> Invoking those WMI commands with an input buffer size greater
> than zero will cause error 0x05 to be returned.
> 
> All WMI commands executed by the driver were reviewed and changes
> were made to ensure the expected input and output buffer size match
> the WMI specification.
> 
> Changes were validated on a HP ZBook Workstation notebook,
> HP EliteBook x360, and HP EliteBook 850 G8.  Additional
> validation was included in the test process to ensure no other
> commands were incorrectly handled.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  drivers/platform/x86/hp-wmi.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index e142e9a0d317..a0aba7db8a1c 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -329,7 +329,7 @@ static int hp_wmi_get_fan_speed(int fan)
>  	char fan_data[4] = { fan, 0, 0, 0 };
>  
>  	int ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_GET_QUERY, HPWMI_GM,
> -				       &fan_data, sizeof(fan_data),
> +				       &fan_data, sizeof(char),
>  				       sizeof(fan_data));
>  
>  	if (ret != 0)
> @@ -406,7 +406,7 @@ static int omen_thermal_profile_set(int mode)
>  		return -EINVAL;
>  
>  	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
> -				   &buffer, sizeof(buffer), sizeof(buffer));
> +				   &buffer, sizeof(buffer), 0);
>  
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
> @@ -443,7 +443,7 @@ static int hp_wmi_fan_speed_max_set(int enabled)
>  	int ret;
>  
>  	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_SET_QUERY, HPWMI_GM,
> -				   &enabled, sizeof(enabled), sizeof(enabled));
> +				   &enabled, sizeof(enabled), 0);
>  
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
> @@ -456,7 +456,7 @@ static int hp_wmi_fan_speed_max_get(void)
>  	int val = 0, ret;
>  
>  	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
> -				   &val, sizeof(val), sizeof(val));
> +				   &val, 0, sizeof(val));
>  
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
> @@ -468,7 +468,7 @@ static int __init hp_wmi_bios_2008_later(void)
>  {
>  	int state = 0;
>  	int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, HPWMI_READ, &state,
> -				       sizeof(state), sizeof(state));
> +				       0, sizeof(state));
>  	if (!ret)
>  		return 1;
>  
> @@ -479,7 +479,7 @@ static int __init hp_wmi_bios_2009_later(void)
>  {
>  	u8 state[128];
>  	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
> -				       sizeof(state), sizeof(state));
> +				       0, sizeof(state));
>  	if (!ret)
>  		return 1;
>  
> @@ -557,7 +557,7 @@ static int hp_wmi_rfkill2_refresh(void)
>  	int err, i;
>  
>  	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
> -				   sizeof(state), sizeof(state));
> +				   0, sizeof(state));
>  	if (err)
>  		return err;
>  
> @@ -646,7 +646,7 @@ static ssize_t als_store(struct device *dev, struct device_attribute *attr,
>  		return ret;
>  
>  	ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, HPWMI_WRITE, &tmp,
> -				       sizeof(tmp), sizeof(tmp));
> +				       sizeof(tmp), 0);
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
>  
> @@ -667,9 +667,9 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
>  	if (clear == false)
>  		return -EINVAL;
>  
> -	/* Clear the POST error code. It is kept until until cleared. */
> +	/* Clear the POST error code. It is kept until cleared. */
>  	ret = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, HPWMI_WRITE, &tmp,
> -				       sizeof(tmp), sizeof(tmp));
> +				       sizeof(tmp), 0);
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
>  
> @@ -959,7 +959,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
>  	int err, i;
>  
>  	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
> -				   sizeof(state), sizeof(state));
> +				   0, sizeof(state));
>  	if (err)
>  		return err < 0 ? err : -EINVAL;
>  

