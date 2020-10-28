Return-Path: <SRS0=eM/Q=EE=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215CFC55179
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 02:15:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF4362076B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 02:14:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EFZBLLoF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgJ2COq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Oct 2020 22:14:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43459 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726771AbgJ1Vfh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Oct 2020 17:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603920935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QJHhfZ2V2kb0ESkGQZCAib+1qqkooRbQR95yCbytl7s=;
        b=EFZBLLoFENA5ieRplqxCSfzhUzYAHdUhuFnztpG3/I+HOaIOZvKdFBrar1dsvK/Fy8S6oW
        GmAASkgGdqgguknAhyLsQuDUeI0Qt3TIrEes2vaYCQ6Pp2hyXvcW2BWHC7pa5KNAtLC0yB
        0KHtRt9QumE53cCL/aY8Htike29JoC4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-HhcSagUWODOM78PWYNc9Lw-1; Wed, 28 Oct 2020 07:33:42 -0400
X-MC-Unique: HhcSagUWODOM78PWYNc9Lw-1
Received: by mail-ed1-f70.google.com with SMTP id w24so2004522edl.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2020 04:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QJHhfZ2V2kb0ESkGQZCAib+1qqkooRbQR95yCbytl7s=;
        b=YnzdeKWvTZ3Sx2RjwMh7dcxrZGEhKuB5uHeIBb1mPc7Mr72nPFEGJZYhcecuT3mOnW
         1XOzXr5yWW3cZF+XTZwlPGRoJYTgtoZUCVyAYUxJ8c4GY2vzBQGwT922Qytq6QZkj8L4
         W+fIHJAvbdxrZ8YWTnJeFWo+f+nCgaZdSEsdExXoOPj7l3uZWCXNVcI4Cz/Jile+eboN
         hbkHR87jxgV0/Lfvgn4RhZuqS6zSxfw7OTjwz+a4/TMI/a76515DCE7Ph/bUlyOCBI7a
         JR6xtL629aghEY6k7v/4H1T6i9JKUc4IY4y6qvHx7hb0zj5MqwbOC3uQnAyZXH8I1tlW
         yRXg==
X-Gm-Message-State: AOAM531qfAIns1VydNbImv6jGPywOCeTtTZlBBkUiim8I4MqHMpoyyZ7
        6gQw2WFO7X5BlPIubtG7PScaGXxXO7mQ31yLo4rYBLtu2o1sICxoyp0CczPyNUeX1obonQIZA4x
        jYZn8op5VtClTq8DtNZhomBDq3htJhL1yBg==
X-Received: by 2002:a17:906:402:: with SMTP id d2mr3293510eja.165.1603884820789;
        Wed, 28 Oct 2020 04:33:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIKV5nnNTcNuopRKBG+aVCqjxcweo+pTjYRN//cyr5S9Wkk3HlbZG1Mt+zdaQ2EMO5feyEGA==
X-Received: by 2002:a17:906:402:: with SMTP id d2mr3293495eja.165.1603884820534;
        Wed, 28 Oct 2020 04:33:40 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id k18sm2651040edx.54.2020.10.28.04.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 04:33:39 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: remove unneeded break
To:     trix@redhat.com, jlee@suse.com, mgross@linux.intel.com,
        malattia@linux.it
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201019133212.12671-1-trix@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <dd06e057-7ca8-972b-3d71-8e06aa68961f@redhat.com>
Date:   Wed, 28 Oct 2020 12:33:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201019133212.12671-1-trix@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/19/20 3:32 PM, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> A break is not needed if it is preceded by a return
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up there once I've pushed my local branch there,
which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/acer-wmi.c    | 1 -
>  drivers/platform/x86/sony-laptop.c | 3 ---
>  drivers/platform/x86/wmi.c         | 3 ---
>  3 files changed, 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 49f4b73be513..1c2084c74a57 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -792,7 +792,6 @@ static acpi_status AMW0_set_u32(u32 value, u32 cap)
>  		switch (quirks->brightness) {
>  		default:
>  			return ec_write(0x83, value);
> -			break;
>  		}
>  	default:
>  		return AE_ERROR;
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index e5a1b5533408..704813374922 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -2467,13 +2467,11 @@ static int __sony_nc_gfx_switch_status_get(void)
>  		 * 0: integrated GFX (stamina)
>  		 */
>  		return result & 0x1 ? SPEED : STAMINA;
> -		break;
>  	case 0x015B:
>  		/* 0: discrete GFX (speed)
>  		 * 1: integrated GFX (stamina)
>  		 */
>  		return result & 0x1 ? STAMINA : SPEED;
> -		break;
>  	case 0x0128:
>  		/* it's a more elaborated bitmask, for now:
>  		 * 2: integrated GFX (stamina)
> @@ -2482,7 +2480,6 @@ static int __sony_nc_gfx_switch_status_get(void)
>  		dprintk("GFX Status: 0x%x\n", result);
>  		return result & 0x80 ? AUTO :
>  			result & 0x02 ? STAMINA : SPEED;
> -		break;
>  	}
>  	return -EINVAL;
>  }
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index d88f388a3450..44e802f9f1b4 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -1260,13 +1260,10 @@ acpi_wmi_ec_space_handler(u32 function, acpi_physical_address address,
>  	switch (result) {
>  	case -EINVAL:
>  		return AE_BAD_PARAMETER;
> -		break;
>  	case -ENODEV:
>  		return AE_NOT_FOUND;
> -		break;
>  	case -ETIME:
>  		return AE_TIME;
> -		break;
>  	default:
>  		return AE_OK;
>  	}
> 

