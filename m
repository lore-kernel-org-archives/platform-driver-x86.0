Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9BF14F9EE
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713792721; cv=none; b=WH6Iu2HMjGwEb8yfDFnhwXHK0NdbzEC/dtJY2YWYpZEZHqagRlLHtvsuJgv6yLfszebNeC4LLYJ/sU530Qi/nVWzT84J63E9xcvRm+t26/2LtCUCZEWZuwcv0RC72nBFbVN2xFlGZJLq3VcWrc/ZmlSlXyvmiSt1EWB/pnRdlyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713792721; c=relaxed/simple;
	bh=awX5B76+HzKgX2w5I2DsXCUaJAK/mYe3tND15fSkqMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ARH32/FiFCpwcRmVObkH3jr87Bknwmxl8wBiugx5L1RtXQI7u5u/+vOfbNCBCGK6lBQAUEGmsf849Z+57XHqgECvbhdPvtuQW3xGF4Y41DP1z8uArojWI6uZ8VUgDbzIAK+XaknmM5pAJc1OMjCLTCKWACdRAeErw3XILVO23nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BdpCVAH1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BdpCVAH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713792719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ANX+xaTgZeaaXkTxg9wkNgDys/2r+xl16Yffp7Qdk4w=;
	b=BdpCVAH17xvRTh29y5nKxzxfrMRJaH+nhHA+dz4dURPHPJECCjvYLWlNFZcIFHdMBUOciY
	+mE6O+o4PLgN73zoP3i7VxRrlkM7cyMn2Iws5YduDUpYulytTkj/2fmETzza9QpPM6UnBZ
	cRZ0W9y5v6b0pys31/Z0JqHsdtASwyA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-r97tuwTyMr20uIDsxztCxg-1; Mon, 22 Apr 2024 09:31:56 -0400
X-MC-Unique: r97tuwTyMr20uIDsxztCxg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a5741ee352bso27611666b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 06:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713792715; x=1714397515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ANX+xaTgZeaaXkTxg9wkNgDys/2r+xl16Yffp7Qdk4w=;
        b=im4Fr361rFmouMFo6krIzMhvorjXcG3OBa5gvuohNzw4eQYpbn1R5/yvz1JSg6NSoP
         8jgx/PPW6SMwawbkSFW/t5O87erds+SbB+D9/tyc06xieKP98xuCyjEL68jB130xoAHo
         ZZszxOrhxcSKEdGCKPxO2vqI6/Qh9aQZyZ2BstJgiBwJDX5C8qlZASoDyJL5a4/G28OD
         VxicQIZjyN/4JDV1Ic0xjyq61F9tgxONSUWkQYBZZan58WoqAJloLCnxl9fIFRsLqGyy
         01qXjmAAzPv6sMq5O3NO0Yjxf5BmFfrtBbfVQqIru+eFkTpMFGu2BU+zeMAnQgH2qrOf
         mmZA==
X-Forwarded-Encrypted: i=1; AJvYcCVKkJiio2D5NjSoOTkT9wvzdGv9XyTNELOSw5G/NsZvnT3+deVNh3C/yUINavFUDRHiEFOSgWh/8XI6o7rmgrWiEvZGhVMHukD+LyfMdpz1Qf/2Tw==
X-Gm-Message-State: AOJu0Yzr/FUE6hIjcxi6KCqmDC4LfplCckFjixvetPE6d5eW0vy8QJZS
	JsT8M2l5SDFWt37etqnYEZdmtIYGw07a42BjgXYenv5fIZWHssUEkm4o4KveIUltg5gLWAUP419
	H6tIyCFGFL3kZlvhPBAFzT0QwnGo23bSKTC+BKzm1re/Xe4SG0KQaovTC7TKNRBIFFHAH6Jg=
X-Received: by 2002:a17:907:94cb:b0:a55:b272:ea02 with SMTP id dn11-20020a17090794cb00b00a55b272ea02mr2618071ejc.75.1713792714915;
        Mon, 22 Apr 2024 06:31:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG82ZH8/Jtju0mhAdG8/PW4XqvBdwQxaB7D0jxdPhLmOnBwNV/D0nX8zuy+43rjCw52vpCfaQ==
X-Received: by 2002:a17:907:94cb:b0:a55:b272:ea02 with SMTP id dn11-20020a17090794cb00b00a55b272ea02mr2618055ejc.75.1713792714632;
        Mon, 22 Apr 2024 06:31:54 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id bk2-20020a170907360200b00a55a8ec5879sm2130351ejc.116.2024.04.22.06.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 06:31:54 -0700 (PDT)
Message-ID: <25965583-4d8a-4e7a-9a2e-83ec2faa4187@redhat.com>
Date: Mon, 22 Apr 2024 15:31:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] platform/x86/intel/pmc: Fix PCH names in comments
To: Colin Ian King <colin.i.king@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240418215202.879171-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240418215202.879171-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/18/24 11:52 PM, Colin Ian King wrote:
> The PCH names in the pmc drivers are incorrect in the comments,
> fix these.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

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
>  drivers/platform/x86/intel/pmc/arl.c | 2 +-
>  drivers/platform/x86/intel/pmc/lnl.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/arl.c b/drivers/platform/x86/intel/pmc/arl.c
> index 34b4cd23bfe5..e10527c4e3e0 100644
> --- a/drivers/platform/x86/intel/pmc/arl.c
> +++ b/drivers/platform/x86/intel/pmc/arl.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * This file contains platform specific structure definitions
> - * and init function used by Meteor Lake PCH.
> + * and init function used by Arrow Lake PCH.
>   *
>   * Copyright (c) 2022, Intel Corporation.
>   * All Rights Reserved.
> diff --git a/drivers/platform/x86/intel/pmc/lnl.c b/drivers/platform/x86/intel/pmc/lnl.c
> index 068d72504683..ec89e7dda103 100644
> --- a/drivers/platform/x86/intel/pmc/lnl.c
> +++ b/drivers/platform/x86/intel/pmc/lnl.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * This file contains platform specific structure definitions
> - * and init function used by Meteor Lake PCH.
> + * and init function used by Lunar Lake PCH.
>   *
>   * Copyright (c) 2022, Intel Corporation.
>   * All Rights Reserved.

