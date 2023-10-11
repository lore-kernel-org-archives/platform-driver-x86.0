Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B4DCD6E53
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Oct 2023 09:23:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbjJKJXX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Oct 2023 05:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbjJKJXV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Oct 2023 05:23:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BB691
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Oct 2023 02:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697016153;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RxJHJUn63z3IJzWto9lPYxX7e40eR/pdovecj6uC/Z4=;
        b=A+mGje8gYJKdV/I+xBeAUtMvEYM+n0ZQzg2bxk/V9fABJodlD0RiSUNd9EBVG9WqECvi6/
        e+IQ4UFR6d+W1R2b7O1fDNaKqBiU4hX9pUG3uOLvWMhDIGrGo/EBxJ68GS6fi0EJ+T2Xfr
        0tvVFt4sQyzY4zE8RomA6JD8S2KnRBE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-TaJgdYmMPPKeUF7ZI3DGDQ-1; Wed, 11 Oct 2023 05:22:32 -0400
X-MC-Unique: TaJgdYmMPPKeUF7ZI3DGDQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-99c8bbc902eso531239766b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Oct 2023 02:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697016151; x=1697620951;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RxJHJUn63z3IJzWto9lPYxX7e40eR/pdovecj6uC/Z4=;
        b=dMZmNlkF0Eefborevcq7HpLg+vjKEBOVqvzgIEzIgP3LHVL8yy4iSsLRsUmKT4b7VL
         /2uCVXdaT4IXtLACYp3ljjVNjQv6n2Fu/JpYCj5tqCGk7SlEIYfMzXU/wBPEniFVxtBa
         A7cU7vSgO4cko+vU70gS+fwIHvLpsNUNAzp6/zRO+ydgwjGRnJAD0vLdDyenw53kuym4
         /v4Uh7d7aFqLRCvjD5jxtsSL0eFB1mPFLx2tVbQyrwNag/U8aRSi0AXEYZcEFBl8iZKG
         a8yTuf8Maq/5ansqYvBs6+pfKphF3nrZ4Sj64iGo7WhKQrl69hW12/jF0f0kSF06tArY
         2bvw==
X-Gm-Message-State: AOJu0YwwLKhGFYh6xjrKU3Ffiub4Wf52igQtF1DPSSKfuopPQMixwWiS
        XErN8BNehAlBTuNovx55T8gveY308XsLWgtMmyZ7qEvAKD8al7Vusx1Cigw6/Rsa5T+LP6thzX+
        rmJBJrzneZ8jI7SbG3XX75JW90y3H/pZALXJM6wVn+g==
X-Received: by 2002:a17:906:c801:b0:9ae:961a:de7f with SMTP id cx1-20020a170906c80100b009ae961ade7fmr15216406ejb.30.1697016151079;
        Wed, 11 Oct 2023 02:22:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR5dViA7KavRhQo3Fw/3LFpOgpqXA/54ymk49+EWv6Q+AyuXhX1odfLM/vG0zRW69lAgdA3Q==
X-Received: by 2002:a17:906:c801:b0:9ae:961a:de7f with SMTP id cx1-20020a170906c80100b009ae961ade7fmr15216394ejb.30.1697016150742;
        Wed, 11 Oct 2023 02:22:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h16-20020a17090619d000b00997e99a662bsm9472611ejd.20.2023.10.11.02.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 02:22:30 -0700 (PDT)
Message-ID: <b3b6044e-c614-3709-64cf-81edf000764d@redhat.com>
Date:   Wed, 11 Oct 2023 11:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] platform/x86: msi-ec: Fix the 3rd config
Content-Language: en-US, nl
To:     Nikita Kravets <teackot@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
References: <20231006175352.1753017-3-teackot@gmail.com>
 <20231006175352.1753017-5-teackot@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231006175352.1753017-5-teackot@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/6/23 19:53, Nikita Kravets wrote:
> Fix the charge control address of CONF3 and remove an incorrect firmware
> version which turned out to be a BIOS firmware and not an EC firmware.
> 
> Fixes: 392cacf2aa10 ("platform/x86: Add new msi-ec driver")
> Cc: Aakash Singh <mail@singhaakash.dev>
> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
> Signed-off-by: Nikita Kravets <teackot@gmail.com>

Thank you for your patch/series, I've applied this patch
(series) to the pdx86 fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in the pdx86 fixes branch once I've pushed
my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
>  drivers/platform/x86/msi-ec.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
> index f26a3121092f..492eb383ee7a 100644
> --- a/drivers/platform/x86/msi-ec.c
> +++ b/drivers/platform/x86/msi-ec.c
> @@ -276,14 +276,13 @@ static struct msi_ec_conf CONF2 __initdata = {
>  
>  static const char * const ALLOWED_FW_3[] __initconst = {
>  	"1592EMS1.111",
> -	"E1592IMS.10C",
>  	NULL
>  };
>  
>  static struct msi_ec_conf CONF3 __initdata = {
>  	.allowed_fw = ALLOWED_FW_3,
>  	.charge_control = {
> -		.address      = 0xef,
> +		.address      = 0xd7,
>  		.offset_start = 0x8a,
>  		.offset_end   = 0x80,
>  		.range_min    = 0x8a,

