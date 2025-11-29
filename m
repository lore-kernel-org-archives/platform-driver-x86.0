Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA1926738D
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Nov 2025 13:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764424504; cv=none; b=LBAlEtK31u4CJ+WbvBTLeuwopsAeXanzBxkr55eSiucRT2K/fYx9Cjk7YDFYidtW+pRBFseHDzVUPi0nHJERZXQ/10sxfWTsFXEq03LUOR/qTkjV/KVzLZ98HmXlT4vBBKE9wSgbFRmSBu+hrlC6eXF33zwq1xu0lW2cFyUaX9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764424504; c=relaxed/simple;
	bh=gWKYc2eLaVGIJXFIP+DdXwUaHyC08QdUjzDZibaaXRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sh9ETQ3ZmGC1Gl5LINLynMxd1J2X9fCm0lXB3LNMYdeQ4Zsfjp1Ai3bbYEK5Dtgz8/DnPqX/dLnXLdaf1uZrAQ0rsIzbeQ/zEgsoZI+nQW53Ot1NPjqmIkbcBuJB3I7WlIZEFlECYRTiOTgQaSCDvehtcllT1X8RqNF1t4giCy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKUFSkR5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKUFSkR5"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b47f662a0so1888252f8f.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Nov 2025 05:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764424500; x=1765029300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kuJJa1QyfSgZDITAN+wzAijav66vEdBFiqUvaGNcsFE=;
        b=fKUFSkR5T0o+k6XbDm8x+N6VBjo0Y7qmv/YMEUlQi3Ow0zmjfcY/BcBSQ6F2LIyBqX
         SgODaSLPQTixQhL9wqRz8XTrYFmvy7cEfibT/FVuGbHyNBq6eQBxFI2UmzGRdEmnbTU6
         EeYkzgIZdCNzbKY4qDIE/ZAHp+RqAa00sOBzeOzB+ToLr2vplFQdP+zefMx8lOmd2YlC
         eXppCYRPsBRE28nEh9JLFqlWczbx65dQMlhCXJGbzLarEXCP5iBb8DKLoCfd2C0qSY8p
         3FBgHRTnlP/oa/eZZf08PezmKDHeANjtY++zG34VLqrbI29C1tC6V8E9i6ZqR9FQEuKP
         RGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764424500; x=1765029300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuJJa1QyfSgZDITAN+wzAijav66vEdBFiqUvaGNcsFE=;
        b=BXHL3WuEHYJesRnutO2V1ZRlKoAxNaNw8I6fVx4YrOo5EgdIvCt8rrnw7uN0m1sAcq
         RLzKTAJQxfRXHjaEWJXlXF4M1J6+BQSWcxCK+szI1DUheGN++6C67CpwtjbpmJF+6p6p
         2wKeK7ZB68FmbXFqEkZprYrz0gfuCyB71fzn5UsxXVj2x6uu632CrSjTKz3pg6wdzO0j
         w3f9RKQCx7n+vpeCx0jtiXKTbPJcuEL1Dx6eg89iBxjfM1dcArg/2kuZUisE8q2K7Sga
         2vgZ0USuNegkw5C4m+gIMCgiV4+Z+7kY/cHJE2XGtFG57GTfh+dVDOTeU5eBT3EI+bVF
         b1QQ==
X-Gm-Message-State: AOJu0YxRb3CVp5xfvf79RDV/lIUg84kt24YigDNjJHSFFsRD7Mgi86ME
	vquXIvoGJQ228n3bb1coU3MQwMYVz4fpX+iQrc4yksp9PmxDLB8VALzcSMY0xA==
X-Gm-Gg: ASbGnctIWQwM0q4WT+BARlm1ULZx3dRtlhQVxGyRKleVA9J3vfQ0SE1qg9X8NdkFgw6
	YtGKu6QB6gCCVdqAR87MUGghFhBRG3sQE4JobcV/DPu4/rB44U9rpCr/DMnTO61LDoDTGGY1Yk/
	N+Bn7yZLOSTANiBRYQ1Lj+wdAFB/PYm9LqZ/4Wpoa8qPWZ4hyNS4EFFdTuxzLZhi7RRq9izzUZQ
	+V8Ppwmwq0yT5wxARGMaOqy0BZff3Sz+Hk3/IDddwDhMEIGOj9M38OcHQ+jm4+idxA7oBUxFjKB
	qM1Rarw/f0pbFpevB8NpsqZW4fiKig+adwynTBDGLKMgMA6UzW3T5fp9Y6rLxoIzIHSstc9mg8w
	/76VcxoEVyVEAMscSMVZAwbiDVcDnKbs68UMcfngX/4p1HCPXFI6cZbo+MelGrVHyiNg9de5sw4
	yJQzinq8yGt882Y1pvx+FDG1g=
