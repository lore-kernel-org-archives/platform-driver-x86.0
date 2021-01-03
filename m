Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9049C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sun,  3 Jan 2021 15:34:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DE1620782
	for <platform-driver-x86@archiver.kernel.org>; Sun,  3 Jan 2021 15:34:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbhACPeW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 3 Jan 2021 10:34:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbhACPeV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 3 Jan 2021 10:34:21 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A8BC061573;
        Sun,  3 Jan 2021 07:33:41 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id a6so14921152wmc.2;
        Sun, 03 Jan 2021 07:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O7ICa8ac8XZ0cgukQ7IpzlBT35xOowy7T29HqXh6Bz4=;
        b=SnSdWnwCWkbxAa1ltHiK8xlsxSH9KsE8xp58Tn4sQwgDzUvOGmV7ixnwOeyUgASc8T
         aytFbfiNpS6GdGILR/7v8g9yiRceW416jmobVvwUVYilD93pI7l8Sfj04GYYvIPfqNIF
         rniDqx8dBbsJ19Kd7ViPBsJvwL8KVIkeAEo8DTz0ZMS6eAQxp0kqslaps20Ls4lHAEX+
         4c+OA8jotel+ItGS1bsdTIq2rod0rMg2cGKxP4DE1NOSu97LFon4fUQrZPLZNvU8q2ae
         f2LQIht3mAqSlZJco3mmD9WfkwrkCz4fU5tILtBLjboEjJehHiqiahiaoOf5wo6q5Qe+
         9ijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O7ICa8ac8XZ0cgukQ7IpzlBT35xOowy7T29HqXh6Bz4=;
        b=iczOZgFIVm7294MAL9W8qJNuI0ATeABoiriQ3918JSqmAZqNT6ON9uytQ1DEFfvs5z
         WyfYxGrK6TEitiIe/gaP+HcTJGCMz86YjO3oijw9Znfa1ocHW4izPEf9JrBLGZ6Tcgf7
         p3ucXO4bZVUEzvekq6j/e7re2744SgZOrXHZ7JZj3jAKZaY8txbsgf26vA4EmBTDOiDY
         dd4Oct4FyecVo/WYGaPeqRdBhJCQB1nV8zUxuk+Dr7zzGb4b5UPkrZvpt0pAY6UqDdPz
         Jv8L0Nq5f9L+6nih2dnjbm0QNRlDZeWbtAB2inNQxjSkLC+v3+UVB5U049g2Ihd7tAsn
         rYbg==
X-Gm-Message-State: AOAM533tM47S/R0moju981laeLGpfWF7YLngD4yZLKbD1KQUCHua7RQ7
        L30hHh1EC+7nGcsjRroQ/1NwRtvcmJs=
X-Google-Smtp-Source: ABdhPJzbkoBtea/8cv76+DoK0lhA+VzUs41XQJL7oyiIT+vzSvhWKykrijxm88LC7wDB/xMBbHAnEg==
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr24159757wml.155.1609688019585;
        Sun, 03 Jan 2021 07:33:39 -0800 (PST)
Received: from [192.168.2.202] (pd9e5a32f.dip0.t-ipconnect.de. [217.229.163.47])
        by smtp.gmail.com with ESMTPSA id x13sm88983933wrp.80.2021.01.03.07.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Jan 2021 07:33:38 -0800 (PST)
Subject: Re: [PATCH] platform/surface: mark PM functions as __maybe_unused
To:     Arnd Bergmann <arnd@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210103140429.3929810-1-arnd@kernel.org>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <14ab487e-f80e-4dea-49c1-fdbf0bd059f3@gmail.com>
Date:   Sun, 3 Jan 2021 16:33:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210103140429.3929810-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 1/3/21 3:04 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_PM is disabled, the compiler produces harmless warnings:
> 
> drivers/platform/surface/surface_gpe.c:184:12: error: unused function 'surface_gpe_suspend' [-Werror,-Wunused-function]
> static int surface_gpe_suspend(struct device *dev)
> drivers/platform/surface/surface_gpe.c:189:12: error: unused function 'surface_gpe_resume' [-Werror,-Wunused-function]
> static int surface_gpe_resume(struct device *dev)
> 
> Mark these as __maybe_unused to shut up the warning.
> 
> Fixes: 274335f1c557 ("platform/surface: Add Driver to set up lid GPEs on MS Surface device")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/platform/surface/surface_gpe.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
> index e49e5d6d5d4e..86f6991b1215 100644
> --- a/drivers/platform/surface/surface_gpe.c
> +++ b/drivers/platform/surface/surface_gpe.c
> @@ -181,12 +181,12 @@ static int surface_lid_enable_wakeup(struct device *dev, bool enable)
>   	return 0;
>   }
>   
> -static int surface_gpe_suspend(struct device *dev)
> +static int __maybe_unused surface_gpe_suspend(struct device *dev)
>   {
>   	return surface_lid_enable_wakeup(dev, true);
>   }
>   
> -static int surface_gpe_resume(struct device *dev)
> +static int __maybe_unused surface_gpe_resume(struct device *dev)
>   {
>   	return surface_lid_enable_wakeup(dev, false);
>   }
> 

Hi,

a patch doing this exact thing has already been submitted, but has yet to
be picked up:

   https://www.spinics.net/lists/platform-driver-x86/msg23888.html

Thanks,
Max
