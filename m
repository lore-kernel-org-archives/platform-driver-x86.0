Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FBC1DE3CA
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Nov 2024 12:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730894554; cv=none; b=vEaCRQ12zcpdxLFLwsjHtlkT7jDJ+fjwcH96wSCRu8erHVF1sReHrEc+vZDAUrzjTuKwUscasF+9kxq80KmhTo3+j//C/WfuchgrP3z4ULALINfTMNDd11k/RPzHkO6R1D5PWsjV5YuxeaTFlW8nl8dwpMAhzVnoCKEhIuwaWK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730894554; c=relaxed/simple;
	bh=H7LZ266bGIcETaXKJQQxpR6qza4nwA2bu+OAgrLwPAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uy19TIWgH5TTC3A6vp54keOCcw0xTHNrkUXPUjIqj61s8el3FLO53Amruql3g2DxqO1YfBvSDR1yayEkeU1lG/iHgOffVFjoXMv1Ou7aiVr/+r3dUTDlqzW2XSs38VonllTeXn5oxNbMKXv5bVSviRKFhCWNUIkaQiUXgqe9Gww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZelFw1s2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZelFw1s2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730894550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wHFUrZJG3IhctJbo9qudNI74wu1wMhSAFpJ8ifZ89rY=;
	b=ZelFw1s2x/GVx9COVsKOUILg4zK2n/rD5QyF2MdVfqtsJxQ9z8ij2Rtv/8Jc2D0OKK5eRJ
	73LufhfhxtDVF/l1lNbQCMv3ZELIn33AcMZhWHfSQ11Hf6SKPT6Z+JNib0XVlG9GUwoLiC
	oZ248s9Tua+oYnyv5QHK3+zrMT7bixY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-D_chDZ2XOR2HNUXN_r3Ppw-1; Wed, 06 Nov 2024 07:02:29 -0500
X-MC-Unique: D_chDZ2XOR2HNUXN_r3Ppw-1
X-Mimecast-MFC-AGG-ID: D_chDZ2XOR2HNUXN_r3Ppw
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5c95ac2d13bso5161636a12.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Nov 2024 04:02:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730894548; x=1731499348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wHFUrZJG3IhctJbo9qudNI74wu1wMhSAFpJ8ifZ89rY=;
        b=CRDMag+JV064xIqxIpAiycV8M8Cywq1DH8KuFJRab/oJwN7SBOAVZQFuImsFJDbrAM
         rS8PlScNkYx0FDVTvoHknWkC5TyT56pS1YGE2ia7F394pl+UUYQvkz/MvxNG7vtcqvlP
         H1oDqmqpNQ38qFBcqwLtX1AyUDMH1hgVJgwwobyKOaGkLIVWsWF4GM8DSE0QaOTlZz11
         oOLKsIcBRdMwkFP/IOZVk4Kiowjht7z/8cIt/MznnOnnmOZbYUOzZFgfcrowk32NtW+6
         khYt0jc6wEKO25Wk0L56m6L8IAJoyizGdr9aLbu/QB+/9deYtgZr7bTHjMVkBIvtCOWH
         Ad6g==
X-Forwarded-Encrypted: i=1; AJvYcCXXs3d/2SF9HMzoKY1HFRH2C5LGvABSAaFl0uqtPnReSLELm964/jD1a3PC6y4MzYiO5lW2MGeDgAv5MhIo24/IZoB2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6aoMGqKeiCJaCoW/i3b+LSQ5bvix9wgev3MKjxN1KHJ/Pmkec
	hzwktT+UHeNlX4BPmNY51seUvXLa9Qs5TlRuXVa3YY5toyPueI5K0TGWeQ8/aYI63eJl1bD/qF8
	bNibbLvv4AYoUs4kCLjZlFFXspEcXJJTTP+l7r8Zq9w53y2taiffzmxK0d6H4TGlo2hmzP8g=
X-Received: by 2002:a17:907:7e90:b0:a9d:e1d6:42a1 with SMTP id a640c23a62f3a-a9e655aa36amr1859337866b.30.1730894547921;
        Wed, 06 Nov 2024 04:02:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNJE0pGbd+J391fMlx8hWRHnGKZWnQKHUov4H3doeDcVwFWy91F0V80/t9gtBCJAkPyjoYjg==
X-Received: by 2002:a17:907:7e90:b0:a9d:e1d6:42a1 with SMTP id a640c23a62f3a-a9e655aa36amr1859335466b.30.1730894547546;
        Wed, 06 Nov 2024 04:02:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a1440sm269817566b.31.2024.11.06.04.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 04:02:27 -0800 (PST)
Message-ID: <f3a50d1a-aa0c-4cf5-9138-a1da4ebdc671@redhat.com>
Date: Wed, 6 Nov 2024 13:02:26 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Thinkpad_acpi: Fix for ThinkPad's with ECFW showing
 incorrect fan speed
