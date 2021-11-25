Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1169DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Nov 2021 15:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237505AbhKYPlC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Nov 2021 10:41:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54427 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244375AbhKYPjC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Nov 2021 10:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637854550;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jjywDXRg/0Lll7BB9Q6+1mvmYs27GKTIb2WjJG1ziL4=;
        b=cImoIrShH5cu0+f/gbHjblgdGyZJYFcCP6tYNTmjhbUqSJwmQcRatKo5nAQnpWRucOFDEq
        s27KyaiC6OysKHZnGAjXJyERwVoMGAwGUjew6/aW4FOnaYy/1phcNrUzfs3yJLjlL4UeMH
        5+nrJtemJ2V47+cGUzu5YTV6g7opD1E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-hen7_eEUMlKUp6brGomxGw-1; Thu, 25 Nov 2021 10:35:49 -0500
X-MC-Unique: hen7_eEUMlKUp6brGomxGw-1
Received: by mail-ed1-f72.google.com with SMTP id w4-20020aa7cb44000000b003e7c0f7cfffso5795150edt.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Nov 2021 07:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jjywDXRg/0Lll7BB9Q6+1mvmYs27GKTIb2WjJG1ziL4=;
        b=NdRZ7Z8Y2bxsl9z/LHk/6cYlVMwQdln81opT3lHdmyyyS/IpM3Ws982G+gFGBnF7R1
         BcqAMGPteRmO1FwMSc23/f0Y3ZGrSdYBhuUxwtgrt7WiUci3O9yGw8jLu4DeJBlKdkiT
         LjyMo9pUH5j0Wc7icbeD/Ecjxkj4R812MCUs+x76yZazjIPLtpXQUzWQWzLKi7qcWK4O
         nAigttlIK2LszFdWVK6GqVOHmQlsodh2cbUcFjnZpBRvMSasvmT6bmodSC+Bc+XAsXfP
         TP1FX1q7Z+LNr3sZ0rPO0p2FQiYXbJkgMDjZzsvLsnykzzCiC3SPxA1YbafjH3lSsviT
         +3Bw==
X-Gm-Message-State: AOAM533ILeW0BaRQdM7QwJXbvPftcASguD1rsqQhRj8SHCr5ONjCtuDq
        F6aHUNlEedLaxAXzOIY8z/xjs0tDhq5jHamJID4NoC3FEmRuBXGSPZAuofy2xWydd1avGaiscux
        HfT/QUKZiMbramjaVrZ5UUq4TQ/Cvx30vJw==
X-Received: by 2002:aa7:d4c3:: with SMTP id t3mr39407614edr.268.1637854547862;
        Thu, 25 Nov 2021 07:35:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgUcwehoYoZiN9RBigQ4abMysX5rZ4fbX6m/8GACDbG+dCpinXn6WAZQ5Vq/sJhYEPYNiN9w==
X-Received: by 2002:aa7:d4c3:: with SMTP id t3mr39407586edr.268.1637854547718;
        Thu, 25 Nov 2021 07:35:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ht7sm1789038ejc.27.2021.11.25.07.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 07:35:47 -0800 (PST)
Message-ID: <08cff5d6-5c05-f8f8-b29a-f4d93b9cac71@redhat.com>
Date:   Thu, 25 Nov 2021 16:35:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] platform/x86: thinkpad_acpi: Add
 LED_RETAIN_AT_SHUTDOWN to led_class_devs
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20211123210524.266705-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211123210524.266705-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 11/23/21 22:05, Hans de Goede wrote:
> Add the LED_RETAIN_AT_SHUTDOWN flag to the registered led_class_devs so
> that the LEDs do not get turned-off when reloading the driver and thus so
> that they also stay under default EC control when reloading the driver,
> unless explicitly overridden by the user.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this series to my review-hans branch now, with the LED
name changed to lid_logo_dot as discussed.

Regards,

Hans


> ---
>  drivers/platform/x86/thinkpad_acpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index a4ef57ddcc90..49fdf16b2db9 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -5827,6 +5827,7 @@ static int __init tpacpi_init_led(unsigned int led)
>  		tpacpi_leds[led].led_classdev.brightness_get = &led_sysfs_get;
>  
>  	tpacpi_leds[led].led_classdev.name = tpacpi_led_names[led];
> +	tpacpi_leds[led].led_classdev.flags = LED_RETAIN_AT_SHUTDOWN;
>  	tpacpi_leds[led].led = led;
>  
>  	return led_classdev_register(&tpacpi_pdev->dev, &tpacpi_leds[led].led_classdev);
> 

