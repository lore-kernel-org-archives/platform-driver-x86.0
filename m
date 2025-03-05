Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF37235BE4
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Mar 2025 11:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741173750; cv=none; b=CNE1SU9XhDK7MHuwLYwAAzoQd9RnH6W8wbK1i8iTa3wOzh+1YlpfbRPTzRccvwS8c/V+fgVnCDXCLlL3S890GPWlq6SG/+EnMJD5NzKmPZ9qDo/PhGqSdUwUB1NtIyS6u/X8X1EQlq8SRbErnAt+W+bgB5FbGloVaVf52mj0830=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741173750; c=relaxed/simple;
	bh=PL/unZm/ZH0RJcs9KK1xQaDQzz34LrfPAoVz0gOcWGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZCVLic/MCSsCm0a6XPaKSy2fnnIZwtrh5z66d2nqVASaBQsC0J+Bnsaj2TqVN5KCJZr47i7wtRUk1tqKNFCpg3htaC7DZ+OWQvnhOIXPQ83kLJr9AN8aoUVYdenxTj+RhzxXSaT6/Spo0w8TsLcX64G9ab0dugTAg527FGm69q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ryg0BwPd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ryg0BwPd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741173747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4EynjiZwwX8iiFZPJPCgUXCVQenFN9tz9ovB65nknNg=;
	b=Ryg0BwPdRHR29nPAkYvsg1IodzqtTLDPmd3lOh/A8gZeL1zRn2b8OGtojFAUE/Hv9noBgQ
	cUrdTEeFJrr8xdZh81bUymWRqMPgRplqX5qFEOsj85jmTgxAsQYcquEQ4Zx6Cl5Dk6twir
	sjLCD5bcGSfRZh/LCkkEJXEdKPM4syc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-tzeJWEbmP-K8q6HWrh5C9Q-1; Wed, 05 Mar 2025 06:22:21 -0500
X-MC-Unique: tzeJWEbmP-K8q6HWrh5C9Q-1
X-Mimecast-MFC-AGG-ID: tzeJWEbmP-K8q6HWrh5C9Q_1741173740
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e583e090deso2780459a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Mar 2025 03:22:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741173740; x=1741778540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4EynjiZwwX8iiFZPJPCgUXCVQenFN9tz9ovB65nknNg=;
        b=Ybzz5omIvRZEc6X4xrunkBT2pa1mnlYQodTCDm6xDnLl9gPQELmrYZNwwTYgPwxadP
         2eN2T+0kjaV+6Acyvjm7otkFNkwrkKeC6CrSpE2/qDUuJ3EAuwd1DOq8IwKzsgPvNoUy
         XPGIGkS8Iw5YRwDch7AV6sFsYef9zhuYUQmyXWOhluEBxvBB8OHNayEe/0I82w/R7SO6
         MkE+uGWHqeswC6AVjNKTO5/kOXF7r7yL5ISBxYm3DiC0rxx0fS2tJJ6PCljN52yaZenk
         iV6+levHJzivZvSy3+V3vvdM1CNJBVh4aFEDPSYpr1urHLH08fNeWOQ2DmZ1f+UJ5QIn
         OWuA==
X-Forwarded-Encrypted: i=1; AJvYcCV2f4BPinGWirTfQNaEsaJywXH0nDMxdujgTSn/hguina7tDIApFGWoyLmTT349y33KkuvVBIP0XtN77mzbPVILOgmu@vger.kernel.org
X-Gm-Message-State: AOJu0YynREf073a5vycduE3aTP6SoXJ4dnVv3t0I7CnLT95nb/04lnub
	bVUw6s3q/YU+yYPddKyT3CCExZ1zL2ODxHtS3niLEKMFgcKimCUWH7CopIbViPdix277bPzqJYU
	NzgwDpsSx3EKYTIHYvfsTxjC0NoV9FR7SGLH3QIWI00EvSGqbBXDCTfk+827WkVNDGGHrhgA=
X-Gm-Gg: ASbGncuJ3Odw6GaD6zREqwICt3CH7PMflb+b9udrKQBoU4uPoCY7644sohawwEfNNCO
	0vMQ3VT8B+FsS3mz4pL7tMnzEf+eHg7mAkHWpKZqpNy1BQXsQie8MoiTmRtcgg0vvSqxqkdjY45
	oFqNhM0Ti5p+alVITWYhQPj+m5vaLsbfdcDwd8ZFqmW0x5AefyiL8BTlZM0RQhQ+PQEb1z2s8Cd
	MAP11r8cOhJZvhh2uqQGWsgG+CCJ2HS5tG03F6wX7r0l33lSxe/A2A3oUaxWUTSM6iDEZkphTOY
	P2jIlCK2C47XF/5bZN6c8EvuzNeIg3XPUOtRC5+UtF9b/M7RCifBYJKZyUwJqQ9E0USxlmwJjww
	avc9jtTKTxpeG28XuaGhzMjYnJ1XcdMdBSaBjv4bNeOkLbWtXMs/XZNBdDhcIQKXepA==
X-Received: by 2002:a05:6402:2811:b0:5e0:9254:c10e with SMTP id 4fb4d7f45d1cf-5e59f3c5f17mr2555790a12.11.1741173739716;
        Wed, 05 Mar 2025 03:22:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtcx8PqIt8taHhLXx1S9ltHSnaqYkEwukF+XNfDCZA3U76w5JdSb35Lct6h2VK3o2px+7X4A==
X-Received: by 2002:a05:6402:2811:b0:5e0:9254:c10e with SMTP id 4fb4d7f45d1cf-5e59f3c5f17mr2555772a12.11.1741173739399;
        Wed, 05 Mar 2025 03:22:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3bb7251sm9377742a12.39.2025.03.05.03.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 03:22:18 -0800 (PST)
Message-ID: <b8fb489b-bc7b-405a-8ff9-f7438d855c94@redhat.com>
Date: Wed, 5 Mar 2025 12:22:17 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger:
 Make symbol static
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250304160639.4295-1-ilpo.jarvinen@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250304160639.4295-1-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On 4-Mar-25 5:06 PM, Ilpo Järvinen wrote:
> Sparse reports:
> 
> lenovo-yoga-tab2-pro-1380-fastcharger.c:222:29: warning: symbol
> 'yt2_1380_fc_serdev_driver' was not declared. Should it be static?
> 
> Fix that by making the symbol static.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> index a96b215cd2c5..25933cd018d1 100644
> --- a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> +++ b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> @@ -219,7 +219,7 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
>  	return 0;
>  }
>  
> -struct serdev_device_driver yt2_1380_fc_serdev_driver = {
> +static struct serdev_device_driver yt2_1380_fc_serdev_driver = {
>  	.probe = yt2_1380_fc_serdev_probe,
>  	.driver = {
>  		.name = KBUILD_MODNAME,
> 
> base-commit: 432c2adb9e2f84f81c4b218acb07a2cd3dce64a9

