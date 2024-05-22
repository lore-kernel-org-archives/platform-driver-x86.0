Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED036442F
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 13:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716384552; cv=none; b=Ff9ZDRp1BZhWCKlulTaKNKTK1CA/wwCqH8zhYSqAO8pIvCoR59E1FxvHN1bY6yBJ9yxRNwIcf92pu/t6G1EnS291ir8DS2f0YQVbjeyrbqJXGQAXtBQooAJ4KZoaE6Ngo2SXAlK7mYXRfUoggB34nU5CJ8SX2BnKgCihkLuztKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716384552; c=relaxed/simple;
	bh=5sakKOKAmbCrsEjASnjL7UgkTgHABzWbOCfbUd+pBkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXx5cunlJnQkI/LKNQ4YVfrws5kCTWGcSeVIx6odLAOSt/RsehbmytiOT5CoucWlBpJgg540EyCr+aFQh2MBMqoqmSoQgijCF2SxNdiJzujGU5V4/mKU0bCkYYJyddzY9LTJTI5gXCfqOgTos/cj1/rOrhnubMtmlmDW4lhQdXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lihs5buf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lihs5buf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716384549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vlxAhypZGuJ51fiH3I4BvsR7+m69A2J2YkZeHnupay4=;
	b=Lihs5bufDb6hXwnVLijx+VbKeiyoy4KV/0uX807tDR3mfIjHdBileDWnTkbKYwTdL1FZsA
	Q2tYBwlbpah7Is415+5Qo7NijHa82kSkHLQ67QWIqb+vKp+v6zJ2BizhYQnnopEiHNv9HF
	9XQNIG8w8ORdGUdvja8nVlUSTNZJwXM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-f7a-An5ZMvWOTjzEtO6k2w-1; Wed, 22 May 2024 09:29:08 -0400
X-MC-Unique: f7a-An5ZMvWOTjzEtO6k2w-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a59a0d2280cso70179066b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 06:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716384547; x=1716989347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vlxAhypZGuJ51fiH3I4BvsR7+m69A2J2YkZeHnupay4=;
        b=oVvpp+al3lLyRzQjUXoR02nFX+1Fvh2eYmSGlrJq531YfRlQcV/gVcx+4uPfhB2mFa
         OpeBKwod/hpmDj6ia+nGHMLgf1SUubpwUOSALAPwqeWbWa85LA7NgZ1MYlJ50lAqOJpG
         SXk7L4WYFcVsazrCEzIlXULnh5IiurtYlDF5Dj5q4KoyQjuW8WMo9p51zUI2D3mDhbXe
         U+V77mVl/lkt5N8148QnvHqHwgX7r4NUsV1fbtx7On2GCLGvtsvUdNrNLXFoH+ApwrIH
         o3DClwiOHhUUsNNsPeErhVC9NgEWVUqf6DUJOhJQ/LjKcVivJZPing7c9wQqLQP3hze+
         Ydyg==
X-Forwarded-Encrypted: i=1; AJvYcCUOZdVCmVSEPXe+WHR5FImztrPWwYjdWJOkAvnx98JMb071bAMB7WzHc2EDQLvc0NaK2qvM6bX4tmyi3RPJNBIJBFhp/T4PNMW9Vuw3uRSjf+HwTQ==
X-Gm-Message-State: AOJu0YxIbz1f+xUEExxO//5p7KZ1TY8ydrHTwGDu3yeLbL7IVElLjEC9
	yy9f3DL/dxvMuXn+ALBLuVLU/NbahhNUd2uZz2dOxbO1u5vLPO6Ksgcthpqxq4Q+yvFoBgwRRI3
	CMya6zCCZA3OPmc7nKGuxzS1m+lWGPDXmCa6nPBnRBXmIo3GtBxg0X08nFOhK+cv3JiqtCJg=
X-Received: by 2002:a17:906:d0db:b0:a59:b4e8:d925 with SMTP id a640c23a62f3a-a62280964f9mr126366566b.34.1716384547168;
        Wed, 22 May 2024 06:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtb1pBEHqfSS0/fLHCW2NnVfu+WU48owlxpl2PgihyF4jDO2x1GADbGyTyJtG37fRQ3GEQYA==
X-Received: by 2002:a17:906:d0db:b0:a59:b4e8:d925 with SMTP id a640c23a62f3a-a62280964f9mr126364966b.34.1716384546632;
        Wed, 22 May 2024 06:29:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17894d57sm1789138166b.73.2024.05.22.06.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 06:29:06 -0700 (PDT)
Message-ID: <bdfc7022-f8a0-4d07-b301-5d00ecb86ea6@redhat.com>
Date: Wed, 22 May 2024 15:29:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Select INPUT_SPARSEKMAP in
 Kconfig
To: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20240522074813.379b9fc2@gandalf.local.home>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240522074813.379b9fc2@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/22/24 1:48 PM, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> Now that drivers/platform/x86/thinkpad_acpi.c uses
> sparse_keymap_report_event(), it must select INPUT_SPARSEKMAP in its
> Kconfig option otherwise the build fails with:
> 
>   ld: vmlinux.o: in function `tpacpi_input_send_key':
>   thinkpad_acpi.c:(.text+0xd4d27f): undefined reference to `sparse_keymap_report_event'
>   ld: vmlinux.o: in function `hotkey_init':
>   thinkpad_acpi.c:(.init.text+0x66cb6): undefined reference to `sparse_keymap_setup'
> 
> Fixes: 42f7b965de9d ("platform/x86: thinkpad_acpi: Switch to using sparse-keymap helpers")
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I'll include this in the next pdx86 fixes pull-request for Linus.

Regards,

Hans

> ---
>  drivers/platform/x86/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0ec952b5d03e..1953317541ea 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -515,6 +515,7 @@ config THINKPAD_ACPI
>  	select NVRAM
>  	select NEW_LEDS
>  	select LEDS_CLASS
> +	select INPUT_SPARSEKMAP
>  	help
>  	  This is a driver for the IBM and Lenovo ThinkPad laptops. It adds
>  	  support for Fn-Fx key combinations, Bluetooth control, video

