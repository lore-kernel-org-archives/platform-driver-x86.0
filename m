Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0A6C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Jun 2022 11:30:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244949AbiFJLaA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Jun 2022 07:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243688AbiFJL37 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jun 2022 07:29:59 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418DB1D5
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 04:29:57 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id p10so36117131wrg.12
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 04:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5i8d1CARYwyZjzbfDJrhdl9Iz5KPK+C+6+wRDbPE9e8=;
        b=KnschyVBqMFVPwzHQcxiJ5oDAq0t4tLNA2s/5XExfMu9e+4yLGk5yOmKg2v3P7dIRi
         PYSUK8ym5mGemccWhA3bBlZKADhDR8vuJzZtVdVhqLcy5Y5JFS2fAuKbvVK8l9xsZ2/9
         CtAZ866ff4bFeHLgVMB9cUGm6IYSXD/f7P2F4jvohsg0aERimeDcxWlrxRVU67JMKMy9
         /F69ZS6pDx0lgI61L1HIdEn1fjWeHFlkyKMOvTtJic+X6J2rBWYmgeu/A2SHpwd4d94t
         k73F6BmVJ1n+SXduJeVf4iec78SaUX0D1/gQbUhoE2/JZLGLps74o23yWoYa8y/bTpYR
         6ukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5i8d1CARYwyZjzbfDJrhdl9Iz5KPK+C+6+wRDbPE9e8=;
        b=wkvxln5au+jfbplgB62PTuzNLcj8ueR+z04SqTjEeLKrK3Id38b2yLKkDBUEc3xJlk
         H9wFgy4QeYQhOhzPoY2g4kEs3DDqJv2wcTG35Sb8aTfSREzMAVB1zbQKOkkGgud9pyuX
         E+V6w257dXERf7NjcdbSjtPi/qBJBTBt4AUh3vpJ1sQCASK0ZEa6vPHapPya9iKZaPzZ
         U8DnE9dk3VWZ+LfbB7RXCT7yvzMeGlFIoTdbQqqTJ9/9vbE4bV1q1mIMzy9QztnAcL5k
         pz0J9LrQCRuyUSDy/KKjb/8h9omh119zvtGd9LVC1o2liDhcngjwoDNb5mTsAfUsYYP2
         mBOQ==
X-Gm-Message-State: AOAM532SxSi1pVearEExdSI9FVFunrSX2u/maL7v1LiV4njUIoS4gDsy
        1OTUDHdU19hyiqp68oDJidk=
X-Google-Smtp-Source: ABdhPJydWVK102zJ6tMi4e6zQS3tkqs99TbMNf6GLaPiuHlJzyJBnARS2UNdf2RA0bJ/c/yU/tUaCQ==
X-Received: by 2002:adf:fb82:0:b0:219:af0c:489a with SMTP id a2-20020adffb82000000b00219af0c489amr10053730wrr.212.1654860595707;
        Fri, 10 Jun 2022 04:29:55 -0700 (PDT)
Received: from [192.168.2.202] (pd9ea33cd.dip0.t-ipconnect.de. [217.234.51.205])
        by smtp.gmail.com with ESMTPSA id h62-20020a1c2141000000b0039c151298b7sm2827639wmh.10.2022.06.10.04.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 04:29:55 -0700 (PDT)
Message-ID: <df69c497-0ec1-0ffa-b434-dede30a36c36@gmail.com>
Date:   Fri, 10 Jun 2022 13:29:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] platform/surface: avoid flush_scheduled_work() usage
Content-Language: en-US
To:     Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <63ec2d45-c67c-1134-f6d3-490c8ba67a01@I-love.SAKURA.ne.jp>
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <63ec2d45-c67c-1134-f6d3-490c8ba67a01@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 6/10/22 07:41, Tetsuo Handa wrote:
> Use local wq in order to avoid flush_scheduled_work() usage.
> 
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
> Please see commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue()
> using a macro") for background.
> 
> This is a blind conversion, and is only compile tested.

Looks good to me, thanks!

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
Tested-by: Maximilian Luz <luzmaximilian@gmail.com>

>   .../platform/surface/surface_acpi_notify.c    | 27 ++++++++++++++++---
>   1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/platform/surface/surface_acpi_notify.c
> index 7b758f8cc137..c0e12f0b9b79 100644
> --- a/drivers/platform/surface/surface_acpi_notify.c
> +++ b/drivers/platform/surface/surface_acpi_notify.c
> @@ -37,6 +37,7 @@ struct san_data {
>   #define to_san_data(ptr, member) \
>   	container_of(ptr, struct san_data, member)
>   
> +static struct workqueue_struct *san_wq;
>   
>   /* -- dGPU notifier interface. ---------------------------------------------- */
>   
> @@ -356,7 +357,7 @@ static u32 san_evt_bat_nf(struct ssam_event_notifier *nf,
>   
>   	memcpy(&work->event, event, sizeof(struct ssam_event) + event->length);
>   
> -	schedule_delayed_work(&work->work, delay);
> +	queue_delayed_work(san_wq, &work->work, delay);
>   	return SSAM_NOTIF_HANDLED;
>   }
>   
> @@ -861,7 +862,7 @@ static int san_remove(struct platform_device *pdev)
>   	 * We have unregistered our event sources. Now we need to ensure that
>   	 * all delayed works they may have spawned are run to completion.
>   	 */
> -	flush_scheduled_work();
> +	flush_workqueue(san_wq);
>   
>   	return 0;
>   }
> @@ -881,7 +882,27 @@ static struct platform_driver surface_acpi_notify = {
>   		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>   	},
>   };
> -module_platform_driver(surface_acpi_notify);
> +
> +static int __init san_init(void)
> +{
> +	int ret;
> +
> +	san_wq = alloc_workqueue("san_wq", 0, 0);
> +	if (!san_wq)
> +		return -ENOMEM;
> +	ret = platform_driver_register(&surface_acpi_notify);
> +	if (ret)
> +		destroy_workqueue(san_wq);
> +	return ret;
> +}
> +module_init(san_init);
> +
> +static void __exit san_exit(void)
> +{
> +	platform_driver_unregister(&surface_acpi_notify);
> +	destroy_workqueue(san_wq);
> +}
> +module_exit(san_exit);
>   
>   MODULE_AUTHOR("Maximilian Luz <luzmaximilian@gmail.com>");
>   MODULE_DESCRIPTION("Surface ACPI Notify driver for Surface System Aggregator Module");
