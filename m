Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1CC8062B
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Jun 2024 09:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717406104; cv=none; b=HuCri8y6Hq1VL3jqcow+DbfE3AkK2AoHJ6UoW4qF+SUM112c0aiS4QAFPozwAqdZ719r0/1ZHl/CvVCOxFcQU2j6LUbAFSt784paVbYq+tyABPYUC3w00h8TZ6yNts6srSpayCQndrPz1xNWkVEwH0gsdxneSeqyK6SMA2ekJSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717406104; c=relaxed/simple;
	bh=RUdhv/rV66TofoZ/+ZusaQUHGKegZw/ZPFoN3z59CkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEG03AVf+n2MTdheYDC04yGaXDzX2bj6dt7rk70VnbOLMlW3SpG9ezwwMppg7xCsxoa3pVrpiOuxe5I8QhIEpRKLYJR76Iv33amcaXQCpdYVE6NIU7AxKpl0vhWAXLstculEryHNdxlj9pHSwCmZMNG7osXVaHf3tAqokrUoJ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cMjuH253; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cMjuH253"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717406101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elJN2/S+zNiKtT9pH96MRDhhv69WvQATNgXhmP4Js+w=;
	b=cMjuH253hWylCrmwRtrcYoogQiiCkZTrYO3nCFxEM/w0FZlRF8HsUQQWd/DtTsbU8SaKTQ
	zFQ3ixCWq8SY5jjGaGbeekS4AuoPEQ5QUe3Y3D9MSDAZ5k/kXVzlALife3KnlX3qtmaqsQ
	sQbEA8OrWCVC2SakGJgIgIAqH1S9HNk=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-LiNWdFhrNvi9NxtCxgIKyg-1; Mon, 03 Jun 2024 05:14:57 -0400
X-MC-Unique: LiNWdFhrNvi9NxtCxgIKyg-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2eaa570a238so11686231fa.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Jun 2024 02:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717406095; x=1718010895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=elJN2/S+zNiKtT9pH96MRDhhv69WvQATNgXhmP4Js+w=;
        b=jEgiaUE587XUDXH2TTR1a9c54q5V7HsmbLT2eImqY/G3v0yl8WsZUtJvBIC+gZ2BiG
         os9Dr9YPa6Gi1/a4lsTrwPi//RxSCsG1uiQ6HzpSJnNBO9PsgbFmIVJy3+UY6EadBkbK
         Ba4bhfsJSWRSdIFkJza75EFep2z33TJMvYEA1086OwQNl8AzUBK3gK4XSmsjMHcolhKK
         xvExQntXpKntFpF1QWPU2pjOdeW2ms54d6M996YE72eX5YGhJYyHoDv0VIYnKKFkI0RK
         mNODu6+wpfMg07eYa5mk2gZ0jYrMxuM6k5aeqAOPMb/+bcgjBImyfam6eautSPVcEoBi
         co+g==
X-Forwarded-Encrypted: i=1; AJvYcCVm6ESGQAIobuWj92fMQUJfb0NOx557GHxsa2VBKxS/TSGQaIPg2qlsZIGpDMGc95bWxxTOnqjJCEPJWdP1wBpOLnSslcxi2M35BpKBH6NjymI5tg==
X-Gm-Message-State: AOJu0YyODQCquvz8SarNdnGQVTAgtj3mYkLk79ntWwO+ZCYqGf33+2uA
	3FDxqzBtCPVRk6YeCBo7mlybpsu2OSianDpIfKgt35Fn8szCUrw8cEJtLTHWcIjpnpNQZalRCgo
	5f7meFgL9Hysng/f3ibeNIgPBvNFeEsGenIhVKJHyy7LqObXHYrZjL6VSltiLgUaoRT8NoIIpP/
	KgDFbJhQ==
X-Received: by 2002:a05:651c:2112:b0:2ea:7dc3:bdc with SMTP id 38308e7fff4ca-2ea951ddecfmr84042771fa.40.1717406095124;
        Mon, 03 Jun 2024 02:14:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNrbHFnrr7U2i5f2P28bJU9GNKZDttPSaEpiR/axgOakGkvJT++VeRbq1nIOoBMsJWVbBVCA==
X-Received: by 2002:a05:651c:2112:b0:2ea:7dc3:bdc with SMTP id 38308e7fff4ca-2ea951ddecfmr84042501fa.40.1717406094649;
        Mon, 03 Jun 2024 02:14:54 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68f77ec99dsm199907566b.106.2024.06.03.02.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 02:14:54 -0700 (PDT)
Message-ID: <dd3f15f6-6e42-4da1-8ed3-3d526f08369c@redhat.com>
Date: Mon, 3 Jun 2024 11:14:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Input: silead - Always support 10 fingers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20240525193854.39130-1-hdegoede@redhat.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240525193854.39130-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/25/24 9:38 PM, Hans de Goede wrote:
> Hi all,
> 
> The first patch in this series stops making the maximum number of supported
> fingers in silead_ts configurable, replacing this with simply hardcoding it
> to 10.
> 
> The main reason for doing so is to avoid the need to have a boiler-plate
> "silead,max-fingers=10" property in each silead touchscreen config.
> The second patch removes this boilerplate from all silead touchscreen
> configs in touchscreen_dmi.c .
> 
> Dmitry, since touchscreen_dmi.c sees regular updates I believe it is
> best to merge the 2 patches separately. As long as I know that patch 1/2
> is queued for merging for say 6.11 then I can merge patch 2/2 independently
> for the same cycle.

As discussed I've added this series my review-hans (soon to be fixes) branch now.
This is more of a cleanup then a pure fix, but since the DMI quirks always get
updated through the fixes branch this avoids conflicts.

Regards,

Hans



> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (2):
>   Input: silead - Always support 10 fingers
>   platform/x86: touchscreen_dmi: Drop "silead,max-fingers" property
> 
>  drivers/input/touchscreen/silead.c     | 19 +++------
>  drivers/platform/x86/touchscreen_dmi.c | 56 --------------------------
>  2 files changed, 5 insertions(+), 70 deletions(-)
> 

