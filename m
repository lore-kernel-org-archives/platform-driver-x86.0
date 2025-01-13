Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F95233139
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 08:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736756823; cv=none; b=jvQu/RrzI2qaZTsh50tLNN/v1ojGJITZ7R0WEkAIOIicLZmALhb3zAtaamFSMYzbVc1JvNDUgbBCtjOC/VRV5wMex3cvjiKwiv7eA0S3zpuH6WAkLvjQg+NECcs/nTfWU5Ngg+k1sfvLV8J/VeNoon+F3boE9tCz0t34o8m6+rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736756823; c=relaxed/simple;
	bh=l9OHTObN7XQ5JUO42fVJHPwm8XDBJkQvoeU8aITtzts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqBucrmB5T/OupJQhXpvO8hAgIVq58cOsFdV/XRY+X5Kup4qYGrp9D7wMiYE7mTnOwa85GXrlFzZGJsCtScAA0gAARL8nnpjxj4Hp7KT2jA20Yol0Tdka5w7N4XxFrLOhVKApItJVkY2BOf9liL9nsOtqo3KFYA3n2awxc+n4RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bx/oHWUC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bx/oHWUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736756820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NZEaafJZstJIFByjDm+P6F0jQ+mx9f+pSKn8vl03MSU=;
	b=Bx/oHWUCFUAhOgV6Rj/cwGK10xQmKWsbBw/8RdhcYdixoU2KVxjw8knkdhBiwpG47XmeJz
	vwJ/MS9ZFobKV3SXahU+mEMhFJqJNcP7dedNwFGgFDrixeH8H9vH/9fonFF8pYJLCb8vHc
	wzGWIYXPgfWiY1zL98C4Tl1TflEAUWA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-P1-vOtgHPt-oz_u93NC9mg-1; Mon, 13 Jan 2025 03:26:59 -0500
X-MC-Unique: P1-vOtgHPt-oz_u93NC9mg-1
X-Mimecast-MFC-AGG-ID: P1-vOtgHPt-oz_u93NC9mg
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa6a87f324cso349529366b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 00:26:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736756818; x=1737361618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZEaafJZstJIFByjDm+P6F0jQ+mx9f+pSKn8vl03MSU=;
        b=rzWA8/KIG0V9wzOSd1eT4fszmYsOQYT9ko6AQcQGDWEvDmEudJNL6UtSn/OZ9fxkSb
         vjsbls5ad8jTYj9DUARJJW3RmUPylt5P+qpzfxG+gu9KoAQzr3AG/2IacvQCNAHVMs5+
         76By0AEQbYq48COPFXojzSBZI5JExgTxcXLepYnHcJG4Xuv4kCD0FW5E/zf2GfAV6VbS
         nmxuaO6oSEXlD1AiluBV58vHSacU34GpkjhsCecTY7iTmk108aPdaLO/o+R0+rH2m/Ia
         xhvqCAPobNDVo8iiyi6BdOFOlbm6rGUWZDOZ5z0v9hB/5KW3AA7cGfVZ8m3i+oHA/kkI
         Itng==
X-Gm-Message-State: AOJu0YxtxGfKJxKkz/RKURQGxh2cAmP7nqgS+5xDOZ0nXEhaZuiG10HC
	yz7uEIjxkmPTjxGpN1NmfAyBHGC675iy2bhtH0fLKTRK1TXn2seNZOZoi3WqrUwLNK5MXOVaThL
	9pwCRwOAMtIbbZScj9DaQ1NkyzNObidMHv2zrpzui+JU9ffdgcFRObdOl7yTssEwUKmsyG+0=
X-Gm-Gg: ASbGncvBA+0VEHSA5g4dfgj8AQAphvkT7JdUgmpSnxrvO7o/AqpUVt/7C9/yj7C7X88
	0G8pujzrpsubXgEq7V4BjrFATbiDu5/loCjun0SyTnqLoG+UI4ET7VdOqTnHylBDnRBfvSroOyj
	QpiXm8BQC/9iUypy9/PQctUSiv98qLVsUoQlnalolSooKw9Do4I0q0+ERxSK8dFY83t8UOn94Ho
	a+NBrb8q0xB1VhV/uSFiSuMRxEckb9R+L6fbVbFnwxEnrccWFJgK8V9ayaw
X-Received: by 2002:a17:907:720e:b0:aa6:6c08:dc79 with SMTP id a640c23a62f3a-ab2ab741567mr1830307866b.35.1736756817743;
        Mon, 13 Jan 2025 00:26:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUSvV7l8qqUlR5kHhwR9j1q87q1wKuHv4gJ7LeVt3N13BcvoWZVPKi19WGFJEJYLWtuyIytA==
X-Received: by 2002:a17:907:720e:b0:aa6:6c08:dc79 with SMTP id a640c23a62f3a-ab2ab741567mr1830304466b.35.1736756817291;
        Mon, 13 Jan 2025 00:26:57 -0800 (PST)
Received: from [10.40.98.179] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c906009bsm467355266b.25.2025.01.13.00.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 00:26:56 -0800 (PST)
Message-ID: <779aa078-96b6-4f97-821f-4454e65ab7bf@redhat.com>
Date: Mon, 13 Jan 2025 09:26:56 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger:
 fix race condition
To: Chenyuan Yang <chenyuan0y@gmail.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 zijie98@gmail.com
References: <20250111180951.2277757-1-chenyuan0y@gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250111180951.2277757-1-chenyuan0y@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Jan-25 7:09 PM, Chenyuan Yang wrote:
> The yt2_1380_fc_serdev_probe() function calls devm_serdev_device_open()
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
> 
> Note, serdev_device_set_baudrate() and serdev_device_set_flow_control()
> calls should be after the devm_serdev_device_open() call.
> 
> Fixes: b2ed33e8d486 ("platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger driver")
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> CC: Hans de Goede <hdegoede@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> index d2699ca24f34..a96b215cd2c5 100644
> --- a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> +++ b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> @@ -199,14 +199,15 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
>  	if (ret)
>  		return ret;
>  
> +	serdev_device_set_drvdata(serdev, fc);
> +	serdev_device_set_client_ops(serdev, &yt2_1380_fc_serdev_ops);
> +
>  	ret = devm_serdev_device_open(dev, serdev);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "opening UART device\n");
>  
>  	serdev_device_set_baudrate(serdev, 600);
>  	serdev_device_set_flow_control(serdev, false);
> -	serdev_device_set_drvdata(serdev, fc);
> -	serdev_device_set_client_ops(serdev, &yt2_1380_fc_serdev_ops);
>  
>  	ret = devm_extcon_register_notifier_all(dev, fc->extcon, &fc->nb);
>  	if (ret)

