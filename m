Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C077FBA1
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Aug 2024 15:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722870130; cv=none; b=tgKRpJQKZ6pXBjjfXFSMPgsdMP7oasgSApiDAYreZXrkQiskQiIWfVmTxBxMeoEAfFl2kl3maeJrr0/196Eu4i8sTO6c/cHwGTuqB+aqkoZ8xwMWtbnvncgbvnb+OybvqgMEdGgab1xHDpATAU0QEMKgjzVgWrD96B7kjLp5oCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722870130; c=relaxed/simple;
	bh=z8JvG8nuF87XFVVLgizgAv8MMiNvKb/zJ3nOwTrgzWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQVSmKKthcAj1WUmZRhQet5qcEIhdK2ZMCSC5sa8zPkre2EpttH/WRBazOiXgSIO6HcY5qv7liC/R2G1LaOAGelRdeLBTQ45aRwlGEems1W/sStyckJdABk/KZCHB1BOfsk478FGipCG/ndn4wLJ9NkKRAct2QbpAHYe9jrpqLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NL31Ux09; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NL31Ux09"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722870127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gVftkobXaLyHU+HWkds+Pq/FWF3DEM7o9NiXvqfPDh0=;
	b=NL31Ux097aB66LIFC32L4ONq5CuXaqzbIhkJbYh5CITvtjkjzUH94BI33s4DFa2Ku+vgPp
	DkcVjY49N6BcvcEDoiRb/as8c5275JhYtJVoo2GlMV/QLYxcFDW2cj+wP2KKrtUKEzfoIq
	en5KHnyKaaTGPP+Qhpv6MEigL4JKL2U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-GYPBY1w2OsWNTA2X4FaIOw-1; Mon, 05 Aug 2024 11:02:06 -0400
X-MC-Unique: GYPBY1w2OsWNTA2X4FaIOw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5a49935bda6so7727546a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Aug 2024 08:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722870125; x=1723474925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVftkobXaLyHU+HWkds+Pq/FWF3DEM7o9NiXvqfPDh0=;
        b=Yyr05jNdw0SrA9LoMCTbVEn00rZE6YU6HqX/dbWG3vN5Ctuer+fGtjRV5227arueyu
         2ifXy0hHpYXza5xBwpgKbHM9IwAUcr3LkOs/kWUKi9zvkdhaZPHFmABtLxCNqkhfaCrs
         LLEp7mCMXeej48yd1B9n4lLnWf9+sk0ge7jidlayGwrsUcyOjubrlhNRFReoU8qcaUPC
         0Yes0XP+GVzV2vLVzwFs0g8zxL0iSo8tPak2NqKj3CVgREVWV9TrMmsNhxsWvTlWGdeB
         Cjv9DRQtgVP+Kn9KgohXLsxbW+/jM0Nv+3UKCUQTt773nVSFZCrRSnKXg+KTaSY9aKH4
         m65Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWtAs21MopdcqY7AMINOk/CUEtXEPUf2cVxxpbh2zWCHHPkXbrszgF9mpL6vT6j3Q0d9TLGsjVF+cKr/rtTfcU2MVcV0+kWJGCuRu8MFiVev3v4Q==
X-Gm-Message-State: AOJu0YyFvzp110enzv4IyZhAAchTNiGayUCWpMGXIej5bQZ8/X5jzqn5
	2WGxMhfaJozwxCIsDY9F8YiGha7PxMTt1e4u0WdlqwfucIY92W2QShoMAyhfJSlsaPI1DUAZlQt
	pUFgqzv56JMrLUFzEFI6GL0W98x9TC/iGDFeJ+Gaol3Thf7Xk5T3oIqAnd+JHCo9V2JaP/5k=
X-Received: by 2002:a17:907:970e:b0:a7d:2a62:40e9 with SMTP id a640c23a62f3a-a7dc509872dmr757181366b.50.1722870124820;
        Mon, 05 Aug 2024 08:02:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS5y0NwSXpQwE40oBuiILUXUDTsdwxT0wijEr+2csxmPmEcXPNs1ij3+VIEc7q5FrIYviGSw==
