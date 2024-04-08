Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC5538FB9
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712568049; cv=none; b=XAJV5ne6lMNjrV3YzYZvRtYyTNtSkom3HcSJ+ipL/gS1BhSf+BKimNuiRD1aYAbtgbVd3nVBXIfkG1baxhJ0RA3iBTv2YtpDxqbPioRV+k2YmfqdKaM7Ofy35di34DmQNfQu7k7G0oCmxbD5oz8ASdJVuVKLKY59oidDdYOl+hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712568049; c=relaxed/simple;
	bh=uICW+mNY3EyrSEYGd3zlsmDxfG0iZhWyhJx+NXP/ayo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EeUey8IUly5vALETfEKApDpSgFRD/cI0IDCz8rvfv5K/aalroJ7i/QLr2XXgDf1JfypryMnDucNQCscO+HAIqrSePk9tie+kM1Ps6vETEOHiay+OI6OD9B971o55wL/xiWH57+qzJYRmAAeAXt/auP5mE766CS9Fnqr1DrldIY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H6auGtrv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H6auGtrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712568047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sXtEdlF4UoQvZ+64ZfEdPlGWL47TtGijXyBK/aKKQV0=;
	b=H6auGtrvbC03tRBL9xBTr5ok338MLeYY8MjhAVPGofjpO3v3GQghHhxUhIhmCNyZ32+Cqj
	kMvqgGR9jd2X7dN4j77xzXqhjoVspKWr5PvLcpVoKWBC0bfZ/hfsOGWMAQRtzsDugZSEtH
	a/6pG4ZjGrHM/A1cvGoAKyc2v174hBw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-30DL78ObNU2f06E_ZwgJaA-1; Mon, 08 Apr 2024 05:20:45 -0400
X-MC-Unique: 30DL78ObNU2f06E_ZwgJaA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a51d062b178so47802966b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Apr 2024 02:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712568044; x=1713172844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sXtEdlF4UoQvZ+64ZfEdPlGWL47TtGijXyBK/aKKQV0=;
        b=SjBh010qvkKZiqnTNcAkSx46sV3tWnU3JvrdYXBMjVcw5kOAy+H4HhgIW4LJNqNLPl
         CFfVW+JsF57XquZyIIQk6ki9A2cOIrPURJvsaQrmOQegNU+29CMHAaYFRV1sWle5j3D3
         poRfMiQ0Q4wi6uqJ1/zaDDLsMSoQpgS6qYPBmYWz7aENiVg5VB8+kUhbQdQO0TZvSXGt
         Z2w6yK0cuOwHCZl44baWbDZMNh+EFMQYOz2GaERUbjN6tOmTby1RTGFePtmTNQGT6piM
         48ZHOiBQkuUOrxZIVIRaEDKW12QZhEK1rcQwwF55Nr2mo4ceNqtg1mAH0ccXcVA06fMm
         gW8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUGv4uofah4q8q5NAPfSdrjFJulH7CRshVFKqLA/8+0JDGV2yjSeiEya4rKEj7FLFUQIN4gXQptPvx/HB7HlZby8D8K4rmN3uJI0lHHnse2VGdog==
X-Gm-Message-State: AOJu0YwF0sSVNeUzHvyQp5VKhS4jF6nvoj/rLKIyuBnjaZQs/hplR5uJ
	O6VIHXv7KGwynEaqeQmNhbEG1iUKm5qd9jSZsG24hbmk6WIEWkE1ALT0SIcb4ZysSbLca+Ae1xD
	YcHpsC63xXlT/ASqjq3+KtrdhuXEHpy5OpFV+vJJ6iK7I+silvI4kYqgsQaDXSpUN5DanWYg=
X-Received: by 2002:a17:906:2514:b0:a50:9190:b751 with SMTP id i20-20020a170906251400b00a509190b751mr5880262ejb.10.1712568044183;
        Mon, 08 Apr 2024 02:20:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHARFE3hVYdjK6ftgphFMP9J3EAhaisQhKehclQ0kly3VquLZBtyeG/nX8FsGt/GOoivRgBKQ==
X-Received: by 2002:a17:906:2514:b0:a50:9190:b751 with SMTP id i20-20020a170906251400b00a509190b751mr5880242ejb.10.1712568043813;
        Mon, 08 Apr 2024 02:20:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l15-20020a170906414f00b00a519de61bebsm4205764ejk.137.2024.04.08.02.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 02:20:43 -0700 (PDT)
Message-ID: <bc71ae19-bc6f-4071-bcaa-f4e41ae283e9@redhat.com>
Date: Mon, 8 Apr 2024 11:20:42 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: quickstart: fix Kconfig selects
To: Arnd Bergmann <arnd@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Henning Schild
 <henning.schild@siemens.com>, SungHwan Jung <onenowy@gmail.com>,
 Ai Chao <aichao@kylinos.cn>, Robert Joslyn <robert.joslyn@redrectangle.org>,
 Henry Shi <henryshi2018@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240404123435.2684819-1-arnd@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240404123435.2684819-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/4/24 2:34 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The new driver Kconfig entry has a typo that causes a link failure
> when CONFIG_INPUT_SPARSEKMAP is disabled:
> 
> x86_64-linux-ld: drivers/platform/x86/quickstart.o: in function `quickstart_notify':
> quickstart.c:(.text+0x96): undefined reference to `sparse_keymap_report_event'
> x86_64-linux-ld: drivers/platform/x86/quickstart.o: in function `quickstart_probe':
> quickstart.c:(.text+0x1da): undefined reference to `sparse_keymap_setup'
> 
> Select this symbol instead of the incorrect INPUT_SPARSE_KEYMAP.
> 
> Fixes: afd66f2a739e ("platform/x86: Add ACPI quickstart button (PNP0C32) driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

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
>  drivers/platform/x86/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index ba88a7f259f1..21a37f1b73ab 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -647,7 +647,7 @@ config ACPI_QUICKSTART
>  	tristate "ACPI Quickstart button driver"
>  	depends on ACPI
>  	depends on INPUT
> -	select INPUT_SPARSE_KEYMAP
> +	select INPUT_SPARSEKMAP
>  	help
>  	  This driver adds support for ACPI quickstart button (PNP0C32) devices.
>  	  The button emits a manufacturer-specific key value when pressed, so

