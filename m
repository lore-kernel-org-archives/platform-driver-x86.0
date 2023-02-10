Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAE6C05027
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Feb 2023 16:16:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbjBJQQ6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Feb 2023 11:16:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjBJQQ5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2023 11:16:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63D9643E0
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 08:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676045768;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XicZZaHKYiFxVDJoxrajqH9cjcclHt3r5xKv9x112Ig=;
        b=EBKLttjagbYWw/qquweRj7AGDoU98gYBnHnKpenKB56bhNjLb4tnPWMm3JL0oViyiuoDoy
        w/6/UHvDg/R6zuQW22WnCCpjH80TOXrXnYd61s35JaQ0vZU57vOoE+paoOoFJaLr6lkGM5
        caRgFU+Ff3aejrT2+IQoP+zh3liDZ88=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-th0AenCHPOC3PCyMwTueBA-1; Fri, 10 Feb 2023 11:16:07 -0500
X-MC-Unique: th0AenCHPOC3PCyMwTueBA-1
Received: by mail-ej1-f71.google.com with SMTP id fy3-20020a1709069f0300b008a69400909fso3859586ejc.7
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 08:16:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XicZZaHKYiFxVDJoxrajqH9cjcclHt3r5xKv9x112Ig=;
        b=pJUOnLQCKWCmiYqLE7acdkHgrsQ1Q9al1+zWCCaGgATunGHNHlNZo8R3AvV8zwmI4p
         RIoQv9Nghf+PmgHr+k29ktPG38BlJA7aMiz4sgtFBh5JCA13G/nDpH1vwmv3YlNXQ8aL
         BF9T9mtN7d9XvfwMWOaQEnU6F0F8Ul3nN2MK+dnEdnhPbzqffyURrNAWpwsyFopsAte0
         JTlb21wIFVprdVNGmx20MSOF2fEkGMmFlKH/jv4N6R533lEsgDkxChrNqWqLFi5f7MGl
         lnmdMG5iWqrLuUCQVJW2wzBHgovIO7mR0TucXIf3a9ayi7riONhZHn/FwYpbo2aVkXk2
         x/IQ==
X-Gm-Message-State: AO0yUKUtJXGB2CwdCr+gZBWcAzmZhQ9M/U2yQiLHBs4LlG/C8+0pBIL7
        V3K7xHjYTlaFaLVaAKKlUBxutBC5MnofQ1PdbZ7OJ57AsXakG29G6OT0AqV3ZmTXz2rTapxFNZI
        pAKqM1rcd/COJEeGYn52BtQxsc6s2t7tlTLxYEt8=
X-Received: by 2002:a17:906:6b08:b0:887:8f6:c1d7 with SMTP id q8-20020a1709066b0800b0088708f6c1d7mr15842703ejr.38.1676045765551;
        Fri, 10 Feb 2023 08:16:05 -0800 (PST)
X-Google-Smtp-Source: AK7set9EFJLiV03HZKytK34nIYfzlrZI+4a21JtGCaNebyCEsD8o90112AQwAiLygjujR89MXKnBJw==
X-Received: by 2002:a17:906:6b08:b0:887:8f6:c1d7 with SMTP id q8-20020a1709066b0800b0088708f6c1d7mr15842681ejr.38.1676045765414;
        Fri, 10 Feb 2023 08:16:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f26-20020a170906825a00b0084c4b87aa18sm2561668ejx.37.2023.02.10.08.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 08:16:05 -0800 (PST)
Message-ID: <2e959ac0-e33a-6128-4fb7-6d86fbb6f69a@redhat.com>
Date:   Fri, 10 Feb 2023 17:16:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 1/1] platform/x86: Add include/linux/platform_data/x86
 to MAINTAINERS
Content-Language: en-US, nl
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20230206150202.27892-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230206150202.27892-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/6/23 16:02, Andy Shevchenko wrote:
> Most of the files there are being used under PDx86 subsystem or
> tightly related drivers (like drivers/clk/x86/). I think it makes
> sense to assure that PDx86 keeps an eye on the changes there.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

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
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4329d6611c20..705ffd15afbe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22598,6 +22598,7 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
>  F:	drivers/platform/olpc/
>  F:	drivers/platform/x86/
> +F:	include/linux/platform_data/x86/
>  
>  X86 PLATFORM DRIVERS - ARCH
>  R:	Darren Hart <dvhart@infradead.org>

