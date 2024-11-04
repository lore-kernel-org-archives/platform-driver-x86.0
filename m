Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4721ABEDC
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Nov 2024 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730714186; cv=none; b=soMJR6Aje7oXV5U7kqT22HvfzxURvhxT0z3h6jeGzYsl461IF4Ur4GbaXZUUKKguphHwuUS4kWott2GAGl2NxqfoSozpxBraETcu+LWtVIpwhDl1fmSXA2zFtoxBrxCd1G9+89wxwF/Zf1Qw0pBNoQqrD/KxthDcCZBZfbqZSO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730714186; c=relaxed/simple;
	bh=xZRoqFxUqdJdx5Uzlbd6t+UY5aD6XYKXb2Tp/U9T3r0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcDGfOaqKYpmna0jO0J/aUC2fCg13yV2o+CL9GISUJYqdu82kjPfT82rW5MFtZPFWZ56mG6fK//fgSFapj9e2llchC9f0BO7P12c1ZrrZ75teyuo4Bn2FFZbfxSNPsEvLDQfNdqbe3noVueBZa1lRlYMHTQ6CaRJbKpkJSRwM5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eMab9Q7N; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eMab9Q7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730714183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cLAkZl+RC1pMxopgh5WfCub7TWMKEbLGAKiD2hkTmKs=;
	b=eMab9Q7N39dnRWFLFztdlnhPnmynw9TLIer5/rkovQyegjBO0oG1nmcQ0dDNQE3cUTfrVc
	HtUaSxWgXiVyTyw8BB/ZFMk/SPL4rQPZSRX6Ppkf4sPyMFaIyzAUjc9COSakSAjwfkTakp
	+Zv9OcJfxulCnI+fUtl79mZI/tY47oY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-wnkUAx3iOlubFZFesBhjeg-1; Mon, 04 Nov 2024 04:56:21 -0500
X-MC-Unique: wnkUAx3iOlubFZFesBhjeg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9e0eb26f08so341036566b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Nov 2024 01:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730714180; x=1731318980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cLAkZl+RC1pMxopgh5WfCub7TWMKEbLGAKiD2hkTmKs=;
        b=cYXucgwav9jv2cK4xKkPWUMJ+mOHZtB6TMkf1oRRJ+v2MCFOrTaLINB9nZxJIBweLk
         F31D16uSNicv3JVFpn1HFD0oB6cR7pPM6g87/EQbPMJ1HuTX9NfWet6jX/m4u0z56MGo
         tZAeUorjF58ywusHtMGRFWY32mvoZlaJfzpVjfQWB3NSUQ9Sv+ZHXcPetkrWV5aAkdXz
         MmWBUd/JKZCJHPdr4BsO/hO1UAQQcDN6Xwpm2gKNsd0aODi6uTZWuZQOqvnCgIF3qLdU
         BY3VkMe5ZbxRXVDhcKTU5SSPw+qMUQqRx4+Op+X4LCr+/qmDmLvi3RFfRkz5n31HIXft
         jH6A==
X-Gm-Message-State: AOJu0Yz8ZIq5jhcazJbAYDCfn6ZiI6fDNNssNlq9lMmfEq4ftDyfqaTQ
	9huohIgyFBcTo9DG1lfb3li7mu4KG5UJ4WtyKvY0Yce8quunBcalfylgTaOLLJw6n8DaVmT/qh8
	VAbvBfiPFz3Vsubw4bIVgdHow/ihQCEtDatKyU5rVWLyhwCHwGuzGka7c7TObkMdTQV21kgo=
X-Received: by 2002:a17:907:6d0a:b0:a9a:d23:f8ca with SMTP id a640c23a62f3a-a9e3a57530fmr1505245866b.13.1730714179911;
        Mon, 04 Nov 2024 01:56:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAGuSY72dBITPGyUg531gjORfdogjI6IybAHRQqVeLKM3IBiT0M2DLtBLZ020vnrF1zqoF8Q==
X-Received: by 2002:a17:907:6d0a:b0:a9a:d23:f8ca with SMTP id a640c23a62f3a-a9e3a57530fmr1505237866b.13.1730714177966;
        Mon, 04 Nov 2024 01:56:17 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565df8d8sm532086666b.131.2024.11.04.01.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 01:56:17 -0800 (PST)
Message-ID: <a30f36ba-e881-46da-8427-ba982bcdb86a@redhat.com>
Date: Mon, 4 Nov 2024 10:56:16 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] platform/x86/amd/pmf: Add SMU metrics table
 support for 1Ah family 60h model
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241023063245.1404420-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-Oct-24 8:32 AM, Shyam Sundar S K wrote:
> Add SMU metrics table support for 1Ah family 60h model. This information
> will be used by the PMF driver to alter the system thermals.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

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
>  drivers/platform/x86/amd/pmf/core.c | 1 +
>  drivers/platform/x86/amd/pmf/spc.c  | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index d6af0ca036f1..347bb43a5f2b 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -261,6 +261,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
>  			dev->mtable_size = sizeof(dev->m_table);
>  			break;
>  		case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +		case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>  			dev->mtable_size = sizeof(dev->m_table_v2);
>  			break;
>  		default:
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index b5183969f9bf..06226eb0eab3 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -86,6 +86,7 @@ static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
>  					 ARRAY_SIZE(dev->m_table.avg_core_c0residency), in);
>  		break;
>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>  		memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
>  		in->ev_info.socket_power = dev->m_table_v2.apu_power + dev->m_table_v2.dgpu_power;
>  		in->ev_info.skin_temperature = dev->m_table_v2.skin_temp;

