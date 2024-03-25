Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C2F12C80B
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711377740; cv=none; b=gboTvC4IAOFlk/HRvPZqbezfGu33wigQFk/Wpd6ho3P2jwDsoruLDRgim4Wmbhexwdp20y32izSvoUHEv2A/PvB4re62iL3yWdqAV61GIa9pdWBz8C+fMgFfCHNQUkb3+LKxzsugAq2krzn3hTVXBuO3F+GlRAKo46TKSC8vmeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711377740; c=relaxed/simple;
	bh=H6GWCzUr4bu05tZUPxWIonNRb0KF+giuYdstauoVwsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pu/gigWXiktiAR4qqp/zqTtpUX44XfnQxw2DdmwgPI6+JTOe8sMHK70ePS5YbiqssOmSu6ZyVqqnyyVQxa9iAnQWktcwg2Rv+T2fN5MznuGImh9DvikYeeQHz+V+TdIeE4Ui876h3g/NtIhRdrGXTXDeE4HpfYFmCTqx/NvEZRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ElOsZOfG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ElOsZOfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711377738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VLrR2JlfX0S1p3aWe4A7fE+XaM/6X9zPvy49Bs4Sz1M=;
	b=ElOsZOfGINVHnfOASkpmRF3SmoVT0G9cJpG177o9W5Y5WeeymlPlYvC7eKz3hjBgic5v6M
	tBE8sYzADUpKuxJpGLUVYyyd/PzROJPjieNh52Y7LEaise0/ekDHQ/0OK6uWEyobHp/QgM
	+Nt36+peR2YSxYUuj6S6ZMlr4rGBKkc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-DIHXM5EpNx6ojLu4ZQDXnQ-1; Mon, 25 Mar 2024 10:42:14 -0400
X-MC-Unique: DIHXM5EpNx6ojLu4ZQDXnQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-56c0d3514baso522792a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 07:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711377733; x=1711982533;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLrR2JlfX0S1p3aWe4A7fE+XaM/6X9zPvy49Bs4Sz1M=;
        b=Dw9HiQPVIm4utCeGqNo1x7JcmxKzqlA7rV7vjgu1KLjv/WZwPuia2u8xBvjzVzIQh7
         oMO0mLNBgjax3HOK4CuUVFiDJMh83Bo/YbVPieQB96N10N3dJCJta+7o/40T0+jyhDY9
         AV28N7L9eANt+GFNoeuzy3FMvGkT5QSCSzc8qaNkkwBO5AHy5QxoWOCmB2wHrWuYLrwv
         RK8Q35Dini0sSxtm+IvaPjkfnFw5NS01W6BVEcqgJ4RL/M5LbrZjZ4Mm5R0+A4VG2n8m
         CovTAMV24aZlUitWdOups5a0jowZNiNFYq7f9y3jNG1iHViQ2xKf/5DCN87UsYR//m1B
         JcGA==
X-Forwarded-Encrypted: i=1; AJvYcCUREfMkUC/5gNWTC0akz+CtiWJC4iUBS8SFKKpj2xTlQxyPryilaYhSGlAPDobjrBnVFRkfoQNnj9K7VQFbTcjYLiDzeSOIT6wrObrQt+73SwRAkg==
X-Gm-Message-State: AOJu0YzKfvpe6Vn5YCt3IFI++8Iq5QU1UuZXoM0V0b6aGq9krYqHdExR
	1pYs96uOKsGZTLjk7ECBCiuz+jZ3rdfCEpN+v1qsw6mx2u1gB/pVuvCWInNwrM95QbcJ6aMJxE9
	Ewh0FvaWeZAQTMaNQRb0GGSCinauSbCrUE8EvWxTUbNusOMBy7+lsaQWtF3CS0OU5vtQ+oeU=
X-Received: by 2002:a50:aac9:0:b0:56b:dd0e:9efc with SMTP id r9-20020a50aac9000000b0056bdd0e9efcmr4998313edc.38.1711377733600;
        Mon, 25 Mar 2024 07:42:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRLQNhiRa8ppxcfMI72+lnofbjam8B8WE2Ycdl8Cxt1uXmB5QRGI2z4FzNFqxon5LflPMetg==
X-Received: by 2002:a50:aac9:0:b0:56b:dd0e:9efc with SMTP id r9-20020a50aac9000000b0056bdd0e9efcmr4998287edc.38.1711377733144;
        Mon, 25 Mar 2024 07:42:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g7-20020a056402320700b0056c0996bf72sm1794239eda.83.2024.03.25.07.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 07:42:12 -0700 (PDT)
Message-ID: <7307a54e-b18c-497c-90d2-9c272f6e634e@redhat.com>
Date: Mon, 25 Mar 2024 15:42:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] platform/x86: hp-wmi: use sysfs_emit() instead of
 sprintf()
Content-Language: en-US, nl
To: Ai Chao <aichao@kylinos.cn>, ilpo.jarvinen@linux.intel.com,
 u.kleine-koenig@pengutronix.de, mario.limonciello@amd.com, jes965@nyu.edu,
 alexbelm48@gmail.com, onenowy@gmail.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240314063703.315841-1-aichao@kylinos.cn>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240314063703.315841-1-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/14/24 7:37 AM, Ai Chao wrote:
> Follow the advice in Documentation/filesystems/sysfs.rst:
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
>  drivers/platform/x86/hp/hp-wmi.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 630519c08617..5fa553023842 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -681,7 +681,7 @@ static ssize_t display_show(struct device *dev, struct device_attribute *attr,
>  
>  	if (value < 0)
>  		return value;
> -	return sprintf(buf, "%d\n", value);
> +	return sysfs_emit(buf, "%d\n", value);
>  }
>  
>  static ssize_t hddtemp_show(struct device *dev, struct device_attribute *attr,
> @@ -691,7 +691,7 @@ static ssize_t hddtemp_show(struct device *dev, struct device_attribute *attr,
>  
>  	if (value < 0)
>  		return value;
> -	return sprintf(buf, "%d\n", value);
> +	return sysfs_emit(buf, "%d\n", value);
>  }
>  
>  static ssize_t als_show(struct device *dev, struct device_attribute *attr,
> @@ -701,7 +701,7 @@ static ssize_t als_show(struct device *dev, struct device_attribute *attr,
>  
>  	if (value < 0)
>  		return value;
> -	return sprintf(buf, "%d\n", value);
> +	return sysfs_emit(buf, "%d\n", value);
>  }
>  
>  static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
> @@ -711,7 +711,7 @@ static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
>  
>  	if (value < 0)
>  		return value;
> -	return sprintf(buf, "%d\n", value);
> +	return sysfs_emit(buf, "%d\n", value);
>  }
>  
>  static ssize_t tablet_show(struct device *dev, struct device_attribute *attr,
> @@ -721,7 +721,7 @@ static ssize_t tablet_show(struct device *dev, struct device_attribute *attr,
>  
>  	if (value < 0)
>  		return value;
> -	return sprintf(buf, "%d\n", value);
> +	return sysfs_emit(buf, "%d\n", value);
>  }
>  
>  static ssize_t postcode_show(struct device *dev, struct device_attribute *attr,
> @@ -732,7 +732,7 @@ static ssize_t postcode_show(struct device *dev, struct device_attribute *attr,
>  
>  	if (value < 0)
>  		return value;
> -	return sprintf(buf, "0x%x\n", value);
> +	return sysfs_emit(buf, "0x%x\n", value);
>  }
>  
>  static ssize_t als_store(struct device *dev, struct device_attribute *attr,

