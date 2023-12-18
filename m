Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBC71D141
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O+1bBIT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702908933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LuquQc0YCQtCYvpmPwBnMx8v2hV6Fg/eWy/tg+6+rYc=;
	b=O+1bBIT29xl837aIA4XzqDxm2ZOmGiPwrsNf+CjtZnbNJh0u9accAKuqWAfl07Df9vhB4t
	jjJUWiJj8YuX7reux/qxt1tp/czw71OnmGb7/NG5Eb/KdadHK5kwue3LPtelQeNf4YPdyJ
	MrRvuNzh4DhigHNpcZBkRIKQ04H87+4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-CXi8VutjMoSHqKb5fyf7YQ-1; Mon, 18 Dec 2023 09:15:32 -0500
X-MC-Unique: CXi8VutjMoSHqKb5fyf7YQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a00dd93a5f9so184917266b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 06:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702908931; x=1703513731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LuquQc0YCQtCYvpmPwBnMx8v2hV6Fg/eWy/tg+6+rYc=;
        b=dYA2Mbej38cnRe4nMQ1wsMrGwPHh1R24VmQfSILAFHyiSe6GUSyK1g5NAz07cV9/EB
         tyIauIr/FiwpGg8abimXCdnyROZB9pEUdlXVJhyCZ8fcDxQlQP6IVu5Wtj4bCurdCigW
         Su+5JBIHPMlZIptYcL9Jo1KO6wPzxv8bukS/TNDkbBqIO9UlEZVKJkUotFeSZPPEX52I
         5ICU299lI/ea1Flx5WY7twWiCO1UWYqS44vxgtpBQuQxuJFCREnm6Ieo1xlmAsOoCI+r
         YSxqsn8godEP7/rb169woK3RJJMZc3Llp0uG1C7gn9CdOXThzmlFppIGXyy4Hfy+JdTM
         fKtA==
X-Gm-Message-State: AOJu0YypnwvRkFo80sfWhXS7T8HmkhE7hZCfNALN7+f3T1igNdwENSR7
	XnSRZIbo/CjlHd0DE224+uE8xghP/aMBeLtnmhbPOSLzTllqddlAbI4/AwTDaoT8AmntYiMfxy5
	jMzVivATHoqEUteKpUrE/b1f5NnsdeXem8NU3W2B4RA==
X-Received: by 2002:a17:907:9403:b0:a1f:6707:cffc with SMTP id dk3-20020a170907940300b00a1f6707cffcmr5215574ejc.74.1702908930841;
        Mon, 18 Dec 2023 06:15:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4Rt6OfhkSOaajYHAjBTNcJhGec50soIzfICbe5edccJDAximYXby/veCBKIej27PTg0Epzw==
X-Received: by 2002:a17:907:9403:b0:a1f:6707:cffc with SMTP id dk3-20020a170907940300b00a1f6707cffcmr5215565ejc.74.1702908930349;
        Mon, 18 Dec 2023 06:15:30 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id mj26-20020a170906af9a00b00a2366090bcfsm427947ejb.212.2023.12.18.06.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 06:15:29 -0800 (PST)
Message-ID: <ac05bc52-e382-4af1-b510-8dd675babcb1@redhat.com>
Date: Mon, 18 Dec 2023 15:15:29 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] platform/x86: wmi: Use devres for resource handling
Content-Language: en-US
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231216015601.395118-1-W_Armin@gmx.de>
 <20231216015601.395118-4-W_Armin@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231216015601.395118-4-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Armin,

