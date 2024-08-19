Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DDF16B3BC
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 13:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724073436; cv=none; b=sOzfSpMtcUIISz5TqmOPePrQUC0hyZeVA7egzGFnH3S2F7O0qAI+npFSae3kCL2I86Lz0UMp9UbIBowrKRhQvmtJlN+bPZ9Mjv+zsRtTZQOa0oCQLDDYWdpxMTcKL+fgoQSvZ3LKwnPnHzH0anlZbBDvSeaCG78UrhrB1Mbu1+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724073436; c=relaxed/simple;
	bh=vIwi+Ho3hcTzwljg2H57BFDuQAi75Ju4VGTPIMbZtJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cauaDsdUY8Jb7nB5A1puB3yz7CzHbDXWk6SWPA+R8jdq4TG6ugpiAME+VzusM7Et2CCgsmuzP4InrRUOwp0M8Tra7bJ5oHrFI7ZnKG4Udo9JO6nqoxGtVeHxUCxXr0yPOGUhPVJ9isvLbUooPtqCYT3RtQ82RfqpmcOzJLGfW40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jWeyp7gB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jWeyp7gB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724073433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9RZOxsSOUpslXvj4HgMWa1YWBn0fhZwVZ+lWFi2Py/0=;
	b=jWeyp7gBQXkB8Ro/e4iteyyk61WqD0RLpYj09iCFBtOnUjY6xMUYEAOL07nRbx1kaHZZTn
	li/iin+cwSnDPrwsYoDgaSwQgd8pcTNsJ/tFUqsB85/qny/XlbaTHjnuWlBT8xgjshiMug
	ni4lpqfqt/h2GY/w8ISmpUitNPP7F34=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-uCMKPlnZM3aSnMeW8R3Xhg-1; Mon, 19 Aug 2024 09:17:12 -0400
X-MC-Unique: uCMKPlnZM3aSnMeW8R3Xhg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5bed5bc6dbeso1250787a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 06:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724073431; x=1724678231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RZOxsSOUpslXvj4HgMWa1YWBn0fhZwVZ+lWFi2Py/0=;
        b=qp/O7/+ReWurcVKmlKaZTlI1qxvOCFu6jkWIW9NHa5U5UtxqtMNZWI7rI4+L2a2Arr
         ZD2dNeVPRgMlJH0aD2pSCoH+wGEnkX4tWiOMa8WbwGTVJyuSJHnbeR8T9HavQJZbBmaP
         u+ZTrJMw2mu+Bkr/qhWNGeU7eYz+jHY1oR76kVrU6tMC3gut2yzZ1RLScSGlOcMs6OZc
         Fmt06XHubIehIaFDBZlcUtZqw0D8+1jTtuWqSlC+FHAA0XEDngeuRb+BIaF5TX8zsXxP
         u2HYkvO74jn+EFZGt14UjMQW3pcxwcBYUJ8GxV/4S/Pe+CO+ChRZZQzwXD3HVrs3FhYF
         zz5A==
X-Gm-Message-State: AOJu0YzmxYkSiBbaag/YjXqSCennzF8lfQprKdLkZYM/1TkmQQ9/95+M
	4JkLlEwnHiCeJHUttSDHKaKmRKGgZD8yob20uYZcg3IjGnPGEJsTYImNMsBF8mjW3kQoABELNHy
	visPDKkq8Nj1NSl1EbBionc7uaquBgDm6XL3UT23VEnpEsUYn2XVb+vtZZGnjjbQB2BBdqsqqi4
	JlMuY=
X-Received: by 2002:a05:6402:2681:b0:5be:dd2d:83 with SMTP id 4fb4d7f45d1cf-5bedd2d02e2mr5286436a12.6.1724073430594;
        Mon, 19 Aug 2024 06:17:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRjAeOgQEM8IvDHQXEfwHvUn1ankhtBMfeAHX9eXd6GBDhylg0X3WB0PuQoK1JlETbRBPJmg==
X-Received: by 2002:a05:6402:2681:b0:5be:dd2d:83 with SMTP id 4fb4d7f45d1cf-5bedd2d02e2mr5286412a12.6.1724073429979;
        Mon, 19 Aug 2024 06:17:09 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebc081ad6sm5524484a12.89.2024.08.19.06.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 06:17:09 -0700 (PDT)
