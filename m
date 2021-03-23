Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0926C433DB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 20:01:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B0A2619C1
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 20:01:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbhCWUBN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Mar 2021 16:01:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57259 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233110AbhCWUAy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Mar 2021 16:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616529653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bNZnjO42gjVhs5dIrJp7IOz6pVwoWDKxlsrX2l5lccI=;
        b=KPqOAFv8t1C3h9dtSSiIrStMzdLTNDLYzpkbnJeTLZKhFf8ugDYQ7rSpsPYJI4vfyUl4Au
        N01owu4FSIJ5G0e3TH5b+1s6NI59eNu4P/9E6IDfVUZakI5g/EqEF08q8icdVL1uIZkBc6
        MkuwW/Cw13kaVyk1E2+bEz1iaqKrsa8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-Bf8urpbQOY6CwEsQbKItGA-1; Tue, 23 Mar 2021 16:00:45 -0400
X-MC-Unique: Bf8urpbQOY6CwEsQbKItGA-1
Received: by mail-ej1-f70.google.com with SMTP id e7so1556207ejx.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Mar 2021 13:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bNZnjO42gjVhs5dIrJp7IOz6pVwoWDKxlsrX2l5lccI=;
        b=efqqWjU7MuaoE8xWg47BunDtwo01hdDXYH1yGk2hxWD38S84508VzxyjNrJyoIK0Vi
         hH2mTBgDJx+RS8RrMNTBRWUGOGfhaSjSWg0ZmSW5vReE3yjXV/yQTFz3OAnbr2oaeeBl
         NIMdNAhCT2Gnh8EJhv/9nisYmGDN8456+ch7X+Vd9dhMn+WEnK68vDse8N20jpigd+cs
         XIlJq5Z3SlThmi77Q56EU+NQ50svU1HX7gomrgdfZODBmEUoidMYhZM0Q48j/cCxIIIv
         Fharuu3CFnjBP9nX48F50M7OMP9y66KzUh557uwDCD4BPjcbYsV791t8LmYuGbOo3csU
         D4ag==
X-Gm-Message-State: AOAM531QirWyZnl1dD9nh8oO+GcNNXTm7mldZIyiTQZWYceQ/CDrcX/O
        cW3Cg9KO01KucHVIGuKRv+zK28pZV7luwyYuHsxLdMMSqsXC29+5t291ZXmcPnGFGJZg8LgaMec
        f27bcII7b6nhKYxvHRhCa8NGxcM8Ub+HAKw==
X-Received: by 2002:a05:6402:4407:: with SMTP id y7mr6211381eda.247.1616529644283;
        Tue, 23 Mar 2021 13:00:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh2ay7mE48Qtx5mN3z/Kd46hbrymSoqNAOGINWQybomqJrcMyzc0xZMTC0DqTMcMpgPmXOOA==
X-Received: by 2002:a05:6402:4407:: with SMTP id y7mr6211358eda.247.1616529644103;
        Tue, 23 Mar 2021 13:00:44 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f21sm11620875ejw.124.2021.03.23.13.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 13:00:43 -0700 (PDT)
Subject: Re: [PATCH] asus-laptop: fix kobj_to_dev.cocci warnings
To:     Julia Lawall <julia.lawall@inria.fr>,
        Corentin Chary <corentin.chary@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        acpi4asus-user@lists.sourceforge.net
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kbuild-all@lists.01.org, Denis Efremov <efremov@linux.com>
References: <alpine.DEB.2.22.394.2103171258010.2981@hadrien>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6e2b729c-11c7-cdf9-18cc-8d3aa988e134@redhat.com>
Date:   Tue, 23 Mar 2021 21:00:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2103171258010.2981@hadrien>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/17/21 1:00 PM, Julia Lawall wrote:
> From: kernel test robot <lkp@intel.com>
> 
> Use kobj_to_dev() instead of container_of()
> 
> Generated by: scripts/coccinelle/api/kobj_to_dev.cocci
> 
> CC: Denis Efremov <efremov@linux.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Julia Lawall <julia.lawall@inria.fr>

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
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   1df27313f50a57497c1faeb6a6ae4ca939c85a7d
> commit: a2fc3718bc22e85378085568ecc5765fb28cabce coccinelle: api: add kobj_to_dev.cocci script
> :::::: branch date: 5 hours ago
> :::::: commit date: 7 months ago
> 
>  asus-laptop.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -1569,7 +1569,7 @@ static umode_t asus_sysfs_is_visible(str
>  				    struct attribute *attr,
>  				    int idx)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct asus_laptop *asus = dev_get_drvdata(dev);
>  	acpi_handle handle = asus->handle;
>  	bool supported;
> 

