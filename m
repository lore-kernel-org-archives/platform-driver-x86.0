Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B781514E0
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 13:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713793541; cv=none; b=n4nofAd0kLFQHUciSIH0yrxqIkoE0sEDVoDPaODFM9BsLfLOOTCfVfgUSe9ciz3mSapmY4QI8hmy6KqY+4lAKm0xER7l+XPqFdzYeLp6yQIhsJRHnwwMb2lisJIOr4kGq1Xzd0nMQV9po1IPr61YTqtxkAuLFXPPUidoYc1jvLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713793541; c=relaxed/simple;
	bh=4YMVZUICuNUnooMES/18Kn3KRTa8xUdNs/MTHLvud3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQxIoedkeJGT+9tTmAf4xfpVZneeDd2gdbEUuLyu6Z8A5s6nmQc2R6CqocaXmSlivtcHybfIIryEP44CTqiJh/NU8rF9p2ohXQnpt5qzfOqG4ftQV9A0hSRtjru+ysr1psvePmQ2tlMfL2iPM8IuMdkyura9KHz2Hfhe8h/MMjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SoqBz39H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SoqBz39H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713793536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kwY1DtEOHqribjOyCtgFKsXBMbmg7tj+TqpASPAmvqA=;
	b=SoqBz39Hqsv+sPthreQ6OGDhAEBVvD+Le6Icvy5ien+J1a+tDOGZj1/fyFNcptrrtV/HLt
	Zpjk3OzKGXbNo0q6lEhemB2CZvJcc/JrPS+EkPi5CVVC5UrkFGsOb1Dl1HOaNpJZrr+UEX
	o0ZJpnsmMqHzjKzdukcXDtmGJg8gdpA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-WjzLyHQXM424KLDsPkChbg-1; Mon, 22 Apr 2024 09:45:33 -0400
X-MC-Unique: WjzLyHQXM424KLDsPkChbg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-516c8697daaso3812911e87.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 06:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713793531; x=1714398331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kwY1DtEOHqribjOyCtgFKsXBMbmg7tj+TqpASPAmvqA=;
        b=hwPOYMg0NvudWhkaSBIOkVATaErvpe4tDBSRnvDy9JJ7TbXoNu0Ky79SLIoiELNTKR
         7JMTLani+rab53hX3D2+x85mq6eU+ebeFxwpQC6+9jIN0NTR2Sycmvet4/xwoZZ3TFXn
         7AFUOVtJOROta+jqJeygbKpavkyzljlbW8SUOZpA4xlcLcq6f48A6QUosfn6tqahFgiM
         C4d45cjB5iTVxkOIp1VU7QvvgCLvQEyj3DTAiHqMWWoX+ZlsDR6dzR96tC27znKVVMNK
         vOUTMbpa7GEXKdxhiAV6cvqIzJr1wNwsaqo+/00JtMAIO699r9t01Fth4lIOf7SGxr4L
         K7fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbo91dnXKmmAWNMUz6leYceAk3mriXo7FuK+cifPP4ORyM3ICcfv0EHSVFJi8J78/hgiCARY3xE1AUWqgMkd+wApvrjOgoHIdPJsVeGWAiawp/qg==
X-Gm-Message-State: AOJu0YzqbJPOtIw5v5pBbpWbUUiPf6Etq/E1JyytbDY7arBUo9yuYlmd
	yvLrK5HNI7k6IVT8xYWYJxViJ3g0bMyKfifYqUBab0c4oqY4bd1SPFYAOgB4XwSrJ+4tMXMIg3Y
	aQ6WMTyN5ljStUShQ3KA/w/Ho2Kj24tkdJ2Hs698iWiBp5IkM3uoCHPyevzDVHQZ1dc/1E/R/jt
	AeNMxrDA==
X-Received: by 2002:a05:6512:60b:b0:51b:3ffa:f22d with SMTP id b11-20020a056512060b00b0051b3ffaf22dmr1621233lfe.18.1713793531038;
        Mon, 22 Apr 2024 06:45:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKFQpw6rKr1G9y/ZCaqi5LiAOCRXo3Yu+6uaAFYUdvzN8gHUauGRjJfN5YhPSGmG97LfhNUA==
X-Received: by 2002:a05:6512:60b:b0:51b:3ffa:f22d with SMTP id b11-20020a056512060b00b0051b3ffaf22dmr1621212lfe.18.1713793530561;
        Mon, 22 Apr 2024 06:45:30 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id dk17-20020a170907941100b00a55b0380a6fsm1785209ejc.10.2024.04.22.06.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 06:45:29 -0700 (PDT)
Message-ID: <98b6e167-5828-41fd-ab4a-014099032d5b@redhat.com>
Date: Mon, 22 Apr 2024 15:45:27 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: asus-laptop: Use sysfs_emit() and
 sysfs_emit_at() to replace sprintf()