Message-ID: <a44bb4d0-c149-4dd7-882b-f87497725dd9@redhat.com>
Date: Mon, 19 Aug 2024 15:17:08 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: serial-multi-instantiate: Don't require
 both I2C and SPI
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20240814132939.308696-1-rf@opensource.cirrus.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240814132939.308696-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/14/24 3:29 PM, Richard Fitzgerald wrote:
> Change the Kconfig dependency so that it doesn't require both I2C and SPI
> subsystems to be built. Make a few small changes to the code so that the
> code for a bus is only called if the bus is being built.
> 
> When SPI support was added to serial-multi-instantiate it created a
> dependency that both CONFIG_I2C and CONFIG_SPI must be enabled.
> Typically they are, but there's no reason why this should be a
> requirement. A specific kernel build could have only I2C devices
> or only SPI devices. It should be possible to use serial-multi-instantiate
> if only I2C or only SPI is enabled.
> 
> The dependency formula used is:
> 
>   depends on (I2C && !SPI) || (!I2C && SPI) || (I2C && SPI)
> 
> The advantage of this approach is that if I2C=m or SPI=m then
> SERIAL_MULTI_INSTANTIATE is limited to n/m.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

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
> Changes from V1:
> Use a different 'depends on' formula so that serial-multi-instantiate
> must be built as a module if any dependencies are a module.
> 
>  drivers/platform/x86/Kconfig                  |  3 +-
>  .../platform/x86/serial-multi-instantiate.c   | 32 ++++++++++++++-----
>  2 files changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 665fa9524986..0dcf4d8eac56 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -999,7 +999,8 @@ config TOPSTAR_LAPTOP
>  
>  config SERIAL_MULTI_INSTANTIATE
>  	tristate "Serial bus multi instantiate pseudo device driver"
> -	depends on I2C && SPI && ACPI
> +	depends on ACPI
> +	depends on (I2C && !SPI) || (!I2C && SPI) || (I2C && SPI)
>  	help
>  	  Some ACPI-based systems list multiple devices in a single ACPI
>  	  firmware-node. This driver will instantiate separate clients
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 3be016cfe601..7c04cc9e5891 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -83,11 +83,15 @@ static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
>  
>  static void smi_devs_unregister(struct smi *smi)
>  {
> +#if IS_REACHABLE(CONFIG_I2C)
>  	while (smi->i2c_num--)
>  		i2c_unregister_device(smi->i2c_devs[smi->i2c_num]);
> +#endif
>  
> -	while (smi->spi_num--)
> -		spi_unregister_device(smi->spi_devs[smi->spi_num]);
> +	if (IS_REACHABLE(CONFIG_SPI)) {
> +		while (smi->spi_num--)
> +			spi_unregister_device(smi->spi_devs[smi->spi_num]);
> +	}
>  }
>  
>  /**
> @@ -258,9 +262,15 @@ static int smi_probe(struct platform_device *pdev)
>  
>  	switch (node->bus_type) {
>  	case SMI_I2C:
> -		return smi_i2c_probe(pdev, smi, node->instances);
> +		if (IS_REACHABLE(CONFIG_I2C))
> +			return smi_i2c_probe(pdev, smi, node->instances);
> +
> +		return -ENODEV;
>  	case SMI_SPI:
> -		return smi_spi_probe(pdev, smi, node->instances);
> +		if (IS_REACHABLE(CONFIG_SPI))
> +			return smi_spi_probe(pdev, smi, node->instances);
> +
> +		return -ENODEV;
>  	case SMI_AUTO_DETECT:
>  		/*
>  		 * For backwards-compatibility with the existing nodes I2C
> @@ -270,10 +280,16 @@ static int smi_probe(struct platform_device *pdev)
>  		 * SpiSerialBus nodes that were previously ignored, and this
>  		 * preserves that behavior.
>  		 */
> -		ret = smi_i2c_probe(pdev, smi, node->instances);
> -		if (ret != -ENOENT)
> -			return ret;
> -		return smi_spi_probe(pdev, smi, node->instances);
> +		if (IS_REACHABLE(CONFIG_I2C)) {
> +			ret = smi_i2c_probe(pdev, smi, node->instances);
> +			if (ret != -ENOENT)
> +				return ret;
> +		}
> +
> +		if (IS_REACHABLE(CONFIG_SPI))
> +			return smi_spi_probe(pdev, smi, node->instances);
> +
> +		return -ENODEV;
>  	default:
>  		return -EINVAL;
>  	}

