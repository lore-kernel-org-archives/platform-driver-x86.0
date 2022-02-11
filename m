Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF10C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 11 Feb 2022 09:52:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348115AbiBKJwE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Feb 2022 04:52:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiBKJwE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Feb 2022 04:52:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BBCBDE51
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Feb 2022 01:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644573122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D7Cok691O3REcTIAKzIulJzPdvLyzuTqC9Y9AsIdR2U=;
        b=DrnQ5lIjfrcfnNGVATqtVSm6dHbsnVVgfSmFCWERp2NOYzyJSXDe3YriZLpEEnB5FV73UP
        UaYHy1ES6uHXt9W2JCefDJAMggOIARnWC8bMKgBhqPBr2wy1cRXdtomOJoLpykatBh/5mH
        MujW0mQcD3f9Pd+xPeuEhHEWl6jQKkU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-N4QCMEDkMVmvDK2KjFxjlg-1; Fri, 11 Feb 2022 04:52:01 -0500
X-MC-Unique: N4QCMEDkMVmvDK2KjFxjlg-1
Received: by mail-ed1-f72.google.com with SMTP id g3-20020a056402424300b004107aa941ffso512403edb.14
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Feb 2022 01:52:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=D7Cok691O3REcTIAKzIulJzPdvLyzuTqC9Y9AsIdR2U=;
        b=tAww4dbp2vxBEn67C1GnEwxsxWZJDUDZ6Laf1EiHv8VnUbl5yESvnXTyAP8DZaAtLX
         29y4wyCfLo3tABM3q+R9ArztD3AO+dnxEOR9nzMCRsJYwmJJiIwLEXisXYa0lHMZBopH
         U8zJg9Whl0xHct2jTSNK4cWrbFGjgc8BbPyQp3uKBYo0rk0TdV6Su5NyzRAqOKXGEYCu
         fSY4UkyhgaMqy5ct5A+yHZG8PA22PXtP+qCE2OpxnRr9gXfR9jJr5rNA2xbXJG/IEE4T
         oDfDzNeLI8i/akdRP5MXzdjOcOYCINOlIjCRXgbwtx+5ljWg/GNCfgYARUyyu5JmbW1E
         vaoA==
X-Gm-Message-State: AOAM531hECels69N/+c5IDCpwFHcPZNMHu7RVFZ3f5xrvYDLG5hdaOeb
        4UgrszM/MekO8xBJ2Sh3bB5GUUQSzXg1RCUoFuA6rZeiQ9THC2pLNCGooCqGd32Flj5G2Zoz+dd
        jCfzC0hXWkH3YyIRt3G64HkGXPShhfOAGrA==
X-Received: by 2002:a17:906:7948:: with SMTP id l8mr668458ejo.636.1644573120281;
        Fri, 11 Feb 2022 01:52:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDwE3B1iQqwDYo3TeKhZofLlGT2qi6ZWzD7BL1If+nw5b9Dc3O8Degv8o1kEd+ZI1AReACig==
X-Received: by 2002:a17:906:7948:: with SMTP id l8mr668448ejo.636.1644573120085;
        Fri, 11 Feb 2022 01:52:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id o9sm4788073ejn.16.2022.02.11.01.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 01:51:59 -0800 (PST)
Message-ID: <41f37bfc-efd1-b9e0-6568-0862e2074b6b@redhat.com>
Date:   Fri, 11 Feb 2022 10:51:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/6] platform/x86: x86-android-tablets: Add battery swnode
 support
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        platform-driver-x86@vger.kernel.org
References: <20220205191356.225505-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220205191356.225505-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/5/22 20:13, Hans de Goede wrote:
> power_supply_get_battery_info() which is used by charger and fuel-gauge
> drivers on x86-android-tablets, expects the battery properties to be
> described in a stand-alone battery fwnode which is then referenced
> from both the charger and fuel-gauge device's fwnodes.
> 
> Add support for registering + unregistering a swnode for this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this series to my review-hans (soon to be for-next) branch now.

Regards,

Hans



> ---
>  drivers/platform/x86/x86-android-tablets.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
> index 3120acf9837c..80d113c41623 100644
> --- a/drivers/platform/x86/x86-android-tablets.c
> +++ b/drivers/platform/x86/x86-android-tablets.c
> @@ -146,6 +146,7 @@ struct x86_serdev_info {
>  struct x86_dev_info {
>  	char *invalid_aei_gpiochip;
>  	const char * const *modules;
> +	const struct software_node *bat_swnode;
>  	struct gpiod_lookup_table * const *gpiod_lookup_tables;
>  	const struct x86_i2c_client_info *i2c_client_info;
>  	const struct platform_device_info *pdev_info;
> @@ -727,6 +728,7 @@ static struct i2c_client **i2c_clients;
>  static struct platform_device **pdevs;
>  static struct serdev_device **serdevs;
>  static struct gpiod_lookup_table * const *gpiod_lookup_tables;
> +static const struct software_node *bat_swnode;
>  static void (*exit_handler)(void);
>  
>  static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info,
> @@ -850,6 +852,8 @@ static void x86_android_tablet_cleanup(void)
>  
>  	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
>  		gpiod_remove_lookup_table(gpiod_lookup_tables[i]);
> +
> +	software_node_unregister(bat_swnode);
>  }
>  
>  static __init int x86_android_tablet_init(void)
> @@ -886,6 +890,13 @@ static __init int x86_android_tablet_init(void)
>  	for (i = 0; dev_info->modules && dev_info->modules[i]; i++)
>  		request_module(dev_info->modules[i]);
>  
> +	bat_swnode = dev_info->bat_swnode;
> +	if (bat_swnode) {
> +		ret = software_node_register(bat_swnode);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	gpiod_lookup_tables = dev_info->gpiod_lookup_tables;
>  	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
>  		gpiod_add_lookup_table(gpiod_lookup_tables[i]);
> 

