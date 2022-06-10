Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401D2CCA47D
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Jun 2022 19:10:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350459AbiFJTKJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Jun 2022 15:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350465AbiFJTKI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jun 2022 15:10:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 36D1E15828
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 12:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654888206;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qUW6JDLfmxj9lFzCpBnq7MGkjudHtjpg7FJPkpReq6I=;
        b=YzrHk8ANKkdwsfW5kABDc/uNzjxIHs1qJaadf139pUKck6MDMvkROu40yaWcUUHIN4esE4
        b9aVc34LsvNFD75yjVUuFkdgqJlKhe/WKoC+KpMqzctg7GgGE1QR7iCHnIifatPhv47Tbk
        moKxd4mrowV398XbqbkbfYqD7b7T7FA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-IL_9wK0ENtOWpyc69dAeYA-1; Fri, 10 Jun 2022 15:10:05 -0400
X-MC-Unique: IL_9wK0ENtOWpyc69dAeYA-1
Received: by mail-ej1-f72.google.com with SMTP id l2-20020a170906078200b006fed42bfeacso12910629ejc.16
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 12:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qUW6JDLfmxj9lFzCpBnq7MGkjudHtjpg7FJPkpReq6I=;
        b=XpnsAHktniNsqrO96BF9sAawRTpCMuuwYw7R19cidKxhdAtKhsb8mg6/ZnZuqA1mNi
         OB3+OKZLNL3kSi1hGZ2upC5fFSAH4F0norwV9t9pjOi10y+hd25XQFTQLJ3EaKpcS4NC
         7En67j/6VGyckMDlp2oGKgp0p3e/8Ku17L8n2X/qjAdky3YbOpbhYKtaIBzJzMfJonZB
         ymQwjmMuwYeErhXsRlY7t/o54hWlbdGBHYYWsEQtKziAq+oNnhEn+qLcUh7FhU4mp4z9
         mb51Yi5Kflkr5omWqafAAc5y6s/VYwMuhqyJsqtmGilgtonafFq+FOp4Xz9o3iStxXzi
         VXCQ==
X-Gm-Message-State: AOAM532HWx/9HJPgkaqeEHWzfiNA8C4DDpn3vKegMUpMXLmmaG42NUUa
        FBrVLdfYqd1jKPn0sOyg/uB+Kz2GQwDQ1DCGsKBsA+2nSA++JBppFSD2sRz1jXld/NDcAv4Y6nv
        YNWt+TC+cToWZUi5Uki+2NcyVDy5SoX352A==
X-Received: by 2002:a05:6402:4246:b0:42f:3a4b:cc71 with SMTP id g6-20020a056402424600b0042f3a4bcc71mr43556563edb.107.1654888203760;
        Fri, 10 Jun 2022 12:10:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnQNxWVZrJvoD/0PvZcdsGvidN1hpNu/R4NfW2TAvvSoYJyzY0SE26ysyPLnRN+SSoVDGpzg==
X-Received: by 2002:a05:6402:4246:b0:42f:3a4b:cc71 with SMTP id g6-20020a056402424600b0042f3a4bcc71mr43556545edb.107.1654888203542;
        Fri, 10 Jun 2022 12:10:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id t2-20020a05640203c200b0042617ba63c2sm5084edw.76.2022.06.10.12.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 12:10:03 -0700 (PDT)
Message-ID: <d5680f64-d5e7-3e42-0340-0f540ea12e50@redhat.com>
Date:   Fri, 10 Jun 2022 21:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: system76_acpi: use dev_get_drvdata
Content-Language: en-US
To:     Haowen Bai <baihaowen@meizu.com>,
        Jeremy Soller <jeremy@system76.com>,
        System76 Product Development <productdev@system76.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1653989063-20180-1-git-send-email-baihaowen@meizu.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1653989063-20180-1-git-send-email-baihaowen@meizu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/31/22 11:24, Haowen Bai wrote:
> Eliminate direct accesses to the driver_data field.
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>

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
>  drivers/platform/x86/system76_acpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
> index 7299ad08c838..958df41ad509 100644
> --- a/drivers/platform/x86/system76_acpi.c
> +++ b/drivers/platform/x86/system76_acpi.c
> @@ -339,7 +339,7 @@ static ssize_t kb_led_color_show(
>  	struct led_classdev *led;
>  	struct system76_data *data;
>  
> -	led = (struct led_classdev *)dev->driver_data;
> +	led = dev_get_drvdata(dev);
>  	data = container_of(led, struct system76_data, kb_led);
>  	return sysfs_emit(buf, "%06X\n", data->kb_color);
>  }
> @@ -356,7 +356,7 @@ static ssize_t kb_led_color_store(
>  	unsigned int val;
>  	int ret;
>  
> -	led = (struct led_classdev *)dev->driver_data;
> +	led = dev_get_drvdata(dev);
>  	data = container_of(led, struct system76_data, kb_led);
>  	ret = kstrtouint(buf, 16, &val);
>  	if (ret)

