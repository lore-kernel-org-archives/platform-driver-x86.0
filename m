Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C3313A899
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802391; cv=none; b=e7lQt8zK+toIgnCBDycsmfumvz5LQ5NzWKjXzlngssuWIbc9dvh/ycLTPUX0681dosbjcUgzUmCYJkcMpq85mruqRq5oNtUMgIY6FHKdUTHjWh7rnfd/RETSoR+Rt65vfl5kzF3NOMln7WgyZMgsT/j7Fm3OLCg02w5vY8mFzl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802391; c=relaxed/simple;
	bh=COzNM6oDLm4wTy/CEwQcW40ZylxD3PyiTtNvAyKA2R0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTNmcKAYCDUuMKvIWSbaOCEAVaxJR5TNDoDm+4z64vw41RBRa55P393B6/uX7mGDFoJOSBvcHX5kjJmTx5f3vSCE3CnGT8Cu4fgzsR8j/jM/aMP/Y0MPrY9p2CV+5lKpAibddYAc/wbNIFqpW7oPgrgW/7x5AJG3LwfoUuiJIog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HRz8uIep; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HRz8uIep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716802389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O2W3HQ2FbT0lMvcZpOadwibJdGOUxJezqTqd6ETmGY4=;
	b=HRz8uIepjAdwH/ACcjkOeNQvHc/oFLCDUXI2lE1YTreGu6oxe6GgwgZBiHg/EJQbDEei1Q
	73iCBrELUcMeXj7tmic+VM/6+lSKM8CRUzzQHMu04y4xx6koRwkBCT095Q4tTzH8RbKTqg
	fquwkU8iZvCDT4nYirwNjof3BeipnZs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-I3l7Bi4WOM6OUVRZddvd4A-1; Mon, 27 May 2024 05:33:06 -0400
X-MC-Unique: I3l7Bi4WOM6OUVRZddvd4A-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a6270b93d0dso187645066b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 02:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802385; x=1717407185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O2W3HQ2FbT0lMvcZpOadwibJdGOUxJezqTqd6ETmGY4=;
        b=M1DywPZgN9T0Pr2dAP5IniDbOP9U4x6/mzkG3z6UogiUV6Z4+sS+DQnGr+m95DfLA3
         X4FVAuCKcw7x9CoX+Wgwqp6YWSa7ugHdznrMwhwIqIRaaR028u4W5YCw70Xf+1FVFkvn
         TrVn63jLHA1Yz3J7RS1+EoqxEEshiWmfPYjuhb8f66xxO8JWEbHzCDN6femth/b2z7/T
         uTCjNEEQdgXkEgi68Y1MD5NGjJXJ0yv2hqBhw9WX5T9R9zt4Xg00/vRBe5p4CemGnhDp
         ol9tFByFQir4Jyo9RRYazmPyzU3KYmF4gNHkeGCS1d+4Ggc8K2EOITKzBxovPL9L8FNJ
         /mlA==
X-Forwarded-Encrypted: i=1; AJvYcCVEv2yMSOL/jhFElPWxFtFQHwN8m5B1rF2CcnQhLFkK5v3iKK9ol0R0E+8ZJy6JWRaf/mJRXx4moWkw7RkYuT0W95jVCavX4Lel0bgjjS/14URJEQ==
X-Gm-Message-State: AOJu0YzRYfhx3c2oSQoH/Bj3Ky4AF6BleMbKKHFwpR+JkMH2rgYcyAg1
	h3q7hyX1mGBXmCPrl5uRyG/BkCoI+6oLX37shU4/LCtad66dUV8Tgvk5CROeTv0rn7Klk2joNy8
	MQWkUdBW5g87BkHeM2aofZKufcnlFSrnzM+bYGWg34fyGnAUMgCSyJfu6m7xaNl6nM5KymTQ=
X-Received: by 2002:a17:906:470f:b0:a5c:e240:ceb7 with SMTP id a640c23a62f3a-a6264f0e8c9mr524496366b.62.1716802385485;
        Mon, 27 May 2024 02:33:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpcYMc1VyHs5D2+265Ocu7lm2Yq8+Lc/mFzBMEb0dWGcljnBKhLIuqsvzUV6YzHDZaMsVDVQ==
X-Received: by 2002:a17:906:470f:b0:a5c:e240:ceb7 with SMTP id a640c23a62f3a-a6264f0e8c9mr524494466b.62.1716802384975;
        Mon, 27 May 2024 02:33:04 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c817e60sm471194266b.21.2024.05.27.02.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 02:33:04 -0700 (PDT)
Message-ID: <de5ad888-65ff-4339-b585-0c0618adcc99@redhat.com>
Date: Mon, 27 May 2024 11:32:56 +0200
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
Content-Language: en-US
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

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

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