X-Google-Smtp-Source: AGHT+IFnYjShq3rPpM766kWeJ3++2I/bYOmZL/eRZqSUa9tMG8SkQxhaeeLvqdMubHFcw0q1cKRIOg==
X-Received: by 2002:a05:6000:228a:b0:3e7:6424:1b47 with SMTP id ffacd0b85a97d-42cc12f1bbamr37984898f8f.6.1764424499866;
        Sat, 29 Nov 2025 05:54:59 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3016sm15759806f8f.1.2025.11.29.05.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Nov 2025 05:54:59 -0800 (PST)
Message-ID: <3da3baa8-aaea-45eb-a560-b81151a85803@gmail.com>
Date: Sat, 29 Nov 2025 14:54:58 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: asus-wmi: use brightness_set_blocking()
 for kbd led
To: Anton Khirnov <anton@khirnov.net>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251129101307.18085-3-anton@khirnov.net>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251129101307.18085-3-anton@khirnov.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/29/25 11:13, Anton Khirnov wrote:
> kbd_led_set() can sleep, and so may not be used as the brightness_set()
> callback.
>
> Otherwise using this led with a trigger leads to system hangs
> accompanied by:
> BUG: scheduling while atomic: acpi_fakekeyd/2588/0x00000003
> CPU: 4 UID: 0 PID: 2588 Comm: acpi_fakekeyd Not tainted 6.17.9+deb14-amd64 #1 PREEMPT(lazy)  Debian 6.17.9-1
> Hardware name: ASUSTeK COMPUTER INC. ASUS EXPERTBOOK B9403CVAR/B9403CVAR, BIOS B9403CVAR.311 12/24/2024
> Call Trace:
>  <TASK>
>  [...]
>  schedule_timeout+0xbd/0x100
>  __down_common+0x175/0x290
>  down_timeout+0x67/0x70
>  acpi_os_wait_semaphore+0x57/0x90
>  [...]
>  asus_wmi_evaluate_method3+0x87/0x190 [asus_wmi]
>  led_trigger_event+0x3f/0x60
>  [...]
Hi and thank you very much for this!

Reviewed-by: Denis Benato <benato.denis96@gmail.com>
> Fixes: 9fe44fc98ce4 ("platform/x86: asus-wmi: Simplify the keyboard brightness updating process")
> Signed-off-by: Anton Khirnov <anton@khirnov.net>
> ---
> v2:
>  - reworded commit message, adding traceback
>  - merged lines in kbd_led_set() signature
> ---
>  drivers/platform/x86/asus-wmi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index e72a2b5d158e..8e3300f5c294 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1619,14 +1619,14 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>  	kbd_led_update(asus);
>  }
>  
> -static void kbd_led_set(struct led_classdev *led_cdev,
> -			enum led_brightness value)
> +static int kbd_led_set(struct led_classdev *led_cdev, enum led_brightness value)
>  {
>  	/* Prevent disabling keyboard backlight on module unregister */
>  	if (led_cdev->flags & LED_UNREGISTERING)
> -		return;
> +		return 0;
>  
>  	do_kbd_led_set(led_cdev, value);
> +	return 0;
>  }
>  
>  static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
> @@ -1802,7 +1802,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>  		asus->kbd_led_wk = led_val;
>  		asus->kbd_led.name = "asus::kbd_backlight";
>  		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> -		asus->kbd_led.brightness_set = kbd_led_set;
> +		asus->kbd_led.brightness_set_blocking = kbd_led_set;
>  		asus->kbd_led.brightness_get = kbd_led_get;
>  		asus->kbd_led.max_brightness = 3;
>  
