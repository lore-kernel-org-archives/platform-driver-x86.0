Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E37519412E
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 11:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731928888; cv=none; b=h/xBZpfFy+2Jzpty32rdknvNYUwPJl/3mH8p+nnDpRDL8N4b1vqfyXNDZH9vOdSWBbaCjZf9F3vlSfR8HEGqfJjWGl1xlmSqFmCbnQjx6c4aY+DkW6dhes8YdCf+mnJhr0tU+HfgwhtNYPPFLCrutAgg5oj6EcT6S5t/eEgDopM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731928888; c=relaxed/simple;
	bh=gCjdTwJtgC8pvpKGrKkLfZzj0vbHT92cffiGbzomHu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KEDRcs+ut7azkd5rRBaeTrWdo+uoxIHYItBgG8aEbWlTbRT8rsvh9acYtCW316TnRrS5Wi44Vn2k5LI0UynZjsZykenc3VZSVRR1AF1nmkV6FR3pWXi1ztEKO1iBFjtf+rSiMaYfXV4t11+iF8JB0rVsusF7iqH8azT6QY8ZyrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z+oLHsSa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z+oLHsSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731928885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/vhtRuGapTYfwMrUTXvgOIYZYR68jtcwBM26NHmo8w=;
	b=Z+oLHsSadrhu28Ja6A1T3nrGvLGGM+9W1Y02ymnndpzPCf+2FUaGH2n9d50Ao/mOhRI5+X
	xFWviNmYKWUyWDPaPl3SY3Ab8I36B+0r/8eThvdnMqmN/4rAkwsBANtFDj6mCsxiQdSG6P
	0Z7v8Gqk7Iw5Qwa7a+VHdCsPFTSCBBw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-jKel4lg-M5-9z6j2qDjr7g-1; Mon, 18 Nov 2024 06:21:24 -0500
X-MC-Unique: jKel4lg-M5-9z6j2qDjr7g-1
X-Mimecast-MFC-AGG-ID: jKel4lg-M5-9z6j2qDjr7g
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5cfc19eb3a9so820827a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 03:21:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731928882; x=1732533682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/vhtRuGapTYfwMrUTXvgOIYZYR68jtcwBM26NHmo8w=;
        b=UbXgUSmMGicTuvBZsQTgQOqme+awFukCZL2l0NtNTXSlI4yc0CPjAxWkU+nlZ5ebeb
         938eCkUePkF3NAZkDgRFGQPWl8Qpg+06jWqgp7EY765EoWs0gQ32UTZ8dT3ZclFazjao
         x5JrPERMNqI31vPlZHRmxlO0vALOFycA91ErT2F/X0N8vgAt64icKlpYCXnxa9B+Z56/
         1okdTCf2+oAZuilG8I5+y1Tt8hlJVed7NFujZxvgWGcj7WIYWevd8fCmphFy7ToRM7jQ
         yrDa92X04Pu/yY0WA1f4THzABhlrCpC8Z5AyZ3GnkO0sCOBFNL0bYegu8v1nJJdqnTrQ
         nA/A==
X-Gm-Message-State: AOJu0YwGxLkc0aA1pnnHYV/PErQIVyAftAOdQgO5JBySPYls/0F7if9v
	HQquVMSSq7twFcGDhdW8ZDc1mT7j9w3I2Vgl3Bgy/vmbcEvkeus3483veTk7bm4zA60Lot9jqaY
	qSHDp24aJbcjgaRleNZjrYYin+qG98v5rKis24gKj1mCi1khdwNsa0U5+3ZVrgWUF9G1/CTt7z7
	Dql5s=
X-Received: by 2002:a05:6402:d05:b0:5ce:fa47:18b6 with SMTP id 4fb4d7f45d1cf-5cf8fc8c279mr8212965a12.12.1731928882646;
        Mon, 18 Nov 2024 03:21:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyn/GEysF6WORMzNW3q8gK3j2rSf3hJU2HyR4Q6dLKfu1IWv3ThPBnLW69j4Xl3SiqiqZiPg==
X-Received: by 2002:a05:6402:d05:b0:5ce:fa47:18b6 with SMTP id 4fb4d7f45d1cf-5cf8fc8c279mr8212941a12.12.1731928882287;
        Mon, 18 Nov 2024 03:21:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cfce9e1e38sm620404a12.37.2024.11.18.03.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 03:21:21 -0800 (PST)
Message-ID: <646da4cc-0030-4f11-8a1d-4e4aaa1f609d@redhat.com>
Date: Mon, 18 Nov 2024 12:21:21 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: panasonic-laptop: Return errno correctly in
 show callback
To: Yao Zi <ziyao@disroot.org>, Kenneth Chan <kenneth.t.chan@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "open list:PANASONIC LAPTOP ACPI EXTRAS DRIVER"
 <platform-driver-x86@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20241118064637.61832-3-ziyao@disroot.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241118064637.61832-3-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Nov-24 7:46 AM, Yao Zi wrote:
> When an error occurs in sysfs show callback, we should return the errno
> directly instead of formatting it as the result, which produces
> meaningless output and doesn't inform the userspace of the error.
> 
> Fixes: 468f96bfa3a0 ("platform/x86: panasonic-laptop: Add support for battery charging threshold (eco mode)")
> Fixes: d5a81d8e864b ("platform/x86: panasonic-laptop: Add support for optical driver power in Y and W series")
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/panasonic-laptop.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
> index 2bf94d0ab324..22ca70eb8227 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
> @@ -614,8 +614,7 @@ static ssize_t eco_mode_show(struct device *dev, struct device_attribute *attr,
>  		result = 1;
>  		break;
>  	default:
> -		result = -EIO;
> -		break;
> +		return -EIO;
>  	}
>  	return sysfs_emit(buf, "%u\n", result);
>  }
> @@ -761,7 +760,12 @@ static ssize_t current_brightness_store(struct device *dev, struct device_attrib
>  static ssize_t cdpower_show(struct device *dev, struct device_attribute *attr,
>  			    char *buf)
>  {
> -	return sysfs_emit(buf, "%d\n", get_optd_power_state());
> +	int state = get_optd_power_state();
> +
> +	if (state < 0)
> +		return state;
> +
> +	return sysfs_emit(buf, "%d\n", state);
>  }
>  
>  static ssize_t cdpower_store(struct device *dev, struct device_attribute *attr,

