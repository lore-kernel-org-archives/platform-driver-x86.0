Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBDB1D0167
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Sep 2024 16:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726330214; cv=none; b=T4KIJFaBQZrA6idE7SrWERK+XKBgMB0Sh8smRnAqbPBQNUGidHRcEOn5y0RM2xjGkt8PUWagLPzMGeBlljrUexs/QkFAmkbPKLJVhUUQHNwNExAOX1BFuBibEj3+1CjE3/A2mdlGM5l/+awwPm1HiW1aNN9zYQ25tL86Z4GmN2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726330214; c=relaxed/simple;
	bh=8AOCxFfb7j8DcfInrSLgYDK9nmwjDzPAdDYsIDvR/lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJ7xi5IeHkJRGmSgAzRav193LRND0+JFOF39NJaXZutD+nnuAdUrlSYlBelMlB15vde5lQTZ24otrF5zzC0y7YmwM9JBnpBw283/EJdopagw800h7ZDiGIDmCdgLU1E7npc28+Zo8uoVu6ZClyd6GlY462rKs6hWmpVJ/lO3P6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BaXzLoFU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BaXzLoFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726330211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gVjWpjqJODWBhVoOOIKNl587HfNajGvXg1O8JyOtZI8=;
	b=BaXzLoFUNrnoj5arWZLk3GUMTIIYYzsgUgJTmQMA+a+F0cntdCkNDTCbQDUbKT1qXQzz2B
	+Fl6BU3Pa83xwrPFvlfyY55T1Iu+Agd2zJAvfsUOggXY/vmB67ZfjLkh5+PxCqQyZrz0f3
	FRbHiG58dbuVCQ1x/2p+NRgsOez5/Vc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-87fHgiuVOLCPN-03ZOesGQ-1; Sat, 14 Sep 2024 12:10:09 -0400
X-MC-Unique: 87fHgiuVOLCPN-03ZOesGQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5c244732fe0so1929911a12.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Sep 2024 09:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726330209; x=1726935009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVjWpjqJODWBhVoOOIKNl587HfNajGvXg1O8JyOtZI8=;
        b=XCSUbwOqrhvx/0cuzFCEPwfGChthn9sxHKkhb8PkLfGNYHnK4VwK+1EADz6ocgXuem
         XetasmDILcBw44ubz1cxgHXdpr7Nn5lpNTSXSXJFRy9J5supCP3U1ogxYvGzK99wKmrt
         jdmEo6X11AyRG/VaK7rQczv45Ls0hkrLMV2Z/XQ0dvVta9Y5dZElVro3f8rbkzaSj6tK
         jZsoy0SKnis/gxsUh9G58byi3gswlKJQyc/DaDPL2syfRbMs97YWGlpZ01NU53bAn7v0
         TAk9dttCw2zKDhMbLVdBewPK3RvMv+Jt7NW/2Dde03OMThdXRpgHwRpitDCwpvJicNoy
         7J8w==
X-Forwarded-Encrypted: i=1; AJvYcCUHCU3MCzfKhTQPSgdiRFYkUq716iYXf3qMcprLaASFUQ2jEN5a2KjF7ovqmUOrqNq8bTRo7edGLgwPVNNrOTFIGuJr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd64fCMPdjrTVejKQgrRVBXS8xSeqyDFQ0mbT4uX9KoHMO6W1/
	81hctKF7M7MCXGA9MSnM2t5eaL7ExnhSaiymmzSTVYKPsmWnfVKhTjtL6BHFkCRRYz87V56iGLz
	Ab7bGUzlNLaZ0wb+3uNw0G/9b3ReK2gaM0ujDfXoLm8hoBNxqDFiCd9KgzHLKtKhrG77OfqM=
X-Received: by 2002:a05:6402:51cd:b0:5c4:1d22:9fd0 with SMTP id 4fb4d7f45d1cf-5c41d22a03emr5251875a12.8.1726330208547;
        Sat, 14 Sep 2024 09:10:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnSE/Qvo9dn/cOeU/e6N9e8WObdZYM7N1mwuFdI0DuIuqajIEaNoiroJO0uOjqGvDq2PqXqQ==
X-Received: by 2002:a05:6402:51cd:b0:5c4:1d22:9fd0 with SMTP id 4fb4d7f45d1cf-5c41d22a03emr5251843a12.8.1726330208020;
        Sat, 14 Sep 2024 09:10:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb89c7fsm773079a12.67.2024.09.14.09.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Sep 2024 09:10:06 -0700 (PDT)
Message-ID: <f987b71a-361f-4d4e-a2d1-6410f4b22cc7@redhat.com>
Date: Sat, 14 Sep 2024 18:10:06 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd: pmf: Add quirk for TUF Gaming A14
To: aln8 <aln8un@gmail.com>, Shyam-sundar.S-k@amd.com
Cc: ilpo.jarvinen@linux.intel.com, luke@ljones.dev,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240912073601.65656-1-aln8un@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240912073601.65656-1-aln8un@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/12/24 9:36 AM, aln8 wrote:
> The ASUS TUF Gaming A14 has the same issue as the ROG Zephyrus G14
> where it advertises SPS support but doesn't use it.
> 
> Signed-off-by: aln8 <aln8un@gmail.com>

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
> v1 -> v2: Change to FA401W so full series models will get the fix.
> ---
>  drivers/platform/x86/amd/pmf/pmf-quirks.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf-quirks.c b/drivers/platform/x86/amd/pmf/pmf-quirks.c
> index 48870ca52..7cde5733b 100644
> --- a/drivers/platform/x86/amd/pmf/pmf-quirks.c
> +++ b/drivers/platform/x86/amd/pmf/pmf-quirks.c
> @@ -37,6 +37,14 @@ static const struct dmi_system_id fwbug_list[] = {
>  		},
>  		.driver_data = &quirk_no_sps_bug,
>  	},
> +	{
> +		.ident = "ASUS TUF Gaming A14",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "FA401W"),
> +		},
> +		.driver_data = &quirk_no_sps_bug,
> +	},
>  	{}
>  };
>  

