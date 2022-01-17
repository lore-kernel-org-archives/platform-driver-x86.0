Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194DEC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Jan 2022 09:49:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237556AbiAQJtX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Jan 2022 04:49:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23850 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237492AbiAQJtW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Jan 2022 04:49:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642412962;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L6UhCfxh0kYRjvMOUSeeMixfl9rDKRgr6zR9cysLT+s=;
        b=e/kUQcX0OwdAs0kDEPJ2A8YpN5kRAzkN+ShUm7Ll+LI8a3wkc2T58rbM8V3/ijRU7/bbPM
        o3iGzvVzwczk5boJrJvzGT7iZXmtcBag8uwX3QnJJTzbDSzqZ3VU7Qh0U06cN88jNq0k/Y
        LsQ6cfcB7z4XAZoV7359MQbrhNvVU6k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-JOcGx_i-PP6Xnn8tLBvE1w-1; Mon, 17 Jan 2022 04:49:20 -0500
X-MC-Unique: JOcGx_i-PP6Xnn8tLBvE1w-1
Received: by mail-ed1-f69.google.com with SMTP id bm21-20020a0564020b1500b00402c34373f9so1550203edb.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Jan 2022 01:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=L6UhCfxh0kYRjvMOUSeeMixfl9rDKRgr6zR9cysLT+s=;
        b=t5IKny0y+vKvp+RqzvpnaAzWJSWWb4TW3cBPzAseRj4ISyNnQcQqV0bDlfHF7D294V
         4FvlOZswo9AhnLD+YXyyQZmUSzv9djobhdvELRA7cDHXmFcMo33A7poKPTXtucMqFAHr
         kxdX4ZuVm1OgfpelqX5IZ5TiUbVvVhrnpqfNJX/DS+U8nizftp751DYAZjX3CF4EwPqy
         6N3OFLqQ1L9BthXE0g1J7+q7VLTK/m0l1E/FnmrY4Lu22/MuBhR9fghzlWn0faPQqkeS
         4p5qw+S0B35ndIfN0wC7X0uK8oXoukTZ8bKkCXpli0QOKQQWliQriM9DgOU5faBQx2E4
         qKrA==
X-Gm-Message-State: AOAM5316izL8VI3dW9C2GBhwGcv3cHnjxtesEW7bf3+4qmWA08ddVZND
        AmPj6tMcHfB5aX+hMTWjxJt9ujcPGaovS/AmuVI03azY+JGKjVKPTuYCCAWoFmLHaNxy/4eDIu0
        XVsCjeedsaWxvK3OMq6vg1qvaLCISX9G7kg==
X-Received: by 2002:a05:6402:518d:: with SMTP id q13mr20011004edd.377.1642412959330;
        Mon, 17 Jan 2022 01:49:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznkw/kzkt83FlVdPD+srXP4wOHPNVBlFm7pWhqZcdQJh+8gc3cC8kPbTgfzRMPOGqkQtXbyA==
X-Received: by 2002:a05:6402:518d:: with SMTP id q13mr20010987edd.377.1642412959116;
        Mon, 17 Jan 2022 01:49:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id l8sm1650172edv.52.2022.01.17.01.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 01:49:18 -0800 (PST)
Message-ID: <e49ac79d-eca1-e404-922b-48129f8a7e54@redhat.com>
Date:   Mon, 17 Jan 2022 10:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: intel_scu_ipc: Keep polling IPC status if
 it reads IPC_STATUS_ERR
Content-Language: en-US
To:     "Khandelwal, Rajat" <rajat.khandelwal@intel.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Westerberg, Mika" <mika.westerberg@intel.com>
References: <20211230082353.2585-1-rajat.khandelwal@intel.com>
 <CO1PR11MB48359C6EC7DAC17F7FDD91D896459@CO1PR11MB4835.namprd11.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CO1PR11MB48359C6EC7DAC17F7FDD91D896459@CO1PR11MB4835.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/30/21 09:30, Khandelwal, Rajat wrote:
> Hi Mika
> I hope this annotation is correct? Sorry for the multiple errors! 
> 
> -----Original Message-----
> From: Khandelwal, Rajat <rajat.khandelwal@intel.com> 
> Sent: Thursday, December 30, 2021 1:54 PM
> To: mika.westerberg@linux.intel.com
> Cc: linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; Khandelwal, Rajat <rajat.khandelwal@intel.com>; Westerberg, Mika <mika.westerberg@intel.com>
> Subject: [PATCH] platform/x86: intel_scu_ipc: Keep polling IPC status if it reads IPC_STATUS_ERR
> 
> The current implementation returns -EIO if and when IPC_STATUS_ERR is returned and returns -ETIMEDOUT even if the status is busy.
> This patch polls the IPC status even if IPC_STATUS_ERR is returned until timeout expires and returns -EBUSY if the status shows busy.
> Observed in multiple scenarios, trying to fetch the status of IPC after it shows ERR sometimes eradicates the ERR status.

So what this is doing is continue to poll,
even though the SCU says it is ready,
when the ERR bit is set ?

Are we sure the IPC does not just simply clear the err bit after some
time becuse it expects it to be "consumed" within X msec after dropping
busy low?

IOW what guarantees are there that this new behavior of ipc_data_readl()
is not actually causing us to ignore actual errors ?

Regards,

Hans





> 
> Signed-off-by: Rajat-Khandelwal <rajat.khandelwal@intel.com>
> ---
>  drivers/platform/x86/intel_scu_ipc.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
> index 7cc9089d1e14..1f90acaa7212 100644
> --- a/drivers/platform/x86/intel_scu_ipc.c
> +++ b/drivers/platform/x86/intel_scu_ipc.c
> @@ -233,17 +233,23 @@ static inline u32 ipc_data_readl(struct intel_scu_ipc_dev *scu, u32 offset)  static inline int busy_loop(struct intel_scu_ipc_dev *scu)  {
>  	unsigned long end = jiffies + IPC_TIMEOUT;
> +	u32 status;
>  
>  	do {
> -		u32 status;
> -
>  		status = ipc_read_status(scu);
> -		if (!(status & IPC_STATUS_BUSY))
> -			return (status & IPC_STATUS_ERR) ? -EIO : 0;
> +		if (!(status & IPC_STATUS_BUSY)) {
> +			if (!(status & IPC_STATUS_ERR))
> +				return 0;
> +		}
>  
>  		usleep_range(50, 100);
>  	} while (time_before(jiffies, end));
>  
> +	if (status & IPC_STATUS_BUSY)
> +		return -EBUSY;
> +	if (status & IPC_STATUS_ERR)
> +		return -EIO;
> +
>  	return -ETIMEDOUT;
>  }
>  
> --
> 2.17.1
> 

