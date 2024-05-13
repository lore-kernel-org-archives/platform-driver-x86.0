Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A048F14B949
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 11:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715601314; cv=none; b=jzbffw6AoLAKaZENJMVD5+UsYfHlZuWs6b7ssOahs0A8Qt+//hsxHrL54JZUuhl9H76zC34cXDpckchMoRch0u9HBE8OPgmpf7DO/1+x/KTAoq5gv4XulpO+DGBNYUuM3u4F2IspAyyMetUNqlDmz1MVZmq6jRp62tzcq+ssgdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715601314; c=relaxed/simple;
	bh=KQlIODRIAwhfMkF+svGRoQjGBP7F6iuEOCJQ2nj9DDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2mLfLMkHF/gfYPgbhR1Yu/EMc2rDbMkuIhApp6Ze8Hy9lgJo8XhBW73Rf0hQKCKfltj8ZwSH/ujZPofxjghvzLv8hFYana5SliKBetQSCOByOCSUffRpEIKaiUQvgrBHoBkSMOwjhvBjhAAeHSjFoi0KukYHBH/KXaedTAW7ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mplv78Lu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mplv78Lu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715601310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/Fae/1ym0klvsKzuPgGEHvQ9spkHPkxZncwd90WiW4=;
	b=Mplv78LuXlpOi1DIrTdc6j9IlzQeUmuqgbS8nrQUOA0h8NPz8Mf90Q9ZYffX7BAyH/abTJ
	0CUNDFsm9NaMm08tzF4Q7RNtu4yzZUy/xzvB5ltvgt43Fz4fKi+L7ZCqO2E8DyNL+JvHQH
	UaJW752f8OChsoUciefCMqjwkB5YcNw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-fCSLjjHWPv63ZT7vH1oMIw-1; Mon, 13 May 2024 07:55:09 -0400
X-MC-Unique: fCSLjjHWPv63ZT7vH1oMIw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a51fdbd06c8so318687866b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 04:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715601308; x=1716206108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/Fae/1ym0klvsKzuPgGEHvQ9spkHPkxZncwd90WiW4=;
        b=DNqGyWOfCb9saAijcABmI9SGKGF2RluZ8sMxKL4cj8fPBx0Jb+sYyWz51M3HJKr9Wi
         tHT9NC91jnQIcolevKkyLY2/ntw2lDAz1dt0LVoC7cNVRz+BYG+0Brf8cwFabSim/hoU
         Hu1PlOg9fiJXJcHlHT/32dNldyYLDOQgHiHDmjIXkQT9Xdebl9JnXulwZBT8nNfheoPk
         xAb29mCNnPg6GzTJ45FAlBG+v1kNOKUozuEx96CRXBAgYe2wqwgYh3ClScXWvFgZK3xj
         Tc45J90RXIUBls9nChJiidO3KEIpn7tOq5cmRS85mpgyO/Zhund7fZXa8cYapW0yA4gD
         nWvA==
X-Forwarded-Encrypted: i=1; AJvYcCUpEhRZlfYvlGL+tM/u/zQZr6VQ+DALtNOlI/BTk55f7olNYo8TWmoW7VCdI8Zbc1BwbT0yKupVsGCr/P8MUJC8dFjt7QR6XPPIirZbU3Yuuu7iew==
X-Gm-Message-State: AOJu0Yy77VMoqIop/qr92ygvJc3PQyPFKBR8cx/ku0grc3LEte0/m3xp
	lwTMLok/CqsDpjHVRM2CTzt8CzIda7niGadQRqiR8HxsNtFrCz+NnQ2qxC1uiTLhGS7jJpYqHYz
	HuAWr6xUpZlC1nvbLHv5hzw1rmFa7TdPVQzrl4nyhBAYd01lc2u9qNzyiZMT8jOG+WcB4ZD8=
X-Received: by 2002:a17:907:31c2:b0:a58:eba0:6716 with SMTP id a640c23a62f3a-a5a2d66a40bmr849997966b.60.1715601308069;
        Mon, 13 May 2024 04:55:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpKpjCc1JrU+4s9UcPB4u3qnTfouEBsIyb1FpN4T+xuY9y1xonGwdJDL7WqOesSOg/Ya4hLw==
X-Received: by 2002:a17:907:31c2:b0:a58:eba0:6716 with SMTP id a640c23a62f3a-a5a2d66a40bmr849996966b.60.1715601307707;
        Mon, 13 May 2024 04:55:07 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b17754sm585084566b.192.2024.05.13.04.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 04:55:07 -0700 (PDT)
Message-ID: <1ca0f892-72be-44d2-9a57-2bf27de305a0@redhat.com>
Date: Mon, 13 May 2024 13:55:06 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] platform/surface: aggregator: Log critical errors
 during SAM probing
To: Weifeng Liu <weifeng.liu.z@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20240505130800.2546640-1-weifeng.liu.z@gmail.com>
 <20240505130800.2546640-3-weifeng.liu.z@gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240505130800.2546640-3-weifeng.liu.z@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/5/24 3:07 PM, Weifeng Liu wrote:
