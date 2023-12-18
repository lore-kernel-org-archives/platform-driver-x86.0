Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A38B37879
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="icd8mDlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702908019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHb9Nbxq9O6XaraMZw0ThBizBBW+/NNEjqc7eDhvdfw=;
	b=icd8mDlVE9JbKi+5IbuDfoi0Y7pNiu2bohpe3UAQrOpTavakjVlLBN/klkzeJZOHloIsuf
	gA0iLLqtMd7R01eWgVnCj3H37+DcSTid9d62W+qXB1jqlLkJkVqgwhhoTbEzjNAAfraWRQ
	neyBB8x2SU+2uzslXcZ+Tej6XIFwr1g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-tnY1a3E8O0yWG7-6JQfR-w-1; Mon, 18 Dec 2023 09:00:17 -0500
X-MC-Unique: tnY1a3E8O0yWG7-6JQfR-w-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40c35d1d776so28154325e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 06:00:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702908016; x=1703512816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHb9Nbxq9O6XaraMZw0ThBizBBW+/NNEjqc7eDhvdfw=;
        b=FqxQrDrR6thYbmc69qFLqthSDXnSsBzMNadZUFriNqbFRBRVAtukBHSYZBXR5xLU9U
         E3+/IzwiMft3zhFPro/CrPbWn9LkKM2eXIblTCSS/nGXJIenXW/fkwcLVF7TmgZ9tHiU
         wmAlqBhKrtWwlkfXGW7p0ED8qdyGQmAtFBvRucgCrB/cwmffrJCiHkFuyk4/gm4XTA3e
         YsHgmSUbrJ5QiQ5lFE1tjyNZlfOdqaJlpNaJZ6DRppkJLY+awPLHyq0MhjTfc2cShWO6
         +IuCz1/YowTL0fYsU8HHRsra+gq0IM/Ua1aJcCQLa6zdQ4opKtbVk0VUpK35Tpyl0J38
         +cLw==
X-Gm-Message-State: AOJu0YzPdLIkAId12AE4TUtGihkIf8h5blcianI8Q7ikvk8ulsqJiija
	69A82mh0wDZMdZ30TEXIJ6IjlJb280NxDCmuj3KVBi7rmVpFY70zF28Gcb4JmRwBXe9kaBlhEtl
	QQqiPpmz300+zgKXnqtIIkhvMiGA3GPShyQ==
X-Received: by 2002:a7b:c4ca:0:b0:40c:2b87:de8b with SMTP id g10-20020a7bc4ca000000b0040c2b87de8bmr7921957wmk.132.1702908016257;
        Mon, 18 Dec 2023 06:00:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQUemTUaWAYOujMHM3kn+wtXlUppofidsDm63eCKP6jWUO0qO6fCKjoguTECdmIH7q1Qnz+g==
X-Received: by 2002:a7b:c4ca:0:b0:40c:2b87:de8b with SMTP id g10-20020a7bc4ca000000b0040c2b87de8bmr7921947wmk.132.1702908015989;
        Mon, 18 Dec 2023 06:00:15 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id cx7-20020a170907168700b009fc576e26e6sm14059747ejd.80.2023.12.18.06.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 06:00:15 -0800 (PST)
Message-ID: <630dd0a3-429a-4bdc-82de-ffc1c7b97f08@redhat.com>
Date: Mon, 18 Dec 2023 15:00:14 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel/vsec: Add support for Lunar Lake M
Content-Language: en-US
To: rjingar <rajvi.jingar@linux.intel.com>, linux-kernel@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org
References: <20231216005146.1735455-1-rajvi.jingar@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231216005146.1735455-1-rajvi.jingar@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/16/23 01:51, rjingar wrote:
> From: Rajvi Jingar <rajvi.jingar@linux.intel.com>
> 
> Add Lunar Lake M PMT telemetry support.
> 
> Signed-off-by: Rajvi Jingar <rajvi.jingar@linux.intel.com>

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
>  drivers/platform/x86/intel/vsec.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index c1f9e4471b28..3567dba57781 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -421,6 +421,11 @@ static const struct intel_vsec_platform_info tgl_info = {
>  	.quirks = VSEC_QUIRK_TABLE_SHIFT | VSEC_QUIRK_EARLY_HW,
>  };
>  
> +/* LNL info */
> +static const struct intel_vsec_platform_info lnl_info = {
> +	.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_WATCHER,
> +};
> +
>  #define PCI_DEVICE_ID_INTEL_VSEC_ADL		0x467d
>  #define PCI_DEVICE_ID_INTEL_VSEC_DG1		0x490e
>  #define PCI_DEVICE_ID_INTEL_VSEC_MTL_M		0x7d0d
> @@ -428,6 +433,7 @@ static const struct intel_vsec_platform_info tgl_info = {
>  #define PCI_DEVICE_ID_INTEL_VSEC_OOBMSM		0x09a7
>  #define PCI_DEVICE_ID_INTEL_VSEC_RPL		0xa77d
>  #define PCI_DEVICE_ID_INTEL_VSEC_TGL		0x9a0d
> +#define PCI_DEVICE_ID_INTEL_VSEC_LNL_M		0x647d
>  static const struct pci_device_id intel_vsec_pci_ids[] = {
>  	{ PCI_DEVICE_DATA(INTEL, VSEC_ADL, &tgl_info) },
>  	{ PCI_DEVICE_DATA(INTEL, VSEC_DG1, &dg1_info) },
> @@ -436,6 +442,7 @@ static const struct pci_device_id intel_vsec_pci_ids[] = {
>  	{ PCI_DEVICE_DATA(INTEL, VSEC_OOBMSM, &oobmsm_info) },
>  	{ PCI_DEVICE_DATA(INTEL, VSEC_RPL, &tgl_info) },
>  	{ PCI_DEVICE_DATA(INTEL, VSEC_TGL, &tgl_info) },
> +	{ PCI_DEVICE_DATA(INTEL, VSEC_LNL_M, &lnl_info) },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, intel_vsec_pci_ids);

