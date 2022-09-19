Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC44ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 10:49:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbiISKtx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 06:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbiISKtJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 06:49:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF2182611E
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 03:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663584131;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JSVojkQBpDH2ShcQLnYMDETdr3XUdR9J9jflqCVySAY=;
        b=bJF5IYeVfNZ4rFJ0QuvEURu/b4Wtqzvut2rdp0C8iwcUSzAN4i15I0SAI8W+er/8Tyl9pM
        udSQjGz2BMKsndW0VFDMpZnpWsCY94ObV01TOt2atskAf+O+5XGuaEKh5aT18wvnQdg8+5
        H4SFUJNHZ2CATEAI+mPq/FV1Bd9OZT0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-302-TnOxa03COaqM0Y3547qbGA-1; Mon, 19 Sep 2022 06:42:10 -0400
X-MC-Unique: TnOxa03COaqM0Y3547qbGA-1
Received: by mail-ed1-f72.google.com with SMTP id h13-20020a056402280d00b004528c8400afso11662970ede.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 03:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JSVojkQBpDH2ShcQLnYMDETdr3XUdR9J9jflqCVySAY=;
        b=pOi9rnVv9Xd1ue+xlyNO4apeJBNs2ypCkl2F3wjksk6zzl4k8zVTIFNphBuZjM5odv
         UblciR+aZRBAkKKZZbO4/12SuNNAUIp1DAXsxC8j6hlU0AjDlMf6RheSlqWdg9JtIzg0
         FmUNFHBbbhO/O88VtqcWcbefwcRJFiBdaWpb2ttKYm5yHKhMZq9fq8Y2eEg6a3LwlhjI
         QMSsoVLM/DwJGTo8yfZ1ttAC1ERX83WSRqPU+IlrQukOx8xY3R4kHM9YouB3L3XEGGcE
         rVpPdNxs9Vk/2otMZjgjakkjcHbG0Ly91sDfptGbH1p5M3n1wPm1YMNsCJB4slONCGER
         XqKw==
X-Gm-Message-State: ACrzQf2xyGVfBSnS6LLv3Mg7+iDE18MMluOyfOAfdmBqlHJCTB3NrjIg
        XO2uGxxyViHNvUXvpXQhgpx/VOJxc5Pv4gM8feN/Io0yNDofc46d5+qI8F381kxc0nKmP62XN40
        rMRBZz3ywrvg/WfAhENiHpajAZGCERiXVFw==
X-Received: by 2002:a17:906:9b87:b0:733:1795:2855 with SMTP id dd7-20020a1709069b8700b0073317952855mr12730725ejc.156.1663584128565;
        Mon, 19 Sep 2022 03:42:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5E9hdTB/zsLiGdHYHGyIfVoWOwYCxo8G7tzx2zblspy+LiFeQDC3v4aeLe3BLK8FnDMRB/wA==
X-Received: by 2002:a17:906:9b87:b0:733:1795:2855 with SMTP id dd7-20020a1709069b8700b0073317952855mr12730715ejc.156.1663584128354;
        Mon, 19 Sep 2022 03:42:08 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id bs11-20020a170906d1cb00b00738467f743dsm9924874ejb.5.2022.09.19.03.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 03:42:07 -0700 (PDT)
Message-ID: <f8fa6d10-6eb1-7fa7-80eb-ea190d29ba4a@redhat.com>
Date:   Mon, 19 Sep 2022 11:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/5] ACPI: battery: Do not unload battery hooks on single
 error
Content-Language: en-US
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org
Cc:     rafael@kernel.org, lenb@kernel.org, hmh@hmh.eng.br,
        matan@svgalib.org, corentin.chary@gmail.com, jeremy@system76.com,
        productdev@system76.com, platform-driver-x86@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220912125342.7395-1-W_Armin@gmx.de>
 <20220912125342.7395-2-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220912125342.7395-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/12/22 13:53, Armin Wolf wrote:
> Currently, battery hooks are being unloaded if they return
> an error when adding a single battery.
> This however also causes the removal of successfully added
> hooks if they return -ENODEV for a single unsupported
> battery.
> 
> Do not unload battery hooks in such cases since the hook
> handles any cleanup actions.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Maybe instead of removing all error checking, allow -ENODEV
and behave as before when the error is not -ENODEV ?

Otherwise we should probably make the add / remove callbacks
void to indicate that any errors are ignored.

Rafael, do you have any opinion on this?

Regards,

Hans

> ---
>  drivers/acpi/battery.c | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/acpi/battery.c b/drivers/acpi/battery.c
> index 306513fec1e1..e59c261c7c59 100644
> --- a/drivers/acpi/battery.c
> +++ b/drivers/acpi/battery.c
> @@ -724,20 +724,10 @@ void battery_hook_register(struct acpi_battery_hook *hook)
>  	 * its attributes.
>  	 */
>  	list_for_each_entry(battery, &acpi_battery_list, list) {
> -		if (hook->add_battery(battery->bat)) {
> -			/*
> -			 * If a add-battery returns non-zero,
> -			 * the registration of the extension has failed,
> -			 * and we will not add it to the list of loaded
> -			 * hooks.
> -			 */
> -			pr_err("extension failed to load: %s", hook->name);
> -			__battery_hook_unregister(hook, 0);
> -			goto end;
> -		}
> +		hook->add_battery(battery->bat);
>  	}
>  	pr_info("new extension: %s\n", hook->name);
> -end:
> +
>  	mutex_unlock(&hook_mutex);
>  }
>  EXPORT_SYMBOL_GPL(battery_hook_register);
> @@ -762,15 +752,7 @@ static void battery_hook_add_battery(struct acpi_battery *battery)
>  	 * during the battery module initialization.
>  	 */
>  	list_for_each_entry_safe(hook_node, tmp, &battery_hook_list, list) {
> -		if (hook_node->add_battery(battery->bat)) {
> -			/*
> -			 * The notification of the extensions has failed, to
> -			 * prevent further errors we will unload the extension.
> -			 */
> -			pr_err("error in extension, unloading: %s",
> -					hook_node->name);
> -			__battery_hook_unregister(hook_node, 0);
> -		}
> +		hook_node->add_battery(battery->bat);
>  	}
>  	mutex_unlock(&hook_mutex);
>  }
> --
> 2.30.2
> 

