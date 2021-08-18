Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1964EC4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 17:42:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE9DD610CB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 17:42:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhHRRnL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 13:43:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49650 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229448AbhHRRnK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 13:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629308555;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y/Xz4ptuCInA5MxEdQJyEQV4lcHnpO/kaWfVde9Blrw=;
        b=KoMgTgXXDs/HetBBRfjaqHyD/mmS66KFjESAJ86eZiMewPW1CtLjseIUa1DnjoYmQFkK+Q
        weAnI/9IIGFB3vfIDuLZFOoSE4CCxrcF9c4O+byjsLiBTYvA5XzEaK+ExnBgYQn9UzQwbt
        Z/+GbfS1WxEtD4aqQiIZfthauybXhek=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-QBGgbm6WNWmgtbBgp2slkQ-1; Wed, 18 Aug 2021 13:42:34 -0400
X-MC-Unique: QBGgbm6WNWmgtbBgp2slkQ-1
Received: by mail-ed1-f70.google.com with SMTP id b25-20020a05640202d9b02903be7281a80cso1431184edx.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 10:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y/Xz4ptuCInA5MxEdQJyEQV4lcHnpO/kaWfVde9Blrw=;
        b=jrKxmFyv5eW8oE3dq2mn6I10e4qRETedn4BTY+e4EVwWl6Yc4rYX/FVslTGYmBnk1p
         VG+A3ToF2Pu6DyJHPvYtWQXvzE1j1aeU5DpAlXrNCVQmxEFjHCko030AhWnFLAOD+MUG
         W97ckcT/c+Aaf5mbj7yH1LQlrE5IdbuFQMFpMok/oS+J8KHOlKyjx904iwcX/2hOXE3m
         M2QKe414mZxAZbzutP6yxGEaMKaJCvFY6ETVRC7FbOdVALFT5i5VRmIjB7zSdssL6bhi
         fqL/LYxvIaLKbzDHpmM6sP5Dx1yow/awKbnUGFAoG0gUJb+kut91r2VhsdKP9iCpMl35
         uGvA==
X-Gm-Message-State: AOAM530Q6Ox4UhfN2bltq6Iut91Wazc+jewCT96rLuekm4zmdtDIpewK
        PNcPsXG7cunpRWcW25w6y72O03CcFP9/wg0VtuJPpoXzEOyLWb3h07BOxDX/2w6j6FlxiFcoiDd
        i8xSJsHkLZCghN1A3gb8MJoIPtJkeFvRRWg==
X-Received: by 2002:a05:6402:30b6:: with SMTP id df22mr11078669edb.375.1629308552972;
        Wed, 18 Aug 2021 10:42:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztSK287xPsVvFI59zfcBFc5rnSLpSYWUIzKSNxsB9mU6EfAkJGxkFoVM+6uiPU/UGDYwCaeg==
X-Received: by 2002:a05:6402:30b6:: with SMTP id df22mr11078659edb.375.1629308552841;
        Wed, 18 Aug 2021 10:42:32 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ee29sm391775edb.63.2021.08.18.10.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 10:42:32 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: gigabyte-wmi: add support for B450M S2H V2
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org
References: <20210818164435.99821-1-linux@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6a5ee185-2c72-eaae-e5e6-6101b292876a@redhat.com>
Date:   Wed, 18 Aug 2021 19:42:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818164435.99821-1-linux@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/18/21 6:44 PM, Thomas Weißschuh wrote:
> Reported as working here:
> https://github.com/t-8ch/linux-gigabyte-wmi-driver/issues/1#issuecomment-901207693
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note I had to apply this manual since the for-next branch already
had your patch to add support for the "B550 AORUS ELITE V2" and this
patch was based on an older version of gigabyte-wmi.c without this so
the context did not match.

I've also added this to the fixes branch so that it will be
included in the next (and last) fixes-pullreq to Linus for 5.14 .

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/x86/gigabyte-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> index 5529d7b0abea..a2beaea18d2f 100644
> --- a/drivers/platform/x86/gigabyte-wmi.c
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -140,6 +140,7 @@ static u8 gigabyte_wmi_detect_sensor_usability(struct wmi_device *wdev)
>  	}}
>  
>  static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
> +	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M S2H V2"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 GAMING X V2"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M AORUS PRO-P"),
> 
> base-commit: 009c9aa5be652675a06d5211e1640e02bbb1c33d
> 

