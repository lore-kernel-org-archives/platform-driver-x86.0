Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627EAEB64DD
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Aug 2023 11:43:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjHGLnq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Aug 2023 07:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233224AbjHGLnN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Aug 2023 07:43:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B559459F7
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Aug 2023 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691408331;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e2w/SmCL+H3bXSVQLt4PZrBtL3ODk0uBW3yXUGSJZU4=;
        b=Xh/LrajEdYdXH0zcfwW+IbSmqPoJaZv7oNNr5Tc/FDTx1ElWgwwrcdyuKIKzM1qiegiTEk
        pGsBi0sTpZWHbkUJTtUtFsp3HiriaVv4AZaJeBzkl1yJ6UjCJyCN8mkhsAdIPCjueDuppt
        bSxUvAxH7AeG0suzBEpCLaWZRnq5Cs0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-9JwVhChuO1Kzp-RvuIrxzQ-1; Mon, 07 Aug 2023 07:38:50 -0400
X-MC-Unique: 9JwVhChuO1Kzp-RvuIrxzQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a355cf318so356224566b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Aug 2023 04:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691408328; x=1692013128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e2w/SmCL+H3bXSVQLt4PZrBtL3ODk0uBW3yXUGSJZU4=;
        b=c38ifaXHWusB3GtiXfvf/1/Q6KmuHw0cNguT3w3OZ8+yuODO+CxYlprvqZDqNHDd3d
         862l5nzX7OfSwl6Dj0Z/WcGrTPmy+vWW6TxD7HacvbmLOl5+nJRudlnBo1DlUHaHyyZm
         l7+XWVC/jcbHFYYJbWsOCsmmGCvUgfjOLgfKdd9My5rcOal181Y8zFZFYHV76EY5lZfi
         z2CnS6xcxADa7CwJI/U/LiTWvyvWDgbPnfm/VMN0G+0NcpI2INrjigkiiwhgdoB7yPD7
         LTyVIWK+xwbMBQ1k2LBzGhkgU5mxJV11Pq690Xxr2J2TtEmALAF3gom23CILorKBwtL2
         yNFA==
X-Gm-Message-State: AOJu0YwoH7IuDWRUOs+weaOGI+1cFCnXiryBSqFyT/1q04Dz4CXtofYw
        5J2e293zCOWqjWcus5Hsuo1Tqov+/cXAyrYx2YHuPKygtCN3NeVLcHZJC1uchOefzSNy34Iv7pH
        sKqvny5IxOO0hqYfQYbLcr4JWhmXDyS/FFUwf8n8NWQ==
X-Received: by 2002:a17:906:18c:b0:994:542c:8718 with SMTP id 12-20020a170906018c00b00994542c8718mr8734312ejb.76.1691408328735;
        Mon, 07 Aug 2023 04:38:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERphai9ZuF3TV8UwBuU3LTba/UPtBQMl69GuNhcTMAaMWEKx4jY1NHDQwLh9oLUTFuB6l1fA==
X-Received: by 2002:a17:906:18c:b0:994:542c:8718 with SMTP id 12-20020a170906018c00b00994542c8718mr8734301ejb.76.1691408328505;
        Mon, 07 Aug 2023 04:38:48 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id y16-20020a170906525000b0099bd046170fsm5053078ejm.104.2023.08.07.04.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 04:38:47 -0700 (PDT)
Message-ID: <9c15a6ba-5f67-02f9-601a-b097aa7d4ae0@redhat.com>
Date:   Mon, 7 Aug 2023 13:38:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] platform/x86: hp-bioscfg: Use kmemdup() to replace
 kmalloc + memcpy
Content-Language: en-US
To:     Li Zetao <lizetao1@huawei.com>, jorge.lopez2@hp.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20230803032027.3044851-1-lizetao1@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230803032027.3044851-1-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/3/23 05:20, Li Zetao wrote:
> There are some warnings reported by coccinelle:
> 
> ./drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c:317:35-42:
> 		WARNING opportunity for kmemdup
> ./drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c:270:40-47:
> 		WARNING opportunity for kmemdup
> ./drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c:233:36-43:
> 		WARNING opportunity for kmemdup
> 
> Use kmemdup rather than duplicating its implementation.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

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
>  .../platform/x86/hp/hp-bioscfg/spmobj-attributes.c    | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> index 02291e32684f..86f90238750c 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> @@ -230,12 +230,10 @@ static ssize_t sk_store(struct kobject *kobj,
>  		length--;
>  
>  	/* allocate space and copy current signing key */
> -	bioscfg_drv.spm_data.signing_key = kmalloc(length, GFP_KERNEL);
> +	bioscfg_drv.spm_data.signing_key = kmemdup(buf, length, GFP_KERNEL);
>  	if (!bioscfg_drv.spm_data.signing_key)
>  		return -ENOMEM;
>  
> -	memcpy(bioscfg_drv.spm_data.signing_key, buf, length);
> -
>  	/* submit signing key payload */
>  	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_SK,
>  				   HPWMI_SECUREPLATFORM,
> @@ -267,14 +265,12 @@ static ssize_t kek_store(struct kobject *kobj,
>  		length--;
>  
>  	/* allocate space and copy current signing key */
> -	bioscfg_drv.spm_data.endorsement_key = kmalloc(length, GFP_KERNEL);
> +	bioscfg_drv.spm_data.endorsement_key = kmemdup(buf, length, GFP_KERNEL);
>  	if (!bioscfg_drv.spm_data.endorsement_key) {
>  		ret = -ENOMEM;
>  		goto exit_kek;
>  	}
>  
> -	memcpy(bioscfg_drv.spm_data.endorsement_key, buf, length);
> -
>  	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_KEK,
>  				   HPWMI_SECUREPLATFORM,
>  				   (void *)bioscfg_drv.spm_data.endorsement_key,
> @@ -314,13 +310,12 @@ static ssize_t auth_token_store(struct kobject *kobj,
>  		length--;
>  
>  	/* allocate space and copy current auth token */
> -	bioscfg_drv.spm_data.auth_token = kmalloc(length, GFP_KERNEL);
> +	bioscfg_drv.spm_data.auth_token = kmemdup(buf, length, GFP_KERNEL);
>  	if (!bioscfg_drv.spm_data.auth_token) {
>  		ret = -ENOMEM;
>  		goto exit_token;
>  	}
>  
> -	memcpy(bioscfg_drv.spm_data.auth_token, buf, length);
>  	return count;
>  
>  exit_token:

