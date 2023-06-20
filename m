Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E06EB64D8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Jun 2023 10:46:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjFTKqR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 20 Jun 2023 06:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbjFTKqQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Jun 2023 06:46:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F6910CE
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jun 2023 03:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687257905;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nIgePxG/PTNaTAj00kx5zSGFfacv6d4L7YcwZ5XRgq4=;
        b=Eh6cR/9XS/tAAvZTmQhHXleH6v10D5RbFBmtSYEitd+EMlOxd6XmiDeK9nLABXgqMN/7EC
        HMwBInvjSXcVXAtmw2Kipq5bHaQbMECcRuuPuuPssxiVFuQSo+Xkn4eun/55UScaBmx640
        LdGsLY+guFZ91JNupW8w+t82Gwuftlw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-iWNexaL5P8CzqIKSWSW2Dw-1; Tue, 20 Jun 2023 06:45:04 -0400
X-MC-Unique: iWNexaL5P8CzqIKSWSW2Dw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9879d2fc970so226333466b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jun 2023 03:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687257902; x=1689849902;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nIgePxG/PTNaTAj00kx5zSGFfacv6d4L7YcwZ5XRgq4=;
        b=Ui1fX0EMlRdX0y9w4GDjU+Ybwn1rZSRUlyHqXRe+TxowJRgBVcM2GTSgoNOUFiKC/P
         QHE8OGrGq+HXE+Emxw0y0j/9KfDmeplFuOIUZ55ZCV1S/GcDBh2p0EebXc37e7ySjmlk
         1zkL6MIJtbKjGkZPC1JOTRS+eW7h3zML6E/71ml4pyGsRl7ZU1lm5RNOt73XKaiObnuI
         Em4+bS/3JDE7GqE2lGuWv8yZbIKUOZgQJBsQfZwt0MRwAnQtsz6NJ+Y6W+sjsegiGMaX
         Co99khCr4a/+FdHiviA5lvdcvuvlz5/u+r9yeFQYv9B5HKVloIrnhCrUpVGI+qOm2mUu
         HP+w==
X-Gm-Message-State: AC+VfDwJ6mT0UfP16/pTeBHUCyw1nCQ3TJ59X8A2bSyV+P5Eu7FiOGdi
        I+Kr5iwYNlTnDl5cWV75WUEWpTz8Ln3WvBc97fPrCXN/UrFPX+wPlkBQtXlUkrJEU6JNabHZ00L
        9xtquFhLcXuRkqHvokUsYmHdidE57zK9XtzXzkZwS6A==
X-Received: by 2002:a17:907:6ea0:b0:961:800b:3f1e with SMTP id sh32-20020a1709076ea000b00961800b3f1emr13701876ejc.73.1687257902551;
        Tue, 20 Jun 2023 03:45:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6X/79stHcs5o6dsd51DlbBuSEdV5Djuhoq8e/i1V8K/sKzAjZoYE4kvKig1z97J9CKGUkjqg==
X-Received: by 2002:a17:907:6ea0:b0:961:800b:3f1e with SMTP id sh32-20020a1709076ea000b00961800b3f1emr13701866ejc.73.1687257902340;
        Tue, 20 Jun 2023 03:45:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b8-20020a170906660800b0096f7500502csm1162794ejp.199.2023.06.20.03.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 03:45:01 -0700 (PDT)
Message-ID: <eb143a0b-ff12-1c4c-212b-639760eda740@redhat.com>
Date:   Tue, 20 Jun 2023 12:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86/intel: tpmi: Remove hardcoded unit and
 offset
Content-Language: en-US, nl
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org, ilpo.jarvinen@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230617014447.2543592-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230617014447.2543592-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/17/23 03:44, Srinivas Pandruvada wrote:
> Use sizeof(u32) for TPMI entry size units. Also add a define
> for capability offset unit size.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

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
>  drivers/platform/x86/intel/tpmi.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
> index a5227951decc..9c606ee2030c 100644
> --- a/drivers/platform/x86/intel/tpmi.c
> +++ b/drivers/platform/x86/intel/tpmi.c
> @@ -222,7 +222,7 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
>  	snprintf(feature_id_name, sizeof(feature_id_name), "tpmi-%s", name);
>  
>  	for (i = 0, tmp = res; i < pfs->pfs_header.num_entries; i++, tmp++) {
> -		u64 entry_size_bytes = pfs->pfs_header.entry_size * 4;
> +		u64 entry_size_bytes = pfs->pfs_header.entry_size * sizeof(u32);
>  
>  		tmp->start = pfs->vsec_offset + entry_size_bytes * i;
>  		tmp->end = tmp->start + entry_size_bytes - 1;
> @@ -277,7 +277,7 @@ static int tpmi_process_info(struct intel_tpmi_info *tpmi_info,
>  	void __iomem *info_mem;
>  
>  	info_mem = ioremap(pfs->vsec_offset + TPMI_INFO_BUS_INFO_OFFSET,
> -			   pfs->pfs_header.entry_size * 4 - TPMI_INFO_BUS_INFO_OFFSET);
> +			   pfs->pfs_header.entry_size * sizeof(u32) - TPMI_INFO_BUS_INFO_OFFSET);
>  	if (!info_mem)
>  		return -ENOMEM;
>  
> @@ -308,6 +308,8 @@ static int tpmi_fetch_pfs_header(struct intel_tpmi_pm_feature *pfs, u64 start, i
>  	return 0;
>  }
>  
> +#define TPMI_CAP_OFFSET_UNIT	1024
> +
>  static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
>  {
>  	struct intel_vsec_device *vsec_dev = auxdev_to_ivdev(auxdev);
> @@ -354,7 +356,7 @@ static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
>  		if (!pfs_start)
>  			pfs_start = res_start;
>  
> -		pfs->pfs_header.cap_offset *= 1024;
> +		pfs->pfs_header.cap_offset *= TPMI_CAP_OFFSET_UNIT;
>  
>  		pfs->vsec_offset = pfs_start + pfs->pfs_header.cap_offset;
>  

