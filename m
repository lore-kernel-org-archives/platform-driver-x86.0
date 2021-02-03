Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAE6C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 11:02:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C55764F5F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 11:02:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233740AbhBCLCP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 06:02:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38613 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233971AbhBCLCA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 06:02:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612350033;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hQg0sdLNM2xYsUdmnJn7mPJoZ7uFdvAkPAibxzjlOr4=;
        b=WNrBzZ1YC+0OGvIu5d8HoBHT6J7+PL8OM+fFIiWl2tELvlxsexUtwVl5D65Cun8xhEYWnl
        nJ1ZnC9UmUHfTl+/arSAgBh0Pd0d8PWCGDrRfQ/Xdu+bfEkgn/0wsuNgSVxY2rQJlrGGZJ
        HAyqnBpcGO4ZE0qziipzwGj58PATfdI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-OwXc19u0OHOC-AMAjfWsog-1; Wed, 03 Feb 2021 06:00:31 -0500
X-MC-Unique: OwXc19u0OHOC-AMAjfWsog-1
Received: by mail-ed1-f70.google.com with SMTP id y6so11240393edc.17
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Feb 2021 03:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hQg0sdLNM2xYsUdmnJn7mPJoZ7uFdvAkPAibxzjlOr4=;
        b=kz3PcYGr2HRbEqwKPQimVosXzieNtFxGfeps0IrUp/QI7Xhih5nh+al8M3Qt3Uvc+T
         0ZgxIitE0haJSU6Zm7xeV1ACpafqxWxlKf0RjT5DNfn3H8qmKVz8TRK3u8GDwgsAHsDL
         KHW0qaBnv2ovqF5rFw1lfUOxJIDDFJlmGxMMdCsXmV9EmSdz7n/wYxZ0ITkBAwklUWHq
         +6z31W/viVk22d72C6FWqsbw1Km8CDh4hjq1rS13eHTq+s9BROe9mYEjQgu6ux6DOUBJ
         FMmk4/TTh6LikHS0AJZ3EHoMv19k1IOvdWoXB3w4kLKaY5f8vMf1zqsijgL5Lz7/v5Ul
         isKg==
X-Gm-Message-State: AOAM533BX2gBCxaZjrB5HVJItxUehFR/r+rw5O7J5E6UfovfT7bui2lz
        wQrXJ1V9zduN3Q7Xs/1RIj2U5A4r3FEszp/a6IH+xAgzmYIrAvfF2TxKSY1CkuuWu1ZMptEytlB
        TYIrA941wkIyqmI/4crRj05O9JySWgnLQPQ==
X-Received: by 2002:aa7:dd16:: with SMTP id i22mr2276987edv.215.1612350030571;
        Wed, 03 Feb 2021 03:00:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxD0l2Sp1vPosJtV46JVBfBeZ0Qn3cmoMemJtsZ1Tpnpbn4n/FzLpKq80zvyNgceIdXHL4zCQ==
X-Received: by 2002:aa7:dd16:: with SMTP id i22mr2276963edv.215.1612350030287;
        Wed, 03 Feb 2021 03:00:30 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id lo26sm825014ejb.106.2021.02.03.03.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 03:00:29 -0800 (PST)
Subject: Re: [PATCH] platform/surface: aggregator: Fix braces in if condition
 with unlikely() macro
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Mark Gross <mgross@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-kernel@vger.kernel.org
References: <20210126172202.1428367-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <81c1f69c-30ba-d01f-002f-41da5cb670aa@redhat.com>
Date:   Wed, 3 Feb 2021 12:00:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126172202.1428367-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/26/21 6:22 PM, Maximilian Luz wrote:
> The braces of the unlikely() macro inside the if condition only cover
> the subtraction part, not the whole statement. This causes the result of
> the subtraction to be converted to zero or one. While that still works
> in this context, it causes static analysis tools to complain (and is
> just plain wrong).
> 
> Fix the bracket placement and, while at it, simplify the if-condition.
> Also add a comment to the if-condition explaining what we expect the
> result to be and what happens on the failure path, as it seems to have
> caused a bit of confusion.
> 
> This commit should not cause any difference in behavior or generated
> code.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: c167b9c7e3d6 ("platform/surface: Add Surface Aggregator subsystem")
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

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
>  .../surface/aggregator/ssh_packet_layer.c     | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/aggregator/ssh_packet_layer.c b/drivers/platform/surface/aggregator/ssh_packet_layer.c
> index 74f0faaa2b27..583315db8b02 100644
> --- a/drivers/platform/surface/aggregator/ssh_packet_layer.c
> +++ b/drivers/platform/surface/aggregator/ssh_packet_layer.c
> @@ -1694,7 +1694,24 @@ static size_t ssh_ptl_rx_eval(struct ssh_ptl *ptl, struct ssam_span *source)
>  	/* Find SYN. */
>  	syn_found = sshp_find_syn(source, &aligned);
>  
> -	if (unlikely(aligned.ptr - source->ptr) > 0) {
> +	if (unlikely(aligned.ptr != source->ptr)) {
> +		/*
> +		 * We expect aligned.ptr == source->ptr. If this is not the
> +		 * case, then aligned.ptr > source->ptr and we've encountered
> +		 * some unexpected data where we'd expect the start of a new
> +		 * message (i.e. the SYN sequence).
> +		 *
> +		 * This can happen when a CRC check for the previous message
> +		 * failed and we start actively searching for the next one
> +		 * (via the call to sshp_find_syn() above), or the first bytes
> +		 * of a message got dropped or corrupted.
> +		 *
> +		 * In any case, we issue a warning, send a NAK to the EC to
> +		 * request re-transmission of any data we haven't acknowledged
> +		 * yet, and finally, skip everything up to the next SYN
> +		 * sequence.
> +		 */
> +
>  		ptl_warn(ptl, "rx: parser: invalid start of frame, skipping\n");
>  
>  		/*
> 

