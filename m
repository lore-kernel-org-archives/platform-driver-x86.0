Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03B6C63797
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Feb 2023 12:51:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbjBFMvG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Feb 2023 07:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjBFMvF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Feb 2023 07:51:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8941115C
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Feb 2023 04:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675687820;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hYEzzWsthRxTp8gijqWqv4ELdCHbswXqxLlHty5ZBP8=;
        b=J9NxtQ8T5Mlm+VnrZnFAVzUl5OWANRDURXgZ4p6/k5HuBpYTBlCyCeYI3C+7OAxQJDoHX1
        qyqXRd1zT6uz8Yx1bkIqSK+UCfXrVoCwY7MaXmGOho11cTuUF29IQs+SlEkaI3BJAjUgMV
        XaqHOOjLzBmISmyW7lIKr3hdgPfWqd0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-455-IeRA671wOZubWIQk37lDag-1; Mon, 06 Feb 2023 07:50:19 -0500
X-MC-Unique: IeRA671wOZubWIQk37lDag-1
Received: by mail-ej1-f69.google.com with SMTP id ti11-20020a170907c20b00b00886244203fcso8483601ejc.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Feb 2023 04:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hYEzzWsthRxTp8gijqWqv4ELdCHbswXqxLlHty5ZBP8=;
        b=Zbp/hfo5HTQHlw9rlOV8F+nCdEY4lfPYbCK61/5qXk96CP6OIdAE4F3H/HzDv0rXx2
         mJHTNV10Ui5WVLbDNAV8O21IDVyMCS33uONhBuw7nZgNvPMb21BXp9Sn6ee8djE7lGzw
         5NOaiSA4OM+wxMo/AK55tRrG+ZWlGDtI19LvQU64zvf0eTXJEG6BuNU7JKMG5SCDCj4Z
         qAq/QLLzxdweWEHHePkhI7YGK03qkt7/Yw+RWmYbVIreByWtZBxH/WthQb7i1h9oe69h
         l3LiopORDGRJVfkyJ5VdXM87L2lVczMRRf3uHNdLuy87/yRC+GAN8FHOEi9zRRsgnlcE
         VhAQ==
X-Gm-Message-State: AO0yUKWDdLBF0ttEEQ7kg/TNUY3Tw4pTp6P9H4iVMWiSi3yTvq/hnQSb
        Ws5oRls/9LZB67hPnv0rP23FsRc+STocl0IeH8nXDrO7lHfnn7MMTKoR+ljpZDP8H0+vrNL6h2w
        HRGJEbmOCJSG+L7YYLfLeGiKxiAdTFsVFEQ==
X-Received: by 2002:a17:906:7fd8:b0:87b:d376:b850 with SMTP id r24-20020a1709067fd800b0087bd376b850mr19930835ejs.10.1675687817986;
        Mon, 06 Feb 2023 04:50:17 -0800 (PST)
X-Google-Smtp-Source: AK7set9m1NdclbQ2IYh8xsEuFCHEV2zUtmdYpCc8PzUqMVk5WjAjaCRM3BeLbrBFejJ1eluuNxFbmw==
X-Received: by 2002:a17:906:7fd8:b0:87b:d376:b850 with SMTP id r24-20020a1709067fd800b0087bd376b850mr19930828ejs.10.1675687817816;
        Mon, 06 Feb 2023 04:50:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id hz19-20020a1709072cf300b008847d7ed37bsm5445974ejc.100.2023.02.06.04.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 04:50:17 -0800 (PST)
Message-ID: <d03d0df4-5664-e732-6fb1-ac8a7c02ae22@redhat.com>
Date:   Mon, 6 Feb 2023 13:50:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 7/7] MAINTAINERS: Add entry for TPMI driver
Content-Language: en-US, nl
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202010738.2186174-1-srinivas.pandruvada@linux.intel.com>
 <20230202010738.2186174-8-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230202010738.2186174-8-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/2/23 02:07, Srinivas Pandruvada wrote:
> Add entry for TPMI (Topology Aware Register and PM Capsule Interface)
> driver.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f61eb221415b..6f3aaa7161d6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10683,6 +10683,12 @@ S:	Maintained
>  F:	arch/x86/include/asm/intel_telemetry.h
>  F:	drivers/platform/x86/intel/telemetry/
>  
> +INTEL TPMI DRIVER
> +M:	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/intel/tpmi.c

Note this is missing:

F:      include/linux/intel_tpmi.h

I have fixed this up while merging this.

Regards,

Hans





> +
>  INTEL UNCORE FREQUENCY CONTROL
>  M:	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>  L:	platform-driver-x86@vger.kernel.org

