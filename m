Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586DA233139
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736756809; cv=none; b=bkQ6ZSgpUEXFSaxASkdkHEphcmMTjvlHxTZUvAX2CkIPGadMVEuorAkG8PGK3TAAWABHCp/5ccoHdV0CgQuNDYewi1zfZdO00tgnHM9OyJaWv+SzUqWuUxe3e55/UHMoRZ2M96srnuqHFx3shFsUKANFG0xUmAsTKlBaHcD/E50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736756809; c=relaxed/simple;
	bh=i5zD6dR1dmpK7v4v81V76xoqblVbKQVqRjfEmxPWkcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H3sj1keZVY2ZjbaL6JHMSekf6Lr0jYpNxyhc7A6pobyAy4owDu1fli07SayoMKg0WV6kx7pYFkQgpj+BxV9l39osUiki8LXCJzWi+0FMNEjwCjg8Q2vixIEOVkh3u484O5ivAk4ZBr10LrohmqOCbWfv4N3AhWEkgy9tpizNfVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B1WfWUF/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B1WfWUF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736756806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IozgCIuCRtFw3O7gk4V7WGjw9BsPbW9CxBefwmeOpzo=;
	b=B1WfWUF/suays2fUQXt83Ex6x56oPK8BCVfZIS96kmoJIcSG7ESUcPEXTvJnkiTfUpGyDY
	o3KCQzWcmjEFTODqkPeHTjYJTtHRtD0nbMo7frexhhpeebTZMTPx0SK9npqijsKRqhvgzK
	N/E0NU6vQRwf+/jpvimHEsRHQCYhwcs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-Ub5f8CY0O1C2Z9KtRhPv7Q-1; Mon, 13 Jan 2025 03:26:44 -0500
X-MC-Unique: Ub5f8CY0O1C2Z9KtRhPv7Q-1
X-Mimecast-MFC-AGG-ID: Ub5f8CY0O1C2Z9KtRhPv7Q
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa622312962so380087366b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 00:26:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736756803; x=1737361603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IozgCIuCRtFw3O7gk4V7WGjw9BsPbW9CxBefwmeOpzo=;
        b=Evna7h4aRVG8XhGDw+Rfay2zQhFp/n35G87gTRhovElhPJeai8C1vqiOwRKCJuatVe
         9zMeaFEdRzlMuiCcMcXgT5TLUWUme00p5VZAt5k8hEbb88pKktNXoq8jmBkQjzmNeiIt
         6qvUPEO1j6hWx1ktW+4odvg8omRWyy6UTtDMbcGY9pR1z0ggEaYNhjSNz9cFgrJWeF3E
         wGQLc7e+wJaeBw/0tF4qZsqF1UfID1Cxm+skVbL8XeRAqPnmx+vDQ7Aza2RRjqb/CtdB
         ys1n0CurrMVRL0y+cTecPFxB7GfApFGCDE0F+MrknpSQVlq426Pv3aCy5fSuT8QwixSm
         xkdA==
X-Gm-Message-State: AOJu0YzfpnrlOQ0ot2CDtDvFU0akhQZwQ/Ygke3AHzBvUFg8n/Ak0HC1
	sOtMOQhLvNb7J1o0LlT8P663oo09pJc9VRv0rxfISohacHbjC6+fQ7/OPBdB6PTK1dZeUWvS3c+
	vd3HeAaVSnhPt2nKe4OjTrpKrAxHsnv/hFWXw2MQzfuBQuU8hW1N6I+oP4G9xjGFgEvoEPkQ=
X-Gm-Gg: ASbGncu7sfczj3Am78l21i+fokTC3RRvl15dEbrQr35ZE2WF/9FT8NMsq9NMecpowCY
	HMI04xMuVrk2XkFYGotEVvxxlpNtens1KEnujI00iyA5a/3gLLjoBkzcQ1itRENPdhkYO8JlMC5
	OnF9VjBmJDRlKVEwJaG+679L9NHB1J08AYxNfz9AsOfhbiyHAonddoW/8TyaMxOJu9CZGcRIRbU
	75XqXePLNgsuKwZ8EXZRoi6n7b3d/95BnvsEPjYyTgnPTuHg4+d/cZysH9k
X-Received: by 2002:a17:907:6d1a:b0:aaf:ab71:69cd with SMTP id a640c23a62f3a-ab2ab558b75mr1917637266b.20.1736756803471;
        Mon, 13 Jan 2025 00:26:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwZgHFVxFYDB23A1IPJkQKxFc9ZJ96CwJeYtxTwoXAyP1H7xIscXWZlEGhswvTIelsRuJzkw==
X-Received: by 2002:a17:907:6d1a:b0:aaf:ab71:69cd with SMTP id a640c23a62f3a-ab2ab558b75mr1917635266b.20.1736756802963;
        Mon, 13 Jan 2025 00:26:42 -0800 (PST)
Received: from [10.40.98.179] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90d7432sm464991866b.49.2025.01.13.00.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 00:26:42 -0800 (PST)
Message-ID: <af6ef60f-d47f-4840-8466-4605ad59716f@redhat.com>
Date: Mon, 13 Jan 2025 09:26:41 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: dell-uart-backlight: fix NULL pointer
 dereference in probe
To: Chenyuan Yang <chenyuan0y@gmail.com>, ilpo.jarvinen@linux.intel.com,
 rafael.j.wysocki@intel.com, acelan.kao@canonical.com,
 u.kleine-koenig@baylibre.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 zijie98@gmail.com
References: <20250111180118.2274516-1-chenyuan0y@gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250111180118.2274516-1-chenyuan0y@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Jan-25 7:01 PM, Chenyuan Yang wrote:
> The dell_uart_bl_serdev_probe() function calls devm_serdev_device_open()
> before setting the client ops via serdev_device_set_client_ops(). This
> ordering can trigger a NULL pointer dereference in the serdev controller's
> receive_buf handler, as it assumes serdev->ops is valid when
> SERPORT_ACTIVE is set.
> 
> This is similar to the issue fixed in commit 5e700b384ec1
> ("platform/chrome: cros_ec_uart: properly fix race condition") where
> devm_serdev_device_open() was called before fully initializing the
> device.
> 
> Fix the race by ensuring client ops are set before enabling the port via
> devm_serdev_device_open().
> Note, serdev_device_set_baudrate() and
> serdev_device_set_flow_control() calls should be
> after the devm_serdev_device_open() call.
> 
> Fixes: 484bae9e4d6a ("platform/x86: Add new Dell UART backlight driver")
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> CC: Hans de Goede <hdegoede@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/dell/dell-uart-backlight.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
> index 6e5dc7e3674f..bcc5c0f3bb4d 100644
> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> @@ -283,6 +283,9 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
>  	init_waitqueue_head(&dell_bl->wait_queue);
>  	dell_bl->dev = dev;
>  
> +	serdev_device_set_drvdata(serdev, dell_bl);
> +	serdev_device_set_client_ops(serdev, &dell_uart_bl_serdev_ops);
> +
>  	ret = devm_serdev_device_open(dev, serdev);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "opening UART device\n");
> @@ -290,8 +293,6 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
>  	/* 9600 bps, no flow control, these are the default but set them to be sure */
>  	serdev_device_set_baudrate(serdev, 9600);
>  	serdev_device_set_flow_control(serdev, false);
> -	serdev_device_set_drvdata(serdev, dell_bl);
> -	serdev_device_set_client_ops(serdev, &dell_uart_bl_serdev_ops);
>  
>  	get_version[0] = DELL_SOF(GET_CMD_LEN);
>  	get_version[1] = CMD_GET_VERSION;

