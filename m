Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581211537D9
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Oct 2024 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729600886; cv=none; b=eURBZYT0lDnYNYZphjcMTDHNvnd1lsnKZ8iwOYJf7wZc1bS9iO4F9YMlp5lFgeAzrOUzVwNpnXORAFuI/I4CgmLNiQfMQ79DgOWuiHuebgPWuE+b2reGf9mSsEaw/c4KeYrT5VRtg01/abEZO76qwQJhmo5rGJ/9NsBT0ImaRWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729600886; c=relaxed/simple;
	bh=7ogbe9klNHIgIwWQi1odvjugDCadVyAD3zv6Rmvq2ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MiW/kCDjZNlXZccGW0weMgnBQnbHKhdJwm9otzut5j3hbqgkbcq0zP9X19ElqOYJU5x17/g3mqHpquDh4Tf6wx3rIlmdojK1ZtfgGBt3sDmaHC7w1Bw3Qst+rBODGeXtFVphMgfxezsKsm9BL6//T4IIGn9jqWXCsbqyjP0pFuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y1rRg1cp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y1rRg1cp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729600883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G77AXdhmFXzZ/ESBcMLQ3RrG4kqVBepd83akdkPaE3g=;
	b=Y1rRg1cpFb/5/xP0uA2R5ozhzKzCUAa55BUi5Ga9ifLttzsdi49kANxyzicX3lx16sR0iu
	rEKX3vaPVAsrq0ksKDAm2pGKXNrdhv5W69OZgYbcaoi5cvYsjuGz6ExbR+4ZFfxKEJdUsH
	Dn4t2zDgn9CeDEPXKjeV/+isH/Hptv0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-DUUvgMuLMxKaFC5FLh-hlg-1; Tue, 22 Oct 2024 08:41:21 -0400
X-MC-Unique: DUUvgMuLMxKaFC5FLh-hlg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a99f084683fso383154566b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Oct 2024 05:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729600880; x=1730205680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G77AXdhmFXzZ/ESBcMLQ3RrG4kqVBepd83akdkPaE3g=;
        b=QTIspjE9qvSdzU4EkJlMpEb1DFCMSBswnRQXxdsNScfpan6kludz5fXsShh+5oDrl1
         D05k2E0qrrbvIZcbO1i+serufY/rq9+hzZUVbhFYMgk+Jx5bX97LjsByz4kJ+0MTKOtx
         W6pmVLThC5kT11oKXUAs9GUJFb796sWQbLi5CopviZ0TJgLy6LScUrWW8tKEFqg8/+8A
         ucDrE1dK5aPIly0A5qb7mARGpYx4E9FghRtIF9tmJNPMpNxwECK9iohc+l8Ovaj1v7G+
         sC5WKAxAOCCK7q/YarmiDDdFuKoA5iyqqyUDLA73N1xxLsi8zLruUxttwsqEDf2oRDuW
         UXPA==
X-Forwarded-Encrypted: i=1; AJvYcCXEyC0GLTyaDBQ/wJdz7omN8/qX0UdjOCXFCYmbWtjVoY4afVtEh7o1ysTyd+935Wr900z2Y5wIkb0HRsgkgqcEomSP@vger.kernel.org
X-Gm-Message-State: AOJu0YyiGGNJCbyelbD0y2g8Wl7OgN/BAzasbQyJbmez4b3O+zqdgc+V
	C9qPMq7o6zOi699wQ7v38DjKjvNiIOMNYDPmMRVUG4a/ZOcKeuNU31GAOvqSblthqKVBvcE9hpn
	ZXyluK2ImXMo41MIJ3xM8lG92yxZOTCUmv9JXpzWjhpCplvlSevMWJ1DCIEzN0NRNtjhMSMI=
X-Received: by 2002:a17:907:8f07:b0:a9a:7f91:8c76 with SMTP id a640c23a62f3a-a9a7f91909emr783155766b.0.1729600880470;
        Tue, 22 Oct 2024 05:41:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOf16Iq8griI6UFYZrIvV7s26ph2XKRc9+xFT6FensfG/rdtXdTr+cjCcBXBOEOEpVJS42kg==
X-Received: by 2002:a17:907:8f07:b0:a9a:7f91:8c76 with SMTP id a640c23a62f3a-a9a7f91909emr783153466b.0.1729600880050;
        Tue, 22 Oct 2024 05:41:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b? (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d638fsm338112466b.18.2024.10.22.05.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 05:41:19 -0700 (PDT)
Message-ID: <ad76d2f6-7045-4c82-b8be-0214b312b8ce@redhat.com>
Date: Tue, 22 Oct 2024 14:41:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: eeepc-laptop: use sysfs_emit() instead of
 sprintf()
To: chen zhang <chenzhang@kylinos.cn>, ilpo.jarvinen@linux.intel.com,
 corentin.chary@gmail.com, luke@ljones.dev
Cc: linux-kernel@vger.kernel.org, chenzhang_0901@163.com,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <20241018095547.46006-1-chenzhang@kylinos.cn>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241018095547.46006-1-chenzhang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Oct-24 11:55 AM, chen zhang wrote:
> Follow the advice in Documentation/filesystems/sysfs.rst:
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
> Signed-off-by: chen zhang <chenzhang@kylinos.cn>
> ---
>  drivers/platform/x86/eeepc-laptop.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
> index 03319a80e114..ba36b7bf6dc4 100644
> --- a/drivers/platform/x86/eeepc-laptop.c
> +++ b/drivers/platform/x86/eeepc-laptop.c

You need to add a:

#include <linux/sysfs.h>

when using sysfs_emit() .

Please send a v2 with this fixed and please don't forget to Cc:

platform-driver-x86@vger.kernel.org

for the v2.

Regards,

Hans





> @@ -285,7 +285,7 @@ static ssize_t show_sys_acpi(struct device *dev, int cm, char *buf)
>  
>  	if (value < 0)
>  		return -EIO;
> -	return sprintf(buf, "%d\n", value);
> +	return sysfs_emit(buf, "%d\n", value);
>  }
>  
>  #define EEEPC_ACPI_SHOW_FUNC(_name, _cm)				\
> @@ -361,7 +361,7 @@ static ssize_t cpufv_show(struct device *dev,
>  
>  	if (get_cpufv(eeepc, &c))
>  		return -ENODEV;
> -	return sprintf(buf, "%#x\n", (c.num << 8) | c.cur);
> +	return sysfs_emit(buf, "%#x\n", (c.num << 8) | c.cur);
>  }
>  
>  static ssize_t cpufv_store(struct device *dev,
> @@ -393,7 +393,7 @@ static ssize_t cpufv_disabled_show(struct device *dev,
>  {
>  	struct eeepc_laptop *eeepc = dev_get_drvdata(dev);
>  
> -	return sprintf(buf, "%d\n", eeepc->cpufv_disabled);
> +	return sysfs_emit(buf, "%d\n", eeepc->cpufv_disabled);
>  }
>  
>  static ssize_t cpufv_disabled_store(struct device *dev,
> @@ -1025,7 +1025,7 @@ static ssize_t store_sys_hwmon(void (*set)(int), const char *buf, size_t count)
>  
>  static ssize_t show_sys_hwmon(int (*get)(void), char *buf)
>  {
> -	return sprintf(buf, "%d\n", get());
> +	return sysfs_emit(buf, "%d\n", get());
>  }
>  
>  #define EEEPC_SENSOR_SHOW_FUNC(_name, _get)				\

