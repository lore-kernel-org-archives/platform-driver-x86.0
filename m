Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FAE189BA2
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Aug 2024 15:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724685176; cv=none; b=Icl1qEYRQ+NlmLM1CsZLOfomj72W5tdWLhI1GXH6HzV6SWOS+JHzFDLm7aAQ0RaoCCzmvSfaRHRyQLluBx0ZGExq8fgOTt7Hcq6LHP+nJGMsFne9LzIacLPsRHXsrkjOr62R+DxeNduOcxdO0aAEGZMc8nBS1T061BbdD5o/HYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724685176; c=relaxed/simple;
	bh=JgD7HLReRvvF27tZt46vggMStfJSMAGSrMBkH0Rnq/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X1yU8I4tEScpf+/yDkGlrblFcBJUofhh+UhURzsIlT0OxhhH8BaYnzXvr2HAxYGkuFDxax+eCCIbPM2/IU0cQHk969hEUll3vYr+MKMi+IedXMi+Qp7ZNQk8U1n/822mJ06UM7NDUXz5wq04r6l/H/xtQqTrcRoW2AYs1qARAcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LkHz0Kic; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LkHz0Kic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724685171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLX/B2mgl3ih/Q9Ax6wkqjLpCaMzycCetwPullYT2S0=;
	b=LkHz0KiczladNK18r3Ou80vOMmpgAZoiDyf0q0daoysRNOfzIU0KyqP1kjrHMhTeVjqMeI
	cbnCJuXUNzLYckLv+WDMLYyKEZS5qnj7/dXWHLb87Nw8WSUbgdK3Vk1UNA8wzc3SnWLxgl
	T2woQ/0DhjnOYvWr0iWFWDnMBkOLceI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-AS_E4qphMNaSFXjEiDsn7g-1; Mon, 26 Aug 2024 11:12:50 -0400
X-MC-Unique: AS_E4qphMNaSFXjEiDsn7g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a869078ff9bso445557966b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Aug 2024 08:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724685169; x=1725289969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hLX/B2mgl3ih/Q9Ax6wkqjLpCaMzycCetwPullYT2S0=;
        b=pHquS5qehlxbAAwXU5w5LiMAG1PP2nJt5tbldjJ2zgCi8W7h4tt/Kles4QR284lqWw
         weAuadvLTjCIspGYZVM37jJCqand+DOs/vU/ZBCy0Aci/zorM/SKrBa/0OSJo1dSjeMA
         LaC13Ab2Wjr3QOnsawJq/u3Fj7EQbQBcym5d8MjJw04WOvL1yJxF94g46gtBoH0ChaHk
         MixavrTEOTL/coSrciOp8PpzCA0+hyukHomUJs7PYh/2KXfZeThY3eiaAmuDUJAP6uBB
         fAwNUotyaisLKh/j31s18uSQJj6N8u2uC7VCkT4DhY9lK9sNxF6EMwQhNPXKrKpFfmYR
         8Dqg==
X-Forwarded-Encrypted: i=1; AJvYcCWN3iLLmSDYf0H8p21YPgIFsZEAim+38+5zxY3/dbJvl+UHOBYpRBEw5SA4ZJENDn/NlX8qA348u3q9TsxBjwTYF4os@vger.kernel.org
X-Gm-Message-State: AOJu0YwoZbOrf/l4DXxZVXJQZq8QkE1SkxVNjqbM/NJJlFnBahoobgbt
	Ql6TB6cZ7074oXMEx6n9kuVlNzbjLxqSkzbZuge1pK1x2CxLz4TrnI847i4gGjGwBB+W0aetiw2
	LIe+Y2D8zHyHjQHg0IdhcvCtj9k4JfiuzgtXcnT9eMczLbjO4TXT6Ry2N/+Md2CN90sXZ9jE=
X-Received: by 2002:a17:907:7214:b0:a86:82e2:8c6d with SMTP id a640c23a62f3a-a86a54df512mr609542966b.62.1724685168943;
        Mon, 26 Aug 2024 08:12:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIQqMMi5TaVbVlTae6McWeZwG8+ARQB/N8IrzmGubaBBMIc0Xh6ucOMLAIDCj2L/6kkSfnLw==
