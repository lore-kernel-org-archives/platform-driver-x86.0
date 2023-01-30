Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC77EC54EED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 15:37:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbjA3PhJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 10:37:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235814AbjA3PhG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 10:37:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE7D3E392
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 07:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675092984;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RBmhX41BoXlyvE9x/O8OKKatZjRg7MheACF8SvOJv6k=;
        b=ULb5JfzMcW2q90CVRIy5pnc7SmP9c20ygvhS4j5PPDPmczphP1VzEQs828UWGQk24agcyH
        jpn/gURXC4xG/nK2IS23ScNHPLkHKSorFDcJLuHluOW0LKMGWMU3ImMkKhfxFTuc7wLBcO
        A2kL5d1FWG9wBVxtgeQ5Wh+CobkfGDE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-567-N7RHSA_7PRWjqJ5D49exfA-1; Mon, 30 Jan 2023 10:36:21 -0500
X-MC-Unique: N7RHSA_7PRWjqJ5D49exfA-1
Received: by mail-ej1-f69.google.com with SMTP id bj15-20020a170906b04f00b0088ac85a6fc1so913731ejb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 07:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBmhX41BoXlyvE9x/O8OKKatZjRg7MheACF8SvOJv6k=;
        b=Zi0v1aflUgVCHXmi5wS+IhGW1SAUc4VW7BR1DDF6+N4clPBRGXHFPgMC6VEK/HE6iI
         Inz4LTT0t+EtsEz0vlblyJpteTBCaMsiHU+gpaowBBRjKiK7vGufcX1u4Q+RlhjJqX9M
         spm/PuOQ6dMCrw0CdgCqmKO5Ga5GYlubY6Aqf9+6cUYN8GfPQCph1O2m9br78/q086pa
         Qjr4qrAtvchpPrMh018BkWgOGVczHTqBWchhY5X/e31EtMtEa+59YonPptGmigSb44V4
         zWl3CZndynetz/2S0TXRkYLXJwqp0zjGiZQpHzkSlZwh62Gm6OOHKzqBQmZRhdsAK/DT
         bbUw==
X-Gm-Message-State: AO0yUKXWa7TM+a1t+NAGLXM+Q/vLzUqfl5SiggvwI5hPrFAWuY+U4ipD
        7HSL+fvo0RaUeBmWtYGCma9LzjZM3RfkYsPGdou2YeznQRb4nJ01SCdCAAgPcHGJW0OsZLIi/I6
        GiUtlHzFf8qiSz3l+Zebrqriga/hl6rXTcA==
X-Received: by 2002:a17:906:4a59:b0:886:ec6e:4c1 with SMTP id a25-20020a1709064a5900b00886ec6e04c1mr6454892ejv.59.1675092980080;
        Mon, 30 Jan 2023 07:36:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+iwFqcC78NFurgo3bhkb5NPKHsAOZddnvdfeU+KEBISZuuSpVuTjQaU3Y4xTKUT0U0sl7I8g==
X-Received: by 2002:a17:906:4a59:b0:886:ec6e:4c1 with SMTP id a25-20020a1709064a5900b00886ec6e04c1mr6454876ejv.59.1675092979905;
        Mon, 30 Jan 2023 07:36:19 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id b14-20020a1709062b4e00b00880d9530761sm4417556ejg.209.2023.01.30.07.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 07:36:19 -0800 (PST)
Message-ID: <506d3a5d-45f3-3c2c-ad2e-b6609814dc5c@redhat.com>
Date:   Mon, 30 Jan 2023 16:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: dell-smo8800: Use min_t() for comparison
 and assignment
Content-Language: en-US
To:     Deepak R Varma <drv@mailo.com>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Saurabh Singh Sengar <ssengar@microsoft.com>,
        Praveen Kumar <kumarpraveen@linux.microsoft.com>
References: <Y9P8debIztOZXazW@ubun2204.myguest.virtualbox.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y9P8debIztOZXazW@ubun2204.myguest.virtualbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/27/23 17:31, Deepak R Varma wrote:
> Simplify code by using min_t helper macro for logical evaluation
> and value assignment. Use the _t variant of min macro since the
> variable types are not same.
> This issue is identified by coccicheck using the minmax.cocci file.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>

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
>  drivers/platform/x86/dell/dell-smo8800.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
> index 3385e852104c..8d6b7a83cf24 100644
> --- a/drivers/platform/x86/dell/dell-smo8800.c
> +++ b/drivers/platform/x86/dell/dell-smo8800.c
> @@ -67,10 +67,7 @@ static ssize_t smo8800_misc_read(struct file *file, char __user *buf,
>  
>  	retval = 1;
>  
> -	if (data < 255)
> -		byte_data = data;
> -	else
> -		byte_data = 255;
> +	byte_data = min_t(u32, data, 255);
>  
>  	if (put_user(byte_data, buf))
>  		retval = -EFAULT;

