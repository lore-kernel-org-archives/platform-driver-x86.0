Return-Path: <SRS0=a5Ee=EJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AE3C388F2
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 09:36:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C64A5206E3
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 09:36:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yiz1Afl9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgKCJge (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Nov 2020 04:36:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45241 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727787AbgKCJga (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 04:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604396189;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ETTAgVG1ue4Hn6DuCHm7ujjeEAEZk7xspJhHoihfwFo=;
        b=Yiz1Afl9TvXPe0NT6+Rq52gGS+fUbGvvTDDAMiNO1+ielnKmJJbFIf0faDm3m3Z85v9be8
        2FhaRRmdP6ofYj0xvSLdu1Ebsej1HGNS2fde75b1ng1oU3yx34QyxtiAOBs2LVb3pJl386
        VQbh7SfidcRyNEG9OujzjfIwv9G+Ov4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-IjcneJfnPTC1gM-elm5QTw-1; Tue, 03 Nov 2020 04:36:26 -0500
X-MC-Unique: IjcneJfnPTC1gM-elm5QTw-1
Received: by mail-ed1-f70.google.com with SMTP id a73so7274826edf.16
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2020 01:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ETTAgVG1ue4Hn6DuCHm7ujjeEAEZk7xspJhHoihfwFo=;
        b=HGRG78VhM9weTq6tV/wL8dTc//FBHYWa0UMhQA0V70LL4Uf1mXNP8YMhuD+mzWCC6Q
         RE+n+F7ypbO7Nft3H6b1iLL12cFHxNKT0IneABVRl9rqFY0bs35nLQ5PxlUz65U4chCf
         V3J0Z7OUizcOupdG55iSIQCbLAwXTdbIXS+vAAFvWX705PVXyb/I3tSETkafz0PF4jwF
         mrnYxM+7c6VvIsAe8tuEJWyF9jhZ2/xIEPbz9HDJDuq/jdJQzNht72OuDrng+pKY49QR
         zyqglSsoh1p1J1szXw23zne0QgpSybV2fwPa7BXoGY3EELVYVBh1BMCEt7BgiomEDOGM
         2VBg==
X-Gm-Message-State: AOAM531vpxmyMG2s3IqsfSOaVbBk+PQ+yRVzQ2x9LKXruBPjHtinPhpL
        tRHAVMDgJu6eAtHGJeK7zrb3khsllasW5qnjbOC99blEtg0XVErm+5Y3cE/2+cxQidBaeS7GK8u
        IdE1pKHLLbF3W+W+Rs2eUjimMt3skLUm49g==
X-Received: by 2002:a17:906:d92c:: with SMTP id rn12mr16568671ejb.472.1604396185066;
        Tue, 03 Nov 2020 01:36:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBSoNawWfzPpeT7Pyu8XcjSdVANFSV5OBWs3ZaxTseppPFq/1qvXaKhi0Q2vqPFyIODCPx3Q==
X-Received: by 2002:a17:906:d92c:: with SMTP id rn12mr16568663ejb.472.1604396184921;
        Tue, 03 Nov 2020 01:36:24 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id d24sm11534047edq.34.2020.11.03.01.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 01:36:24 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: rectify DELL WMI SYSMAN DRIVERS section
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Mario Limonciello <mario.limonciello@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>,
        Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201029114425.22520-1-lukas.bulwahn@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a3fe61e9-c126-2d38-6ca1-accbcdea91ad@redhat.com>
Date:   Tue, 3 Nov 2020 10:36:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201029114425.22520-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/29/20 12:44 PM, Lukas Bulwahn wrote:
> Commit e8a60aa7404b ("platform/x86: Introduce support for Systems
> Management Driver over WMI for Dell Systems") added a new section
> DELL WMI SYSMAN DRIVERS in MAINTAINERS, but slipped in a typo.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    drivers/platform/x86/dell-wmi-syman/*
> 
> Point the file entry to the right location and add an entry for its
> Documentation while at it.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

This time with content, sorry for the empty mail.

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
> Divya, please ack.
> 
> Hans, please pick this minor non-urgent patch into your -next x86 platform
> driver tree on top of commit mentioned above.
> 
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b8a905354ee9..a0a86daa9c51 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4974,7 +4974,8 @@ M:	Mario Limonciello <mario.limonciello@dell.com>
>  M:	Prasanth Ksr <prasanth.ksr@dell.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/x86/dell-wmi-syman/*
> +F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
> +F:	drivers/platform/x86/dell-wmi-sysman/
>  
>  DELL WMI NOTIFICATIONS DRIVER
>  M:	Matthew Garrett <mjg59@srcf.ucam.org>
> 

