Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D26HgZXn"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDFB93
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Dec 2023 01:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702547894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tYjs3vviB3majg/0TNrxp+P2fqidMVAtaeyzLcg64ao=;
	b=D26HgZXnMtItzNr8fuDY2OHvaUe9LRqhjyPui5IKsxUclkAp02HhBfNawn52BxKLGV0jg6
	P0k5XWeWA7xJHztMm5beoshZBXrw/Mpc8/xDm4PZB+QAttCZNE4qIPuiyPTdieusvedMQQ
	NhwYeCP7FT9FejNcev/C/8b4GwasGRs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-1lVQM8-3MJaOkIAhaJbYIw-1; Thu, 14 Dec 2023 04:58:13 -0500
X-MC-Unique: 1lVQM8-3MJaOkIAhaJbYIw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a1d72320a33so467794466b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Dec 2023 01:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702547891; x=1703152691;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tYjs3vviB3majg/0TNrxp+P2fqidMVAtaeyzLcg64ao=;
        b=Ofc8fJM4JFHbiJn5CzngzMSL5lUj0dQWaRNoUKygbghjdI7ijkmhG98ga1vrvVAAch
         gniMPfofhsXUSKaK8GUCIXb28WCY2VqqkolB8WpVDSqAXlHQbPpTOtfbDlLXJR7kJEr/
         SfEB+a0ZjsV41jZKu24CqV7qNkLIWSG3DUnGXbIfUk/Vo+AD/MSuWVq5nrwzlmjwm5QM
         05+7vPPZy1FBRCl70MyFP6Qy3L2zgd4I1I7dtIO1wg2Sklj1lwhBGROy/uk0yBQyZPEC
         KLxeBPP7ZMqPCnnQRJGTYMH7LMafROKmYkhhXABtfbkj/WB/KpJPT4s7l+p8pK7EALXq
         c3sg==
X-Gm-Message-State: AOJu0Yz23yL3DsNN4y0+UtkIx3SMZ7p2cKOP3bjIOGIq+tuAkeKHGPQL
	fid4XOWpdreqXqVp/wE35fUl1IF2kEQofGbzZy8qy1jdZ9P/0uPLwVCluUbiyV1B5SyHV/HBogT
	SrfY41RLDF+4bZA4XCiy4jJdBxhpm6cFAE3i8M4Ob4Q==
X-Received: by 2002:a17:906:3f0f:b0:a22:fb3f:7a67 with SMTP id c15-20020a1709063f0f00b00a22fb3f7a67mr1319821ejj.150.1702547891585;
        Thu, 14 Dec 2023 01:58:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZ+ee6keFatf/RhkcVUOTtEW7Vzhv6BVrgYY2WAxcmQ5PM/HFT/VoSb8fsZS4wJ293vIyvmw==
X-Received: by 2002:a17:906:3f0f:b0:a22:fb3f:7a67 with SMTP id c15-20020a1709063f0f00b00a22fb3f7a67mr1319816ejj.150.1702547891189;
        Thu, 14 Dec 2023 01:58:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id vq6-20020a170907a4c600b00a19b7362dcfsm9189143ejc.139.2023.12.14.01.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 01:58:10 -0800 (PST)
Message-ID: <b44597ec-dd13-4727-ad45-32a44bed329e@redhat.com>
Date: Thu, 14 Dec 2023 10:58:10 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: serial-multi-instantiate: allow single
 GpioInt IRQ for INT3515
Content-Language: en-US, nl
To: =?UTF-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>,
 linux-usb <linux-usb@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <Y53J5S.LX6YEPYLP1CF2@nozomi.space>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y53J5S.LX6YEPYLP1CF2@nozomi.space>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Michał,

On 12/12/23 01:39, Michał Kopeć wrote:
> On some devices, such as the Lenovo ThinkPad T14 Gen1 (AMD), there is only one
> GpioInt resource defined for all i2c device instances. Handle this case
> appropriately by autodetecting the irq type and allowing fallback to the first
> IRQ index for the second, third and fourth tps6598x instances.

