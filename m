Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A63A14F102
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jan 2025 09:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736587784; cv=none; b=KNriBcTjHD882uaUSuO5N+TCqz2FtM3mWfS3m77pTK0U0HHQEKzHT+oRbaWfqBBChiCbaKnj2Zb6P3Lb1aKh/qfa7PPZr5TVgGEzrJa7jQph5q0FlqGKZE9Orx1fpDg5iW8w7lN/pWaEuhtRbAcy0mixaSDtdj119LzosfeFCDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736587784; c=relaxed/simple;
	bh=2YMxAITK7y+VI3ksX3x/70QZ2EZ3uv06sHdRGIZ1bxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LRhqggbpFHZDk9nLNj4XajerecirkSqcQoo1BptCMaJ1t4gQkCYTM13WZQUokMsiVTmbvN3iG9ikGaXrNCbas9bq2rigmZ4vORTq7jpDMtgdul9vLbpeWwDstI45QG67nsAsxf/yqpJsI3XEMHgFdNZ9fEpdovMZ6H2APoTXgDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ULubeM6M; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ULubeM6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736587781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZYGhb39yY3FBEymOQw4ukiZDpYRY+agebQPORW7MYls=;
	b=ULubeM6Ma2FtvDr1VvhvHGAD987O/ypovwKTmKSvxChPOGiNka2bNiqP46g717lpbU1z35
	cALH4NsH0EK74b/zTBEe9wXqE//8b8vk2VLy5TS5KmbKa5P9Bahh930hblfK7wfS0NnaMJ
	Enapt5AqsK0ogJWwb0b6QhUh/UuYsoQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-FHcC7JUJO1Ogi9fX0EY5Lg-1; Sat, 11 Jan 2025 04:29:39 -0500
X-MC-Unique: FHcC7JUJO1Ogi9fX0EY5Lg-1
X-Mimecast-MFC-AGG-ID: FHcC7JUJO1Ogi9fX0EY5Lg
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa67855b3deso239289666b.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jan 2025 01:29:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736587778; x=1737192578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYGhb39yY3FBEymOQw4ukiZDpYRY+agebQPORW7MYls=;
        b=F8Ykxn9VPEZHHQuP2muRKpamNNk5haTRJ2SO660UW4kuAx/9rwOzr8CZnZaYTr4aeC
         bGtBdrUVoGPkl6vqTxf/XYELK7QVZ+TtDzwoQjv2WHOI9phZwLHCNlMabtnmdyB7Ksif
         oOX7CC2ZBIHu+Fky1xZZ9aWemHY9CIjKzhHqTnih20gISOMLHWYV0eB0xrWPsLsfMdT/
         Imh7OmskL6UY45pqPlZHsuHMkmt77+fAxH0YStPDU3XUVdCtEH2BN9xTce/MH+vY+7AO
         gegyfxt8YmFOlGy28hkPSeeYbJX8Mh/uMmUodfOesZ84c7FmZezmw9twfAIfTEflrGVH
         uxbw==
X-Gm-Message-State: AOJu0Yzcyfxs386afQzXAHxbSGRRYSd/hrppYiUy1wa/tUJNmFHcaBuP
	vYGorkcWbG0G4m3pDSs9muKIMrUNQ4pFscD8r4nBtDWdYJdv8Dt1O76NYzospbp88anba4v6s6l
	28uW2OeXXeMpeVBaZnGmJ07n4rCdgETxZWdxtYeZRWW5CR1h+VBpAETKht+d4eCVgNkydIIk=
X-Gm-Gg: ASbGncsIhtyNEjV1fuiEgJJzVNJkck1yKd6Q98s+J8qNc7RA6jFKGbq24AT71iAG22U
	uPSHcGf7XGGncGWTzutJs818BHqut0BdEUpLznfGoQLr1q9Tpi20vCgyRBpxyOJESMCnPe1F9OH
	LmVW1Y7XXftyHlKtvvTagMeyzpxFPVXamQ8jsUxWKEiDNsxbDRkYwAo5NWsKX9KZhSZydmMUPpJ
	46nckRzN410BszTtW7rKmZ2xMC3/JIEgNVfSbBM6wf5iOgygrQfwk0U/7dUGVUTFMjzGxERLniy
	MJVXOm6c1suktcvvEDPx9uhxYASPiGHo5dWOnnZDIJpnQ6k8spk4QbAN0Wc34Z+0nyeNOEXhi2f
	c635vhrNSifQ4ecvT+Sc+X3qpkmhzAv8=
X-Received: by 2002:a17:907:2d8d:b0:aae:c159:9e10 with SMTP id a640c23a62f3a-ab2abc78decmr1389074466b.42.1736587778646;
        Sat, 11 Jan 2025 01:29:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFle87LVb1MvSXRzvMCsPFfXmkVHuP3teDaLIx7aFMQsSFdqB/oGI0qDYdA7Ley+pwqdap4WA==
X-Received: by 2002:a17:907:2d8d:b0:aae:c159:9e10 with SMTP id a640c23a62f3a-ab2abc78decmr1389071866b.42.1736587777873;
        Sat, 11 Jan 2025 01:29:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9136045sm251971966b.89.2025.01.11.01.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jan 2025 01:29:37 -0800 (PST)
Message-ID: <0cb76614-fdba-47aa-b4c8-f001a303406f@redhat.com>
Date: Sat, 11 Jan 2025 10:29:36 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: dell-uart-backlight: fix NULL pointer
 dereference in probe
To: Chenyuan Yang <chenyuan0y@gmail.com>, ilpo.jarvinen@linux.intel.com,
 rafael.j.wysocki@intel.com, acelan.kao@canonical.com,
 u.kleine-koenig@baylibre.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 zijie98@gmail.com
References: <20250111054717.1830450-1-chenyuan0y@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250111054717.1830450-1-chenyuan0y@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Jan-25 6:47 AM, Chenyuan Yang wrote:
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
> 
> Fixes: 484bae9e4d6a ("platform/x86: Add new Dell UART backlight driver")
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>

Thank you for your patch.

> ---
>  drivers/platform/x86/dell/dell-uart-backlight.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
> index 6e5dc7e3674f..41162ff1686b 100644
> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> @@ -283,16 +283,16 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
>  	init_waitqueue_head(&dell_bl->wait_queue);
>  	dell_bl->dev = dev;
>  
> -	ret = devm_serdev_device_open(dev, serdev);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "opening UART device\n");
> -
>  	/* 9600 bps, no flow control, these are the default but set them to be sure */
>  	serdev_device_set_baudrate(serdev, 9600);
>  	serdev_device_set_flow_control(serdev, false);
>  	serdev_device_set_drvdata(serdev, dell_bl);
>  	serdev_device_set_client_ops(serdev, &dell_uart_bl_serdev_ops);
>  
> +	ret = devm_serdev_device_open(dev, serdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "opening UART device\n");
> +

serdev_device_open() resets the termios settings such as flow-control,
so you need to move the serdev_device_set_baudrate() and
serdev_device_set_flow_control() calls to after the new location of
the devm_serdev_device_open() call, just like commit 5e700b384ec1
("platform/chrome: cros_ec_uart: properly fix race condition") does.

Regards,

Hans



>  	get_version[0] = DELL_SOF(GET_CMD_LEN);
>  	get_version[1] = CMD_GET_VERSION;
>  	get_version[2] = dell_uart_checksum(get_version, 2);

