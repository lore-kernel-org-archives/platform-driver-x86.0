Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6047AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 May 2022 10:43:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1391047AbiEFKrO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 May 2022 06:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbiEFKrO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 May 2022 06:47:14 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A6C8B65432
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 May 2022 03:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651833810;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Snzmq85aJhY8SrwLYfIHKZ6vZUi6gYdUUM71Krz7mxs=;
        b=ULfyGS+WkxRLTV1Wc57tGgO9MrNqcek/RKBn73NVYNWy4mDXjnHS6xRD8CSHuICqEBJd3m
        F8rFN6PaXFox1EI7MK9o1hbLLqPbqy//9Ub7Jl1HYweuwP/f/YGPrlSPxM3EkEQr2I7RqA
        hXPB7kZYc+cxbQhZJ0RkKPEyeSZFjtI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-KEOzwytTMUeXjHZ9UCQPxw-1; Fri, 06 May 2022 06:43:29 -0400
X-MC-Unique: KEOzwytTMUeXjHZ9UCQPxw-1
Received: by mail-ed1-f69.google.com with SMTP id s24-20020a05640217d800b00425e19e7deaso3784163edy.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 May 2022 03:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Snzmq85aJhY8SrwLYfIHKZ6vZUi6gYdUUM71Krz7mxs=;
        b=pD6B9gr4qhw1UE9zdrA5Z6LeY89HF9P2FDvxZ2hPJUSFp2S2X4Ujx2BF4waDUEWdp9
         rOOwXjFucp3QLqAL3ZDfNEYRpA0YdoN/4m7tTqXXPV63jW5WnN4M8oiU+UQTU9sS26uU
         YEG8zjZqjB9eL0Mmf2PpGLs6XlRvfyhCrilPstQ+cUHS6OO3QWQ16lwV2xTE1erDolJ1
         H2DyZF83GbMEn6GXIT7ZQucgIyw8JgPZXKNomglk8x5stfmVCT81WKLrZuvuUCIhmtwT
         /4LkHige+2FyIXGRDdZuw/fZbZ1paVZyfxOkjWZGzR4N0w4rRUi1Fma3l6g2PN3Z43nZ
         ik+g==
X-Gm-Message-State: AOAM530PynoDeoVw8UHo/ymfsIAlvyvVsBOgS+AFoP2m1bCsFbQUehuI
        4jiShvrp1E5oB82pu8IVB082rcZYjCtFlNHuJ87R4aa263HwglRVMbksqeuwflArAKtPmvpjvCK
        pin8GfGCFA7/mffYCKjFjFB2WF+bS0gKuzA==
X-Received: by 2002:aa7:c6d0:0:b0:425:e9f3:10a8 with SMTP id b16-20020aa7c6d0000000b00425e9f310a8mr2769999eds.41.1651833808649;
        Fri, 06 May 2022 03:43:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBTdshAXXd+sfpEZAow87phheMy+OPGT2ZFq8IhkHn2o/yE6x8ikrGKRXl5zKoXxU9Pt9pcw==
X-Received: by 2002:aa7:c6d0:0:b0:425:e9f3:10a8 with SMTP id b16-20020aa7c6d0000000b00425e9f310a8mr2769984eds.41.1651833808435;
        Fri, 06 May 2022 03:43:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id z22-20020a50f156000000b0042617ba63c3sm2115354edl.77.2022.05.06.03.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 03:43:28 -0700 (PDT)
Message-ID: <6d63ba54-fe1c-c2ec-7888-a4c5f409457c@redhat.com>
Date:   Fri, 6 May 2022 12:43:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/4] platform/x86: pmc_atom: remove unused
 pmc_atom_write()
Content-Language: en-US
To:     Paul Gortmaker <paul.gortmaker@windriver.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Aubrey Li <aubrey.li@linux.intel.com>,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>
References: <20220428062430.31010-1-paul.gortmaker@windriver.com>
 <20220428062430.31010-2-paul.gortmaker@windriver.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220428062430.31010-2-paul.gortmaker@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/28/22 08:24, Paul Gortmaker wrote:
> This function isn't used anywhere in the driver or anywhere in tree.
> So remove it.  It can always be re-added if/when a use arises.
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Aubrey Li <aubrey.li@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

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
>  drivers/platform/x86/pmc_atom.c            | 12 ------------
>  include/linux/platform_data/x86/pmc_atom.h |  1 -
>  2 files changed, 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index a40fae6edc84..31cf25d25d66 100644
> --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -223,18 +223,6 @@ int pmc_atom_read(int offset, u32 *value)
>  }
>  EXPORT_SYMBOL_GPL(pmc_atom_read);
>  
> -int pmc_atom_write(int offset, u32 value)
> -{
> -	struct pmc_dev *pmc = &pmc_device;
> -
> -	if (!pmc->init)
> -		return -ENODEV;
> -
> -	pmc_reg_write(pmc, offset, value);
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(pmc_atom_write);
> -
>  static void pmc_power_off(void)
>  {
>  	u16	pm1_cnt_port;
> diff --git a/include/linux/platform_data/x86/pmc_atom.h b/include/linux/platform_data/x86/pmc_atom.h
> index 022bcea9edec..6807839c718b 100644
> --- a/include/linux/platform_data/x86/pmc_atom.h
> +++ b/include/linux/platform_data/x86/pmc_atom.h
> @@ -144,6 +144,5 @@
>  #define	SLEEP_ENABLE		0x2000
>  
>  extern int pmc_atom_read(int offset, u32 *value);
> -extern int pmc_atom_write(int offset, u32 value);
>  
>  #endif /* PMC_ATOM_H */

