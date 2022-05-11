Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCAAC4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 May 2022 14:34:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244750AbiEKOec (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 May 2022 10:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244843AbiEKOe1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 May 2022 10:34:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ABE2D19B3AF
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 07:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652279659;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l6RLj8UsrA5gv/Hv6OZRopkP0qnJiCPWilzj0FfnJcw=;
        b=Me8SyT3ddV6rG8AEMuVCNweinqqlU+iPnfB83WTQ4faOWZQgN76DjbPgtqfYZDZBKswi6d
        R/pTlHKdJ9COAqgE9LKLtHYpORJieSc1kn8DVFM5bGb+wP+Oo1YUYRDLGSKyDcOoh1ZXjg
        FMw/cpNod+NXaUfLpip2MN0fxpdEHf8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-k6BiGKEqPMSyK9elrUdbsQ-1; Wed, 11 May 2022 10:34:18 -0400
X-MC-Unique: k6BiGKEqPMSyK9elrUdbsQ-1
Received: by mail-ej1-f72.google.com with SMTP id p7-20020a170906614700b006f87f866117so1244887ejl.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 07:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l6RLj8UsrA5gv/Hv6OZRopkP0qnJiCPWilzj0FfnJcw=;
        b=4dvVn+jQRDv6w3dXYKaVx0TE+L2SOoxaA9pIysiRZoCWKVHEGh/10KW6OzYAV6KDim
         fcaANFas1qFMdjztbLnU2RTeU57t4ZPeMXi5h3IP8tYvsrags9+yak0T+s22lT1inwBX
         lPva6wwQ4fUbGsU22rqtMRDqqjcrbsKJjNrNmI+c63wlKK6GDrxXF7MxBjTW3k1hrx1V
         kwBMfb/A0sLeRm98Ch/6j53LDd+5oGNPvMzu3ivG8PgvBUCT8IgUiRdgU5JZkOLakRWn
         Pj3JJ2D+dxGjdaH98ouWrgwcWYDW4XRn4w3YrI7LLLvHkLKKMgYJfHPrS88fs8BJlVhW
         YAQA==
X-Gm-Message-State: AOAM53021QVslEhKfBK3MOzmTAmslQzm4z4k1OrOGShz+iG+nz5/sD51
        N1nroCsMe9ODt+FR40/T49OsvbcaYRdzxoluVPLL5M4lp/AJO6k6P/fEyTVvSIeR2Vf8Yft2xOE
        SCkuC8YzUuFLmVTcpFO4oI6JIRuSgb1DMRw==
X-Received: by 2002:a50:fa8c:0:b0:428:9d92:e5fb with SMTP id w12-20020a50fa8c000000b004289d92e5fbmr16842850edr.395.1652279657262;
        Wed, 11 May 2022 07:34:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjckULa/jmWXEiIh/TleWW58ONjAbx8TZEmK4BhFuoToi9I8RYT9biDSKkDQ/NQA/KyhXpZg==
X-Received: by 2002:a50:fa8c:0:b0:428:9d92:e5fb with SMTP id w12-20020a50fa8c000000b004289d92e5fbmr16842811edr.395.1652279656926;
        Wed, 11 May 2022 07:34:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id k15-20020a50ce4f000000b0042a2ccdd2b8sm257216edj.70.2022.05.11.07.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 07:34:16 -0700 (PDT)
Message-ID: <a4883972-a31b-5e81-c8ef-3d9d097662d0@redhat.com>
Date:   Wed, 11 May 2022 16:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 1/3] platform_data/mlxreg: Add field for notification
 callback
Content-Language: en-US
To:     michaelsh@nvidia.com
Cc:     platform-driver-x86@vger.kernel.org, vadimp@nvidia.com
References: <20220430115809.54565-1-michaelsh@nvidia.com>
 <20220430115809.54565-2-michaelsh@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220430115809.54565-2-michaelsh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/30/22 13:58, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> Add notification callback to inform caller that platform driver probing
> has been completed. It allows to caller to perform some initialization
> flow steps depending on specific driver probing completion.
> 
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

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
>  include/linux/platform_data/mlxreg.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
> index 40185f9d7c14..a6bd74e29b6b 100644
> --- a/include/linux/platform_data/mlxreg.h
> +++ b/include/linux/platform_data/mlxreg.h
> @@ -216,6 +216,8 @@ struct mlxreg_core_platform_data {
>   * @mask_low: low aggregation interrupt common mask;
>   * @deferred_nr: I2C adapter number must be exist prior probing execution;
>   * @shift_nr: I2C adapter numbers must be incremented by this value;
> + * @handle: handle to be passed by callback;
> + * @completion_notify: callback to notify when platform driver probing is done;
>   */
>  struct mlxreg_core_hotplug_platform_data {
>  	struct mlxreg_core_item *items;
> @@ -228,6 +230,8 @@ struct mlxreg_core_hotplug_platform_data {
>  	u32 mask_low;
>  	int deferred_nr;
>  	int shift_nr;
> +	void *handle;
> +	int (*completion_notify)(void *handle, int id);
>  };
>  
>  #endif /* __LINUX_PLATFORM_DATA_MLXREG_H */