On 12/16/23 02:55, Armin Wolf wrote:
> Use devres for cleaning up the ACPI handlers and the
> WMI bus device to simplify the error handling.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/wmi.c | 54 +++++++++++++++++++++++---------------
>  1 file changed, 33 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 2120c13e1676..4306a5533842 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -1236,17 +1236,33 @@ static int wmi_remove_device(struct device *dev, void *data)
> 
>  static void acpi_wmi_remove(struct platform_device *device)
>  {
> -	struct acpi_device *acpi_device = ACPI_COMPANION(&device->dev);
>  	struct device *wmi_bus_device = dev_get_drvdata(&device->dev);
> 
>  	device_for_each_child_reverse(wmi_bus_device, NULL, wmi_remove_device);
> -	device_unregister(wmi_bus_device);
> +}
> +
> +static void acpi_wmi_remove_notify_handler(void *data)
> +{
> +	struct acpi_device *acpi_device = data;
> 
>  	acpi_remove_notify_handler(acpi_device->handle, ACPI_ALL_NOTIFY, acpi_wmi_notify_handler);
> +}
> +
> +static void acpi_wmi_remove_address_space_handler(void *data)
> +{
> +	struct acpi_device *acpi_device = data;
> +
>  	acpi_remove_address_space_handler(acpi_device->handle, ACPI_ADR_SPACE_EC,
>  					  &acpi_wmi_ec_space_handler);
>  }
> 
> +static void acpi_wmi_remove_bus_device(void *data)
> +{
> +	struct device *wmi_bus_dev = data;
> +
> +	device_unregister(wmi_bus_dev);
> +}
> +
>  static int acpi_wmi_probe(struct platform_device *device)
>  {
>  	struct acpi_device *acpi_device;
> @@ -1268,6 +1284,10 @@ static int acpi_wmi_probe(struct platform_device *device)
>  		dev_err(&device->dev, "Error installing EC region handler\n");
>  		return -ENODEV;
>  	}
> +	error = devm_add_action_or_reset(&device->dev, acpi_wmi_remove_notify_handler,
> +					 acpi_device);
> +	if (error < 0)
> +		return error;

The code just installed the EC address space handler here, so AFAICT
the added action here should be acpi_wmi_remove_address_space_handler and
... (continued below)

> 
>  	status = acpi_install_notify_handler(acpi_device->handle,
>  					     ACPI_ALL_NOTIFY,
> @@ -1275,39 +1295,31 @@ static int acpi_wmi_probe(struct platform_device *device)
>  					     NULL);
>  	if (ACPI_FAILURE(status)) {
>  		dev_err(&device->dev, "Error installing notify handler\n");
> -		error = -ENODEV;
> -		goto err_remove_ec_handler;
> +		return -ENODEV;
>  	}
> +	error = devm_add_action_or_reset(&device->dev, acpi_wmi_remove_address_space_handler,
> +					 acpi_device);

The added action here should be acpi_wmi_remove_notify_handler ?

Otherwise this looks good to me (and so do patches 1-2).

Regards,

Hans


> +	if (error < 0)
> +		return error;
> 
>  	wmi_bus_dev = device_create(&wmi_bus_class, &device->dev, MKDEV(0, 0),
>  				    NULL, "wmi_bus-%s", dev_name(&device->dev));
>  	if (IS_ERR(wmi_bus_dev)) {
> -		error = PTR_ERR(wmi_bus_dev);
> -		goto err_remove_notify_handler;
> +		return PTR_ERR(wmi_bus_dev);
>  	}
> +	error = devm_add_action_or_reset(&device->dev, acpi_wmi_remove_bus_device, wmi_bus_dev);
> +	if (error < 0)
> +		return error;
> +
>  	dev_set_drvdata(&device->dev, wmi_bus_dev);
> 
>  	error = parse_wdg(wmi_bus_dev, device);
>  	if (error) {
>  		pr_err("Failed to parse WDG method\n");
> -		goto err_remove_busdev;
> +		return error;
>  	}
> 
>  	return 0;
> -
> -err_remove_busdev:
> -	device_unregister(wmi_bus_dev);
> -
> -err_remove_notify_handler:
> -	acpi_remove_notify_handler(acpi_device->handle, ACPI_ALL_NOTIFY,
> -				   acpi_wmi_notify_handler);
> -
> -err_remove_ec_handler:
> -	acpi_remove_address_space_handler(acpi_device->handle,
> -					  ACPI_ADR_SPACE_EC,
> -					  &acpi_wmi_ec_space_handler);
> -
> -	return error;
>  }
> 
>  int __must_check __wmi_driver_register(struct wmi_driver *driver,
> --
> 2.39.2
> 

