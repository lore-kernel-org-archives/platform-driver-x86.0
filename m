Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA54C54EED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 13:49:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbjA3Nt6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 08:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjA3Nt5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 08:49:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD1736FEA
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 05:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675086550;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=khWUJvHdx5J4eL+21ybuf9aVnqAzPnJ5sS+uPDhULsw=;
        b=PpxQkg1kAFJujS/tlTxogzORlUUmcwrGz2WBH7UZP/0MjrN4dC0asdTzHkmnFXiI68Ota+
        ni9i1QpvbOWweVopjjPpBfVakgrTD0AEQu5fUIoraaXiuWmvnhuZGWARLkXe4lpGqiRrPh
        lJtUlAt53PkzksJH5RQ6uXPreWzW6o8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-580-n4ngCtCnM4aH5anL9S0faw-1; Mon, 30 Jan 2023 08:49:08 -0500
X-MC-Unique: n4ngCtCnM4aH5anL9S0faw-1
Received: by mail-ed1-f69.google.com with SMTP id m23-20020aa7c2d7000000b004a230f52c81so3131254edp.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 05:49:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khWUJvHdx5J4eL+21ybuf9aVnqAzPnJ5sS+uPDhULsw=;
        b=KyuyEgYL7TAjk/PWfLQtxwUIo2BZd7LoAY7Bql4xSWYSTDfbBL2iidOnCQF7ZKbmW1
         9ys6xr9O0J/GCkCFI2fQTWkVK8G88DUpqko3VNpEUTi5EY+H++xF0VNL/jFGrbIgUL+E
         qrXSb6wUZjiXbsVCp0MyM0jqBv3/OVLdSkfZw/14KQYrMEnLBkN63696O4HPDa/LFt/v
         tP/eetfxX2Bx/TehKCam2qbSKqn+88YncoKHUlJFFjVXGqWvHYPhnDGN0lOvaR/nboN9
         GccoiIgEK8JmcWf6PJAXAJNkJgFYj5yJDt4mMgzxs7IYz6Zl5c0F6lNAtAPdayePLkRe
         /uow==
X-Gm-Message-State: AFqh2kqLYgSv0GzjXk3eHFOCRy/RSK3P7hgSbBBI8Vudd3FGmMPMS1fk
        x+m2IueJh/5eEDlv8yUQ7t7S7W63PNdpBxJEe6vLB3alLPLPVPLmm2l6BnTrxw5I+WmWZ5V4zu0
        BxyD5lMjPsnTjCZ1WQo/cLAcTyb8a1HCkJQ==
X-Received: by 2002:a17:906:150d:b0:7c1:458b:a947 with SMTP id b13-20020a170906150d00b007c1458ba947mr49429988ejd.26.1675086546317;
        Mon, 30 Jan 2023 05:49:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtKQ5YvcJEu7Y7MnT4+vZ5jaAGs7KrILd3xUWQY7lxKVSkWxE+aWXcLuASciflewdh6Mbfkcw==
X-Received: by 2002:a17:906:150d:b0:7c1:458b:a947 with SMTP id b13-20020a170906150d00b007c1458ba947mr49429977ejd.26.1675086546111;
        Mon, 30 Jan 2023 05:49:06 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id rh16-20020a17090720f000b0087329ff593fsm6904225ejb.144.2023.01.30.05.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 05:49:05 -0800 (PST)
Message-ID: <ef698dd2-8620-7ebf-7e79-3280dada148e@redhat.com>
Date:   Mon, 30 Jan 2023 14:49:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix thinklight LED
 brightness returning 255
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230127235723.412864-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230127235723.412864-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/28/23 00:57, Hans de Goede wrote:
> Reading the thinklight LED brightnes while the LED is on returns
> 255 (LED_FULL) but we advertise a max_brightness of 1, so this should
> be 1 (LED_ON).
> 
> Fixes: db5e2a4ca0a7 ("platform/x86: thinkpad_acpi: Fix max_brightness of thinklight")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've applied this to the pdx86 fixes branch now:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

and this will be included in my next fixes pull-req to Linus.

Regards,

Hans



> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 02860c32625e..32c10457399e 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -5563,7 +5563,7 @@ static int light_sysfs_set(struct led_classdev *led_cdev,
>  
>  static enum led_brightness light_sysfs_get(struct led_classdev *led_cdev)
>  {
> -	return (light_get_status() == 1) ? LED_FULL : LED_OFF;
> +	return (light_get_status() == 1) ? LED_ON : LED_OFF;
>  }
>  
>  static struct tpacpi_led_classdev tpacpi_led_thinklight = {

