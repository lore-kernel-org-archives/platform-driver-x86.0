Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA21BA2E
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714389016; cv=none; b=n0ZpOyv2872VdyY+hervj+gOgr1GX3R1Kvf8EV7yP6Vj/r/wYR7Cm12hUSNXtjdXhZrb6LmM9q9/qq6rEqDDq3CGZRAMBPAhAbY8tPsPYFjilZga2m4xqNurzA3egA0zBNd/o6XVCJB44gm/CiYM+JTHg02wZD3wYs0GBILtAfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714389016; c=relaxed/simple;
	bh=ntnrAWCjAOHHGilIANLmGKab2I7VtQxYNxQHAql4D+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H3OlvRmijSiTCTuh+zZjH+IgUJVbsuVE3M9l06WHoZTx6fIszJ3Q77Kr1PkI6+MT4CoWps/4hb271+8xLPiKOPThDUYdaoFVSsEGT+iPco88mXno3dneJNu5KQNYFnP49WOlKUzhRYv7Ss8WpmpMhWLqaSo4pyrWA6DPt8nCF24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UcA+jZDQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UcA+jZDQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714389014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TD7HmQbU9mOgAHiXzeaj3BhsO3Ox44E4vsCadC3C2WU=;
	b=UcA+jZDQztu8dgPxSVZZVgH9RL9o+fqHebZtjd2BuCjQC8N7Y5L3wKNt+T1XD4IVGT6OxA
	c+D/gFxTT2jxQtdfziH1YOLUUAMK4aW5zWo5TyPnUtdgVXvNnJapnDHiEgJ3CPpiWMXefF
	jy0HGbuLIT60bOfzIMB/ScqcFKH4sQk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-yVe5U4I0P-S31AyT8webrQ-1; Mon, 29 Apr 2024 07:10:12 -0400
X-MC-Unique: yVe5U4I0P-S31AyT8webrQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a556121c01aso229040866b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 04:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714389010; x=1714993810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TD7HmQbU9mOgAHiXzeaj3BhsO3Ox44E4vsCadC3C2WU=;
        b=LhnztBL8KQn4K/bE0eU2f7POO0us/LB56Rr8lZJA7eJ9g11/Bah5VLkERi9MgiDr6u
         yEx3bzeN3S4udA2/ERJKghq77kIaISCIk8qjKuTR2cLD5bcKIXovSkivgzehYx0KmbCc
         qMFX3XgZsbrzSJfD/VhI7+v9TbkMrlbIkQhZ3qw25PT7AxXZheGM0KA5dkk5Qj4966dA
         Cy+aLveBrRPMibhFPobZYV7z07hb5ihSlsna1pO6xEylMxlyfTVIcpK+FX5m9sgkySyu
         MMqQjZq2q/pDZ2BjnIn6F+nCCoC2S6S7P3wg+fsVGpYyDiMxl1yU4rNqFUQl6B6Ya94v
         SsKw==
X-Forwarded-Encrypted: i=1; AJvYcCW1a0seke0CChYFHgCBe5M8idJp9ZpFNVHH+xQbrj70QkrlcrrJl0kchrhWNVVMd5liIo2sT4SV3VzDtA6A5zhK6H+DIy6Aq8cuZBOCkkb9L2laUQ==
X-Gm-Message-State: AOJu0YwItF4hadXakfHoFY1Nc++BMZ82WbgaSYkZvvUz0tV7jemF3+J9
	3ypkw1i+Y+bJUyo8j1s+Xe3OjyzNEQsmB7ouexQ4W4/tFHQMuKFOEbRJzVtNA/hghFsEUKsR3EE
	ZoX0EzRdSrTEl/de3OU2OEZFqtzZzuGaJQJnY9p6SoGb5WKev+18pDbQGoZKCWaLf3+ZWHic=
X-Received: by 2002:a17:906:b55:b0:a46:f9c2:f059 with SMTP id v21-20020a1709060b5500b00a46f9c2f059mr6219332ejg.22.1714389010013;
        Mon, 29 Apr 2024 04:10:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR0ojatb/lFEb/FPKwL15M19QpXBCdZhETLZLlSObDFRDmZLDdhpd83l15LAivhxDSQI6i4g==
X-Received: by 2002:a17:906:b55:b0:a46:f9c2:f059 with SMTP id v21-20020a1709060b5500b00a46f9c2f059mr6219304ejg.22.1714389009649;
        Mon, 29 Apr 2024 04:10:09 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id jw17-20020a170906e95100b00a58df78ab27sm3049363ejb.166.2024.04.29.04.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 04:10:09 -0700 (PDT)
Message-ID: <6c692ae4-e78a-441d-8487-71a6ad4a4ed8@redhat.com>
Date: Mon, 29 Apr 2024 13:10:08 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] power: supply: power-supply-leds: Add
 charging_orange_full_green trigger for RGB LED
To: Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20240424065212.263784-1-hpa@redhat.com>
 <20240424065212.263784-6-hpa@redhat.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240424065212.263784-6-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/24/24 8:52 AM, Kate Hsuan wrote:
