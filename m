Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69C0136988
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 13:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713793315; cv=none; b=SV8tN1p6RsvCLdZA8OLzW2Wi4I4Ua0zS7BX0msKFG+vgPYlpIEo7bn8uyPOMX9Wg956f9XUS8QHincqh/g5SfK4UO/Zf4hXaqqi7kYcXzbn4bZzeOpEJ2+lO2qlBHlnYKi3rzQx16vzGM6Hvm1tGeX0M4glSgoz70vJed4Cm01U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713793315; c=relaxed/simple;
	bh=4oim69y/9OfKbI8BdKLij662Sppol9ItNizhr27QLms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFBTMN4b+D0IqDN6gvvfSWildrs7M2RBTsSB2QkfF3o+Luh+TpapSInsJ1sLgG7P5DSoPoXqpGv19wGljZmEma3z1dMFrwr7nvc4znIkcIQxYhTeNDtoPr+ssp/uMZJC/wItNNCdOO3SXnUS18H0c0HL++4JR0A0r5thH7YWqQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CxXywcTX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CxXywcTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713793312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kRxwkIFUs9CTScVUXhPkf0X+3b18MF4xd0ddKvmTSu8=;
	b=CxXywcTXkIhyohZS7uQE3uT7HRC6yKNXMiF9KiIwzuSx2U2wKE+RXkYk9cFngyEdCQARn4
	A+5BEZadFwCFEv7avVRCtc4oYKrI5holYLqJJPWQG0V4RfaJl2MzNDg3tXtXXWEDIj2+Hv
	YQ/b1M/NM68zEH0Xq+TxsUl9KxHj5yQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-dStpfvpjMeybEMDKssIGqA-1; Mon, 22 Apr 2024 09:41:51 -0400
X-MC-Unique: dStpfvpjMeybEMDKssIGqA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-34b40e8482aso416224f8f.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 06:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713793309; x=1714398109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRxwkIFUs9CTScVUXhPkf0X+3b18MF4xd0ddKvmTSu8=;
        b=Brh5MMBgLAkZOg1Kfu47/jXgOSK0AJeT8eWkCTljzGMcr6dpZoJSxrrmTxD6vO9sY9
         z6TGX+9cMhG3GKayGe8u/UA0NNmkgg4Gq/DOwbFLVa2NBcFSealrhpFNaUyjC0jtNIBF
         W/0EBIO91WGaKtXtFfP9gkUINILbDR54cxrT5W1x7wsBMaK//yp28pjArJ9vIYWkt49r
         POw9vvSz7aosM8jX02qGeRV5Yh5XpwGrp2gPjowM7YBIIHzwyLnS268YQNRzBQZpPmHW
         LrP+cJ+WhJMH8d1WtMcuUBnbB0QQdV2L9cg6rSc5SlnFSajhPm2CN1dNV/F/yVUDWh3b
         mLlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhsDKgfdLoWYyYB8dzupDQKrA1t12FFezYlDZ2P9bcz34VtrpkniFYm/AF+LoTxOqE2SI8Kfloc/esb8Kki+EeLyvCiJROSM2hKV7oJDz0Wer1bg==
X-Gm-Message-State: AOJu0YwHLSYWWB0j4kcZAhzz5YcIcMMtWEjH2XJaaCDyC/Xls5bIPDjC
	+nL5nRzf6VX37Bf6NghWzP3OrFmLH5I5r+aesGiLAe/oUfZbJTP0a43O7QxMs8xdvDF/ALCbrqf
	VyS0am1fR7O3IE/oL6xDFOLG6p28+iIRcfPDTqvS4c1x8e93pDJTFDZWSAqXUbi1NhBAdiAVxfG
	dx8OnDvQ==
X-Received: by 2002:adf:f343:0:b0:343:5cca:f7c7 with SMTP id e3-20020adff343000000b003435ccaf7c7mr8253512wrp.41.1713793309116;
        Mon, 22 Apr 2024 06:41:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0jLaTWNc6yGyIvSKmiCD5yZ7ygpSwhzslfbyzrlx20Ts+CP4YuQ0EwZ9+WZX60zIsyyVJ9A==
X-Received: by 2002:adf:f343:0:b0:343:5cca:f7c7 with SMTP id e3-20020adff343000000b003435ccaf7c7mr8253486wrp.41.1713793308682;
        Mon, 22 Apr 2024 06:41:48 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id f15-20020a170906c08f00b00a553574ae71sm5742142ejz.7.2024.04.22.06.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 06:41:47 -0700 (PDT)
