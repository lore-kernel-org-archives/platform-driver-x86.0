Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998F3152E12
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Apr 2024 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713429990; cv=none; b=kqmhe9JtNBigEJdwbs4DztXmzDYHlsPiw3uvysifUccxfA/Nzh39Z4GZ0eEcyJ5txV11WrO+3dbdT9N//8D8kBhgquLdJJmBur3oW+bNEN13VifIlhX1quIwLNWFa/Unp3duBss5IPC35i4tZXxWIW4FzJWWb5RdMGt5YMKqF2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713429990; c=relaxed/simple;
	bh=liaanHInhCVHl6LFCXyaUL53XzFp8tFHkc9T7d/cwqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LiqaITICbv7dzdEjaOpme22qapiH/X2vBnw8yMV2mlJFUyctQPcCbtkyqNzqpfQpGW3Enb+DzlW87/xrYZHtJGKxaEFyLeS74ZBL9dTsJDVifoP+qwoqm5ybn1ZzX1TLBMyv/7GR5sJSUlhyRQpyd0/a+NSq+wKyD5NMSJTbAr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eI4TiPsb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eI4TiPsb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713429987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VNj3joo+Yw9FT0MEQmqvCroatRCFxnhMX9kyaDL4c3c=;
	b=eI4TiPsbpL4k6Z5Ygc8XtDDRhBcJedgbl21+RwBJtnqiFHqjZrmy+xbCkwIy9YJQ+r7Z21
	NydO4LmD23YNgrwurVC0ODENi/jT0ZoE7TX71qOMQ+pLm7ky78B7CiUtlhIEzBWn85GToa
	wrJ9olwCvsE46c8BaPUsyL43/OUJjPA=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-M-VVyArlNiScapVDUhBHpQ-1; Thu, 18 Apr 2024 04:46:26 -0400
X-MC-Unique: M-VVyArlNiScapVDUhBHpQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2d87257c610so6219121fa.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Apr 2024 01:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713429984; x=1714034784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNj3joo+Yw9FT0MEQmqvCroatRCFxnhMX9kyaDL4c3c=;
        b=ivdu5w+DWMq+FEPLiR2qHjgQZ5an56oosZzN8jsWWN/ViyDQ56qnQihXy0t91Sr2/3
         Dol5OYeg3XNWL0NR66q4vVXVpi2EBTvov2oHaeXC72XDMVcEN6reju5SkBau3mjGMiOI
         llb5uAtRooTeCPHQl1ZcPfBlRF/In52c8GsqMTgpC5kYlzJOMhUZh+PIGeta96F9mVDA
         Oglwl1VguSzdgQH3ZksSu1anjoW7AO512/qiItCDH5Q69Us5DdtW8XDf/k/BVo1bgMDj
         HSbD3Xj/d5IKAVEvfrPDElloCBQnzsZ/74JDC+i8Nttbjzwesi4U+gLTSMCqv2lx40N5
         QB9A==
X-Forwarded-Encrypted: i=1; AJvYcCWEx7oS4TbpDHcOduKPPZvcEoibyJ9/+nnaqSMJ3oDY5nRLS89WnCboWpQXPH2phECZTNxfwTYYnzkvoYOhn1OEyFh1cvmhoQATeBMgT95ACDBH7Q==
X-Gm-Message-State: AOJu0YyFe8JD6ao72t9WF4jQY9kiIMvgNwbybmTwpqH8JGLN53ynwY36
	jDk8GIvtYKIoNs/gbwKK2UEowklAyqSD1MjviTbzCpdGL8sq+/4oQKpgHOcCxMVD80lBlMEYxu1
	7ZiG0BNZ4RwXoWyEqiVy0U5ocknXTCygSBXsbs7zkTicMn2AjfgMPLsoRy4VvKUa0cCCZvig=
