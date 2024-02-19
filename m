Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA8C381AC
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 14:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708351665; cv=none; b=noZrKnhfFy65Nbp22rqKP09QyZqeFgO97ODleCUlgqS/u8dGU+7M7MluhBlO9GTAJ43DCXTF4bZqRak5S9zGhe+xnAt9jfo7M3KuVNxJ06cWcFXcpM8L5xBu7uPLw+Rdlk28cfeoLV/xrpZVOX6beTzuLaAUJECjh1YZ/R91uek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708351665; c=relaxed/simple;
	bh=Yubxcwc74fnvinboM8f2wKWx0JVSdMIlG/Jp7i17rKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jFxLc8Pj92/mG3kHRDQK/h0P5vM+6dSqcrRtHxQz4M1KMkmnu4GmwpK0m/5k9UHo0bk8Z9XC+3JA7wuLk9kR9g6DlsLsIamT1ECObazYc/uPbuH1cEIZFxpMKMtI6N0IMjQ0ArD9dQcxdN7aQ+S46HB4N9BpXXfhkAfWd7CEVNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MYe0pjaR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MYe0pjaR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708351662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JatPSeu8YiBwIRU1HbTBc2vJuzkDUblm7vhLTXnjP1w=;
	b=MYe0pjaR2J+gcqNiE354gmNmz0n4RPWLgeZykIX4etA9RZOHxgRvUHsHIiaN6Ix50sIkyd
	HezIxVyimSKd7qB7MQkUKLRx+gsgnOpY6iYDnfC3vA6/ZkpwmqUqe2x3GOf2C5vAcNHUmi
	EMwngubYcegZdMU9I8dPked+3ewREWs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-JXtggdriO2OoIo8p90mXBw-1; Mon, 19 Feb 2024 09:07:40 -0500
X-MC-Unique: JXtggdriO2OoIo8p90mXBw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-564753be3deso531027a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 06:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708351659; x=1708956459;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JatPSeu8YiBwIRU1HbTBc2vJuzkDUblm7vhLTXnjP1w=;
        b=MHt8s9A3gquavAtGOEBFcipqU5fKX/B/U4sVAHZ3R7Iuwe9RVUURmEqV/LzohfV3EC
         DtotNNfCLD3XZnej62EWOoKBu693UON8n9qBFiOXT+xY25u+H9rQaUCUgxSUTd9aiZL6
         zec4wO5RtX1wqrqg08CiouCmNkAb5gFaGQ01PQGnQsUKJ6x4DoHVHnjcqz6oABN22vC6
         5cv3Qrq8RM3xudFCsJpOfNbBM53tkckWr66yrH+wiOqX2v7Xyk6ygETfqju61jTgslCj
         XAwCVXQvZa1B1g5WmTE228IjcLm8cok1ZH2oap3hvrQKTFezkZslyL7acOXv5gKCc6ab
         x5ig==
X-Forwarded-Encrypted: i=1; AJvYcCV5j4xdEFRFVKbLF38tDhNPODKwifR9eV16kDHAYkAufxubvHW73nDlqnhAh+knrVq/1rcAWYft1lKpqLo3DkBd1biz1hVPaEiN1QkJ80WvUelXVQ==
X-Gm-Message-State: AOJu0YwVlLuu3IEe0Qw45IUO2qFaAxybOLDJvEWXNEZdtadl19OiLgQb
	doNTXd+3+yelMP8036vrRcb4T8//mk1jQdLrymzV+fLMjXn5vcJMNBJyysMgLnj6u0U+fpcG3m0
	vLJ7nDC1VZSD33Hp9Nlz+6cEYuIznSZw3YUBpD/ArGBAiDs1jLgIam1KA5JKeiJEv7jqRBAY=
X-Received: by 2002:aa7:d642:0:b0:564:a718:5334 with SMTP id v2-20020aa7d642000000b00564a7185334mr573090edr.30.1708351659538;
        Mon, 19 Feb 2024 06:07:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOizrac7Yg5FzmH5oWrMJAPRFQ3K6xO58/1F8nJ5fZ2SDtAX0W5/hkjvBf8oXt4JSfjGi4DA==
X-Received: by 2002:aa7:d642:0:b0:564:a718:5334 with SMTP id v2-20020aa7d642000000b00564a7185334mr573076edr.30.1708351659220;
        Mon, 19 Feb 2024 06:07:39 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id bc24-20020a056402205800b00564a94cac1fsm185919edb.28.2024.02.19.06.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 06:07:38 -0800 (PST)
Message-ID: <a62e3df9-b111-4093-a9de-cc7897f1b306@redhat.com>
Date: Mon, 19 Feb 2024 15:07:37 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] platform: x86-android-tablets: other: Add swnode
 for Xiaomi pad2 indicator LED
Content-Language: en-US
To: Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
References: <20240216160526.235594-1-hpa@redhat.com>
 <20240216160526.235594-2-hpa@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240216160526.235594-2-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kate,

