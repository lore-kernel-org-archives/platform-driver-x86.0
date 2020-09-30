Return-Path: <SRS0=fgui=DH=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035D4C4727E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Sep 2020 13:21:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B730420759
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Sep 2020 13:21:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MNS8Vrhu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgI3NVo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:21:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30144 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728043AbgI3NVn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Sep 2020 09:21:43 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601472102;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SIUeHCg4ObFBTzNeRmXqLyzNztGL/qF7cJVPSEqtDtU=;
        b=MNS8VrhupTXTS6k6tNJBPti4J2m9K5ZSOw8fI8FywWylc2Eqse4Ytctm2aAY1ViDkvJe8T
        Iyk1FfS7kqrCjknjSbk4uNyxzO54O/UqVNkb4i6+iMPyt2O4CgeIsjWx449AWpUdCKA78Z
        /ZWUN+DOIrENWr5t8AOWtY+rCalQswY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-5uF39hNoO5SaqbB6qa3uIg-1; Wed, 30 Sep 2020 09:21:32 -0400
X-MC-Unique: 5uF39hNoO5SaqbB6qa3uIg-1
Received: by mail-ed1-f72.google.com with SMTP id c26so565535edj.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2020 06:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SIUeHCg4ObFBTzNeRmXqLyzNztGL/qF7cJVPSEqtDtU=;
        b=P3Oh9I0kdqmZMRwBeM6qnXwKBeLzcKu2KTRSB09gqbH9MUegLDolu6lT3dE8hWRtRS
         ftdS9F99ET75i8/T/qQ9Yoj03C8lFmm2s85R/Wg3oAWdmKirBVGOCJjA28mO76Vs5Ny0
         QuxVIPsCMmzuzTYAHFY3pkzj7Bdv1JdOHhklQWtSxp0Yb8JSvCsppFpAqnB4WSTjsk3r
         ICKSyupvgrTrxvpWqI/Gg8JQTSapVrNe7Gn3wPQh1cdEwjOE++vnMZZ2D9HvbH5dCofO
         8cB/+d4kN3oT6UJkxNcvwH5i9e7Ezqpinzv7wY9Z/q8GTXCd34T8JabGfTLi/VkgeNTo
         njCA==
X-Gm-Message-State: AOAM532YtXWQMO+PIfTHUYB1pxc4JCzCF0MEg146NgXREj/XZ3EHew4N
        kAbyN/UHTOZMnFYF8C59KSeqexAhvjBIEzP3AYmndDr/DGjXWHCp/pxaGo7eITWQMAdDRM6mVn3
        kaFwhhLiKijUc5LE/0zahRR7TTLpZpbThvA==
X-Received: by 2002:a17:906:d9c3:: with SMTP id qk3mr2738278ejb.207.1601472090482;
        Wed, 30 Sep 2020 06:21:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU0z5x3UIZ7XSqZzFVFHBydKV2JxTLnRCowJqy0RsogsLlCJfIjc8uzEUjl4oT2cTC5M0WFA==
X-Received: by 2002:a17:906:d9c3:: with SMTP id qk3mr2738260ejb.207.1601472090294;
        Wed, 30 Sep 2020 06:21:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id m10sm1537087edf.11.2020.09.30.06.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 06:21:26 -0700 (PDT)
Subject: Re: Keyboard regression by intel-vbtn
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <s5hft71klxl.wl-tiwai@suse.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <036dbbe8-dbf9-76c6-d8f7-9761bee58a8f@redhat.com>
Date:   Wed, 30 Sep 2020 15:21:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hft71klxl.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/29/20 10:48 AM, Takashi Iwai wrote:
> Hi Hans,
> 
> it seems that the recent update of intel-vtn broke the keyboard input
> on some laptops with libinput:
>    https://bugzilla.opensuse.org/show_bug.cgi?id=1175599
> 
> Blacklisting intel-vtn fixes the issue, so it's likely the falsely
> reported tablet mode switch that leads libinput misbehaving.  The
> affected machines are Acer E5-511 and ASUS X756UX laptops, and they
> shouldn't have the tablet mode at all, AFAIK.
> 
> Could you take a look?  I guess it's the commit cfae58ed681c that
> broke.  The chassis type is Notebook on those, and this type should be
> excluded as well as Laptop.
> 
> The dmidecode outputs and other info are found in the bugzilla above:
>    https://bugzilla.opensuse.org/attachment.cgi?id=841999
>    https://bugzilla.opensuse.org/attachment.cgi?id=842039
> 
> The one for ASUS is embedded in hwinfo outpt:
>    https://bugzilla.opensuse.org/attachment.cgi?id=841157

Ok, you should have just received a patch fixing this, sorry
that creating it took a bit longer then I had hoped.

Andy, can you drop the:

"platform/x86: intel-vbtn: Fix SW_TABLET_MODE always reporting 1 on the HP Pavilion 11 x360"

Patch from your review-andy branch, plug in the new one and
then send it out to Linus for merging into 5.9 please ?

Regards,

Hans