X-Received: by 2002:a2e:a784:0:b0:2d4:6a34:97bf with SMTP id c4-20020a2ea784000000b002d46a3497bfmr1474222ljf.49.1713429984602;
        Thu, 18 Apr 2024 01:46:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8Q3nlDo1Y5obOYlTRSJejji2XuPvgeect2eoeDKPrcfW8fAPyfx7tp7Pvm9JeCr8oWfW3Eg==
X-Received: by 2002:a2e:a784:0:b0:2d4:6a34:97bf with SMTP id c4-20020a2ea784000000b002d46a3497bfmr1474199ljf.49.1713429984230;
        Thu, 18 Apr 2024 01:46:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t7-20020a1709066bc700b00a5556cd0fd5sm589910ejs.183.2024.04.18.01.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 01:46:23 -0700 (PDT)
Message-ID: <5f8fac08-5368-443c-853e-6587b635e39b@redhat.com>
Date: Thu, 18 Apr 2024 10:46:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: samsung-laptop: Use sysfs_emit() to replace
 the old interface sprintf()
To: yunshui <jiangyunshui@kylinos.cn>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com, ilpo.jarvinen@linux.intel.com,
 Ai Chao <aichao@kylinos.cn>
References: <20240418070550.628310-1-jiangyunshui@kylinos.cn>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240418070550.628310-1-jiangyunshui@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>


On 4/18/24 9:05 AM, yunshui wrote:
>     As Documentation/filesystems/sysfs.rst suggested,
>     show() should only use sysfs_emit() or sysfs_emit_at() when formatting
>     the value to be returned to user space.
> 
> Signed-off-by: yunshui <jiangyunshui@kylinos.cn>
> Signed-off-by: Ai Chao <aichao@kylinos.cn>

But this double Signed-off-by is weird, looking at the From:
you (yunshui) are the author so your Signed-off-by is expected.

But Ai Chao's Signed-off-by here is weird, I would only
expect that if Ai Chao would be submitting the patch on
your behalf (for whatever reason).  Signed-off-by indicates
that you're either the author or the patch passed through
your hands. So I'll add my S-o-b for example when applying
this to my review-hans branch.

I guess you may want:

Reviewed-by: Ai Chao <aichao@kylinos.cn>

here and in the other similar sysfs_emit() patches ?

Regards,

Hans




> ---
>  drivers/platform/x86/samsung-laptop.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
> index b4aa8ba35d2d..3d2f8e758369 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -661,9 +661,9 @@ static ssize_t get_performance_level(struct device *dev,
>  	/* The logic is backwards, yeah, lots of fun... */
>  	for (i = 0; config->performance_levels[i].name; ++i) {
>  		if (sretval.data[0] == config->performance_levels[i].value)
> -			return sprintf(buf, "%s\n", config->performance_levels[i].name);
> +			return sysfs_emit(buf, "%s\n", config->performance_levels[i].name);
>  	}
> -	return sprintf(buf, "%s\n", "unknown");
> +	return sysfs_emit(buf, "%s\n", "unknown");
>  }
>  
>  static ssize_t set_performance_level(struct device *dev,
> @@ -744,7 +744,7 @@ static ssize_t get_battery_life_extender(struct device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	return sprintf(buf, "%d\n", ret);
> +	return sysfs_emit(buf, "%d\n", ret);
>  }
>  
>  static ssize_t set_battery_life_extender(struct device *dev,
> @@ -813,7 +813,7 @@ static ssize_t get_usb_charge(struct device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	return sprintf(buf, "%d\n", ret);
> +	return sysfs_emit(buf, "%d\n", ret);
>  }
>  
>  static ssize_t set_usb_charge(struct device *dev,
> @@ -878,7 +878,7 @@ static ssize_t get_lid_handling(struct device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	return sprintf(buf, "%d\n", ret);
> +	return sysfs_emit(buf, "%d\n", ret);
>  }
>  
>  static ssize_t set_lid_handling(struct device *dev,

