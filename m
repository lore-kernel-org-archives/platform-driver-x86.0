Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E878C7EE32
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 12:43:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjCAMnm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 07:43:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjCAMnU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 07:43:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329883C7BC
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 04:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677674553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1rpnH98wTLhNce/b0NogbnAHOQzjLCiRqXJRNeyc7CY=;
        b=Q//deFSA8PVQo/T7MbtwBC2K5S1mRh9l/fB1CfpIbJTVusy+K0LrJB9PZAzEO7+O+rtKEt
        JTKuc8c+SiVbeAvDfjwL/OD0No6YL5ZOHtrIZk4wHdTtYaJJEz6dJRxzcYbFoXxasA54yZ
        wLj3htifVn6KgkVin7YdcUyQW6Q/H1s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-9IjUUw_rOHGkh_1ZLZkhDw-1; Wed, 01 Mar 2023 07:42:32 -0500
X-MC-Unique: 9IjUUw_rOHGkh_1ZLZkhDw-1
Received: by mail-ed1-f71.google.com with SMTP id cy28-20020a0564021c9c00b004acc6cf6322so18771759edb.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 04:42:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1rpnH98wTLhNce/b0NogbnAHOQzjLCiRqXJRNeyc7CY=;
        b=XPQ7xPSt0mfqvV6mwO7PrwAQizkvuOQR6/E2sQLa38tk0VqZ8CvJ33GuwYfEJo89wD
         kq6bYUCgOnqDerT3v5y3axL0ogBcKE2Ib4fkctTp7yA6E1lZUWKTv/ziUprJ5DBknbEW
         GE6KiGQngNFp565JnRvIMx998P1i6uIBMEqMClyEPozfVjQ59FeIHhoBPcGWwuS859Dc
         4StHG55nLX1TtMLPU2GQQu7Dj8WYPlrgzbTQwZ1mh5VSIqJHL+7hYIBdki+xNfBRDFmV
         CQCQIZx4LzbT8T3yRU6nkCxuHqCoE87L1i6OggACOfoTIK9L+gGEzZH5U/zU3q9C88s/
         F/3Q==
X-Gm-Message-State: AO0yUKXfkzwR13xtdRY/IqnkIJ2xNOPNFeEJCh9OD1RN9KKPrKO+pyQW
        pim4Je+CkjU3GIIl9z1xqfBvfU1CZf9p1H4qDK/94EkkO+HU8cW60uj/Qghjm4lNt0NV0aanbrd
        FssdnoooZ54FRFrJer04h09DGTZ2G8kxi3g==
X-Received: by 2002:aa7:cd91:0:b0:4af:6aa6:12d3 with SMTP id x17-20020aa7cd91000000b004af6aa612d3mr5821565edv.40.1677674550476;
        Wed, 01 Mar 2023 04:42:30 -0800 (PST)
X-Google-Smtp-Source: AK7set+35lIRUpEO8j+kI01CSCd8mMNqTzPQI81CfWsGcFawLY1xZR54rOk8kDowbztoLzP8EEc88Q==
X-Received: by 2002:aa7:cd91:0:b0:4af:6aa6:12d3 with SMTP id x17-20020aa7cd91000000b004af6aa612d3mr5821551edv.40.1677674550206;
        Wed, 01 Mar 2023 04:42:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z9-20020a50cd09000000b004ac54d4da22sm5622325edi.71.2023.03.01.04.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 04:42:29 -0800 (PST)
Message-ID: <984e2340-6d9d-f7b6-a638-b70a3ed40a32@redhat.com>
Date:   Wed, 1 Mar 2023 13:42:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86/intel/tpmi: Fix double free reported by
 Smatch
Content-Language: en-US, nl
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Carpenter <error27@gmail.com>
References: <20230227140614.2913474-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230227140614.2913474-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/27/23 15:06, Srinivas Pandruvada wrote:
> Fix warning:
> drivers/platform/x86/intel/tpmi.c:253 tpmi_create_device()
> 	warn: 'feature_vsec_dev' was already freed.
> 
> If there is some error, feature_vsec_dev memory is freed as part
> of resource managed call intel_vsec_add_aux(). So, additional
> kfree() call is not required.
> 
> Reordered res allocation and feature_vsec_dev, so that on error
> only res is freed.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://lore.kernel.org/platform-driver-x86/Y%2FxYR7WGiPayZu%2FR@kili/T/#u
> Fixes: 47731fd2865f ("platform/x86/intel: Intel TPMI enumeration driver")
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Thanks, I've applied this patch to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I'll rebase that branch once 6.3-rc1 is out and then push the rebased
patch to the fixes branch and include it in my next 6.3 fixes pull-req
to Linus.

Regards,

Hans





> ---
>  drivers/platform/x86/intel/tpmi.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
> index c60733261c89..c999732b0f1e 100644
> --- a/drivers/platform/x86/intel/tpmi.c
> +++ b/drivers/platform/x86/intel/tpmi.c
> @@ -209,14 +209,14 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
>  	if (!name)
>  		return -EOPNOTSUPP;
>  
> -	feature_vsec_dev = kzalloc(sizeof(*feature_vsec_dev), GFP_KERNEL);
> -	if (!feature_vsec_dev)
> +	res = kcalloc(pfs->pfs_header.num_entries, sizeof(*res), GFP_KERNEL);
> +	if (!res)
>  		return -ENOMEM;
>  
> -	res = kcalloc(pfs->pfs_header.num_entries, sizeof(*res), GFP_KERNEL);
> -	if (!res) {
> +	feature_vsec_dev = kzalloc(sizeof(*feature_vsec_dev), GFP_KERNEL);
> +	if (!feature_vsec_dev) {
>  		ret = -ENOMEM;
> -		goto free_vsec;
> +		goto free_res;
>  	}
>  
>  	snprintf(feature_id_name, sizeof(feature_id_name), "tpmi-%s", name);
> @@ -239,6 +239,8 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
>  	/*
>  	 * intel_vsec_add_aux() is resource managed, no explicit
>  	 * delete is required on error or on module unload.
> +	 * feature_vsec_dev memory is also freed as part of device
> +	 * delete.
>  	 */
>  	ret = intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev->auxdev.dev,
>  				 feature_vsec_dev, feature_id_name);
> @@ -249,8 +251,6 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
>  
>  free_res:
>  	kfree(res);
> -free_vsec:
> -	kfree(feature_vsec_dev);
>  
>  	return ret;
>  }

