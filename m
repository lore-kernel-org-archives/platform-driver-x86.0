Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C5118654
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jun 2024 11:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228843; cv=none; b=N+ffz8BTg1/tKoj9fP2+dUi1+M9ThUAbxra22A/1O4XI+DBrGgwQinAkhx+xvGGqQI5u/Pf8UMDKr3E+EBwloQTD91wB2MsVKFvsOmP+YNnoBUhcmk+QCRTNih7D29IABdbm/GXtf0scT8AayEhliua4K7fgWpBaJVZlImm7ku8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228843; c=relaxed/simple;
	bh=E27VeBp0L3wh/lWcmKu18PcxmDIts+AAE8lfLuX8e6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVW/v5BmdafBVao+hvco8iEYjujb76k53kMoNdIFxRKSe2hV/F9e8FCDXN149AgcRGHsRdNvV2LGBQnEOQMsR8Ai3XpfNTif9zP+/QpdQJ2B4RdGhMxqubOoZ4qyUoQvEgyzTfh/ZI2oLqB04921y3x59fo3AHRknMqzhGwe60U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DSX3qHIn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DSX3qHIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719228841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ihp+f25iG3MeuRzLeQNN9+ypX1FQGCz6g9Ryzz3fUzw=;
	b=DSX3qHIndmQddO2PYLUoKwFWl/VudrrgV4g5RcRvRAnJ7ilt5f4saU3m2wIFMnJrcaQ8Pq
	N7cjSWDSGvDsi3u84+PaOI/oYHfyfm8wsI6mpjubAKbAhmpfYfoH7Oh9pI2yedn1BJyQFb
	BCj/WEEDeGHtcgLFWpxlfuqapbOncsU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-Zbo9gzg1NjyPynlyYiiXJw-1; Mon, 24 Jun 2024 07:33:58 -0400
X-MC-Unique: Zbo9gzg1NjyPynlyYiiXJw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-57d34e190d9so1181075a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jun 2024 04:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228837; x=1719833637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ihp+f25iG3MeuRzLeQNN9+ypX1FQGCz6g9Ryzz3fUzw=;
        b=ZFtRGN97zZ6XOf3DF2Kjhxw30H4JcB8V/UKQIVh/eAexdlO+GV//NLphQAObeC4t97
         DG+yNRl0Gx99dQrGlDCUY3KO3Tt9GogMVuYoxBstkJxL3dlCRW5147CNEUK8q/31ScXe
         oPsgHIQOeiE/PZbnxvi0pvgGPSSmdXooPP1/q+rEHla9CIwLknueNnQj9XaYT+fC7EIB
         McKPD6H7Phnk4VCLcw2r5kD1i5rCNxg3qqC9b/lvVUov/CIf6ccZ9qEz5JVGTFveCc43
         2pgB6tkjov5cv5Ez9kwrbg3FSfJY8X3Du0Ez4jSo867SRhilrU86B6B5v3U4wnSTjKJb
         RIXg==
X-Gm-Message-State: AOJu0YyhxKDLFnpAnKkH41R3cm7E+Qy5ol544jAQKu4i+KTjRpwT6wb+
	zbD6lbJT66QHq0VjTmAfBCNF4RlbrpM+qMN11L1sba24g7r6TgyXQBqEN7maiKAZk2sKxY/DXdZ
	u45VYUVA7v5Tmn6EmMsrfeEbfq53I9CH6kvU8P4H7V1PL6/APE0m+w5Le3bc1Neues2f+hIM=
X-Received: by 2002:a50:d552:0:b0:57d:4d2:83fa with SMTP id 4fb4d7f45d1cf-57d4bd53811mr3457374a12.9.1719228837655;
        Mon, 24 Jun 2024 04:33:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOAkJEJmUJrVPcuILZOvyw7ds3cfckFPT0OK/leclOB4nL8YBWpcF86g6vY2d4xNKx5JPhDQ==
X-Received: by 2002:a50:d552:0:b0:57d:4d2:83fa with SMTP id 4fb4d7f45d1cf-57d4bd53811mr3457352a12.9.1719228837180;
        Mon, 24 Jun 2024 04:33:57 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d31f33086sm4406438a12.61.2024.06.24.04.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 04:33:56 -0700 (PDT)