To: Vishnu Sankar <vishnuocv@gmail.com>, ilpo.jarvinen@linux.intel.com,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Vishnu Sankar <vsankar@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20241105235505.8493-1-vishnuocv@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241105235505.8493-1-vishnuocv@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6-Nov-24 12:55 AM, Vishnu Sankar wrote:
> Fix for Thinkpad's with ECFW showing incorrect fan speed.
> Some models use decimal instead of hexadecimal for the fan speed stored
> in the EC registers.
> for eg: the rpm register will have 0x4200 instead of 0x1068.
> Here the actual RPM is "4200" in decimal.
> 
> A quirk added to handle this.

Thank you for your patch/series, I've applied this patch
(series) to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> Signed-off-by: Vishnu Sankar <vsankar@lenovo.com>

Note I have dropped this second duplicate Signed-off-by,
I have kept the first one since that matches the From: 
from this email / the git commit author field.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans





> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 4c1b0553f872..6371a9f765c1 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -7936,6 +7936,7 @@ static u8 fan_control_resume_level;
>  static int fan_watchdog_maxinterval;
>  
>  static bool fan_with_ns_addr;
> +static bool ecfw_with_fan_dec_rpm;
>  
>  static struct mutex fan_mutex;
>  
> @@ -8682,7 +8683,11 @@ static ssize_t fan_fan1_input_show(struct device *dev,
>  	if (res < 0)
>  		return res;
>  
> -	return sysfs_emit(buf, "%u\n", speed);
> +	/* Check for fan speeds displayed in hexadecimal */
> +	if (!ecfw_with_fan_dec_rpm)
> +		return sysfs_emit(buf, "%u\n", speed);
> +	else
> +		return sysfs_emit(buf, "%x\n", speed);
>  }
>  
>  static DEVICE_ATTR(fan1_input, S_IRUGO, fan_fan1_input_show, NULL);
> @@ -8699,7 +8704,11 @@ static ssize_t fan_fan2_input_show(struct device *dev,
>  	if (res < 0)
>  		return res;
>  
> -	return sysfs_emit(buf, "%u\n", speed);
> +	/* Check for fan speeds displayed in hexadecimal */
> +	if (!ecfw_with_fan_dec_rpm)
> +		return sysfs_emit(buf, "%u\n", speed);
> +	else
> +		return sysfs_emit(buf, "%x\n", speed);
>  }
>  
>  static DEVICE_ATTR(fan2_input, S_IRUGO, fan_fan2_input_show, NULL);
> @@ -8775,6 +8784,7 @@ static const struct attribute_group fan_driver_attr_group = {
>  #define TPACPI_FAN_2CTL		0x0004		/* selects fan2 control */
>  #define TPACPI_FAN_NOFAN	0x0008		/* no fan available */
>  #define TPACPI_FAN_NS		0x0010		/* For EC with non-Standard register addresses */
> +#define TPACPI_FAN_DECRPM	0x0020		/* For ECFW's with RPM in register as decimal */
>  
>  static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
> @@ -8803,6 +8813,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('R', '1', 'D', TPACPI_FAN_NS),	/* 11e Gen5 GL-R */
>  	TPACPI_Q_LNV3('R', '0', 'V', TPACPI_FAN_NS),	/* 11e Gen5 KL-Y */
>  	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
> +	TPACPI_Q_LNV3('R', '0', 'Q', TPACPI_FAN_DECRPM),/* L480 */
>  };
>  
>  static int __init fan_init(struct ibm_init_struct *iibm)
> @@ -8847,6 +8858,13 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  		tp_features.fan_ctrl_status_undef = 1;
>  	}
>  
> +	/* Check for the EC/BIOS with RPM reported in decimal*/
> +	if (quirks & TPACPI_FAN_DECRPM) {
> +		pr_info("ECFW with fan RPM as decimal in EC register\n");
> +		ecfw_with_fan_dec_rpm = 1;
> +		tp_features.fan_ctrl_status_undef = 1;
> +	}
> +
>  	if (gfan_handle) {
>  		/* 570, 600e/x, 770e, 770x */
>  		fan_status_access_mode = TPACPI_FAN_RD_ACPI_GFAN;
> @@ -9067,7 +9085,11 @@ static int fan_read(struct seq_file *m)
>  		if (rc < 0)
>  			return rc;
>  
> -		seq_printf(m, "speed:\t\t%d\n", speed);
> +		/* Check for fan speeds displayed in hexadecimal */
> +		if (!ecfw_with_fan_dec_rpm)
> +			seq_printf(m, "speed:\t\t%d\n", speed);
> +		else
> +			seq_printf(m, "speed:\t\t%x\n", speed);
>  
>  		if (fan_status_access_mode == TPACPI_FAN_RD_TPEC_NS) {
>  			/*

