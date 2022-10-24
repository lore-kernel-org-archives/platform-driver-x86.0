Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C96CC67871
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 20:12:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbiJXUMW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 16:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232746AbiJXUMB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 16:12:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4135E7EFE9
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 11:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666636147;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y5YZaxL1oMnz09mWsUSZRYvvuUIE5nQnPiEikkuSV6Y=;
        b=HPN8kMxMnZIT5DZ/SfN7CrIgLNT4HbfZdSPU7q/YWKpxMaJyPROfMNBfEH9Gj2XKVaSpCs
        gEYA8agmHgwrgKBW6PPrh9YSu9laieK3i+8KR0HBJkQOOCrHI2cH3f8DszDDYTTHzVGd4b
        SbY7H20uVyUDyj3jGU3WJN4d/es4rUU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-550-IJcA6ogwOqum3gQiPxheuQ-1; Mon, 24 Oct 2022 09:58:11 -0400
X-MC-Unique: IJcA6ogwOqum3gQiPxheuQ-1
Received: by mail-ed1-f69.google.com with SMTP id y14-20020a056402270e00b0045d1baf4951so9824553edd.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 06:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5YZaxL1oMnz09mWsUSZRYvvuUIE5nQnPiEikkuSV6Y=;
        b=chsOOCBS6bpstzVpzBAuJzvssEAsT7J6xg88ILmH9ElpF0/rmAC39BoUa0ZfUPV/Ii
         3jys991FZZO/rWxTHd3AEwN9ujaHMZyn6kFNN2/mIqZSXYMAQKL976QS3hhSokpdBlHE
         l9+Mrp6+8p5nHxvtridyWpdbFzoLj7MjnXN/GmDgOPMCCKhcj5EyfN/6I5kyaj69WK+K
         irv+Tc9nBwXn7aO+bI/RRw4IR2P+NPd+R1LGC0LdYnzNd7fh8koDe8cdNAWT3ZKLhnKU
         S51tjfCbog9UF5HakUhCR2KQbRxjD2M4Fb4RJnGRb8uz+hxUwLajZuMjCopVx0mqpFlw
         dyug==
X-Gm-Message-State: ACrzQf0EPu77z67X3ayLz9TY4sWh9zNas+DgySILyuu6sfENE7tPmZC1
        1XmrBLUOo3v6kzBD0Gr5WcsESoC96oU21ZKgPGLiQXTpFtiDzpWSNKtZYm2h8BWpW/ZlLDB5YqO
        v7RJktXLPrH2etIK2JbuU+Qu6zn77y0Vb7A==
X-Received: by 2002:a17:907:9710:b0:791:8aa6:18bb with SMTP id jg16-20020a170907971000b007918aa618bbmr27159487ejc.279.1666619890259;
        Mon, 24 Oct 2022 06:58:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6M86ueEZcPTUi2KLtqWd0TWYCio4RjiOdeK3EtdOkwJ9Duagj1VkJ9BPCMyVc0lYQxG5fT9Q==
X-Received: by 2002:a17:907:9710:b0:791:8aa6:18bb with SMTP id jg16-20020a170907971000b007918aa618bbmr27159477ejc.279.1666619890041;
        Mon, 24 Oct 2022 06:58:10 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id de13-20020a1709069bcd00b0078d957e65b6sm15541991ejc.23.2022.10.24.06.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:58:09 -0700 (PDT)
Message-ID: <6c47276e-cbca-dcde-6a8a-721f34c0755e@redhat.com>
Date:   Mon, 24 Oct 2022 15:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1 1/3] platform/x86: huawei-wmi: do not hard-code sizes
Content-Language: en-US
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <markgross@kernel.org>,
        Ayman Bagabas <ayman.bagabas@gmail.com>
References: <20221005150032.173198-1-pobrn@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221005150032.173198-1-pobrn@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/5/22 17:00, Barnabás Pőcze wrote:
> Use `sizeof()` and `ARRAY_SIZE()` instead of
> hard-coding buffer sizes and indices.
> 
> Signed-off-by: Barnabás Pőcze <pobrn@protonmail.com>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
>  drivers/platform/x86/huawei-wmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
> index eac3e6b4ea11..66b53b90188f 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -323,12 +323,12 @@ static int huawei_wmi_battery_get(int *start, int *end)
>  	u8 ret[0x100];
>  	int err, i;
> 
> -	err = huawei_wmi_cmd(BATTERY_THRESH_GET, ret, 0x100);
> +	err = huawei_wmi_cmd(BATTERY_THRESH_GET, ret, sizeof(ret));
>  	if (err)
>  		return err;
> 
>  	/* Find the last two non-zero values. Return status is ignored. */
> -	i = 0xff;
> +	i = ARRAY_SIZE(ret) - 1;
>  	do {
>  		if (start)
>  			*start = ret[i-1];
> --
> 2.38.0
> 
> 

