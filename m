Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B188133F39F
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 20:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764188383; cv=none; b=sgIxJV6d0NI/dtSpaspi4Ybxel3r55W0ux8I3TDqO9xQNWW5hiHDVfqqD54WcV3szOmwfCxkX9lxEPyW1f3Mf609GOsnJWtS7UdaQQrSK7afdJJpt9kuVvlVMKpXN7a3241ezi7ceb9A6LFKN5MEFi/GR65N9VC7m54UxDyW+NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764188383; c=relaxed/simple;
	bh=+L92OgRzckF8lysBDUjzwD+rby1GBhwcu5vhVpsisw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3/ROOAUcd2Wv4WXJ2HhwkrgwongDnN6ZGFQAomQK7PTlkidbx1D2pVYoW5jjhlcyz7eWkunhQo0yI6xNdrpkjvATxYs7Ywx1wGU971sm/UP8oAf+D2eM3Js2Z0PQRbSI98jOoiDDthfGuHIUCB8CtERicnJcyM7+jwwAnyfWmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DB9GXMCe; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DB9GXMCe"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so825778f8f.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 12:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764188379; x=1764793179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W1Ghjj0om1Ay0qf6/KldkuwEcS8A6uUNI7dFPbMcUe8=;
        b=DB9GXMCeCTVUALIuNFw1Ep0JHUW3A1wMpWa/tVKMYxi6WclTKUVtFH8PJtC0Ub2pVi
         hoXl4nHWzPbarvA5gLhWk3pj/q469Xoy7jkG7SYmzlbCi3Tqe6AtTRVUpyj39vn7w44Z
         cQpXxY0jo8ldaQxKamoG9RKsCmr+KeTCeZKfJW/ZrMYZTgRXRVptfnCIBRolE9X4Szq3
         znmdowffpScJSXyK29MSjaspmYaPbM27AMPED+GIKSWO7C0XkoUGomO7AEt/xVOV6q/3
         dCwrB/hBEG6Lh2LOK1wPXhYNdr7P3hHu9PPcMuN7eIph8Ct2+vIe4o/znMyTwbHFb7DU
         RhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764188379; x=1764793179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1Ghjj0om1Ay0qf6/KldkuwEcS8A6uUNI7dFPbMcUe8=;
        b=KBBvzObSA9KAB5EsV9eLQrHuAV90RHrVugVCViSNOcvSZxGQhNkb1BUMIeO1Y7PCaf
         pBn/GE07xuOQgj5K/ipQmSsCQpgX+6PV4bJQTtOF84Hm+B6zVS/dM8BNJKuJATDeDgrY
         YYbuH3C2B6ixAuTsyUub0KdCz5/a6AX9lK7LrpTn7OQZyMk6Z/ZxanYCmQMvEhrGDATz
         etg29TToeC+k9wMHvQQiNmpyr1IUqWArF8lzTjaxoiUQ+EMd9UPdE9BV/Bm5L5CqpIA3
         qAyUfVOKbQi2MViqecu8VkQ1SW0logqvG6VVkptyVBh+090L17jj763CfceGdbkFG+DO
         cmRw==
X-Forwarded-Encrypted: i=1; AJvYcCUqrul24n1kZbHXkEF9V31F+amqbOvMVhk5OAlvtjZqoxOFpHaVvMjvcVLdB23d7ZYl3Xtb9B3RMLjsMiIWUPMvX618@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6StGR4BkyZFGrv/z7u4dOATnfNWfmu+2nbUCc/jKueJiuT4OC
	IoKPpYOjWojx7DjxiY5LoA8zryVIrvL2fPhmuZ9MwjHnD8eYenOTlfDm
X-Gm-Gg: ASbGncuV7d7/AXl6XdG3uuZASiJrGPj5CzHNry/wt5PnPqLzZKgvn/Tx+ZmSZrCyiWP
	6HXV3k/tCvJaxaqV1teqwRsFj6yqIjee2UQIwDdMnazX6Mi9UPU5FOceF8HIQGJI7qRxUakFMVn
	Ga9R68Ej29DpeXoy7m2Y25nwQ/C97lGNFr+pgD7yVHXTNjhmgMHmZ6mBB2Edq3vRN+cZA8eRPgS
	HnI35SZvMVcGiRhf/QaqFYg0u6rsNi6AfZnj5M6bFs4dBerpfjKDCutDqF5CVBxiyc7BYE8kdDh
	PprlHH/r7o25V3v01EwkwMPoXtxmDepFPZ1XtYAhbHyUdn6YJts1+c+/PmXZxOXhx+BrbDd6w35
	JjihxizUYV7Gkidvkt4yHgptSN5DkITXPHw+6TJcbN0AV0UmEgZHALdLOpViQwABmUEYxhpRx2I
	euiuNzgJm5tEjT9Dpm0oZKBKI=
X-Google-Smtp-Source: AGHT+IGqfsrj/1HHB7lKhCnVz1sW5u/XkYNSFM2KNvJF161TnGDhnm7/YvioNnjmR9vUKlqVT7PBFQ==
X-Received: by 2002:a5d:5d88:0:b0:429:bfbb:5dae with SMTP id ffacd0b85a97d-42cba7a8100mr27345858f8f.17.1764188378909;
        Wed, 26 Nov 2025 12:19:38 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8baesm42816445f8f.39.2025.11.26.12.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 12:19:38 -0800 (PST)
Message-ID: <f5220043-f685-4778-9fc7-9c3585c01fb3@gmail.com>
Date: Wed, 26 Nov 2025 21:19:37 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/11] platform/x86: asus-wmi: remove unused keyboard
 backlight quirk
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251122110032.4274-1-lkml@antheas.dev>
 <20251122110032.4274-10-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251122110032.4274-10-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/22/25 12:00, Antheas Kapenekakis wrote:
> The quirk for selecting whether keyboard backlight should be controlled
> by HID or WMI is not needed anymore, so remove the file containing it.
Reviewed-by: Denis Benato <benato.denis96@gmail.com>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  .../platform_data/x86/asus-wmi-leds-ids.h     | 50 -------------------
>  1 file changed, 50 deletions(-)
>  delete mode 100644 include/linux/platform_data/x86/asus-wmi-leds-ids.h
>
> diff --git a/include/linux/platform_data/x86/asus-wmi-leds-ids.h b/include/linux/platform_data/x86/asus-wmi-leds-ids.h
> deleted file mode 100644
> index 034a039c4e37..000000000000
> --- a/include/linux/platform_data/x86/asus-wmi-leds-ids.h
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __PLATFORM_DATA_X86_ASUS_WMI_LEDS_IDS_H
> -#define __PLATFORM_DATA_X86_ASUS_WMI_LEDS_IDS_H
> -
> -#include <linux/dmi.h>
> -#include <linux/types.h>
> -
> -/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
> -#if IS_REACHABLE(CONFIG_ASUS_WMI) || IS_REACHABLE(CONFIG_HID_ASUS)
> -static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "ProArt P16"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_BOARD_NAME, "GU605M"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> -		},
> -	},
> -	{ },
> -};
> -#endif
> -
> -#endif	/* __PLATFORM_DATA_X86_ASUS_WMI_LEDS_IDS_H */
