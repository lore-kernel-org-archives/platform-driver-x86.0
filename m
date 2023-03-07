Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58679C678D5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Mar 2023 11:12:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbjCGLMW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Mar 2023 06:12:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbjCGLLf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Mar 2023 06:11:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4591C589
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Mar 2023 03:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678187335;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KVC9qbG1+l17R9dAYQYYHSR3Zti7GnunoZVw0+7r/0U=;
        b=ALlEW6kntJjufAvA292VT5Hua97sUhE4rT+1BISEalxeP7F1GMx/U8UowTWSKcC8BOqBpX
        yZQTF9r1PRNMhIg0/UBKBH/A+E/gcIGdvm/LOZV89XSxEhg3VTrC8xMAhf5BhfAnNTwTmp
        SjApYYPbvd6BDsHTTvEnlXB7jzayI7Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-jRfXttc1NsGzo7AZC4BDXg-1; Tue, 07 Mar 2023 06:08:54 -0500
X-MC-Unique: jRfXttc1NsGzo7AZC4BDXg-1
Received: by mail-ed1-f71.google.com with SMTP id k12-20020a50c8cc000000b004accf30f6d3so18430944edh.14
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Mar 2023 03:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678187333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KVC9qbG1+l17R9dAYQYYHSR3Zti7GnunoZVw0+7r/0U=;
        b=M/I79QimfElcYK3Z/KTSuPABkZXn6aEo53/iowc5TgPtPLypRanGfHS6U3m+PFaaav
         t2nEeoetVbGwWtu81FqltUwsTWW/l73zqEPJKh1KqqFV1afMtaAk2p7P83Ri5KOHe6Ii
         PRCmH3Jsz0CClFpum7Hc2ytYLOOiYutcjOvHhHCD0Jn3NhVrju43JdzAj7Yy9UBZbWjm
         St6jsBVhX/pTmkZ3DDJi3PhQlCTUe3kJrqgH/G3By9uTmP42AieOWh94B2lzKDebsByu
         DqaWceaK5Ell/EhmYHHYvpAW7wbckP48YUr4/LKJ0WW2L+CYCrHOUZR8jz9WkpFiYC17
         KVTw==
X-Gm-Message-State: AO0yUKWJBr+2PCyCrDGVGopLYLaCND3rT72LE0KuaC2f5bU0wmSt161b
        OGPNCvXEmXE1T5JindnjoQdB/cgWkzxykDv/1w7/OtGJZM1krrH31MimsZhcEF+kZsQLm5zgD8r
        tN1X2zaxm6BZxTrVbt/jbulyX6VNn8tgNgQ==
X-Received: by 2002:a17:907:a47:b0:8f0:143d:fa4b with SMTP id be7-20020a1709070a4700b008f0143dfa4bmr18087069ejc.7.1678187333001;
        Tue, 07 Mar 2023 03:08:53 -0800 (PST)
X-Google-Smtp-Source: AK7set//AmKBKg5Lxdhpuv94nfG1IG2kaEzMxSwYPEuDI2mZTzFhFG0IIqg9hEP/VTiRcj9zTlHgVw==
X-Received: by 2002:a17:907:a47:b0:8f0:143d:fa4b with SMTP id be7-20020a1709070a4700b008f0143dfa4bmr18087059ejc.7.1678187332785;
        Tue, 07 Mar 2023 03:08:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n8-20020a17090695c800b008c76facbbf7sm6032593ejy.171.2023.03.07.03.08.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 03:08:52 -0800 (PST)
Message-ID: <4e91535d-02ec-3b2f-408b-231f99340927@redhat.com>
Date:   Tue, 7 Mar 2023 12:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform: mellanox: mlx-platform: Initialize shift
 variable to 0
Content-Language: en-US, nl
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>
References: <20230307105842.286118-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230307105842.286118-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/7/23 11:58, Hans de Goede wrote:
> Initialize shift variable in mlxplat_mlxcpld_verify_bus_topology()
> to 0 to avoid the following compile error:
> 
> drivers/platform/x86/mlx-platform.c:6013
>  mlxplat_mlxcpld_verify_bus_topology() error: uninitialized symbol 'shift'.
> 
> Fixes: 50b823fdd357 ("platform: mellanox: mlx-platform: Move bus shift assignment out of the loop")
> Cc: Vadim Pasternak <vadimp@nvidia.com>
> Cc: Michael Shych <michaelsh@nvidia.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be fixes) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/mlx-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index 7b6779cdb134..67367f010139 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -5980,7 +5980,7 @@ MODULE_DEVICE_TABLE(dmi, mlxplat_dmi_table);
>  static int mlxplat_mlxcpld_verify_bus_topology(int *nr)
>  {
>  	struct i2c_adapter *search_adap;
> -	int shift, i;
> +	int i, shift = 0;
>  
>  	/* Scan adapters from expected id to verify it is free. */
>  	*nr = MLXPLAT_CPLD_PHYS_ADAPTER_DEF_NR;

