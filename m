Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790327B3FD
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Apr 2024 08:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713430026; cv=none; b=htAkQ8i03aCykqDICvv2tmD9Wn6Fm6XwNXACCX5qjgThC32rSS1KFzoy7cqwXx2QxPTjPlAAWHWQC2RJ3/7XOO+KBLmaMzH+pb/sS7AV3PpzwdGLCoFtMVeTPW18dv2XzVg2n9tBRXEg+OMWGnDBgp2MP7DRZjMpI6M26Qn+kzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713430026; c=relaxed/simple;
	bh=hZhXW9wg4wjoavT+9EfcCTWpvN/SZJQnteH7FnhHDXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tvwcS6yePJaEi+3qySCrNe07x8271uItGwY4cEmJ7KuPhc1iv/StEbwIl/W0VZhdQsbohgf2A7/v7X3IjYU6/PfTwQnbUVQynzPL6KpVDIIXSz1VygH0/w8CYXHhRGPETkPbWqhr1QdoHO1Pi2dK41RfbL7qBSG8XbaMZtgaSqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gd/ZJtJ6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gd/ZJtJ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713430024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypu/IzdSRACz4KGvkLD7l6pluK2joJIPj93eOoJKFJU=;
	b=Gd/ZJtJ6nQ6wAGsux7zoAVMNqQavIgpAMSTLsoIarQOs+Ozib7vb85WdMc+jjYC0IiRb9f
	2oVO0c+YuazINKkO+VIP4ucIabpiRPocRZWJ2oRPRLTKuKKo3Jl97Hk3NXYINc8RzE6d5B
	f49svQuBLVMhDovuvKCTNdls4HJxhPY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-coN1DQ0GNriDu_se8XDFOA-1; Thu, 18 Apr 2024 04:47:03 -0400
X-MC-Unique: coN1DQ0GNriDu_se8XDFOA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2d45c064742so6262861fa.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Apr 2024 01:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713430021; x=1714034821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypu/IzdSRACz4KGvkLD7l6pluK2joJIPj93eOoJKFJU=;
        b=mxDKaAqC1IoCq4lCCQRDGkLfQmfVhCsDqDmRT3mEbcnMGDMN7g4BwuTTZ9A/XARiZ2
         5WVEFJrGvJ3uqNQcapTQHfcWAkB5DTx8ACSsM5lEOWlNlVpA16BnWFMfyYjeAyzNnoz9
         YVhuvrvs+a9O1HoM+WwWFqo+UfrvYJ4ppGPHbkucGBB04DZiTJ2xQ4LSm7C3dJmKcfnx
         aIVdnb2VIbRwxTgjg1p2c9kMmFDY0W+nX9tIo6SNGD/DZ1QWv4emA9Lhnj25bW0oM76R
         ItyCdz/0vcKU8ykl3g4bqNq4G8AMSehAVfReltGP3mt1EtixNZH0GIBElZC4wD2OjPOh
         u7bA==
X-Forwarded-Encrypted: i=1; AJvYcCVGpgBKGVzH8p4Ui3aT/n+7nwlGb7TMZ0/iBcR75BZs+ckOwreeXedC8ECsIs1kWCHNC1mrnz3/ER2BaZuNOSDDwYgwFnZZtmFycyNnrzAQi9mDeA==
X-Gm-Message-State: AOJu0YyTL3xjpjO5hsf1cNzD/M9JWDBRqo7jvAMw0X+9tESUosUJ2t0o
	G8op04C97LyN5d/PYBcUNOcgVcyVDsO9GOcuxNJIbRhiClR2uWfrvhVzmXOQu/PE0VIWcC5090h
	o9Djfycv/8Au6x11Pyi08InlqFj1lJleuj0r9rtfkm0lHXgmUUbYXAt2m6BxS1IbjkGggVMA=
X-Received: by 2002:ac2:514a:0:b0:518:dfae:2691 with SMTP id q10-20020ac2514a000000b00518dfae2691mr934549lfd.11.1713430021715;
        Thu, 18 Apr 2024 01:47:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmRh2T6pvnSqHalT0e9jZSTumH+2b2s1Adv+nj5rhoXDlqkM4PEjAaGAuY6sV4enTEM5Eukw==
X-Received: by 2002:ac2:514a:0:b0:518:dfae:2691 with SMTP id q10-20020ac2514a000000b00518dfae2691mr934538lfd.11.1713430021471;
        Thu, 18 Apr 2024 01:47:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k4-20020a50cb84000000b005705bb48307sm600965edi.42.2024.04.18.01.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 01:47:01 -0700 (PDT)
Message-ID: <9d4800ed-ac7d-406e-ad66-7b5bcd136c30@redhat.com>
Date: Thu, 18 Apr 2024 10:47:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: msi-laptop: Use sysfs_emit() to replace
 sprintf()
To: yunshui <jiangyunshui@kylinos.cn>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Cc: jlee@suse.com, ilpo.jarvinen@linux.intel.com, Ai Chao <aichao@kylinos.cn>
References: <20240418072257.631977-1-jiangyunshui@kylinos.cn>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240418072257.631977-1-jiangyunshui@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

On 4/18/24 9:22 AM, yunshui wrote:
>     As Documentation/filesystems/sysfs.rst suggested,
>     show() should only use sysfs_emit() or sysfs_emit_at() when formatting
>     the value to be returned to user space.
> 
> Signed-off-by: yunshui <jiangyunshui@kylinos.cn>
> Signed-off-by: Ai Chao <aichao@kylinos.cn>

Note same weird S-o-b here though.

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

