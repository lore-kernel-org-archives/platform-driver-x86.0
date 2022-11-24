Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A40AC433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Nov 2022 11:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbiKXLsa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Nov 2022 06:48:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbiKXLsZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Nov 2022 06:48:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296AEB0400
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Nov 2022 03:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669290441;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6UKcDxDchtxziI/HIsz5rxDvl8BLvMydht/Ew4gxrpc=;
        b=N6m3Dlw/56VQT4Dg0FSdPzQQJKLe76IjoEx1e6wMz2G046mmr3MN4q3uXmcKKLz6/5zV6k
        21yBeuZf7LDB4Ep8gJgjfFoWX2vyArw8w7yBh9je8+LDSz0sI4POwViXII+iG7kjOMZmWG
        lYrJ3vx8HjC87EYI9PgoJwrmgkS/jTE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-436-TrE5B2XBM1SnF10eYlwz1A-1; Thu, 24 Nov 2022 06:47:19 -0500
X-MC-Unique: TrE5B2XBM1SnF10eYlwz1A-1
Received: by mail-ed1-f72.google.com with SMTP id b14-20020a056402278e00b00469cb71480fso831580ede.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Nov 2022 03:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6UKcDxDchtxziI/HIsz5rxDvl8BLvMydht/Ew4gxrpc=;
        b=ffkqLofOXxXi+hl4cy249ENWp0nA3igoPl91RlbbTxce/q/rtIpGn8b0stfq0/LvRk
         1RoREOH0AiFL0DWFtailduO8sA9CG4QKSoG4ire8ZzqNv4zu2bF0BDEj+aikrlJ3a8sd
         ECW3J2Mr4vUJ9GwJb4OG4oQmAkPocxikMQI6Pqf3ZSoQ7cGqJe/QHFyAO2x2rnAaDne/
         YyNy1vxHPwmxXA0yWSlTBJGku7AEOQUU5OOclnlg+D0vp7HYAI/WOhsyxHtlMrHpgFIU
         rcxh0+plTqEF2TIlCqR90A0vpJzeRq6R2ZGaVpD75nCh/IDXfSqWdUnM0k0zPEQlWuEx
         Gt6Q==
X-Gm-Message-State: ANoB5pnU7dT4N0nTE7wO15GwZPVIkYNWjQh6pUNBjrHXHdaeIWita6E/
        aFKvmTtv0tt34zY2yMK+gcNLMnZlSQBCMp7qfjzR+F8js/GhGcWvU44mubgautNk+mUbSCdN6l6
        AVrP14dsAzT5zoB1Y0BVhy2WtS/5PiZDS8Q==
X-Received: by 2002:aa7:c9c3:0:b0:461:8f21:5f12 with SMTP id i3-20020aa7c9c3000000b004618f215f12mr29994520edt.54.1669290438822;
        Thu, 24 Nov 2022 03:47:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Lfw2riZ0eO3p/mqdvjpYHj4TuGNzHS07kAgArfyv0j8wdQdThhnIH77ovbJyXoKoinhiJ1A==
X-Received: by 2002:aa7:c9c3:0:b0:461:8f21:5f12 with SMTP id i3-20020aa7c9c3000000b004618f215f12mr29994495edt.54.1669290438599;
        Thu, 24 Nov 2022 03:47:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b4-20020a056402138400b0046146c730easm416985edv.75.2022.11.24.03.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 03:47:18 -0800 (PST)
Message-ID: <1b548284-baa3-26e0-2e8f-a8d853788e5c@redhat.com>
Date:   Thu, 24 Nov 2022 12:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 1/2] platform/x86: serial-multi-instantiate: Set fwnode
 for i2c
Content-Language: en-US, nl
To:     Stefan Binding <sbinding@opensource.cirrus.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, patches@opensource.cirrus.com
References: <20221124110718.3925934-1-sbinding@opensource.cirrus.com>
 <20221124110718.3925934-2-sbinding@opensource.cirrus.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221124110718.3925934-2-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Stefan,

On 11/24/22 12:07, Stefan Binding wrote:
> This allows the i2c driver to obtain the ACPI_COMPANION.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  drivers/platform/x86/serial-multi-instantiate.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 5362f1a7b77c..15ef2f3c442e 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -194,6 +194,7 @@ static int smi_i2c_probe(struct platform_device *pdev, struct smi *smi,
>  		strscpy(board_info.type, inst_array[i].type, I2C_NAME_SIZE);
>  		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev), inst_array[i].type, i);
>  		board_info.dev_name = name;
> +		board_info.fwnode = acpi_fwnode_handle(adev);
>  
>  		ret = smi_get_irq(pdev, adev, &inst_array[i]);
>  		if (ret < 0)

I'm afraid that making this change is not as straight forward as it looks.

I know that I have tried to do this in the past and it failed.

IIRC there were 3 problems:

1. I was expecting this to also allow the driver for the instantiated
i2c-client to be able to bind using an acpi_match_table but that
unfortunately does not work. acpi_match_table matches only work for
the first physical_node linked under
/sys/bus/acpi/devices/xxxx:xx/physical_node and that is the platform
device to which serial-multi-instantiate.c binds. The i2c_client becomes
the second physical node.  Note this is not really an issue,
just something to be aware of.


2. This causes the i2c-core to use the first IRQ resource in the ACPI
fwnode as client->irq for any clients for which we do not set an
IRQ when instantiating. Which may very well be wrong. Sometimes that
IRQ is only valid for the first i2c-client which we instantiate; and
not for the others! And sometimes it is a problem because it may
point to an irqchip for which we never wrote a driver leading to
all probes of the i2c-client failing with -EPROBE_DEFER, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d1d84bb95364ed604015c2b788caaf3dbca0262f

Note that patch has been reverted since that specific -EPROBE_DEFER
issue has been solved by making the ACPI core instantiate a
platform_device instead of an i2c_client (in this case we
did not need the actual i2c_client at all).

The current i2c-core code has a (!client-irq) test guarding its
code of trying to use the first ACPI fwnode IRQ resource.

So we could disable this by setting client->irq = -ENOENT in
serial-multi-instantiate.c when (inst->flags & IRQ_RESOURCE_TYPE) ==
IRQ_RESOURCE_NONE). But that will introduce a new problem. Many
i2c-drivers check if there is an IRQ for them to use by doing:
"if (client->irq) request_irq(client->irq, ...)" but then with
error checking/so setting client->irq to -ENOENT will cause
the request_irq to fail, leading the probe to fail.

So before you can write a patch setting client->irq = -ENOENT
when (inst->flags & IRQ_RESOURCE_TYPE) == IRQ_RESOURCE_NONE),
you would first need to patch all i2c-drivers for clients
instantiated through serial-multi-instantiate.c changing:

	if (client->irq) {
		...
	}

to:

	if (client->irq > 0) {
		...
	}

Note this is not as bad as it sounds, since there are only
a few drivers for clients instantiated by serial-multi-instantiate.c .


3. Some drivers may check for an ACPI companion device and then
change their behavior. So all drivers for clients instantiated
through serial-multi-instantiate.c will need to be audited for
this (and a summary of this audit needs to be added to the commit
msg).

Regards,

Hans

