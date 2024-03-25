Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6496116A986
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 14:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711377754; cv=none; b=uDxJw8NmzKwd7gl3dU9CvfgqY/Gcflb8xTrorjV5YkSh3is78VO555MyutYaEH96dis+0Zbm3a8ZiFXh2jtg6g5JVoSrQGlT8nfOB+IqFNXUisd+BZh49wNcZEWQWgS/KRJWdxe3xNc7DOerEKSM+VXphn+dg6iuiiSZk9F7pws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711377754; c=relaxed/simple;
	bh=DYlADzUbU1di/2H68CYRl4rnSbo9j2jMOM39IJaayg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sZ/AIs+/bF3/JjOTHcqE06q0F9YDefNELLGzQkjkSV0yPZFYV64dhte/11SI3yL1/ezw31dpMTBqzGccCqQ9OFR4fk6c7B+WwCp/O0WbwdTulhepXXP05APbcgo+ugovYmzTGXiUlwD8PHd6xSDnTS50Rp/s1i26ir01FG5m7SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BlxnzSJ1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BlxnzSJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711377751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f/cLCtEJf6Rixzsx98pU0iIcSCtTUmNBzmxhoeo32yw=;
	b=BlxnzSJ1EyjjvIGSwauUnwp16L0+7zxezUji1qkMbVp5gZn4nGuMLRI2XutvlKQZH+tAVm
	jRn01jNTbFhpaJ+mBQjM5wCBDswzOExjfY8mxRh/5OnNCGEGMeg5+7jUxxwszUxh6pHTXq
	x2j+IZs2bezOyp3APob0rAkfG5dOldU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-ekPdfy8yMka0UC5zcrsioQ-1; Mon, 25 Mar 2024 10:42:27 -0400
X-MC-Unique: ekPdfy8yMka0UC5zcrsioQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-56c0d3514baso522930a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 07:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711377746; x=1711982546;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/cLCtEJf6Rixzsx98pU0iIcSCtTUmNBzmxhoeo32yw=;
        b=Vo9bLkzSjIpg0ht8txvTQ0sfEnx8ApVJThmnt+h+sgSmApk4JFm+qo0R6kOwIfdNsB
         v78T9XX6AQITZIHnT3nfJgifIrsYWsSJwumNM1UrM6fXxK1k/k1C6a2PlyxPntxnMhcG
         tiCTLVbK1jXZS1+K7ny+RbTKBjrPVJyAWX7pEH4VtZUKgbSb0kKGtmmw3Ui33BkoFmny
         7o82y3I5qI7C4HypNrhxgQjGKSkA1VWJB9vCyqrI6G5xSEqTRuCOlBjUj5f2S1fZM4OC
         DqBNaKa3a7CP71wjTLOqUdm6FDcYJosmeyMFK1+kV6MFVQx1Aloj1vRA+xvVbpVaDjVl
         tkFg==
X-Forwarded-Encrypted: i=1; AJvYcCXcXMonih6CMX2knr5UEHlZ1spIIFVXhi0liLqyZYqEnItPFXM8XobIkICBiTBeiJHTaq0DtCHzwmoLu1NKMjz/G08V1OjVCD1xhRedzEOFa+eLMw==
X-Gm-Message-State: AOJu0YzRuzYwX1b1LUIRMTUVYs7GzUlwv6IOvAB4jB7wXRll0N6nPfcG
	1W5SVJ4WArhze3U/UOqky3mOpigfWUljB+Vfw7ApxsZ4lpwk5xmPdfCN7lF/Hm21QwECcvejGDg
	VgsxJqP/cTnpfGHrfgsvGyTNh2e3TyA/5r3Sgiuh0BdFq5PB/ikOMb6/641t1HNiYFftYGec=
X-Received: by 2002:a50:cd1a:0:b0:56b:cf40:f712 with SMTP id z26-20020a50cd1a000000b0056bcf40f712mr4668254edi.19.1711377746516;
        Mon, 25 Mar 2024 07:42:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1y2OwdHo0pZWiekVXudlRme8momwGYarO2R5s8yxbc4GL8LbOcr9Diqsfq3IHC+9vYc/fkQ==
X-Received: by 2002:a50:cd1a:0:b0:56b:cf40:f712 with SMTP id z26-20020a50cd1a000000b0056bcf40f712mr4668245edi.19.1711377746329;
        Mon, 25 Mar 2024 07:42:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g7-20020a056402320700b0056c0996bf72sm1794239eda.83.2024.03.25.07.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 07:42:25 -0700 (PDT)
Message-ID: <407f241f-e185-4586-9f75-9beb73902870@redhat.com>
Date: Mon, 25 Mar 2024 15:42:25 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] platform/x86: asus-wmi: use sysfs_emit() instead of
 sprintf()
Content-Language: en-US, nl
To: Ai Chao <aichao@kylinos.cn>, corentin.chary@gmail.com, luke@ljones.dev,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240319055636.150289-1-aichao@kylinos.cn>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240319055636.150289-1-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/19/24 6:56 AM, Ai Chao wrote:
> This changes all *_show attributes in asus-wmi.c to use sysfs_emit()
> instead of the older method of writing to the output buffer manually.
> 
> Follow the advice in Documentation/filesystems/sysfs.rst:
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
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
>  drivers/platform/x86/asus-wmi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 3f07bbf809ef..df4c103459da 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2326,7 +2326,7 @@ static ssize_t pwm1_show(struct device *dev,
>  
>  	/* If we already set a value then just return it */
>  	if (asus->agfn_pwm >= 0)
> -		return sprintf(buf, "%d\n", asus->agfn_pwm);
> +		return sysfs_emit(buf, "%d\n", asus->agfn_pwm);
>  
>  	/*
>  	 * If we haven't set already set a value through the AGFN interface,
> @@ -2512,8 +2512,8 @@ static ssize_t asus_hwmon_temp1(struct device *dev,
>  	if (err < 0)
>  		return err;
>  
> -	return sprintf(buf, "%ld\n",
> -		       deci_kelvin_to_millicelsius(value & 0xFFFF));
> +	return sysfs_emit(buf, "%ld\n",
> +			  deci_kelvin_to_millicelsius(value & 0xFFFF));
>  }
>  
>  /* GPU fan on modern ROG laptops */
> @@ -4061,7 +4061,7 @@ static ssize_t show_sys_wmi(struct asus_wmi *asus, int devid, char *buf)
>  	if (value < 0)
>  		return value;
>  
> -	return sprintf(buf, "%d\n", value);
> +	return sysfs_emit(buf, "%d\n", value);
>  }
>  
>  #define ASUS_WMI_CREATE_DEVICE_ATTR(_name, _mode, _cm)			\