On 2/16/24 17:05, Kate Hsuan wrote:
> There is a KTD2026 LED controller to manage the indicator LED for Xiaomi
> pad2. The ACPI for it is not properly made so the kernel can't get
> a correct description of it.
> 
> This work add a description for this RGB LED controller and also set a
> trigger to indicate the chaging event (bq27520-0-charging). When it is
> charging, the indicator LED will be turn on.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  .../platform/x86/x86-android-tablets/other.c  | 85 +++++++++++++++++++
>  .../x86/x86-android-tablets/shared-psy-info.h |  2 +
>  2 files changed, 87 insertions(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
> index bc6bbf7ec6ea..542ef6667b7b 100644
> --- a/drivers/platform/x86/x86-android-tablets/other.c
> +++ b/drivers/platform/x86/x86-android-tablets/other.c
> @@ -12,6 +12,7 @@
>  #include <linux/gpio/machine.h>
>  #include <linux/input.h>
>  #include <linux/platform_device.h>
> +#include <dt-bindings/leds/common.h>
>  
>  #include "shared-psy-info.h"
>  #include "x86-android-tablets.h"
> @@ -593,6 +594,87 @@ const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
>  	.gpiod_lookup_tables = whitelabel_tm800a550l_gpios,
>  };
>  
> +/*
> + * The fwnode for ktd2026 on Xaomi pad2. It composed of a RGB LED node
> + * with three subnodes for each color (B/G/R). The RGB LED node is named
> + * "multi-led" to align with the name in the device tree.
> + */
> +
> +/* main fwnode for ktd2026 */
> +static const struct software_node ktd2026_node = {
> +};
> +
> +static const struct property_entry ktd2026_rgb_led_props[] = {
> +	PROPERTY_ENTRY_U32("reg", 0),
> +	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RGB),
> +	PROPERTY_ENTRY_STRING("function", "indicator"),
> +	PROPERTY_ENTRY_STRING("linux,default-trigger",
> +			      "bq27520-0-charging"),
> +
> +	{ }
> +};

What is the result of setting this default trigger on
the multi-color LED class device ?

Will the LED now turn on at whatever color it was last
set (presumably white?) when charging and turn off
again when charging is complete, or the charger is plugged out ?

Regards,

Hans




> +
> +static const struct software_node ktd2026_rgb_led_node = {
> +	.name = "multi-led",
> +	.properties = ktd2026_rgb_led_props,
> +	.parent = &ktd2026_node,
> +};
> +
> +/* B */
> +static const struct property_entry ktd2026_red_led_props[] = {
> +	PROPERTY_ENTRY_U32("reg", 0),
> +	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_BLUE),
> +	{ }
> +};
> +
> +static const struct software_node ktd2026_red_led_node = {
> +	.properties = ktd2026_red_led_props,
> +	.parent = &ktd2026_rgb_led_node,
> +};
> +
> +/* G */
> +static const struct property_entry ktd2026_green_led_props[] = {
> +	PROPERTY_ENTRY_U32("reg", 1),
> +	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_GREEN),
> +	{ }
> +};
> +
> +static const struct software_node ktd2026_green_led_node = {
> +	.properties = ktd2026_green_led_props,
> +	.parent = &ktd2026_rgb_led_node,
> +};
> +
> +/* R */
> +static const struct property_entry ktd2026_blue_led_props[] = {
> +	PROPERTY_ENTRY_U32("reg", 2),
> +	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RED),
> +	{ }
> +};
> +
> +static const struct software_node ktd2026_blue_led_node = {
> +	.properties = ktd2026_blue_led_props,
> +	.parent = &ktd2026_rgb_led_node,
> +};
> +
> +static const struct software_node *ktd2026_node_group[] = {
> +	&ktd2026_node,
> +	&ktd2026_rgb_led_node,
> +	&ktd2026_red_led_node,
> +	&ktd2026_green_led_node,
> +	&ktd2026_blue_led_node,
> +	NULL
> +};
> +
> +static int __init xiaomi_mipad2_init(void)
> +{
> +	return software_node_register_node_group(ktd2026_node_group);
> +}
> +
> +static void xiaomi_mipad2_exit(void)
> +{
> +	software_node_unregister_node_group(ktd2026_node_group);
> +}
> +
>  /*
>   * If the EFI bootloader is not Xiaomi's own signed Android loader, then the
>   * Xiaomi Mi Pad 2 X86 tablet sets OSID in the DSDT to 1 (Windows), causing
> @@ -616,6 +698,7 @@ static const struct x86_i2c_client_info xiaomi_mipad2_i2c_clients[] __initconst
>  			.type = "ktd2026",
>  			.addr = 0x30,
>  			.dev_name = "ktd2026",
> +			.swnode = &ktd2026_node,
>  		},
>  		.adapter_path = "\\_SB_.PCI0.I2C3",
>  	},
> @@ -624,4 +707,6 @@ static const struct x86_i2c_client_info xiaomi_mipad2_i2c_clients[] __initconst
>  const struct x86_dev_info xiaomi_mipad2_info __initconst = {
>  	.i2c_client_info = xiaomi_mipad2_i2c_clients,
>  	.i2c_client_count = ARRAY_SIZE(xiaomi_mipad2_i2c_clients),
> +	.init = xiaomi_mipad2_init,
> +	.exit = xiaomi_mipad2_exit,
>  };
> diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> index c2d2968cddc2..8c33ec47ee12 100644
> --- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> +++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> @@ -29,4 +29,6 @@ extern const char * const bq24190_modules[];
>  extern const struct platform_device_info int3496_pdevs[];
>  extern struct gpiod_lookup_table int3496_reference_gpios;
>  
> +extern const struct software_node ktd2026_leds_node;
> +
>  #endif

