Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6BAC38142
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Jan 2023 15:56:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbjAWP4K (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Jan 2023 10:56:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232714AbjAWP4J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Jan 2023 10:56:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B655B90
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 07:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674489319;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jCAD4d47/BHFzPuHYVMhr0BvGhmMwApgFifpM3vZL8Q=;
        b=Q0h+ZCyhR8p4gKu5fIEpxGWOstz8uOR4WWZpq/zheA9IWAkwc/xOg2RniC6bqfNxmg+nIw
        V1AjC/G2ZPy+YEcD/3A6iFzu631rqjHhCp456OjNk492nxun1IgqLNzQCEpGAt7X9T1irA
        PwHfoSDTh6kvjlj/1WMq1DLsk6d98D4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313--yVgZVzfOt2uOAZh--izxA-1; Mon, 23 Jan 2023 10:55:18 -0500
X-MC-Unique: -yVgZVzfOt2uOAZh--izxA-1
Received: by mail-ej1-f70.google.com with SMTP id gn31-20020a1709070d1f00b0087024adbba2so8119260ejc.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 07:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jCAD4d47/BHFzPuHYVMhr0BvGhmMwApgFifpM3vZL8Q=;
        b=B3I1lejm0dkaYwwKkcI2WYmqmpCdCWwcl/27l36BKh/0dLIo0hZW/ay1rCN2FbdaPK
         P0+FwUieVxuuBhZKb4wQ3UlnCY+NqpAGVXadYM+sQ4fDeV40oOJaj3OSbu9R0MNIZxNM
         sHxHHmDr+do5EHUNSjgyH5xyG7thygWjvYpAZF14RaS7bkF7a4tMiyUfNLfxhdRv5/ff
         ou3Drxy7cdBgYUwAiZY8X3jcVRIs8Lk9qcxrsuKtQDt+BiZS+APbzfSxM8LcuKO7XH21
         E/lRYHPlJqEauKew5aSiHOsDm4KdiJM5quHrCc/JjyQjiJ2vzUnvIMcOez4LGMmxlRQq
         v8FA==
X-Gm-Message-State: AFqh2kqVQiqbPSb6tPgcsixAeQlV5DoEjK9/6Dbuv8zNSoTIgFGiK0gv
        R2ci9ljUBJ4FV+MazZI/faiNjv0w3h8RlUj0PJnxaxs1j6CjbRVvsYsGkamDqOXey/ZIzfIQQAX
        3Hv9pW+87xcSPQ2UPIGSNjhOXOEnR5iAF1w==
X-Received: by 2002:aa7:c6d9:0:b0:497:233d:3ef4 with SMTP id b25-20020aa7c6d9000000b00497233d3ef4mr24123952eds.22.1674489317262;
        Mon, 23 Jan 2023 07:55:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsVeO/dcvWK52S6F3pLlXPbt0ufj0yLiui/5X5gLEcz4UVQceMWRf5bZ0OWMJ4nR/4Iu2j48w==
X-Received: by 2002:aa7:c6d9:0:b0:497:233d:3ef4 with SMTP id b25-20020aa7c6d9000000b00497233d3ef4mr24123940eds.22.1674489317090;
        Mon, 23 Jan 2023 07:55:17 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906308b00b007c0f217aadbsm22068428ejv.24.2023.01.23.07.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 07:55:16 -0800 (PST)
Message-ID: <b2d42cec-4ef8-2032-dad0-13ee49f05784@redhat.com>
Date:   Mon, 23 Jan 2023 16:55:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/1] platform/surface: Switch to use
 acpi_evaluate_dsm_typed()
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20230118093823.39679-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230118093823.39679-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

On 1/18/23 10:38, Andy Shevchenko wrote:
> The acpi_evaluate_dsm_typed() provides a way to check the type of the
> object evaluated by _DSM call. Use it instead of open coded variant.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for the 3 patches switching to acpi_evaluate_dsm_typed().
I have added all 3 to my review-hans  branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Regards,

Hans


> ---
>  drivers/platform/surface/surface_hotplug.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/surface/surface_hotplug.c b/drivers/platform/surface/surface_hotplug.c
> index f004a2495201..7b6d887dccdb 100644
> --- a/drivers/platform/surface/surface_hotplug.c
> +++ b/drivers/platform/surface/surface_hotplug.c
> @@ -101,18 +101,12 @@ static void shps_dsm_notify_irq(struct platform_device *pdev, enum shps_irq_type
>  	param.type = ACPI_TYPE_INTEGER;
>  	param.integer.value = value;
>  
> -	result = acpi_evaluate_dsm(handle, &shps_dsm_guid, SHPS_DSM_REVISION,
> -				   shps_dsm_fn_for_irq(type), &param);
> -
> +	result = acpi_evaluate_dsm_typed(handle, &shps_dsm_guid, SHPS_DSM_REVISION,
> +					 shps_dsm_fn_for_irq(type), &param, ACPI_TYPE_BUFFER);
>  	if (!result) {
>  		dev_err(&pdev->dev, "IRQ notification via DSM failed (irq=%d, gpio=%d)\n",
>  			type, value);
>  
> -	} else if (result->type != ACPI_TYPE_BUFFER) {
> -		dev_err(&pdev->dev,
> -			"IRQ notification via DSM failed: unexpected result type (irq=%d, gpio=%d)\n",
> -			type, value);
> -
>  	} else if (result->buffer.length != 1 || result->buffer.pointer[0] != 0) {
>  		dev_err(&pdev->dev,
>  			"IRQ notification via DSM failed: unexpected result value (irq=%d, gpio=%d)\n",
> @@ -121,8 +115,7 @@ static void shps_dsm_notify_irq(struct platform_device *pdev, enum shps_irq_type
>  
>  	mutex_unlock(&sdev->lock[type]);
>  
> -	if (result)
> -		ACPI_FREE(result);
> +	ACPI_FREE(result);
>  }
>  
>  static irqreturn_t shps_handle_irq(int irq, void *data)