Message-ID: <1e4e5799-38b7-42ca-b196-3eac82601ff4@redhat.com>
Date: Mon, 22 Apr 2024 15:41:45 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -v2] platform/x86: msi-laptop: Use sysfs_emit() to replace
 sprintf()
To: yunshui <jiangyunshui@kylinos.cn>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Cc: Ai Chao <aichao@kylinos.cn>
References: <20240419063649.2396461-1-jiangyunshui@kylinos.cn>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240419063649.2396461-1-jiangyunshui@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/19/24 8:36 AM, yunshui wrote:
> As Documentation/filesystems/sysfs.rst suggested,
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
> Signed-off-by: yunshui <jiangyunshui@kylinos.cn>
> Reviewed-by: Ai Chao <aichao@kylinos.cn>

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
>  drivers/platform/x86/msi-laptop.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
> index f4c6c36e05a5..e5391a37014d 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -317,7 +317,7 @@ static ssize_t show_wlan(struct device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	return sprintf(buf, "%i\n", enabled);
> +	return sysfs_emit(buf, "%i\n", enabled);
>  }
>  
>  static ssize_t store_wlan(struct device *dev,
> @@ -341,7 +341,7 @@ static ssize_t show_bluetooth(struct device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	return sprintf(buf, "%i\n", enabled);
> +	return sysfs_emit(buf, "%i\n", enabled);
>  }
>  
>  static ssize_t store_bluetooth(struct device *dev,
> @@ -364,7 +364,7 @@ static ssize_t show_threeg(struct device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	return sprintf(buf, "%i\n", threeg_s);
> +	return sysfs_emit(buf, "%i\n", threeg_s);
>  }
>  
>  static ssize_t store_threeg(struct device *dev,
> @@ -383,7 +383,7 @@ static ssize_t show_lcd_level(struct device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	return sprintf(buf, "%i\n", ret);
> +	return sysfs_emit(buf, "%i\n", ret);
>  }
>  
>  static ssize_t store_lcd_level(struct device *dev,
> @@ -413,7 +413,7 @@ static ssize_t show_auto_brightness(struct device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	return sprintf(buf, "%i\n", ret);
> +	return sysfs_emit(buf, "%i\n", ret);
>  }
>  
>  static ssize_t store_auto_brightness(struct device *dev,
> @@ -443,7 +443,7 @@ static ssize_t show_touchpad(struct device *dev,
>  	if (result < 0)
>  		return result;
>  
> -	return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_TOUCHPAD_MASK));
> +	return sysfs_emit(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_TOUCHPAD_MASK));
>  }
>  
>  static ssize_t show_turbo(struct device *dev,
> @@ -457,7 +457,7 @@ static ssize_t show_turbo(struct device *dev,
>  	if (result < 0)
>  		return result;
>  
> -	return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_TURBO_MASK));
> +	return sysfs_emit(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_TURBO_MASK));
>  }
>  
>  static ssize_t show_eco(struct device *dev,
> @@ -471,7 +471,7 @@ static ssize_t show_eco(struct device *dev,
>  	if (result < 0)
>  		return result;
>  
> -	return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_ECO_MASK));
> +	return sysfs_emit(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_ECO_MASK));
>  }
>  
>  static ssize_t show_turbo_cooldown(struct device *dev,
> @@ -485,7 +485,7 @@ static ssize_t show_turbo_cooldown(struct device *dev,
>  	if (result < 0)
>  		return result;
>  
> -	return sprintf(buf, "%i\n", (!!(rdata & MSI_STANDARD_EC_TURBO_MASK)) |
> +	return sysfs_emit(buf, "%i\n", (!!(rdata & MSI_STANDARD_EC_TURBO_MASK)) |
>  		(!!(rdata & MSI_STANDARD_EC_TURBO_COOLDOWN_MASK) << 1));
>  }
>  
> @@ -500,7 +500,7 @@ static ssize_t show_auto_fan(struct device *dev,
>  	if (result < 0)
>  		return result;
>  
> -	return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_AUTOFAN_MASK));
> +	return sysfs_emit(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_AUTOFAN_MASK));
>  }
>  
>  static ssize_t store_auto_fan(struct device *dev,