This suggests that the IRQ at index 0 gets used for all i2c_clients
if there is no IRQ at index > 0, but that is not what this patch
is actually doing, it is assigning the error value to i2c_client->irq,
which will then get passed to the i2c-driver for the client which
may very well expect that any value other then 0 actually is a valid IRQ.

So what do you actually want to do here, use the IRQ at index 0 as
shared IRQ for all clients (seems sensible) or just give the
other clients no IRQ? If you want to give them no IRQ then please
make smi_get_irq() return 0 when there is an error and the optional
flag is set.

Note one more review remark inline below.

> Additionally, to use the `platform_get_irq_optional` function to silence errors
> that may not be relevant if the IRQ is optional. In cases where the IRQ is not
> optional, `dev_err_probe` is still triggered, so other devices will not be
> affected by this change.
> 
> Signed-off-by: Michał Kopeć <michal@nozomi.space>
> ---
> .../platform/x86/serial-multi-instantiate.c | 19 ++++++++++++-------
> 1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 8158e3cf5d6d..1c4cc44d5a88 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -23,6 +23,8 @@
> #define IRQ_RESOURCE_APIC 2
> #define IRQ_RESOURCE_AUTO 3
> 
> +#define IRQ_OPTIONAL BIT(2)
> +
> enum smi_bus_type {
>  SMI_I2C,
>  SMI_SPI,
> @@ -59,7 +61,7 @@ static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
>    dev_dbg(&pdev->dev, "Using gpio irq\n");
>    break;
>   }
> - ret = platform_get_irq(pdev, inst->irq_idx);
> + ret = platform_get_irq_optional(pdev, inst->irq_idx);
>   if (ret > 0) {
>    dev_dbg(&pdev->dev, "Using platform irq\n");
>    break;
> @@ -69,12 +71,12 @@ static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
>   ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
>   break;
>  case IRQ_RESOURCE_APIC:
> - ret = platform_get_irq(pdev, inst->irq_idx);
> + ret = platform_get_irq_optional(pdev, inst->irq_idx);
>   break;
>  default:
>   return 0;
>  }
> - if (ret < 0)
> + if (ret < 0 && !inst->flags & IRQ_OPTIONAL)
>   return dev_err_probe(&pdev->dev, ret, "Error requesting irq at index %d\n",
>          inst->irq_idx);
> 
> @@ -210,6 +212,8 @@ static int smi_i2c_probe(struct platform_device *pdev, struct smi *smi,
>   board_info.dev_name = name;
> 
>   ret = smi_get_irq(pdev, adev, &inst_array[i]);
> + if (ret < 0 && inst_array[i].flags & IRQ_OPTIONAL)
> + ret = smi_get_irq(pdev, adev, &inst_array[0]);

It seems something went wrong with the patch here, you now
have both the old and the new code here.

Note that when you make  smi_get_irq() return 0 for "no-irq"
instead of an error you do not need to make any changes here
at all.

For v2 please also send this patch to platform-driver-x86@vger.kernel.org .

Regards,

Hans



>   if (ret < 0)
>    goto error;
>   board_info.irq = ret;
> @@ -309,10 +313,11 @@ static const struct smi_node bsg2150_data = {
> 
> static const struct smi_node int3515_data = {
>  .instances = {
> - { "tps6598x", IRQ_RESOURCE_APIC, 0 },
> - { "tps6598x", IRQ_RESOURCE_APIC, 1 },
> - { "tps6598x", IRQ_RESOURCE_APIC, 2 },
> - { "tps6598x", IRQ_RESOURCE_APIC, 3 },
> + { "tps6598x", IRQ_RESOURCE_AUTO, 0 },
> + /* On some platforms only one shared GpioInt is defined */
> + { "tps6598x", IRQ_RESOURCE_AUTO | IRQ_OPTIONAL, 1 },
> + { "tps6598x", IRQ_RESOURCE_AUTO | IRQ_OPTIONAL, 2 },
> + { "tps6598x", IRQ_RESOURCE_AUTO | IRQ_OPTIONAL, 3 },
>   {}
>  },
>  .bus_type = SMI_I2C,

