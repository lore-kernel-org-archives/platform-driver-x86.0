Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124E117B4F6
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 12:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723466906; cv=none; b=D8ijGqjYBdy0L9DfCDcUzh2ol34isv6lIk/caiRTGOr/pNaCmRRV8vUMGe1j730/Hjs00XK76Zn6FTGIa0wtjLH1BReUieS5CzD+htai0PLCRojugDhSP0gL1hNqXGy/J349XZvrTGJDKwNV36G250pQRVcP/sCqrTubba9jml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723466906; c=relaxed/simple;
	bh=8bo8xpp/6vJwbHGAAvw+1pSQFYWA+0dCEVeKlYLVTqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wwss0Gqahb/+AavIIK9tVVgkFHFQxoDZ4+UZy1gwhhcPfG011Z0OkH/bQFbqOsyjOnq+VR84LJ4AcZIVaIgh1KiInLZFhALSZMWj0YPDCQueo/amyHxtdqprYNK8u5uEbjdSCgtdg6WXSNihPXrc4uul9KYbRVblvDdBqWNPp34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MUttT0Q4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MUttT0Q4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723466903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8d8haasheAsFVThGjhEYRKDinSaCWYMQj8ax5D0rh3A=;
	b=MUttT0Q4v1O5iXT+JkaIS6IjaQ0KpMwofgoNw/ERGC56KddeM+uxF8mjXQUJxL4aNZqQZR
	kpczCF5UsMVo8vyKhRSZt3WSG/U3EfW7tQ7FCOb6iRdGhJ4cSaRbevNi2tRI1F8CHX1iWK
	qubJh61bgj+K0sWlUqgULZ3cb2juLWE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-3dRWg2eRM0SopIiwm8BoJQ-1; Mon, 12 Aug 2024 08:48:22 -0400
X-MC-Unique: 3dRWg2eRM0SopIiwm8BoJQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52f0258afecso5271441e87.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 05:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723466901; x=1724071701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8d8haasheAsFVThGjhEYRKDinSaCWYMQj8ax5D0rh3A=;
        b=JT4PBpsxEKeH4EP1i64ojW4ZEaBXHBnGcZ4D0kXP0FNVkUvo1e8CaPiplsJ+yuadhm
         4BIhxZYRYA+BPs9zGXHavNWHqtUFcV0RRbCziGQoseEz9AvBEFQ0KAKuVpmJo/XgWZYh
         6zzZBh+6G2M2YvbZPoI3kRK+biqbH4bJX6ctVADXkYpoPc6cgh29PxnQ6l2AfQ2ZBtdh
         1N3/fNq/Q8QuguWHQrCI+fgUSIPMUlRY/MeAuoK/pnqRkw9AAvB90eK5XgP1zYgj3rNh
         bkf9Fscs3HqqK7ys1mqaB3JbLD/el55ifXRrw7DeokRSfvqLT+l4AYyll7js6Vh57VzW
         5piA==
X-Forwarded-Encrypted: i=1; AJvYcCWqkmWV2/CCouplUsOQpLwXpm1jwD3bDbcuF5qdOoKhmW7CxmsLE/93vJGntTrerUDqJDpAHr6gnN22U2MJ9jZQm9zsIRlDILgerVJYdeJVpnGGUw==
X-Gm-Message-State: AOJu0YyYmvVdYac6RaZp9LoV/lzi4I+zQcSQL73KKCWOgBNLVj1ajnbc
	qv3ynsY03FvVNtDe8w6nVFfga5TBevIZhrf0acWDZlU8k4t46jdmhfGqwKXnMmwr11j+6py4TYc
	MY0r+WiW0ehIR3Sn+Jjl9XfcM+GwlFr4CKLKCfQ2kYWCWG0azEy+yQE+yrB59rj0a7dZzmLw=
X-Received: by 2002:a05:6512:3e0c:b0:52c:e07d:229c with SMTP id 2adb3069b0e04-5321365d338mr7197e87.22.1723466900840;
        Mon, 12 Aug 2024 05:48:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHejkkgyA0azZvDT/mX1/XOZpJaecJH2R29rXxfhob07pjKW9TXVcI9hlTBx8S42862SP10xQ==
X-Received: by 2002:a05:6512:3e0c:b0:52c:e07d:229c with SMTP id 2adb3069b0e04-5321365d338mr7163e87.22.1723466899980;
        Mon, 12 Aug 2024 05:48:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb243c3dsm229614366b.225.2024.08.12.05.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 05:48:19 -0700 (PDT)
