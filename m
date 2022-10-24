Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A48C67871
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 23:21:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbiJXXVJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 19:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbiJXXUz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 19:20:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B99CE983
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 14:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666647669;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=61ONWJblhKykTdnnWFJPLzFrI2GgQTtZLaYgVl5PSEo=;
        b=I0s90pV7UVq2bG3d6YBVefPf6d9hX1CO7T4q5YyBk+QzViUbXI1pKV0fqcmAElxVrzKUBl
        Svq5FI6f613b/y0zJOk/oA1h6PlFwhH9xEpSB6lAusXcF9lVHhfoMjk0NRXi/b68vC79Ly
        hsRqrrJEEtI+UFjBCApof+XTCzhGpXw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-yn2drGgtMl6tLDnJCfz5aw-1; Mon, 24 Oct 2022 10:06:50 -0400
X-MC-Unique: yn2drGgtMl6tLDnJCfz5aw-1
Received: by mail-ed1-f69.google.com with SMTP id e15-20020a056402190f00b00461b0576620so3692556edz.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 07:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=61ONWJblhKykTdnnWFJPLzFrI2GgQTtZLaYgVl5PSEo=;
        b=Mq7lhnT1G7DEzAmMUNk/wdI89/AWtWS39WZelW0ogQG25DBIiaTCw/7JptRstEEMLr
         ucsKoUGtiWIaB+M5+Kj7N6f8mJZHQHHSUTncovJ23CITURtJ0hoGWS184XhbIb5B+Qh5
         nASLoiEYQ4pETMcOfPThZUqWC6Yliw4mw02yLrYHOcUB5BB2AlZYa7F0RsB23iEzsxZ4
         rZauqtN8xrV2to16odSEv/oxL3JTTOGEYhSPaLHEnGZ+4rINh2d4gHlpBSyTjRJbxmlF
         53Nzj0RkYzH4A+7/LZT/ewf6QlMBIQXsscjz3QD/hoNKSx08GWRss3LRz33NpL1V5fgR
         HH4w==
X-Gm-Message-State: ACrzQf2idFfy4QeqKV7W71qeqGUr6m9m4nRe1LLAtNFJpNUike0DqrBQ
        kkiPqqsYZ82Gjk2dzXSJ4ijmI77SDoCxLgtCBMCDlYwmbgY4Gy1o/aLqLOHFt9k2/j0iMt38ZTQ
        baHFMNGyuD/ShqnU4Tmw3Qh+WOU8YVOFLTA==
X-Received: by 2002:a17:906:9b83:b0:730:b3ae:343 with SMTP id dd3-20020a1709069b8300b00730b3ae0343mr28814888ejc.670.1666620408961;
        Mon, 24 Oct 2022 07:06:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4F6Ovxer5z8nqFLbjl91mu9iIhrga9lNSTAEq2gyu682xI+X6JZNjFoK1Q7oLcdoko/lhY6A==
X-Received: by 2002:a17:906:9b83:b0:730:b3ae:343 with SMTP id dd3-20020a1709069b8300b00730b3ae0343mr28814872ejc.670.1666620408733;
        Mon, 24 Oct 2022 07:06:48 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id dn2-20020a05640222e200b00459cf672a65sm18655822edb.71.2022.10.24.07.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 07:06:48 -0700 (PDT)
Message-ID: <f98a33a7-08d6-e1fa-f00c-05b7fa96a919@redhat.com>
Date:   Mon, 24 Oct 2022 16:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] acerhdf: remove unneeded semicolon
Content-Language: en-US
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, peter@piie.net
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20221008070411.51859-1-jiapeng.chong@linux.alibaba.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221008070411.51859-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/8/22 09:04, Jiapeng Chong wrote:
> ./drivers/platform/x86/acerhdf.c:344:2-3: Unneeded semicolon.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2271
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

This patch does not apply:

[hans@x1 platform-drivers-x86]$ git am -s ~/1.eml
Applying: acerhdf: remove unneeded semicolon
error: patch failed: drivers/platform/x86/acerhdf.c:341
error: drivers/platform/x86/acerhdf.c: patch does not apply
Patch failed at 0001 acerhdf: remove unneeded semicolon
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Please make sure that you base this on the latest version of
the acerhdf code from:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next

Regards,

Hans



> ---
>  drivers/platform/x86/acerhdf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
> index 1956469c3457..6cf7f2a8a074 100644
> --- a/drivers/platform/x86/acerhdf.c
> +++ b/drivers/platform/x86/acerhdf.c
> @@ -341,7 +341,7 @@ static void acerhdf_check_param(struct thermal_zone_device *thermal)
>  		pr_err("fanoff temperature (%d) is above fanon temperature (%d), clamping to %d\n",
>  		       fanoff, fanon, fanon);
>  		fanoff = fanon;
> -	};
> +	}
>  
>  	trips[0].temperature = fanon;
>  	trips[0].hysteresis  = fanon - fanoff;

