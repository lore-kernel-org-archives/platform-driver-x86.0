Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D4A8C3F6B0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Aug 2022 08:31:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235517AbiHXIbP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Aug 2022 04:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235413AbiHXIbO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Aug 2022 04:31:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC903341A
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661329872;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gkcw+raXG40JC4+fnlfmJ7yhtm1NTIAu1/bHUuMASf4=;
        b=OgKoecffEYr8OTcIwmSIeiOOf8fe3czg5VL891LRz1LuOrJQu2S6bRUvLBtnp/eFt71yCB
        rH1LoIMJtJdCzCjCzvfQ+yRcNj1a/+GgFAr3/0iw/CH+o6RP6UsMEMIBPXwd+IR8OjC+m3
        sFr719kYvEGEPuocdWLPvpJesdP6gso=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-oitVahZTM4-amy5VJn6tiw-1; Wed, 24 Aug 2022 04:31:11 -0400
X-MC-Unique: oitVahZTM4-amy5VJn6tiw-1
Received: by mail-ed1-f69.google.com with SMTP id x3-20020a05640226c300b00446ad76aeb5so5703227edd.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 01:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=gkcw+raXG40JC4+fnlfmJ7yhtm1NTIAu1/bHUuMASf4=;
        b=hZkhV+lsisSQcI5btv3oKksgfgqAXKFSxL7QSViMe+k4IzNyaUGmmcLzWDAMFdvqxe
         zlqu1gXDzWzRqss7mW5um+MaD0ODx+llt7iAN7em/80Fmc3iv0Rw6uEYzDlStAIfgn8C
         wC/4tje9pNy0ZSPaAN7GbwE0IwE5nH+6HD9h+3vqb3GStKzQ2aRVmAWRSkJnAUV7SFiN
         jKL73XnZ+HecmOzUDD+3Uzp+S/L/QDHT5xHC/qEfnlsftYQ5lbjiWtq5qEqeb4dZlspR
         Joqtd4Q0kX3HID6AONcdf17B2ICyIeaWlj8iK0j3dWFUkh1t21g9N3WQGOJeRfjKV/Hg
         Reqw==
X-Gm-Message-State: ACgBeo3sC04nSJKLj0Jmb+vO6S9gX3euX3BNlhrB16610shisy4cWMs9
        kS87HwbIc/kZTHyvkaA6hos4eVDLJTLzykHY6ME1EvgAb/Cyr9/ANQYKS/BQ8Iq6o3zAdSgEUce
        /bt8yBxmyj8Io96TwR0A0DFgILWDY2bwpww==
X-Received: by 2002:a05:6402:5201:b0:446:cfe7:9f0c with SMTP id s1-20020a056402520100b00446cfe79f0cmr6714311edd.16.1661329869925;
        Wed, 24 Aug 2022 01:31:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7rEpk45RXiU7EgFEY0cqHAkKlPqyXH+r1K1cgiRS3THgX+nTuG+p5si5uwDWJrHAkF5YBkCQ==
X-Received: by 2002:a05:6402:5201:b0:446:cfe7:9f0c with SMTP id s1-20020a056402520100b00446cfe79f0cmr6714303edd.16.1661329869771;
        Wed, 24 Aug 2022 01:31:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id k21-20020aa7d2d5000000b0043bd2a79311sm2710310edr.37.2022.08.24.01.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 01:31:09 -0700 (PDT)
Message-ID: <5bfa3c78-4700-eea2-5e59-9474c7be74fb@redhat.com>
Date:   Wed, 24 Aug 2022 10:31:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] platform/x86/amd/pmf: Fix undefined reference to
 platform_profile
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        Randy Dunlap <rdunlap@infradead.org>
References: <20220819083858.3987590-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220819083858.3987590-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/19/22 10:38, Shyam Sundar S K wrote:
> Its reported that amd-pmf driver when built with config which does not
> have ACPI_PLATFORM_PROFILE set/enabled throws a undefined references to
> symbols used.
> 
> ---
> ld: vmlinux.o: in function `amd_pmf_init_sps':
> /work/lnx/next/linux-next-20220818/X64/../drivers/platform/x86/amd/pmf/sps.c:132: undefined reference to `platform_profile_register'
> ld: vmlinux.o: in function `amd_pmf_deinit_sps':
> /work/lnx/next/linux-next-20220818/X64/../drivers/platform/x86/amd/pmf/sps.c:142: undefined reference to `platform_profile_remove'
> ---
> 
> Fix it by adding a "select" to the Kconfig.
> 
> Fixes: da5ce22df5fe ("platform/x86/amd/pmf: Add support for PMF core layer")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thank you for your patch, I've applied this patch to
the platform-drivers-x86-amd-pmf branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=platform-drivers-x86-amd-pmf

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
> 
> Based on "review-hans" branch.
> 
>  drivers/platform/x86/amd/pmf/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index e65ffa52229b..c375498c4071 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -6,6 +6,7 @@
>  config AMD_PMF
>  	tristate "AMD Platform Management Framework"
>  	depends on ACPI && PCI
> +	select ACPI_PLATFORM_PROFILE
>  	help
>  	  This driver provides support for the AMD Platform Management Framework.
>  	  The goal is to enhance end user experience by making AMD PCs smarter,

