Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20EF1C3F0C
	for <platform-driver-x86@vger.kernel.org>; Sat, 19 Apr 2025 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745053262; cv=none; b=rKC/1Gt+2ROMQ5CO40mG3706IVgENydeNjCcc+JpAM+p30Pfj4kibRzzIi8AoGQnZwDReEJaLTmNxZPje8nWA443vqIcGbbL18ZaOrP9M2MUyrVnOuikcLrgQCNKhhLkRqXI+PHfIDeKUL+8n/ZpaPosfALocSxxZpQ2DXrlb8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745053262; c=relaxed/simple;
	bh=Afa7DtkpR1H867LKVqQ+2mYAAsCrm/hqfEOwSdi/xr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebplIpWOrVzK8oq9Xh5/Ir3vPWe6zQOGMKZNit9lozU/RI/kBF8Pq7dErBbNlxqY47PqryVpfdIXriAfPYDx4P6tGCmNgXiaxp3wj4/pWjrMYUs6zXHwy8exqz0Mf0chRAA6Z0LXswWwWgURYJQtRFI0UYv8+5xU1FCOLA6+frg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PAxOF1N4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PAxOF1N4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745053259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cfRQFnOp2abxMYKTcV4kSnderRUR49x/VL105gem5OE=;
	b=PAxOF1N47JVCmHGWD1LecrIN3xn8kGBW3VR7zPdpATQGnQvzyJk/PxK75FifD771Xma9Mg
	TAtoyAy54CDQn/MbpyYaEuRW0zDiSp8xZbqMZFpyXkeFQIwfAXbbEup0rYk3qsaXqZo+lB
	SrSZLfZQ4xdNkaRAUSn+OHk7gwLo9ig=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-rzyCLXPdP-qcWjebRq2G6g-1; Sat, 19 Apr 2025 05:00:57 -0400
X-MC-Unique: rzyCLXPdP-qcWjebRq2G6g-1
X-Mimecast-MFC-AGG-ID: rzyCLXPdP-qcWjebRq2G6g_1745053256
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acb5a03afdcso180046666b.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 19 Apr 2025 02:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745053256; x=1745658056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cfRQFnOp2abxMYKTcV4kSnderRUR49x/VL105gem5OE=;
        b=aYTPn25LZr94W9P8yLTOPi8YNM9OTSgxxzz/D6ks3oZgQHnVS9KgCRkPDi/kLY01qi
         B2Tlcwky4BIXOQw9xuiG5u3rr0hDo1MTPaExTOvX9Ut/zLCij+rko2u+fGqR/BmY0n1N
         QSXEb/izzIkt+qdW8GmEGLDd7HV947gzTZKwAV5SWMi6LsxW1h+VwOLWTugaUfnM4Mkl
         9z8mAglcd0g+bcbrjtVR33opnKfIZgDLiRW5j4P5ImHKECKxtlEAE0zehVDFceab2frE
         /f4yxKrin3RTvdtdRfXp7M7vR6f3w12gfCuE7K3JfOj2v+SwsZhMrnCCTYZzhqhIo5UL
         5wAA==
X-Forwarded-Encrypted: i=1; AJvYcCWsVsD2dSJUJaR5dQtnHa35HIMBE4pIPQ1QPpC8kUlB4odVTsBYYTe+w+gaZuexPYgFGIQHFfkxNeB8d+vroKfulzex@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa4LunklBnxmW2MWe6wxC3YwDj0mJsMtjkmE32UQCL4LQE+/Un
	Wotpruh5DtjeQJf7hQmwhaOnOc/tlnBbChUYLi9/uGPmKM1rauTm1+6Y2Aq94BGgSHI7n14ifHM
	0tHKKbYgn/iQggGa45tG7bDK/8MCZ2BFsbcjTu/mEFpnz5na2EAVbUT2/ZKDtE9iWG2I2Q18=
X-Gm-Gg: ASbGncvCnF2we66sz3leX+en8mBBO3i8edk554r3g92mNxuHgU9GRgoAnJ+EME8JlsN
	IO7xi2dZSHfQhxdabnyoUlzJkp1RaNDMUF6aUcaNDBmC3ii4DAHiFcPUbO4DPRyWzS4KxqrxlB2
	Xn9+DS1NKXHbzJBS7tuny2Vq1mJiKOHZcyPh8cIjgjCg4vm2kc/ngA8uhMXmr0ODV0RFFkroD5+
	NZUCSopXaz980KLlsI7fXtsf25apd90uhxznVBZE78MfOdUHIKhxi3lio/UcYndnnEAfiadTL+9
	jfOFyya4hka8Xz2nZDSo9VHdwL4751HRUg2E9b8qkLX3blB2xD8H1rWZz5XDnlmLgvrLowUW/jz
	fkiPWJtF5ZnNrfD4bxVuvryxreJsJ61JYH7jDBRtBwM9sUH5reG5zbuumTJb+qg==
X-Received: by 2002:a17:907:3f16:b0:ac7:322c:fd0c with SMTP id a640c23a62f3a-acb74d655c0mr461975266b.40.1745053256130;
        Sat, 19 Apr 2025 02:00:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7KopLoMEM0G0CmKtJ3Op2+yxp2bKNQnrsAm22X1QFsjO9mFtWsvnH/c1QljWzoCxgg5PbLA==
X-Received: by 2002:a17:907:3f16:b0:ac7:322c:fd0c with SMTP id a640c23a62f3a-acb74d655c0mr461973066b.40.1745053255759;
        Sat, 19 Apr 2025 02:00:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec4befesm238341366b.65.2025.04.19.02.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 02:00:55 -0700 (PDT)
Message-ID: <60715d85-48b4-4066-8a9a-c8d2b62ebb45@redhat.com>
Date: Sat, 19 Apr 2025 11:00:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: change driver name from amd_hsmp
 to hsmp_acpi
To: Gregory Price <gourry@gourry.net>, platform-driver-x86@vger.kernel.org
Cc: naveenkrishna.chatradhi@amd.com, carlos.bilbao@kernel.org,
 ilpo.jarvinen@linux.intel.com, suma.hegde@amd.com,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250419025026.1555230-1-gourry@gourry.net>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250419025026.1555230-1-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-Apr-25 4:50 AM, Gregory Price wrote:
> The amd_hsmp and hsmp_acpi drivers fail to load together (whichever
> is loaded second, fails) because they have the same DRIVER_NAME.
> 
> Change hsmp_acpi DRIVER_NAME from amd_hsmp to hsmp_acpi.
> 
> Link: https://lore.kernel.org/all/20241021111428.2676884-8-suma.hegde@amd.com/
> Fixes: 7d3135d16356f ("platform/x86/amd/hsmp: Create separate ACPI, plat and common drivers")
> Signed-off-by: Gregory Price <gourry@gourry.net>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Note as mention in my reply to your other email, there do seem
to be some other potential issues with the pair of drivers which
need to be addressed. But this patch is good to have regardless.

Regards,

Hans




> ---
>  drivers/platform/x86/amd/hsmp/acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 444b43be35a2..a9c24502d3d2 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -26,7 +26,7 @@
>  
>  #include "hsmp.h"
>  
> -#define DRIVER_NAME		"amd_hsmp"
> +#define DRIVER_NAME		"hsmp_acpi"
>  #define DRIVER_VERSION		"2.3"
>  #define ACPI_HSMP_DEVICE_HID	"AMDI0097"
>  