To: yunshui <jiangyunshui@kylinos.cn>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com, luke@ljones.dev, ilpo.jarvinen@linux.intel.com,
 Ai Chao <aichao@kylinos.cn>
References: <20240422062915.3393480-1-jiangyunshui@kylinos.cn>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240422062915.3393480-1-jiangyunshui@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/22/24 8:29 AM, yunshui wrote:
> As Documentation/filesystems/sysfs.rst suggested,
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
> Signed-off-by: yunshui <jiangyunshui@kylinos.cn>
> Signed-off-by: Ai Chao <aichao@kylinos.cn>

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
>  drivers/platform/x86/asus-laptop.c | 44 +++++++++++++++---------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
> index 78c42767295a..ccb33d034e2a 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -852,8 +852,8 @@ static ssize_t infos_show(struct device *dev, struct device_attribute *attr,
>  	 * so we don't set eof to 1
>  	 */
>  
> -	len += sprintf(page, ASUS_LAPTOP_NAME " " ASUS_LAPTOP_VERSION "\n");
> -	len += sprintf(page + len, "Model reference    : %s\n", asus->name);
> +	len += sysfs_emit_at(page, len, ASUS_LAPTOP_NAME " " ASUS_LAPTOP_VERSION "\n");
> +	len += sysfs_emit_at(page, len, "Model reference    : %s\n", asus->name);
>  	/*
>  	 * The SFUN method probably allows the original driver to get the list
>  	 * of features supported by a given model. For now, 0x0100 or 0x0800
> @@ -862,7 +862,7 @@ static ssize_t infos_show(struct device *dev, struct device_attribute *attr,
>  	 */
>  	rv = acpi_evaluate_integer(asus->handle, "SFUN", NULL, &temp);
>  	if (ACPI_SUCCESS(rv))
> -		len += sprintf(page + len, "SFUN value         : %#x\n",
> +		len += sysfs_emit_at(page, len, "SFUN value         : %#x\n",
>  			       (uint) temp);
>  	/*
>  	 * The HWRS method return informations about the hardware.
> @@ -874,7 +874,7 @@ static ssize_t infos_show(struct device *dev, struct device_attribute *attr,
>  	 */
>  	rv = acpi_evaluate_integer(asus->handle, "HWRS", NULL, &temp);
>  	if (ACPI_SUCCESS(rv))
> -		len += sprintf(page + len, "HWRS value         : %#x\n",
> +		len += sysfs_emit_at(page, len, "HWRS value         : %#x\n",
>  			       (uint) temp);
>  	/*
>  	 * Another value for userspace: the ASYM method returns 0x02 for
> @@ -885,25 +885,25 @@ static ssize_t infos_show(struct device *dev, struct device_attribute *attr,
>  	 */
>  	rv = acpi_evaluate_integer(asus->handle, "ASYM", NULL, &temp);
>  	if (ACPI_SUCCESS(rv))
> -		len += sprintf(page + len, "ASYM value         : %#x\n",
> +		len += sysfs_emit_at(page, len, "ASYM value         : %#x\n",
>  			       (uint) temp);
>  	if (asus->dsdt_info) {
>  		snprintf(buf, 16, "%d", asus->dsdt_info->length);
> -		len += sprintf(page + len, "DSDT length        : %s\n", buf);
> +		len += sysfs_emit_at(page, len, "DSDT length        : %s\n", buf);
>  		snprintf(buf, 16, "%d", asus->dsdt_info->checksum);
> -		len += sprintf(page + len, "DSDT checksum      : %s\n", buf);
> +		len += sysfs_emit_at(page, len, "DSDT checksum      : %s\n", buf);
>  		snprintf(buf, 16, "%d", asus->dsdt_info->revision);
> -		len += sprintf(page + len, "DSDT revision      : %s\n", buf);
> +		len += sysfs_emit_at(page, len, "DSDT revision      : %s\n", buf);
>  		snprintf(buf, 7, "%s", asus->dsdt_info->oem_id);
> -		len += sprintf(page + len, "OEM id             : %s\n", buf);
> +		len += sysfs_emit_at(page, len, "OEM id             : %s\n", buf);
>  		snprintf(buf, 9, "%s", asus->dsdt_info->oem_table_id);
> -		len += sprintf(page + len, "OEM table id       : %s\n", buf);
> +		len += sysfs_emit_at(page, len, "OEM table id       : %s\n", buf);
>  		snprintf(buf, 16, "%x", asus->dsdt_info->oem_revision);
> -		len += sprintf(page + len, "OEM revision       : 0x%s\n", buf);
> +		len += sysfs_emit_at(page, len, "OEM revision       : 0x%s\n", buf);
>  		snprintf(buf, 5, "%s", asus->dsdt_info->asl_compiler_id);
> -		len += sprintf(page + len, "ASL comp vendor id : %s\n", buf);
> +		len += sysfs_emit_at(page, len, "ASL comp vendor id : %s\n", buf);
>  		snprintf(buf, 16, "%x", asus->dsdt_info->asl_compiler_revision);
> -		len += sprintf(page + len, "ASL comp revision  : 0x%s\n", buf);
> +		len += sysfs_emit_at(page, len, "ASL comp revision  : 0x%s\n", buf);
>  	}
>  
>  	return len;
> @@ -933,7 +933,7 @@ static ssize_t ledd_show(struct device *dev, struct device_attribute *attr,
>  {
>  	struct asus_laptop *asus = dev_get_drvdata(dev);
>  
> -	return sprintf(buf, "0x%08x\n", asus->ledd_status);
> +	return sysfs_emit(buf, "0x%08x\n", asus->ledd_status);
>  }
>  
>  static ssize_t ledd_store(struct device *dev, struct device_attribute *attr,
> @@ -993,7 +993,7 @@ static ssize_t wlan_show(struct device *dev, struct device_attribute *attr,
>  {
>  	struct asus_laptop *asus = dev_get_drvdata(dev);
>  
> -	return sprintf(buf, "%d\n", asus_wireless_status(asus, WL_RSTS));
> +	return sysfs_emit(buf, "%d\n", asus_wireless_status(asus, WL_RSTS));
>  }
>  
>  static ssize_t wlan_store(struct device *dev, struct device_attribute *attr,
> @@ -1022,7 +1022,7 @@ static ssize_t bluetooth_show(struct device *dev, struct device_attribute *attr,
>  {
>  	struct asus_laptop *asus = dev_get_drvdata(dev);
>  
> -	return sprintf(buf, "%d\n", asus_wireless_status(asus, BT_RSTS));
> +	return sysfs_emit(buf, "%d\n", asus_wireless_status(asus, BT_RSTS));
>  }
>  
>  static ssize_t bluetooth_store(struct device *dev,
> @@ -1052,7 +1052,7 @@ static ssize_t wimax_show(struct device *dev, struct device_attribute *attr,
>  {
>  	struct asus_laptop *asus = dev_get_drvdata(dev);
>  
> -	return sprintf(buf, "%d\n", asus_wireless_status(asus, WM_RSTS));
> +	return sysfs_emit(buf, "%d\n", asus_wireless_status(asus, WM_RSTS));
>  }
>  
>  static ssize_t wimax_store(struct device *dev, struct device_attribute *attr,
> @@ -1081,7 +1081,7 @@ static ssize_t wwan_show(struct device *dev, struct device_attribute *attr,
>  {
>  	struct asus_laptop *asus = dev_get_drvdata(dev);
>  
> -	return sprintf(buf, "%d\n", asus_wireless_status(asus, WW_RSTS));
> +	return sysfs_emit(buf, "%d\n", asus_wireless_status(asus, WW_RSTS));
>  }
>  
>  static ssize_t wwan_store(struct device *dev, struct device_attribute *attr,
> @@ -1151,7 +1151,7 @@ static ssize_t ls_switch_show(struct device *dev, struct device_attribute *attr,
>  {
>  	struct asus_laptop *asus = dev_get_drvdata(dev);
>  
> -	return sprintf(buf, "%d\n", asus->light_switch);
> +	return sysfs_emit(buf, "%d\n", asus->light_switch);
>  }
>  
>  static ssize_t ls_switch_store(struct device *dev,
> @@ -1182,7 +1182,7 @@ static ssize_t ls_level_show(struct device *dev, struct device_attribute *attr,
>  {
>  	struct asus_laptop *asus = dev_get_drvdata(dev);
>  
> -	return sprintf(buf, "%d\n", asus->light_level);
> +	return sysfs_emit(buf, "%d\n", asus->light_level);
>  }
>  
>  static ssize_t ls_level_store(struct device *dev, struct device_attribute *attr,
> @@ -1228,7 +1228,7 @@ static ssize_t ls_value_show(struct device *dev, struct device_attribute *attr,
>  	if (!err)
>  		err = pega_int_read(asus, PEGA_READ_ALS_L, &lo);
>  	if (!err)
> -		return sprintf(buf, "%d\n", 10 * hi + lo);
> +		return sysfs_emit(buf, "%d\n", 10 * hi + lo);
>  	return err;
>  }
>  static DEVICE_ATTR_RO(ls_value);
> @@ -1264,7 +1264,7 @@ static ssize_t gps_show(struct device *dev, struct device_attribute *attr,
>  {
>  	struct asus_laptop *asus = dev_get_drvdata(dev);
>  
> -	return sprintf(buf, "%d\n", asus_gps_status(asus));
> +	return sysfs_emit(buf, "%d\n", asus_gps_status(asus));
>  }
>  
>  static ssize_t gps_store(struct device *dev, struct device_attribute *attr,

