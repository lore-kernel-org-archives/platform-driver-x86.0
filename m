Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1360A61687
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706532693; cv=none; b=IwGYaFmMigq9BR97Oi0UIdvKnuI8Yx9IqccfTFdZzLviodtCom5bhoOSrV+IkEw6hlHA+TOXTQ9786rspmQF5qgzZiiHqKrVIYRfvddSWRr9dmYHc7qp1Wth0hjMswvNE6Kr2rWurlyh2h6+AMOz6MgnuzC7mPzDj/sOTXMgC5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706532693; c=relaxed/simple;
	bh=TT0kk3g0cXNmk2WZ37i1e9BjEUKBf2mV38ZCaf0dd7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4s+Hppn7LDhAdFJf/KsIhF9isGkDvNPhXtQ9KCrNwDRUUiJbBmd8Fz/B9cHDEIa3VJY4Mpy1VviE/Cj6B+oKdwKk6eArH+6YdW9yCF4TSaqg3KxCdSuulp4xi8tLpvg5n9bp6QUnnyuxyub6tWEsy58c6Enacsn3TU99wa6wzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M5JGLnYm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M5JGLnYm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706532691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jZ9E+mY3bk+/7O80pbPDq42yAYWPTkivulN28a2LDxg=;
	b=M5JGLnYmAKzgo/l9cIXXbeoSsgaqIpRzNR0N5gl5zglGb0zDYvpkY5HCXqix9oV/48TOcO
	ZrrGQHwWCuTbOwsTni2xOD9bXIsK9TE/F1n0aKiZir4rd7TkFx6oLzYU2hPa1Qmw42kXw7
	0rfj/JA8Wi7JeY8ojOAJ0KWgjKjUm6Y=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-BCP5a4DmNQeXb4ooAtfIIw-1; Mon, 29 Jan 2024 07:51:29 -0500
X-MC-Unique: BCP5a4DmNQeXb4ooAtfIIw-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2cf30de8dd8so18175631fa.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 04:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706532688; x=1707137488;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jZ9E+mY3bk+/7O80pbPDq42yAYWPTkivulN28a2LDxg=;
        b=hh3xB9Ok0sbPjRZVx+L0yb+f6nnU4UBoZB3oWNdOSl58jG+IefUTrHH0Pw5sBtj5zk
         Ryk15wdm+pEbXIw8yjX1l8igtuWbIsz1Ubu4MTsOuhsnL+s4QvFKNVLkwNv9DhoSlr1L
         zQQprZiXBa32FdyNuZwE5BT2SQp9+GY93WYTpKCSo7NnB75btMlCCiKHvSLF7gpwR7c9
         eNrShdMX/WSx9CSnCj2NtItO37piAAP31BVU3QdKW1m8gvhCPLOK7gRu3m4LhO0hH3fn
         K0K5T+iyXNJALG4JebXtQ5yJokR8IhH5mgD2YsWgjeYYvjQ/5mWeVoyB05+dP8X6YUgd
         /nCA==
X-Gm-Message-State: AOJu0YzQ1StLFhKHhfFPA4a2X65HgeClIds4x62qvLLTLBPlLJq+GT/r
	5X2o2+f9h2sMN4et0WmuTTelTRomeduxBORVd1OLAiIU8pcm89Vxgvcm9qT8Grbhxk54KcWhcHl
	1Wc7MAKceuce52iS23FlPVonXjQ63tnm4vhlqXpuSh9FseYXISPgIe8L1ptUd0d90VA189FU=
X-Received: by 2002:a2e:a58a:0:b0:2cf:3324:cedd with SMTP id m10-20020a2ea58a000000b002cf3324ceddmr4350067ljp.24.1706532688185;
        Mon, 29 Jan 2024 04:51:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2FSNEk9hjROZE0Gi7s8AkxnU9Lj3p2t8sbGnqkNQw2YtRgzHHHK1lIoCAUFJXhw4ozT55ug==
X-Received: by 2002:a2e:a58a:0:b0:2cf:3324:cedd with SMTP id m10-20020a2ea58a000000b002cf3324ceddmr4350049ljp.24.1706532687842;
        Mon, 29 Jan 2024 04:51:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h29-20020a056402095d00b0055f1087e1d1sm571674edz.29.2024.01.29.04.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 04:51:26 -0800 (PST)
Message-ID: <9ccc3b9d-d71a-451c-80f5-3da62108d983@redhat.com>
Date: Mon, 29 Jan 2024 13:51:26 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: wmi: Initialize ACPI device class
Content-Language: en-US, nl
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240124190732.4795-1-W_Armin@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240124190732.4795-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/24/24 20:07, Armin Wolf wrote:
> When an ACPI netlink event is received by acpid, the ACPI device
> class is passed as its first argument. But since the class string
> is not initialized, an empty string is being passed:
> 
> 	netlink:  PNP0C14:01 000000d0 00000000
> 
> Fix this by initializing the ACPI device class during probe.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
> Note: This patch is based on commit 3f399b5d7189 ("platform/x86: wmi: Use ACPI device name in netlink event")
> ---
>  drivers/platform/x86/wmi.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 7ef1e82dc61c..b92425c30a50 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -32,6 +32,8 @@
>  #include <linux/wmi.h>
>  #include <linux/fs.h>
> 
> +#define ACPI_WMI_DEVICE_CLASS	"wmi"
> +
>  MODULE_AUTHOR("Carlos Corbacho");
>  MODULE_DESCRIPTION("ACPI-WMI Mapping Driver");
>  MODULE_LICENSE("GPL");
> @@ -1202,7 +1204,7 @@ static int wmi_notify_device(struct device *dev, void *data)
>  		wblock->handler(*event, wblock->handler_data);
>  	}
> 
> -	acpi_bus_generate_netlink_event(wblock->acpi_device->pnp.device_class,
> +	acpi_bus_generate_netlink_event(acpi_device_class(wblock->acpi_device),
>  					acpi_dev_name(wblock->acpi_device), *event, 0);
> 
>  	return -EBUSY;
> @@ -1267,6 +1269,8 @@ static int acpi_wmi_probe(struct platform_device *device)
>  		return -ENODEV;
>  	}
> 
> +	strscpy(acpi_device_class(acpi_device), ACPI_WMI_DEVICE_CLASS, sizeof(acpi_device_class));
> +

Hmm, I'm not sure if you are supposed to do this when you are not an
acpi_driver's add() function.

Rafael, do you have any comments on this ?

Regards,

Hans





>  	wmi_bus_dev = device_create(&wmi_bus_class, &device->dev, MKDEV(0, 0), NULL, "wmi_bus-%s",
>  				    dev_name(&device->dev));
>  	if (IS_ERR(wmi_bus_dev))
> --
> 2.39.2
> 

