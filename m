Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAFCC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 14:09:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AE3061078
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 14:09:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241304AbhJKOL2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Oct 2021 10:11:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28859 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242688AbhJKOJB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Oct 2021 10:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633961221;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UH7PKwF4Z5JS0smpZmGqRuXV5jdZzltefNhTAchIIIo=;
        b=NSOYfYcpkfLUjSwJHtHzNRh282H6j8rjkBRN/A7pYkQaGS+fLQ3uHPHg+72+giLwNKpGbx
        izmjbPyvvyC/6I/K+11TiaB7aVifhdF/2jbejMYQdb/YwSA+YFAXzkS2p4qHis3o26i7Ru
        InKUUgra607aIv/jHjrJnxibUdbyyeg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-FAYC42iNM0us_vnqyBIHqQ-1; Mon, 11 Oct 2021 10:07:00 -0400
X-MC-Unique: FAYC42iNM0us_vnqyBIHqQ-1
Received: by mail-ed1-f70.google.com with SMTP id h19-20020aa7de13000000b003db6ad5245bso7396595edv.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2021 07:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UH7PKwF4Z5JS0smpZmGqRuXV5jdZzltefNhTAchIIIo=;
        b=s/wss+1x3/O5DIlLIizE6MJaOqo7d9UfPv+7yySp+rn9zFAALoHaKfkUOpoYM+BKMK
         Jj3oiyMro8xrtJ+gsxqC0VU9W4kCxdT++caEXZzJpvRJ6UxdbLGQnmSO11kmSnw0WsA3
         qp1QA28pF6QiTy/5ZPKY2iiLOi/jPSyV54Ri0BNQaPICAiGJbpfwZUG4ZyNplw/G8mBx
         hLroEcFxaGAY0f9jFGEC+Fh3m22CK+Fwd1ZGB2SABgUdE5IavjTPTmOX7nOVFEnUkpM4
         3xZkqV0Z3ESoMUStQ/iEYyykF96VADBRewVSXWLe83MsI4KPZZClK1OBPQs2F7KG/jdV
         TpTw==
X-Gm-Message-State: AOAM533gqaUL55VGdUtszPGNFeWC9hCuT0qS9qbCxl8/MhA9FHpt+KN5
        cXvXgUUzI2iHgmLd2isTXG93RAMW59JpXpJ4/jiXd6kTIWLVmaHrq8gmsyPYeMZXTStlUgwKwaM
        d1mu0FO4nJbczt5hgNfbwvo7mRJnqL78cwQ==
X-Received: by 2002:a05:6402:2022:: with SMTP id ay2mr18975703edb.344.1633961218925;
        Mon, 11 Oct 2021 07:06:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEvIziUS282WT1398kwg/E8pezemjIKBXGX71W/i2GvjRMIhVNPiJun9qRkyi7Q8lJRJK9aA==
X-Received: by 2002:a05:6402:2022:: with SMTP id ay2mr18975674edb.344.1633961218743;
        Mon, 11 Oct 2021 07:06:58 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id r22sm3555173ejd.109.2021.10.11.07.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 07:06:58 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel_skl_int3472: Correct null check
To:     Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20211008224608.415949-1-djrscally@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e78eec7e-301e-8686-7768-7e62c713afdd@redhat.com>
Date:   Mon, 11 Oct 2021 16:06:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211008224608.415949-1-djrscally@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/9/21 12:46 AM, Daniel Scally wrote:
> The int3472-discrete driver can enter an error path after initialising
> int3472->clock.ena_gpio, but before it has registered the clock. This will
> cause a NULL pointer dereference, because clkdev_drop() is not null aware.
> Instead of guarding the call to skl_int3472_unregister_clock() by checking
> for .ena_gpio, check specifically for the presence of the clk_lookup, which
> will guarantee clkdev_create() has already been called.
> 
> Bug: https://bugzilla.kernel.org/show_bug.cgi?id=214453
> Fixes: 7540599a5ef1 ("platform/x86: intel_skl_int3472: Provide skl_int3472_unregister_clock()")
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

I will also include this in my upcoming pdx86-fixes pull-req for 5.15 .

Regards,

Hans


> ---
>  drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
> index 9fe0a2527e1c..e59d79c7e82f 100644
> --- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
> +++ b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
> @@ -401,7 +401,7 @@ int skl_int3472_discrete_remove(struct platform_device *pdev)
>  
>  	gpiod_remove_lookup_table(&int3472->gpios);
>  
> -	if (int3472->clock.ena_gpio)
> +	if (int3472->clock.cl)
>  		skl_int3472_unregister_clock(int3472);
>  
>  	gpiod_put(int3472->clock.ena_gpio);
> 