Message-ID: <7941463e-1d2c-4d5a-a772-bf8f60db58a7@redhat.com>
Date: Mon, 24 Jun 2024 13:33:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/siemens: add missing MODULE_DESCRIPTION()
 macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
 Xing Tong Wu <xingtong.wu@siemens.com>,
 Tobias Schaffner <tobias.schaffner@siemens.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240611-md-drivers-platform-x86-siemens-v1-1-b399d7d6ae64@quicinc.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240611-md-drivers-platform-x86-siemens-v1-1-b399d7d6ae64@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/12/24 6:25 AM, Jeff Johnson wrote:
> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/siemens/simatic-ipc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/siemens/simatic-ipc-batt.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

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
>  drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c  | 1 +
>  drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c | 1 +
>  drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c      | 1 +
>  drivers/platform/x86/siemens/simatic-ipc-batt.c             | 1 +
>  drivers/platform/x86/siemens/simatic-ipc.c                  | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c b/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c
> index 31a139d87d9a..5edc294de6e4 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c
> @@ -45,6 +45,7 @@ static struct platform_driver simatic_ipc_batt_driver = {
>  
>  module_platform_driver(simatic_ipc_batt_driver);
>  
> +MODULE_DESCRIPTION("CMOS Battery monitoring for Simatic IPCs based on Apollo Lake GPIO");
>  MODULE_LICENSE("GPL");
>  MODULE_ALIAS("platform:" KBUILD_MODNAME);
>  MODULE_SOFTDEP("pre: simatic-ipc-batt platform:apollolake-pinctrl");
> diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c b/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c
> index a7676f224075..e6a56d14b505 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c
> @@ -45,6 +45,7 @@ static struct platform_driver simatic_ipc_batt_driver = {
>  
>  module_platform_driver(simatic_ipc_batt_driver);
>  
> +MODULE_DESCRIPTION("CMOS Battery monitoring for Simatic IPCs based on Elkhart Lake GPIO");
>  MODULE_LICENSE("GPL");
>  MODULE_ALIAS("platform:" KBUILD_MODNAME);
>  MODULE_SOFTDEP("pre: simatic-ipc-batt platform:elkhartlake-pinctrl");
> diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c b/drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c
> index 5e77e05fdb5d..f8849d0e48a8 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c
> @@ -81,6 +81,7 @@ static struct platform_driver simatic_ipc_batt_driver = {
>  
>  module_platform_driver(simatic_ipc_batt_driver);
>  
> +MODULE_DESCRIPTION("CMOS Battery monitoring for Simatic IPCs based on Nuvoton GPIO");
>  MODULE_LICENSE("GPL");
>  MODULE_ALIAS("platform:" KBUILD_MODNAME);
>  MODULE_SOFTDEP("pre: simatic-ipc-batt gpio_f7188x platform:elkhartlake-pinctrl platform:alderlake-pinctrl");
> diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt.c b/drivers/platform/x86/siemens/simatic-ipc-batt.c
> index c6dd263b4ee3..d9aff10608cf 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc-batt.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc-batt.c
> @@ -247,6 +247,7 @@ static struct platform_driver simatic_ipc_batt_driver = {
>  
>  module_platform_driver(simatic_ipc_batt_driver);
>  
> +MODULE_DESCRIPTION("CMOS core battery driver for Siemens Simatic IPCs");
>  MODULE_LICENSE("GPL");
>  MODULE_ALIAS("platform:" KBUILD_MODNAME);
>  MODULE_AUTHOR("Henning Schild <henning.schild@siemens.com>");
> diff --git a/drivers/platform/x86/siemens/simatic-ipc.c b/drivers/platform/x86/siemens/simatic-ipc.c
> index 8ca6e277fa03..7039874d8f11 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc.c
> @@ -231,6 +231,7 @@ static void __exit simatic_ipc_exit_module(void)
>  module_init(simatic_ipc_init_module);
>  module_exit(simatic_ipc_exit_module);
>  
> +MODULE_DESCRIPTION("Siemens SIMATIC IPC platform driver");
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Gerd Haeussler <gerd.haeussler.ext@siemens.com>");
>  MODULE_ALIAS("dmi:*:svnSIEMENSAG:*");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240611-md-drivers-platform-x86-siemens-9e7c20b9ca24
> 