X-Received: by 2002:a17:907:970e:b0:a7d:2a62:40e9 with SMTP id a640c23a62f3a-a7dc509872dmr757179066b.50.1722870124364;
        Mon, 05 Aug 2024 08:02:04 -0700 (PDT)
Received: from [192.168.211.203] ([109.38.139.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d437a5sm459079366b.101.2024.08.05.08.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 08:02:04 -0700 (PDT)
Message-ID: <af477c9a-3241-4dbc-9b40-7986149e81f7@redhat.com>
Date: Mon, 5 Aug 2024 17:02:02 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: int3472: make common part a separate module
To: Arnd Bergmann <arnd@kernel.org>, Daniel Scally <djrscally@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240529095009.1895618-1-arnd@kernel.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240529095009.1895618-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/29/24 11:49 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Linking an object file into multiple modules is not supported
> and causes a W=1 warning:
> 
> scripts/Makefile.build:236: drivers/platform/x86/intel/int3472/Makefile: common.o is added to multiple modules: intel_skl_int3472_discrete intel_skl_int3472_tps68470
> 
> Split out the common part here into a separate module to make it
> more reliable.
> 
> Fixes: a2f9fbc247ee ("platform/x86: int3472: Split into 2 drivers")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I've fixed the following checkpatch warning while applying this:

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/x86/intel/int3472/Makefile | 9 ++++++---
>  drivers/platform/x86/intel/int3472/common.c | 7 +++++++
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/Makefile b/drivers/platform/x86/intel/int3472/Makefile
> index 9f16cb514397..a8aba07bf1dc 100644
> --- a/drivers/platform/x86/intel/int3472/Makefile
> +++ b/drivers/platform/x86/intel/int3472/Makefile
> @@ -1,4 +1,7 @@
>  obj-$(CONFIG_INTEL_SKL_INT3472)		+= intel_skl_int3472_discrete.o \
> -					   intel_skl_int3472_tps68470.o
> -intel_skl_int3472_discrete-y		:= discrete.o clk_and_regulator.o led.o common.o
> -intel_skl_int3472_tps68470-y		:= tps68470.o tps68470_board_data.o common.o
> +					   intel_skl_int3472_tps68470.o \
> +					   intel_skl_int3472_common.o
> +intel_skl_int3472_discrete-y		:= discrete.o clk_and_regulator.o led.o
> +intel_skl_int3472_tps68470-y		:= tps68470.o tps68470_board_data.o
> +
> +intel_skl_int3472_common-y		+= common.o
> diff --git a/drivers/platform/x86/intel/int3472/common.c b/drivers/platform/x86/intel/int3472/common.c
> index 9db2bb0bbba4..8e4a782b2c35 100644
> --- a/drivers/platform/x86/intel/int3472/common.c
> +++ b/drivers/platform/x86/intel/int3472/common.c
> @@ -29,6 +29,7 @@ union acpi_object *skl_int3472_get_acpi_buffer(struct acpi_device *adev, char *i
>  
>  	return obj;
>  }
> +EXPORT_SYMBOL_GPL(skl_int3472_get_acpi_buffer);
>  
>  int skl_int3472_fill_cldb(struct acpi_device *adev, struct int3472_cldb *cldb)
>  {
> @@ -52,6 +53,7 @@ int skl_int3472_fill_cldb(struct acpi_device *adev, struct int3472_cldb *cldb)
>  	kfree(obj);
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(skl_int3472_fill_cldb);
>  
>  /* sensor_adev_ret may be NULL, name_ret must not be NULL */
>  int skl_int3472_get_sensor_adev_and_name(struct device *dev,
> @@ -80,3 +82,8 @@ int skl_int3472_get_sensor_adev_and_name(struct device *dev,
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(skl_int3472_get_sensor_adev_and_name);
> +
> +MODULE_DESCRIPTION("Intel SkyLake INT3472 ACPI Device Driver library");
> +MODULE_AUTHOR("Daniel Scally <djrscally@gmail.com>");
> +MODULE_LICENSE("GPL v2");

