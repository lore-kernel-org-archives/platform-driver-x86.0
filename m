Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292DEC4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 10:30:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbiKGKaD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 05:30:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbiKGK37 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 05:29:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 079C112ACF
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 02:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667816939;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0GKRHeT/hSkShGots+moeceaSZrmk8mLFZWP8W+tQNo=;
        b=cW143k5Lt5CfSlbRCkJcaNqE3WYASitFKDdgEsb2cmCRgr05qmMhVxUxIysJ3w9SFNeR9N
        yV4B7WDzWpOXeGN5jT6XH4YNIx2uAObHWICkdFXCdM9zco9meu2DB8CekP2R6LQgttoLKR
        6mbvOpTRdEhFHvvTYgA+4mvaJGPo/ms=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-519-Wnz48HV8Puu1bSh1hsCOww-1; Mon, 07 Nov 2022 05:28:54 -0500
X-MC-Unique: Wnz48HV8Puu1bSh1hsCOww-1
Received: by mail-ed1-f69.google.com with SMTP id z15-20020a05640240cf00b00461b253c220so7958040edb.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Nov 2022 02:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0GKRHeT/hSkShGots+moeceaSZrmk8mLFZWP8W+tQNo=;
        b=JVIFRW6OPprPN0EWX2fTMuvJjkDkhJZ6m5z8DGrwlf6GSr77RTLlE8MT8MjZ+IWw94
         XgvCvib9shNND6/82Wr4ID15Ectg+X+d9zBztxjN4cEEkPr89jsTD+IJElOPD7qIx18W
         jpTBzWvg+ENnDGJvTMHG/3oBQu0Gh6yfK0l1lY3nUg6ALHBR1rnoNqmEpemki5opLegV
         MgUDSy9MlqQGQ6LQJkQ/cm1yFlafcMg/Wog5DQXTgbRhALcHPbbc/Ly5y0riN7wwYWkq
         +cOmdHp+8qK3OFHBwOLdH0565DaYbHF//o23z3+Z2U2Gpr3Ek9cJwnlFKZEoS6NYjsRR
         JnKA==
X-Gm-Message-State: ACrzQf0sfaojBKIN0KyTuoOkK+eF3PMAuU0Ly6jMKn97fkfK/sSKI2Ph
        r6Xd9P5sFUArs5zpZYiqx4bVF61/T77M5oUmrCHFc+HUHqZi8D8+S6c9q7hkX8iEEmfjmVrBUEF
        7GkGo54YhM3mVotIruKvXY4tK/mo91C/qUA==
X-Received: by 2002:a17:906:bceb:b0:7ae:75e:3929 with SMTP id op11-20020a170906bceb00b007ae075e3929mr25890149ejb.400.1667816932918;
        Mon, 07 Nov 2022 02:28:52 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6cN9WxsTv8pDFQdgYI7Us38X7mQ64h/3sPONJKcXBuo3KkIoh7qRxk071npAzvQZTZn50WCA==
X-Received: by 2002:a17:906:bceb:b0:7ae:75e:3929 with SMTP id op11-20020a170906bceb00b007ae075e3929mr25890136ejb.400.1667816932718;
        Mon, 07 Nov 2022 02:28:52 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id k18-20020a05640212d200b0044ef2ac2650sm3922664edx.90.2022.11.07.02.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 02:28:52 -0800 (PST)
Message-ID: <0910bcc4-d55f-6f3a-b2df-4e30d164aeeb@redhat.com>
Date:   Mon, 7 Nov 2022 11:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/1] platform/x86/amd: Fix pmc compile dependency errors.
Content-Language: en-US
To:     Yupeng Li <liyupeng@zbhlos.com>, Shyam-sundar.S-k@amd.com,
        markgross@kernel.org,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        caizp2008@163.com
References: <20221026072531.346013-1-liyupeng@zbhlos.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221026072531.346013-1-liyupeng@zbhlos.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/26/22 09:25, Yupeng Li wrote:
> When disabled CONFIG_SUSPEND and CONFIG_DEBUG_FS, get_metrics_table
> and amd_pmc_idlemask_read is defined under two conditions of this,
> pmc build with implicit declaration of function error.Some build error
> messages are as follows:
> 
>  CC [M]  drivers/platform/x86/amd/pmc.o
> drivers/platform/x86/amd/pmc.c: In function ‘smu_fw_info_show’:
> drivers/platform/x86/amd/pmc.c:436:6: error: implicit declaration of function ‘get_metrics_table’ [-Werror=implicit-function-declaration]
>   436 |  if (get_metrics_table(dev, &table))
>       |      ^~~~~~~~~~~~~~~~~
> drivers/platform/x86/amd/pmc.c: In function ‘amd_pmc_idlemask_show’:
> drivers/platform/x86/amd/pmc.c:508:8: error: implicit declaration of function ‘amd_pmc_idlemask_read’; did you mean ‘amd_pmc_idlemask_show’? [-Werror=implicit-function-declaration]
>   508 |   rc = amd_pmc_idlemask_read(dev, NULL, s);
>       |        ^~~~~~~~~~~~~~~~~~~~~
>       |        amd_pmc_idlemask_show
> cc1: some warnings being treated as errors
> 
> Signed-off-by: Yupeng Li <liyupeng@zbhlos.com>
> Reviewed-by: Caicai <caizp2008@163.com>

Thank you for your patch, however I do not believe that this is the correct fix:

> ---
>  drivers/platform/x86/amd/pmc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index ce859b300712..2b08039921b8 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -433,8 +433,10 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
>  	struct smu_metrics table;
>  	int idx;
>  
> +#if defined(CONFIG_SUSPEND) || defined(CONFIG_DEBUG_FS)
>  	if (get_metrics_table(dev, &table))
>  		return -EINVAL;
> +#endif
>  
>  	seq_puts(s, "\n=== SMU Statistics ===\n");
>  	seq_printf(s, "Table Version: %d\n", table.table_version);

The table variable gets used here, but now it no longer has been initialized by
get_metrics_table() so just #ifdef-ing out the get_metrics_table() call is wrong.

> @@ -503,11 +505,12 @@ static int amd_pmc_idlemask_show(struct seq_file *s, void *unused)
>  		if (rc)
>  			return rc;
>  	}
> -
>  	if (dev->major > 56 || (dev->major >= 55 && dev->minor >= 37)) {
> +#if defined(CONFIG_SUSPEND) || defined(CONFIG_DEBUG_FS)
>  		rc = amd_pmc_idlemask_read(dev, NULL, s);
>  		if (rc)
>  			return rc;
> +#endif
>  	} else {
>  		seq_puts(s, "Unsupported SMU version for Idlemask\n");
>  	}

Same thing except now nothing gets send to the struct seq_file *s,
so this is wrong too.

Shyam / Mario, can you take a look at the reported compile errors please?

Regards,

Hans