Message-ID: <7bf12e39-8956-4cd3-a90a-871291d84370@redhat.com>
Date: Mon, 12 Aug 2024 14:48:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] HP: wmi: Add documentation for the LED API naming
 scheme
To: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>,
 ilpo.jarvinen@linux.intel.com, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>
Cc: mustafa.eskieksi@gmail.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
References: <20240719100011.16656-1-carlosmiguelferreira.2003@gmail.com>
 <20240719100011.16656-3-carlosmiguelferreira.2003@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240719100011.16656-3-carlosmiguelferreira.2003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

+Cc Pavel, Lee, linux-leds for review by the linux LED subsystem folks.

Pavel, Lee there are 2 pdx86 drivers for control of zoned (3/4 zones)
RGB backlit laptop keyboards pending:

https://lore.kernel.org/platform-driver-x86/20240719100011.16656-2-carlosmiguelferreira.2003@gmail.com/
https://lore.kernel.org/platform-driver-x86/20240806205001.191551-2-mustafa.eskieksi@gmail.com/

both of these will use 1 multicolor LED class device per keyboard zone,
using the naming convention documented in this patch.

It would be good if we can get feedback or an ack from you for this
userspace API before merging these drivers.

Note the first part of the patch documents the already existing naming
scheme for single zone (RGB or mono color) backlight keyboards. This
scheme is already used by many drivers and by userspace consumers like
upower. So this is just documenting existing userspace API which so far
was not documented.


Carlos, Thank you for writing this patch.

For v2 please change the patch subject to:

"Documentation: leds: leds-class: Add documentation for keyboard backlight LED device names"

and this should also be merged through the LED subsystem tree, so for v2
please send this to Pavel + Lee with linux-leds + platform-driver-x86
in the Cc.


On 7/19/24 11:59 AM, Carlos Ferreira wrote:
> This patch adds documentation for the LED API class-device naming
> scheme practice.
>
> Signed-off-by: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>
> ---
>  Documentation/leds/leds-class.rst | 40 +++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
> index 5db620ed27aa..8e74a436ca9b 100644
> --- a/Documentation/leds/leds-class.rst
> +++ b/Documentation/leds/leds-class.rst
> @@ -116,6 +116,46 @@ above leaves scope for further attributes should they be needed. If sections
>  of the name don't apply, just leave that section blank.
>  
>  
> +Keyboard backlight control
> +==========================
> +
> +For backlit keyboards with a single brightness / color settings a
> +single (multicolor) LED device should be used to allow userspace
> +to change the backlight brightness (and if possible the color).
> +This LED device must have a name ending in ':kbd_backlight'.
> +
> +For RGB backlit keyboards with multiple control zones, one multicolor
> +LED device should be used per zone. These LED devices' name
> +must follow the following form:
> +
> +	"<devicename>:rgb:kbd_zoned_backlight-<zone_name>"
> +
> +and <devicename> must be the same for all zones of the same keyboard.
> +
> +Where possible <zone_name> should be a value already used by other
> +zoned keyboards with a similar or identical zone layout, e.g.:
> +
> +<devicename>:rgb:kbd_zoned_backlight-right
> +<devicename>:rgb:kbd_zoned_backlight-middle
> +<devicename>:rgb:kbd_zoned_backlight-left
> +<devicename>:rgb:kbd_zoned_backlight-corners

The -corners zone was based on a misunderstanding about
the Excaliber laptop's functionality, please drop
the "<devicename>:rgb:kbd_zoned_backlight-corners"
line here as well as below.

Regards,

Hans



> +<devicename>:rgb:kbd_zoned_backlight-wasd
> +
> +or:
> +
> +<devicename>:rgb:kbd_zoned_backlight-main
> +<devicename>:rgb:kbd_zoned_backlight-cursor
> +<devicename>:rgb:kbd_zoned_backlight-numpad
> +<devicename>:rgb:kbd_zoned_backlight-corners
> +<devicename>:rgb:kbd_zoned_backlight-wasd
> +
> +Note that this is intended for keyboards with a limited number of zones,
> +keyboards with per key addressable backlighting must not use LED
> +class devices since the sysfs API is not suitable for rapidly change
> +multiple LEDs in one "commit" as is necessary to do animations /
> +special effects on such keyboards.
> +
> +
>  Brightness setting API
>  ======================
>  