X-Received: by 2002:a17:907:7214:b0:a86:82e2:8c6d with SMTP id a640c23a62f3a-a86a54df512mr609540866b.62.1724685168419;
        Mon, 26 Aug 2024 08:12:48 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f222b23sm684686566b.19.2024.08.26.08.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 08:12:47 -0700 (PDT)
Message-ID: <ae68cba8-564c-47bf-a796-2bf15b3998d6@redhat.com>
Date: Mon, 26 Aug 2024 17:12:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] platform/x86: int3472: discrete: Remap "reset" to
 "enable" for OV7251
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Daniel Scally <djrscally@gmail.com>
References: <20240821184546.627456-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240821184546.627456-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 8/21/24 8:40 PM, Andy Shevchenko wrote:
> The driver of OV7251 expects "enable" pin instead of "reset".
> Remap "reset" to "enable" and update polarity.
> 
> In particular, the Microsoft Surface Book can't load the camera sensor
> driver without this change:
> 
>  ov7251 i2c-INT347E:00: supply vdddo not found, using dummy regulator
>  ov7251 i2c-INT347E:00: supply vddd not found, using dummy regulator
>  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
>  ov7251 i2c-INT347E:00: cannot get enable gpio
>  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -2
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> Hmm... I have spent some time to achieve this, and then I realised that
> linux-surface GitHub project already has something similar [1].
> 
> The advantage of [1] is that it applies the quirk to all OV7251 sensors
> on the platform (don't know how useful it IRL).
> 
> However, it seems the [1] has two issues:
> 1) it missed terminator entry in the ACPI ID table;
> 2) it forces polarity to be active high, while I think the XOR approach
> is better as it's possible (but quite unlikely I believe) that reset pin
> might be inverted on the PCB level.
> 
> All in all, I'm fine with any of these patches to be applied with the
> above mentioned improvements / caveats.
> 
> Link: https://github.com/linux-surface/kernel/commit/d0f2c2d5a449c2bf69432f90d164183143d8af8d [1]

Looking at the datasheet the sensor actually has a reset pin and not
an enable pin and the current GPIO mapping in the ov7251 driver /
device-tree bindings is wrong.

The datasheet describes the single reset control pin as:

D6 XSHUTDOWN input "reset (active low with internal pull down resistor)"

So as we have done before I would greatly prefer for the sensor driver
to get fixed instead of hacking around this in the int3472 code.

You could do something similar to what is done in the ov2680.c driver
for this, here is the ov2680 gpiod-get code adjusted for the ov7251 case:

        /*
         * The device-tree bindings call this pin "enable", but the
	 * datasheet describes the pin as "reset (active low with internal
	 * pull down resistor)". The ACPI tables describing this sensor
	 * on e.g. the Microsoft Surface Book use the ACPI equivalent of
	 * "reset" as pin name, which ACPI glue code then maps to "reset".
 	 * Check for a "reset" pin if there is no "enable" pin.
         */
	ov7251->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
	if (IS_ERR(ov7251->enable_gpio)) {
		ov7251->enable_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
		if (!IS_ERR(ov7251->enable_gpio))
			gpiod_toggle_active_low(ov7251->enable_gpio);
	}
	if (IS_ERR(ov7251->enable_gpio)) {
                dev_err(dev, "cannot get enable gpio\n");
                return PTR_ERR(ov7251->enable_gpio);
        }

(untested)

Regards,

Hans



> 
>  drivers/platform/x86/intel/int3472/discrete.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index b5f6f71bb1dd..0559295dfb27 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -86,6 +86,16 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * The driver of OV7251 expects "enable" pin instead of "reset".
> +	 * Remap "reset" to "enable" and update polarity.
> +	 */
> +	if (!strcmp(int3472->sensor_name, "i2c-INT347E:00") &&
> +	    !strcmp(func, "reset")) {
> +		func = "enable";
> +		polarity ^= GPIO_ACTIVE_LOW;
> +	}
> +
>  	ret = skl_int3472_fill_gpiod_lookup(&int3472->gpios.table[int3472->n_sensor_gpios],
>  					    agpio, func, polarity);
>  	if (ret)

