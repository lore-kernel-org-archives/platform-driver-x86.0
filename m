Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8B6C7618A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 14:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbjCTOWJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 10:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjCTOWI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 10:22:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E01D1F91B
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 07:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679322086;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J+ZnUujAjEIgFuw+UukJjs1MGIzuq34ky6ggoxpxDwg=;
        b=JeKb8VAiGwa0fqfUuyHMqu27SFaTTnoF8r/iINp5AzydTeaP4lZkbURSlPZznIDACDjYJM
        ut9fkcVIwBodJtBgAVGl7qZdiehwN6Fm/YKsTzlPm1fJ6IWHaHu3ITJyZEklyia/dhLUTa
        xGpTcv3CVthLsXObMPP0l6NTmTPVl7M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-C9KqPAkjNQWGGvVukDQw9g-1; Mon, 20 Mar 2023 10:21:25 -0400
X-MC-Unique: C9KqPAkjNQWGGvVukDQw9g-1
Received: by mail-ed1-f71.google.com with SMTP id a27-20020a50c31b000000b0050047ecf4bfso11623576edb.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 07:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679322083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J+ZnUujAjEIgFuw+UukJjs1MGIzuq34ky6ggoxpxDwg=;
        b=OZDGZCMc/RuBrUYz0b2+lX9IMP2ZgzKKbG5nH2LeX+veETImDUkKJy4ltAc3zYkSWf
         9yICZKav8RCuO/kaw4zzSGmJq5TCk5NGlKVUVmu/F/K8FLyg8ZwziPnebzd4xmQk3w/D
         0wCZLFyVeZO1QRRtW5/FbipULYKamkix2HOSwRAZ7g/G7t1YqY/q16lB51ofBd8JF7Lu
         7+0zMzCMNKI4HKYU3vwO7O230bb/xIcHpf9SgF8yRqAef8JB1FsjfEKLDkEZFM5NjfU1
         HXhFDpWhSukSE5GgkjFbJHVSsewB/eT2CmY8rIcYVHBFb7P44Jj4F7wBRO6bWYpIc5PW
         tbMw==
X-Gm-Message-State: AO0yUKXgkXrIcCZDIm0UHdYHrrCzaQ2cBEBB4QXAd6huDV0l34bv6JCD
        JA7Tp36NNGcyjkp6rLMqkfQwrQWDVpPUeuF9vtGIWk8v1K8pXnW2S0AsYNHuJRdj72PTxA8qX7q
        zzdcWeM5hgMEK7/aGVF00AobzepTxKUjUAvaY6i2ZiA==
X-Received: by 2002:aa7:cb8f:0:b0:4fb:fd9f:737a with SMTP id r15-20020aa7cb8f000000b004fbfd9f737amr14139821edt.4.1679322083750;
        Mon, 20 Mar 2023 07:21:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set+xEDom1cjy6XvfSXHvtHSLGtDCnJA21F7q4k/CM1CUAktQ9QZvgV127J77bi2UPRHq+Bwovg==
X-Received: by 2002:aa7:cb8f:0:b0:4fb:fd9f:737a with SMTP id r15-20020aa7cb8f000000b004fbfd9f737amr14139803edt.4.1679322083482;
        Mon, 20 Mar 2023 07:21:23 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id q28-20020a50aa9c000000b004fb556e905fsm4941032edc.49.2023.03.20.07.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 07:21:22 -0700 (PDT)
Message-ID: <16a8e956-e3ed-5b52-fa53-19429294c1c1@redhat.com>
Date:   Mon, 20 Mar 2023 15:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86/intel: vsec: Use intel_vsec_dev_release() to
 simplify init() error cleanup
Content-Language: en-US
To:     "David E . Box" <david.e.box@linux.intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230320103815.229729-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230320103815.229729-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/20/23 11:38, Hans de Goede wrote:
> On auxiliary_device_init(auxdev) failure we need to do the exact same
> cleanup steps as on device.release(), so use the intel_vsec_dev_release()
> callback for this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/intel/vsec.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index 2311c16cb975..cf2a20088f6b 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -169,11 +169,7 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
>  
>  	ret = auxiliary_device_init(auxdev);
>  	if (ret < 0) {
> -		mutex_lock(&vsec_ida_lock);
> -		ida_free(intel_vsec_dev->ida, auxdev->id);
> -		mutex_unlock(&vsec_ida_lock);
> -		kfree(intel_vsec_dev->resource);
> -		kfree(intel_vsec_dev);
> +		intel_vsec_dev_release(&auxdev->dev);
>  		return ret;
>  	}
>  

