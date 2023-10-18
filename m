Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0112CDB47E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Oct 2023 13:42:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbjJRNml (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Oct 2023 09:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbjJRNmk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Oct 2023 09:42:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B842119
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Oct 2023 06:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697636515;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SK4S43IHlmF4EFyh15THtbxj/W0Jb2/UfHyPZ4GJTqE=;
        b=g7zl4Nqmx69helckGzjQ/Fm0p6x/2LAq2JjtJ8yV2UYBchWwIf0hLsSq1v69GyPScE02Jl
        1sDcM4QugH6DMQyOrnyyyLW670vVMXkmg1nZRnjSpiVrwGgzyuybKS11ApDQ0/ZgEaa0Fx
        00tATeuT7NCtUWa5DS40RlRGNYv/rpw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-sKQp1k7vPuClov-dGxPibA-1; Wed, 18 Oct 2023 09:41:53 -0400
X-MC-Unique: sKQp1k7vPuClov-dGxPibA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-533d8a785a5so5650147a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Oct 2023 06:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697636512; x=1698241312;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SK4S43IHlmF4EFyh15THtbxj/W0Jb2/UfHyPZ4GJTqE=;
        b=I8MRYi5nrE+yJEM+ZrrZD37Sr1sFns9QL54CAKefL1upRRllRLmcFtMm+2wDkCf367
         MVEPNkWWAh8xYPyr8CO5xZT93zn0fMaXE4ieorFIJ0yUlzGbc1BaCbA1b7RXyJ5EYTJe
         ru6m0QwGfmEYS+ol/VGqiyQhZ06SaD4iQb8NwBdzvcKM0Gjy4h9LLstjegiXBRf184fU
         24hqZz2HWWgFWh8pKbcYJ5ES510JbZU59mrsOVHg27Z98Nveh/viUS/Zga0KX0xzASQj
         t/YY5q+dcmCcKvaFX4Yy3kXXqm/tIKTRAYPrA23w9alAGnrN/3gNMCY84uR+PUtZmyok
         qF5A==
X-Gm-Message-State: AOJu0YxJRlAH7s53IZN9upNqZd4VfS8QkjemdIByiEc+hyXriI/IO/Tf
        /1DsWzDxswT/B/6EVRFU7d717dm7sNqREZUcx91cUS5putTuSSwDn9Lv0k4jFc+AlHVXgZzkYaV
        quFJCjKJ040ZgESokpMoZzDHwa2VyWrGMvA==
X-Received: by 2002:a05:6402:40d0:b0:53e:2af1:e966 with SMTP id z16-20020a05640240d000b0053e2af1e966mr4813603edb.1.1697636512711;
        Wed, 18 Oct 2023 06:41:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbfRLmV3HcaMlvTLlgoeZtSny2aGLcRuG+gXxjIoyNiH2+Bv7O/IFtGCUm/O675WpbzIvUZA==
X-Received: by 2002:a05:6402:40d0:b0:53e:2af1:e966 with SMTP id z16-20020a05640240d000b0053e2af1e966mr4813579edb.1.1697636512402;
        Wed, 18 Oct 2023 06:41:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s26-20020a056402037a00b00532eba07773sm2816133edw.25.2023.10.18.06.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 06:41:51 -0700 (PDT)
Message-ID: <f084c21c-bff2-c12f-f583-ba4bc42fdf9d@redhat.com>
Date:   Wed, 18 Oct 2023 15:41:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] platform/mellanox: mlxbf-tmfifo: Fix a warning message
Content-Language: en-US, nl
To:     Liming Sun <limings@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>,
        David Thompson <davthompson@nvidia.com>,
        Mark Gross <markgross@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <bb8bc77e6ecc2287fc9110cfa08caa48eb2a0385.1696508228.git.limings@nvidia.com>
 <20231012230235.219861-1-limings@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231012230235.219861-1-limings@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/13/23 01:02, Liming Sun wrote:
> This commit fixes the smatch static checker warning in function
> mlxbf_tmfifo_rxtx_word() which complains data not initialized at
> line 634 when IS_VRING_DROP() is TRUE.
> 
> Signed-off-by: Liming Sun <limings@nvidia.com>
> ---
> v1->v2: Logic adjustment for Hans's comment
>   - Adjust the logic to avoid confusion.

Thank you for your patch/series, I've applied this patch
(series) to the pdx86 fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans






> v1: Initial version.
> ---
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
> index f3696a54a2bd..d9615ad60012 100644
> --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
> @@ -607,24 +607,25 @@ static void mlxbf_tmfifo_rxtx_word(struct mlxbf_tmfifo_vring *vring,
>  
>  	if (vring->cur_len + sizeof(u64) <= len) {
>  		/* The whole word. */
> -		if (!IS_VRING_DROP(vring)) {
> -			if (is_rx)
> +		if (is_rx) {
> +			if (!IS_VRING_DROP(vring))
>  				memcpy(addr + vring->cur_len, &data,
>  				       sizeof(u64));
> -			else
> -				memcpy(&data, addr + vring->cur_len,
> -				       sizeof(u64));
> +		} else {
> +			memcpy(&data, addr + vring->cur_len,
> +			       sizeof(u64));
>  		}
>  		vring->cur_len += sizeof(u64);
>  	} else {
>  		/* Leftover bytes. */
> -		if (!IS_VRING_DROP(vring)) {
> -			if (is_rx)
> +		if (is_rx) {
> +			if (!IS_VRING_DROP(vring))
>  				memcpy(addr + vring->cur_len, &data,
>  				       len - vring->cur_len);
> -			else
> -				memcpy(&data, addr + vring->cur_len,
> -				       len - vring->cur_len);
> +		} else {
> +			data = 0;
> +			memcpy(&data, addr + vring->cur_len,
> +			       len - vring->cur_len);
>  		}
>  		vring->cur_len = len;
>  	}

