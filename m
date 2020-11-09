Return-Path: <SRS0=xf+z=EP=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A548C388F7
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 13:37:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FD6A20867
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 13:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TNYgpL8i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730887AbgKINhf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Nov 2020 08:37:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28264 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731924AbgKINhe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Nov 2020 08:37:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604929053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Vo+cO/LNGoPT1bsa0vhqVm/6CFvb1OA4fjV8AjbaH64=;
        b=TNYgpL8ihqBnejk5Dovpku9SmO72rb8ArrAoaHdBhZ6Zrd8hoRXPcP3yNNhVDMrlg+bCTK
        99VpBPswyjlgceWvtdeqp6BCHSpCk6ZRfNo/Z5DuYIZWgzz9Y6XRsHUn/qW1lHBHd/1GTu
        48Q/FTgt2l1WQlVg8jSXaVGC3dvEgfg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-dJQbXSqXP0qF_-ynH-LGpA-1; Mon, 09 Nov 2020 08:37:31 -0500
X-MC-Unique: dJQbXSqXP0qF_-ynH-LGpA-1
Received: by mail-ed1-f71.google.com with SMTP id bc27so2700691edb.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2020 05:37:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vo+cO/LNGoPT1bsa0vhqVm/6CFvb1OA4fjV8AjbaH64=;
        b=etccmcP0tyJ2UeRWMQNbvTFJ2HiRf56qBrxQLMldDwbgEUgjT31XaCHxQOUdJm3/ag
         8nyEFbeFFy5AmHc/GrjN8Mm/mB6C75emtqyfkj076FTW4o4ouxVhfF1dSF4lcSFyMAVO
         jmrvYK/J4CHjKFDVjCFwUgu0ZlAwcC+VQbVxBl2iE1Eon4OMmj7m1f3LT0S7mA1pMbHi
         G7FVXk15ISQwFZguggdzuE572PKlYknzm4aGPwwN9PVbRAeOvksnNLVm7cjuSgnjn8Er
         HKFgg5IFEnIiWwePNg9zmEG+jnmVWuhI/W/vJ4Ns0tOrvGi1q1FBQo5Qn+PqTmWSWoWw
         yG2Q==
X-Gm-Message-State: AOAM530OTwKyiPbgGdFG6doo1robFfQEX62Y/Se1iG0sF8ayXprN7phR
        EPcIsi2jA1cWmqkOQvzT+sv1idUqjOOP+IHcef86nJHAxW0xcRU/cuPqmmHTXY42Ct94iiyB4XB
        +Q/yQukniKkVeP2fgONOlxkoBsO8SaudNKw==
X-Received: by 2002:a05:6402:141:: with SMTP id s1mr14869280edu.87.1604929050157;
        Mon, 09 Nov 2020 05:37:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuQ6FsIO36mhFnvxPw7RhYbSoCdxR7tjK6DBJFPoceOlCj5Tl6mBAK5aRnLvzv5GT7qzlxPw==
X-Received: by 2002:a05:6402:141:: with SMTP id s1mr14869256edu.87.1604929049864;
        Mon, 09 Nov 2020 05:37:29 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id a10sm8889799edn.77.2020.11.09.05.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 05:37:29 -0800 (PST)
Subject: Re: [PATCH] thinkpad_acpi: add P1 gen3 second fan support
To:     Iakov 'Jake' Kirilenko <jake.kirilenko@gmail.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc:     Mark Gross <mgross@linux.intel.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201105152556.34073-1-jake.kirilenko@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1b5ec9ac-a587-2b6e-83da-f3b3c18efd43@redhat.com>
Date:   Mon, 9 Nov 2020 14:37:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201105152556.34073-1-jake.kirilenko@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/5/20 4:25 PM, Iakov 'Jake' Kirilenko wrote:
> Tested on my P1 gen3, works fine with `thinkfan`. Since thinkpad_acpi fan
> control is off by default, it is safe to add 2nd fan control for brave
> overclockers
> 
> Signed-off-by: Iakov 'Jake' Kirilenko <jake.kirilenko@gmail.com>

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
>  drivers/platform/x86/thinkpad_acpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index e38106750..4d64ba291 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8776,6 +8776,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2CTL),	/* P52 / P72 */
>  	TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (1st gen) */
>  	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (2nd gen) */
> +	TPACPI_Q_LNV3('N', '2', 'V', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (3nd gen) */
>  };
>  
>  static int __init fan_init(struct ibm_init_struct *iibm)
> 

