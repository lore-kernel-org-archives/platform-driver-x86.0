Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95E9C2B9F8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 12:46:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8FDC6141D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 12:46:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232721AbhEYMro (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 May 2021 08:47:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51116 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232353AbhEYMrh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 May 2021 08:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621946767;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BAsSn0QqqS827pEDp2tUmlZZNLwNBxRbKX1OInU2lIM=;
        b=Y1C3Js3MVc6gBf82pWGNt0iQsh10gpABJ3zE9SrEtBtFu317TRF+3syR4GiQb5IfmB+4Rn
        kRCLpqdNdXRaK3mBaKW3KsO75eSDfvlZ6MNxucSThE6DSExeR5Iw0lPBSLSKboCOzIIzil
        BA3jOcpomNmmE5wHR0iazmKw0E7IhzE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-h49Uj7VBN9WVZ0lrvKmqAg-1; Tue, 25 May 2021 08:46:06 -0400
X-MC-Unique: h49Uj7VBN9WVZ0lrvKmqAg-1
Received: by mail-ed1-f71.google.com with SMTP id m6-20020aa7c4860000b029038d4e973878so13053029edq.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 May 2021 05:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BAsSn0QqqS827pEDp2tUmlZZNLwNBxRbKX1OInU2lIM=;
        b=c5QyJwyU6y6fqZl0oGmnqFLJfejWvjFMr9M2lMOLWsYdu9VTZxJ9zE4+dvw0K8swAZ
         eID4ShFvnI9mxQXtZcuiwEzuBiXX/e/ugEzCeF+dfD3VL+EmYMgT+sdZVtvkXtfNjGW4
         G92reeYuS+oQPLawVEPKkPYsHnE8B4HT54LVkRwdjZkCEbPHF4hunbl+Ru6wnyneCpp8
         wRNDvTZJr6MJrrUbE3TkZtb14o3NIdun6XxQCms1CJY4EH2nEE9MAF37AxZat9mjGnGD
         nSXjRZIy9D+L6u16Yr56W1Qc4TLbS+9ybNABBKgMfLY8k/mEt+zXXU4gxpM2Dx7SJPmS
         MWaw==
X-Gm-Message-State: AOAM5334D4XG3rQIG8b+zaU37TxggjLbmPnAnNwnrHilWncCtW7KlXjy
        XDe/DEqTzoDbl51oXMs7ZzjMIcUxBcY6e2Q+yJwS5bIDkv6373g+V/7t1+2QDvjC/5DdzK//PrA
        yS7VnHEHakIAzfIl1dNJVlAyKEeTv8ck7aw==
X-Received: by 2002:a17:906:914d:: with SMTP id y13mr28396474ejw.489.1621946764868;
        Tue, 25 May 2021 05:46:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC24QkEUJbBUYm9nsAY/iT6F2AsbeP/cQgBHwWHXbl0ufK8TwUkYxJZeJhUNBBg0OZ4UCYgw==
X-Received: by 2002:a17:906:914d:: with SMTP id y13mr28396455ejw.489.1621946764680;
        Tue, 25 May 2021 05:46:04 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q18sm10517988edd.3.2021.05.25.05.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 05:46:04 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Fix inconsistent
 indenting
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, hmh@hmh.eng.br
Cc:     mgross@linux.intel.com, jdelvare@suse.com, linux@roeck-us.net,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
References: <1621837438-70790-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <86bee518-cf29-f1b1-c1fc-b939f418be84@redhat.com>
Date:   Tue, 25 May 2021 14:46:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1621837438-70790-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/24/21 8:23 AM, Jiapeng Chong wrote:
> Eliminate the follow smatch warning:
> 
> drivers/platform/x86/thinkpad_acpi.c:7942 volume_write() warn:
> inconsistent indenting.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

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
> Changes in v2:
>   -For the follow advice: https://lore.kernel.org/patchwork/patch/1434215/
> 
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index dd60c93..b7fec1b 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -7938,7 +7938,7 @@ static int volume_write(char *buf)
>  				continue;
>  			} else if (sscanf(cmd, "level %u", &l) == 1 &&
>  				   l >= 0 && l <= TP_EC_VOLUME_MAX) {
> -					new_level = l;
> +				new_level = l;
>  				continue;
>  			}
>  		}
> 

