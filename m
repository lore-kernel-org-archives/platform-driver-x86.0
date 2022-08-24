Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B3BC00140
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Aug 2022 08:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234714AbiHXIe7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Aug 2022 04:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232621AbiHXIe6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Aug 2022 04:34:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B588B64
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 01:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661330094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c2YjHPNEqJ97hNe22A70HWZchzw/Ihbel7Q8/JZMSGs=;
        b=SJ0vggj/SWJKEkzXhLGc/2FgdIqhjO9SaZja/3b2/ALbCloJ83X1aXRQlceBwG589YkwbO
        qtuFaUlVvFklMaEd/VAAiWn25hGMwI5Sed0ZZRfLb5V4T6fSd+KO7kNvpnncC2rhtG4/VM
        Rn/8MFpLP3G9UMD4dv0DyVudbFroptI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-aFz1yc4sObWeAESewE5Izg-1; Wed, 24 Aug 2022 04:34:52 -0400
X-MC-Unique: aFz1yc4sObWeAESewE5Izg-1
Received: by mail-ed1-f69.google.com with SMTP id v14-20020a056402348e00b00446946ba703so6422331edc.23
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 01:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=c2YjHPNEqJ97hNe22A70HWZchzw/Ihbel7Q8/JZMSGs=;
        b=8PAtzyErprJuScbxaHZCRytLFtPrq7g+1CI/0yUViqvuL9UW2ESJB5+coq+3eRwtY3
         QSIwAvJ0VXzI2gxNmknuz0RH/cMqZi4VcbcEMu4ROFw3i8/m3bx8nJiOe80+FejJygIz
         0X5B+tD1fT+LtuDXwIQMQulPQfIokcTyzuTSPExo1eQ9TihKr9Y4kTYegHHH0iS5P111
         1r373WJeKdiauiqv4spR+2NvBjAvuRPKfCxX92kIHAF9FdOs43n/H81R2ZGH8tNR8Pfi
         keevVnSk2BKWG7QVZqzoqxvqUE6Ouvil82ArpfuUNeDevoQ+M3bV2cuJIqYPSq6Z6C8Z
         xSAQ==
X-Gm-Message-State: ACgBeo2UjqDkVBiUEA614F+X+Cite9nlZDLTwEEG5IdIyTfAzf2bk+0c
        IbPnzG+mopQQdeaKS8Jb1VGD4ntmUezFlNuEyqssbAhz9BWKcFWEKl7koLQxvjgchdDg7EmNWv2
        VCWnMQizUL75ucO60w2Pj/NqyQnBU8GM66w==
X-Received: by 2002:a17:906:98d5:b0:73d:538a:cb88 with SMTP id zd21-20020a17090698d500b0073d538acb88mr2275706ejb.422.1661330091858;
        Wed, 24 Aug 2022 01:34:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4+H1xJniJrCnDzCEYf3+ETQ/s/9p9kk2yZS0rPG+6yXnYtX1hxb0UH9mmyFNovLjZh9CZk6A==
X-Received: by 2002:a17:906:98d5:b0:73d:538a:cb88 with SMTP id zd21-20020a17090698d500b0073d538acb88mr2275695ejb.422.1661330091610;
        Wed, 24 Aug 2022 01:34:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id f20-20020a50fe14000000b00446b9a3189asm2700937edt.19.2022.08.24.01.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 01:34:50 -0700 (PDT)
Message-ID: <a62923eb-1220-4503-7c1a-9632877843b8@redhat.com>
Date:   Wed, 24 Aug 2022 10:34:50 +0200
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

p.s.

I had to manual fixup the commit message because of the use of "---"
here, this is a so called cut line normally used for remarks at
the end of the commit msg which are to be disregarded when applying
the patch.

So this use causes the commit message to end here (without e.g.
your S-o-b). I just noticed you've done the same for quoting
the clang warnings in the other patch.

In the future please dont't use "---" in the middle of
the commit message.

Thanks & Regards,

Hans



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