> Add a charging_orange_full_green LED trigger and the trigger is based on
> led_mc_trigger_event() which can set an RGB LED when the trigger is
> triggered. The LED will show orange when the battery status is charging.
> The LED will show green when the battery status is full.
> 
> Link: https://lore.kernel.org/linux-leds/f40a0b1a-ceac-e269-c2dd-0158c5b4a1ad@gmail.com/
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/power/supply/power_supply_leds.c | 26 ++++++++++++++++++++++++
>  include/linux/power_supply.h             |  2 ++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/power/supply/power_supply_leds.c b/drivers/power/supply/power_supply_leds.c
> index c7db29d5fcb8..8dd99199c65b 100644
> --- a/drivers/power/supply/power_supply_leds.c
> +++ b/drivers/power/supply/power_supply_leds.c
> @@ -22,6 +22,9 @@
>  static void power_supply_update_bat_leds(struct power_supply *psy)
>  {
>  	union power_supply_propval status;
> +	unsigned int intensity_green[3] = {255, 0, 0};
> +	unsigned int intensity_orange[3] = {128, 0, 255};
> +	unsigned int intensity_red[3] = {0, 0, 255};
>  
>  	if (power_supply_get_property(psy, POWER_SUPPLY_PROP_STATUS, &status))
>  		return;
> @@ -36,12 +39,20 @@ static void power_supply_update_bat_leds(struct power_supply *psy)
>  		/* Going from blink to LED on requires a LED_OFF event to stop blink */
>  		led_trigger_event(psy->charging_blink_full_solid_trig, LED_OFF);
>  		led_trigger_event(psy->charging_blink_full_solid_trig, LED_FULL);
> +		led_mc_trigger_event(psy->charging_orange_full_green_trig,
> +				     intensity_green,
> +				     ARRAY_SIZE(intensity_green),
> +				     LED_FULL);
>  		break;
>  	case POWER_SUPPLY_STATUS_CHARGING:
>  		led_trigger_event(psy->charging_full_trig, LED_FULL);
>  		led_trigger_event(psy->charging_trig, LED_FULL);
>  		led_trigger_event(psy->full_trig, LED_OFF);
>  		led_trigger_blink(psy->charging_blink_full_solid_trig, 0, 0);
> +		led_mc_trigger_event(psy->charging_orange_full_green_trig,
> +				     intensity_orange,
> +				     ARRAY_SIZE(intensity_orange),
> +				     LED_FULL);
>  		break;
>  	default:
>  		led_trigger_event(psy->charging_full_trig, LED_OFF);
> @@ -49,6 +60,10 @@ static void power_supply_update_bat_leds(struct power_supply *psy)
>  		led_trigger_event(psy->full_trig, LED_OFF);
>  		led_trigger_event(psy->charging_blink_full_solid_trig,
>  			LED_OFF);
> +		led_mc_trigger_event(psy->charging_orange_full_green_trig,
> +				     intensity_red,
> +				     ARRAY_SIZE(intensity_red),
> +				     LED_OFF);
>  		break;
>  	}
>  }
> @@ -74,6 +89,11 @@ static int power_supply_create_bat_triggers(struct power_supply *psy)
>  	if (!psy->charging_blink_full_solid_trig_name)
>  		goto charging_blink_full_solid_failed;
>  
> +	psy->charging_orange_full_green_trig_name = kasprintf(GFP_KERNEL,
> +		"%s-charging-orange-full-green", psy->desc->name);
> +	if (!psy->charging_orange_full_green_trig_name)
> +		goto charging_red_full_green_failed;
> +
>  	led_trigger_register_simple(psy->charging_full_trig_name,
>  				    &psy->charging_full_trig);
>  	led_trigger_register_simple(psy->charging_trig_name,
> @@ -82,9 +102,13 @@ static int power_supply_create_bat_triggers(struct power_supply *psy)
>  				    &psy->full_trig);
>  	led_trigger_register_simple(psy->charging_blink_full_solid_trig_name,
>  				    &psy->charging_blink_full_solid_trig);
> +	led_trigger_register_simple(psy->charging_orange_full_green_trig_name,
> +				    &psy->charging_orange_full_green_trig);
>  
>  	return 0;
>  
> +charging_red_full_green_failed:
> +	kfree(psy->charging_blink_full_solid_trig_name);
>  charging_blink_full_solid_failed:
>  	kfree(psy->full_trig_name);
>  full_failed:
> @@ -101,10 +125,12 @@ static void power_supply_remove_bat_triggers(struct power_supply *psy)
>  	led_trigger_unregister_simple(psy->charging_trig);
>  	led_trigger_unregister_simple(psy->full_trig);
>  	led_trigger_unregister_simple(psy->charging_blink_full_solid_trig);
> +	led_trigger_unregister_simple(psy->charging_orange_full_green_trig);
>  	kfree(psy->charging_blink_full_solid_trig_name);
>  	kfree(psy->full_trig_name);
>  	kfree(psy->charging_trig_name);
>  	kfree(psy->charging_full_trig_name);
> +	kfree(psy->charging_orange_full_green_trig_name);
>  }
>  
>  /* Generated power specific LEDs triggers. */
> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
> index c0992a77feea..9b6898085224 100644
> --- a/include/linux/power_supply.h
> +++ b/include/linux/power_supply.h
> @@ -318,6 +318,8 @@ struct power_supply {
>  	char *online_trig_name;
>  	struct led_trigger *charging_blink_full_solid_trig;
>  	char *charging_blink_full_solid_trig_name;
> +	struct led_trigger *charging_orange_full_green_trig;
> +	char *charging_orange_full_green_trig_name;
>  #endif
>  };
>  

