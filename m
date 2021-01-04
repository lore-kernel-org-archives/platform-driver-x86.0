Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C90C433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 14:59:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC17322286
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 14:59:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbhADO7k (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 09:59:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23195 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727030AbhADO7j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 09:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609772292;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QJMwfJFAvrkd1g03sWePLl3ntJKUDpuOi40+a2rwztw=;
        b=iuvs8UrEWH63iyvRElN4FJhAa4ucOjxHTJ407jE8bRsmHdHrKye02t5mJeeQ+OgN8pHkBb
        dcZmanF/7mAB9Fgh+mcxxQvwYMJ4SaXwD/P1D4y4Jy1MGJptNhCqK1MZKn8LnCZKZII/U3
        H6jLn26h2a8k6eVZ23H9Q5rbeF+Bkn8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-uE9gEH0VMiOdgpoCtd0HnA-1; Mon, 04 Jan 2021 09:58:11 -0500
X-MC-Unique: uE9gEH0VMiOdgpoCtd0HnA-1
Received: by mail-ed1-f72.google.com with SMTP id u18so12297989edy.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jan 2021 06:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QJMwfJFAvrkd1g03sWePLl3ntJKUDpuOi40+a2rwztw=;
        b=ITqsH3ng735eKUFAQsAgOsvrd+i38EijpgBSt/sMmDTYgB++7Ewaovd3eY3SjUABEz
         3tfua1N/b7OXIq+tgFivUkMStCLsF1uzsZny90l1Mv5LEdZM6AskTi8r9gw5BqVt2crB
         TaaRBBGlvXQNJfnfWCCvU1JWABS75h0CWsK4na5QOgBsE9tm1IFtI1lnyEpstP1QgMNb
         gv+94MzKLBs0Tma4YJdHh7MTJwYbq/zLY8YUgZTTdu3aCFJg+P2F+JdsfxzK+IlvWs52
         TxPdiJBy8I5sOYbfQzxDaZ1+NqgjV7PvgS/ejcY4O6+67qy7oh0l07H1q4j04JmJVKP3
         na6A==
X-Gm-Message-State: AOAM533zJBEoVrWHIDUeNfhh0rz91Lw4ZWufGPRkFAMALgQtcvsfUkz1
        0SBdiZu+zYDJs2wzZosDbBkY6B0DSd1xHWCsMIz1dydB6TMTMbvcFVEpS76BtwWull4qQFydRk6
        YFGK/yQFrZmBhAVG8vDsLg1THzdk+aq1f2Q==
X-Received: by 2002:a17:906:565a:: with SMTP id v26mr66717595ejr.332.1609772289714;
        Mon, 04 Jan 2021 06:58:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOJXgbLO/Xuvyh3/M7FI+z855n8R5zbh+EHvsyOy01BgA0CqtW1SLDpDV+Oyl1r0o+c9hiXg==
X-Received: by 2002:a17:906:565a:: with SMTP id v26mr66717582ejr.332.1609772289518;
        Mon, 04 Jan 2021 06:58:09 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id t15sm24176516ejx.88.2021.01.04.06.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 06:58:09 -0800 (PST)
Subject: Re: [PATCH] platform/x86: amd-pmc: Fix build issue for make ARCH=i386
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, mgross@linux.intel.com
Cc:     andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20201230081028.2615217-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1eeacf7f-aa50-1b31-7c16-0af0415ec6d0@redhat.com>
Date:   Mon, 4 Jan 2021 15:58:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201230081028.2615217-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/30/20 9:10 AM, Shyam Sundar S K wrote:
> lkp reported that CONFIG_DEBUG_FS was not defined because of wrong usage
> if macro, correcting it now.
> 
> Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

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
>  drivers/platform/x86/amd-pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 0102bf1c7916..ef8342572463 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -85,7 +85,7 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
>  	iowrite32(val, dev->regbase + reg_offset);
>  }
>  
> -#if CONFIG_DEBUG_FS
> +#ifdef CONFIG_DEBUG_FS
>  static int smu_fw_info_show(struct seq_file *s, void *unused)
>  {
>  	struct amd_pmc_dev *dev = s->private;
> 