> Emits messages upon errors during probing of SAM.  Hopefully this could
> provide useful context to user for the purpose of diagnosis when
> something miserable happen.
> 
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Weifeng Liu <weifeng.liu.z@gmail.com>

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
>  drivers/platform/surface/aggregator/core.c | 42 ++++++++++++++--------
>  1 file changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/surface/aggregator/core.c b/drivers/platform/surface/aggregator/core.c
> index 7b1871eb7a6f..046fa63446bf 100644
> --- a/drivers/platform/surface/aggregator/core.c
> +++ b/drivers/platform/surface/aggregator/core.c
> @@ -618,15 +618,17 @@ static const struct acpi_gpio_mapping ssam_acpi_gpios[] = {
>  
>  static int ssam_serial_hub_probe(struct serdev_device *serdev)
>  {
> -	struct acpi_device *ssh = ACPI_COMPANION(&serdev->dev);
> +	struct device *dev = &serdev->dev;
> +	struct acpi_device *ssh = ACPI_COMPANION(dev);
>  	struct ssam_controller *ctrl;
>  	acpi_status astatus;
>  	int status;
>  
> -	if (gpiod_count(&serdev->dev, NULL) < 0)
> -		return -ENODEV;
> +	status = gpiod_count(dev, NULL);
> +	if (status < 0)
> +		return dev_err_probe(dev, status, "no GPIO found\n");
>  
> -	status = devm_acpi_dev_add_driver_gpios(&serdev->dev, ssam_acpi_gpios);
> +	status = devm_acpi_dev_add_driver_gpios(dev, ssam_acpi_gpios);
>  	if (status)
>  		return status;
>  
> @@ -637,8 +639,11 @@ static int ssam_serial_hub_probe(struct serdev_device *serdev)
>  
>  	/* Initialize controller. */
>  	status = ssam_controller_init(ctrl, serdev);
> -	if (status)
> +	if (status) {
> +		dev_err_probe(dev, status,
> +			      "failed to initialize ssam controller\n");
>  		goto err_ctrl_init;
> +	}
>  
>  	ssam_controller_lock(ctrl);
>  
> @@ -657,14 +662,13 @@ static int ssam_serial_hub_probe(struct serdev_device *serdev)
>  	if (status == -ENXIO)
>  		status = -EPROBE_DEFER;
>  	if (status) {
> -		dev_err_probe(&serdev->dev, status,
> -			      "failed to open serdev device\n");
> +		dev_err_probe(dev, status, "failed to open serdev device\n");
>  		goto err_devopen;
>  	}
>  
>  	astatus = ssam_serdev_setup_via_acpi(ssh->handle, serdev);
>  	if (ACPI_FAILURE(astatus)) {
> -		status = -ENXIO;
> +		status = dev_err_probe(dev, -ENXIO, "failed to setup serdev\n");
>  		goto err_devinit;
>  	}
>  
> @@ -680,25 +684,33 @@ static int ssam_serial_hub_probe(struct serdev_device *serdev)
>  	 * states.
>  	 */
>  	status = ssam_log_firmware_version(ctrl);
> -	if (status)
> +	if (status) {
> +		dev_err_probe(dev, status, "failed to get firmware version\n");
>  		goto err_initrq;
> +	}
>  
>  	status = ssam_ctrl_notif_d0_entry(ctrl);
> -	if (status)
> +	if (status) {
> +		dev_err_probe(dev, status, "D0-entry notification failed\n");
>  		goto err_initrq;
> +	}
>  
>  	status = ssam_ctrl_notif_display_on(ctrl);
> -	if (status)
> +	if (status) {
> +		dev_err_probe(dev, status, "display-on notification failed\n");
>  		goto err_initrq;
> +	}
>  
> -	status = sysfs_create_group(&serdev->dev.kobj, &ssam_sam_group);
> +	status = sysfs_create_group(&dev->kobj, &ssam_sam_group);
>  	if (status)
>  		goto err_initrq;
>  
>  	/* Set up IRQ. */
>  	status = ssam_irq_setup(ctrl);
> -	if (status)
> +	if (status) {
> +		dev_err_probe(dev, status, "failed to setup IRQ\n");
>  		goto err_irq;
> +	}
>  
>  	/* Finally, set main controller reference. */
>  	status = ssam_try_set_controller(ctrl);
> @@ -715,7 +727,7 @@ static int ssam_serial_hub_probe(struct serdev_device *serdev)
>  	 *       resumed. In short, this causes some spurious unwanted wake-ups.
>  	 *       For now let's thus default power/wakeup to false.
>  	 */
> -	device_set_wakeup_capable(&serdev->dev, true);
> +	device_set_wakeup_capable(dev, true);
>  	acpi_dev_clear_dependencies(ssh);
>  
>  	return 0;
> @@ -723,7 +735,7 @@ static int ssam_serial_hub_probe(struct serdev_device *serdev)
>  err_mainref:
>  	ssam_irq_free(ctrl);
>  err_irq:
> -	sysfs_remove_group(&serdev->dev.kobj, &ssam_sam_group);
> +	sysfs_remove_group(&dev->kobj, &ssam_sam_group);
>  err_initrq:
>  	ssam_controller_lock(ctrl);
>  	ssam_controller_shutdown(ctrl);

