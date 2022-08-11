Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F461C19F2A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Aug 2022 18:53:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236042AbiHKSxH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Aug 2022 14:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236075AbiHKSxD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Aug 2022 14:53:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 787099E101
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Aug 2022 11:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660243980;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FvVxqLM4x5dbRrPxVlbHvXS0vsIzsQ1yRarP/nxxQ/A=;
        b=PqlXuNQ2tpmOhH3hRUQ5hFvj+1lIbMur5+3m4HAzWVf8ImEhqm9pZQdmr1+4bUUJq0RuNb
        0IhtOfpubudZPtgDthx+WiY1/4qSFjyOtD/HIHCuaoGnk0tJvjSl8hR98vCODnarSWaRDM
        infgvcZ75+AooIRY26cM5E0AOZ6TWDo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-Q6YTrf4TOMaopZuIlrgrGQ-1; Thu, 11 Aug 2022 14:52:59 -0400
X-MC-Unique: Q6YTrf4TOMaopZuIlrgrGQ-1
Received: by mail-ed1-f72.google.com with SMTP id h6-20020a05640250c600b0043d9964d2ceso11314847edb.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Aug 2022 11:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=FvVxqLM4x5dbRrPxVlbHvXS0vsIzsQ1yRarP/nxxQ/A=;
        b=LhWtJMZgxjZs0a7uVuxjKIjSkpOz9r4bNUrmxFCEr64wWIZwaqDPlXULVoaLo84nsV
         SbAbuadPO63iGou4sk0p80QHr6NsOxsukYRvTCQW7d9tn8/nA5qCQZ7QsNW7cy3UQVAb
         7y9fTzBfKAbZusHivqo1yjP8hKTS1/b5RejXWtj4P2myB8F4cYHXukA3WNWuwBvhkXl1
         0Uw1Z7ioL6t+e8doZX9/CGPc6Ij/8yhLrRrswxsvx7Cg/0qcKnQJX4JjZUwdekGNqypX
         L8dA4BrWRGskIdVTtR7d38kMQDXET6E6WFIg/jGLI5mkF0fwFRXhyxYCtP979KHZ9ZB/
         b3hw==
X-Gm-Message-State: ACgBeo2j4V5EbcgncglYWTdBILietyg34LzQh77nVsHQmxEQOTbsOAuo
        tVAtrCZTaQ7CeRAenQwTUtzCQhCQKLqe4BTTLIMQzn9i0ZbfvRzYAY9ttW/Plv+/Zymko0/0fO1
        KXTJfo/V1n1vWchSBmvlglGgGLkGAkZBeLw==
X-Received: by 2002:a17:906:5a71:b0:730:aaa1:a9ec with SMTP id my49-20020a1709065a7100b00730aaa1a9ecmr300534ejc.440.1660243977888;
        Thu, 11 Aug 2022 11:52:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4cPacyhZSdtLSfC3PougGGKWRGO/lmdzLpY9MLaycwuWxkXhX0a99tYmnwNDUIz5ymCZEwkg==
X-Received: by 2002:a17:906:5a71:b0:730:aaa1:a9ec with SMTP id my49-20020a1709065a7100b00730aaa1a9ecmr300529ejc.440.1660243977726;
        Thu, 11 Aug 2022 11:52:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id j10-20020aa7de8a000000b0043af8007e7fsm131200edv.3.2022.08.11.11.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 11:52:57 -0700 (PDT)
Message-ID: <f5977666-26a8-4bfc-03f3-dcab17f790d8@redhat.com>
Date:   Thu, 11 Aug 2022 20:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Fix broken touchscreen
 on Chuwi Hi8 with Windows BIOS
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220810141934.140771-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220810141934.140771-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 8/10/22 16:19, Hans de Goede wrote:
> The x86-android-tablets handling for the Chuwi Hi8 is only necessary with
> the Android BIOS and it is causing problems with the Windows BIOS version.
> 
> Specifically when trying to register the already present touchscreen
> x86_acpi_irq_helper_get() calls acpi_unregister_gsi(), this breaks
> the working of the touchscreen and also leads to an oops:
> 
> [   14.248946] ------------[ cut here ]------------
> [   14.248954] remove_proc_entry: removing non-empty directory 'irq/75', leaking at least 'MSSL0001:00'
> [   14.248983] WARNING: CPU: 3 PID: 440 at fs/proc/generic.c:718 remove_proc_entry
> ...
> [   14.249293]  unregister_irq_proc+0xe0/0x100
> [   14.249305]  free_desc+0x29/0x70
> [   14.249312]  irq_free_descs+0x4b/0x80
> [   14.249320]  mp_unmap_irq+0x5c/0x60
> [   14.249329]  acpi_unregister_gsi_ioapic+0x2a/0x40
> [   14.249338]  x86_acpi_irq_helper_get+0x4b/0x190 [x86_android_tablets]
> [   14.249355]  x86_android_tablet_init+0x178/0xe34 [x86_android_tablets]
> 
> Add an init callback for the Chuwi Hi8, which detects when the Windows BIOS
> is in use and exits with -ENODEV in that case, fixing this.
> 
> Fixes: 84c2dcdd475f ("platform/x86: x86-android-tablets: Add an init() callback to struct x86_dev_info")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans



> ---
>  drivers/platform/x86/x86-android-tablets.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
> index 480375977435..4acd6fa8d43b 100644
> --- a/drivers/platform/x86/x86-android-tablets.c
> +++ b/drivers/platform/x86/x86-android-tablets.c
> @@ -663,9 +663,23 @@ static const struct x86_i2c_client_info chuwi_hi8_i2c_clients[] __initconst = {
>  	},
>  };
>  
> +static int __init chuwi_hi8_init(void)
> +{
> +	/*
> +	 * Avoid the acpi_unregister_gsi() call in x86_acpi_irq_helper_get()
> +	 * breaking the touchscreen + logging various errors when the Windows
> +	 * BIOS is used.
> +	 */
> +	if (acpi_dev_present("MSSL0001", NULL, 1))
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
>  static const struct x86_dev_info chuwi_hi8_info __initconst = {
>  	.i2c_client_info = chuwi_hi8_i2c_clients,
>  	.i2c_client_count = ARRAY_SIZE(chuwi_hi8_i2c_clients),
> +	.init = chuwi_hi8_init,
>  };
>  
>  #define CZC_EC_EXTRA_PORT	0x68

