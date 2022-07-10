Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350C3C43334
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Jul 2022 15:38:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiGJPiX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 10 Jul 2022 11:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiGJPiW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Jul 2022 11:38:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 014F811C36
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 08:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657467501;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A0UK9IefudPOqjj1mwuHU78WebTdymMB10ytRpbgqeo=;
        b=iNdd1Q6nxIXZ7jm9U8k+PEW1+UFt1xwp9BiFJE2OQ/HV1Fq86Y2evp4tQeIuIxLp87P+5T
        f5MjDAI7rzlMx1Yz8gmax+pwyZm73EmgHTalGiaSyMcJofzhE2W52LK2pVibcGq+EtHe00
        myFB3lLHogYwf+2yZDeItqTeAYAaffU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-tZdwk7ulObK0N_eyZET8ZA-1; Sun, 10 Jul 2022 11:38:19 -0400
X-MC-Unique: tZdwk7ulObK0N_eyZET8ZA-1
Received: by mail-ed1-f71.google.com with SMTP id z20-20020a05640240d400b0043a82d9d65fso2687821edb.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 08:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=A0UK9IefudPOqjj1mwuHU78WebTdymMB10ytRpbgqeo=;
        b=wOV8B92jzf/BAWucZ/NLmBMjgBojbVVFKPl5GyTyi5HHvNux5HBRXHCOgXBcI3fHv1
         G716v3HEx09OI8QgRRmRuoOtiWKhsyM9yKCJg1Gs7e4qNetnZNWyHShrPsO+abtZpJAt
         pPzJ6kk945KtrmZg5HD0a24LKCyrlmCh1y0JKL1s5uYH7IYbUgjAGR0XLTAMy6bMl5Bv
         XnPnyaf6vHW6Xay06uWluxewu2R+8ga47lhawymsLlSlcdKRXOoqkuoAL88x7kgle0IZ
         k42cM4ilVBtP7/9AEPdFpjtJ4z6O9EzUbzKUbCFOg5BmtvaNKlDQCy3R+3rwyZODkFkD
         p8ig==
X-Gm-Message-State: AJIora/xEh6QHL5kD9ofwcSBBNO30w4zx5kYt7s2T7CzCjPnBuVazKmL
        5Rr/I1rXM/aFzlIE2ajZF/7VvpO3s9GzpX9KXVVHdYk26BSpNxrHxRGWjh+mzM8qj7+YAVBtygh
        1c9XWNq2tOJVEASEVS6vlchj/JFhEndiLSw==
X-Received: by 2002:a17:907:75d7:b0:72b:307d:fb60 with SMTP id jl23-20020a17090775d700b0072b307dfb60mr11328814ejc.22.1657467498503;
        Sun, 10 Jul 2022 08:38:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tL4URgQEAU6IOetOO60jlBmRbR6/XGB+pWg3b4P/nXSwjkWgkmbkl+2SfsEF2plVM1RHwVmQ==
X-Received: by 2002:a17:907:75d7:b0:72b:307d:fb60 with SMTP id jl23-20020a17090775d700b0072b307dfb60mr11328793ejc.22.1657467498298;
        Sun, 10 Jul 2022 08:38:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id pv20-20020a170907209400b0072b3464c043sm1664695ejb.116.2022.07.10.08.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jul 2022 08:38:17 -0700 (PDT)
Message-ID: <d35aed19-31a3-6d89-d8c0-4161cec790ad@redhat.com>
Date:   Sun, 10 Jul 2022 17:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86/intel/ifs: Mark as BROKEN
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Jithu Joseph <jithu.joseph@intel.com>,
        Ashok Raj <ashok.raj@intel.com>,
        Tony Luck <tony.luck@intel.com>
References: <20220710140736.6492-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220710140736.6492-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/10/22 16:07, Hans de Goede wrote:
> A recent suggested change to the IFS code has shown that the userspace
> API needs a bit more work, see:
> https://lore.kernel.org/platform-driver-x86/20220708151938.986530-1-jithu.joseph@intel.com/
> 
> Mark it as BROKEN before 5.19 ships, to give ourselves one more
> kernel-devel cycle to get the userspace API right.
> 
> Link: https://lore.kernel.org/platform-driver-x86/20220708151938.986530-1-jithu.joseph@intel.com/
> Cc: Jithu Joseph <jithu.joseph@intel.com>
> Cc: Ashok Raj <ashok.raj@intel.com>
> Cc: Tony Luck <tony.luck@intel.com>
> Suggested-by: Greg KH <gregkh@linuxfoundation.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/intel/ifs/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/ifs/Kconfig b/drivers/platform/x86/intel/ifs/Kconfig
> index 7ce896434b8f..c341a27cc1a3 100644
> --- a/drivers/platform/x86/intel/ifs/Kconfig
> +++ b/drivers/platform/x86/intel/ifs/Kconfig
> @@ -1,6 +1,9 @@
>  config INTEL_IFS
>  	tristate "Intel In Field Scan"
>  	depends on X86 && CPU_SUP_INTEL && 64BIT && SMP
> +	# Discussion on the list has shown that the sysfs API needs a bit
> +	# more work, mark this as broken for now
> +	depends on BROKEN
>  	select INTEL_IFS_DEVICE
>  	help
>  	  Enable support for the In Field Scan capability in select

