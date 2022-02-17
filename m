Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76577C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 16:35:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243273AbiBQQfe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 11:35:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243268AbiBQQfe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 11:35:34 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4F8D72B2E03
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 08:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645115718;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c2fq/Ny4lMJaIMatRd00hK6MYEHazev14fwhUdBFReI=;
        b=YHshSjUMxIJVEs1R/LqTaXpZ4sIwq39Kuvfwg4qPZbI1bW8XiiNs+Z/dCSW0h/mcNOzlpE
        Xd/dcb4PI2TakxqAjnvQAugvU2saPieXO8n/Co3JWyZ5Tw/ni/v+Aj3v81uCbnBKCW6iNN
        us1OPwqWHkxS0a/KaqAbEEycJSARmR0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-IqgwIIZtMJ64pRhrTB6zwA-1; Thu, 17 Feb 2022 11:35:15 -0500
X-MC-Unique: IqgwIIZtMJ64pRhrTB6zwA-1
Received: by mail-ej1-f72.google.com with SMTP id k16-20020a170906971000b006d0118d857aso1757894ejx.14
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 08:35:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=c2fq/Ny4lMJaIMatRd00hK6MYEHazev14fwhUdBFReI=;
        b=7Q26wam5KN/KlCfv2KI8m66BxDx5ok8dXS5C6QtMTOTNKRVMibTq4DEMvSzbJVRRy/
         xtmpktFTfyloq3Tjky3EcrHmZY3+RzrreTmeHISsoVbT8RQP0BDnTIeV23nT9E/g8kpo
         QduFtDZkvbVIB62fIJrO1OOZtNsumdSpYXee57XpM+1/W1jWJtbgQy0uL2hPoqq9aRFV
         fTxoOgzfgEvYi7/bdynEKDf1rjfB2oALtGyENSiv8Z1eMYzZiF0tShEj6G6fcTVrYjat
         7yJMFHOVvLoOfzKYJ2u04wFzsAlWup1kwCr5WiFTFrvuyY8DzBVj88NhkjctbScE0f7c
         oQxA==
X-Gm-Message-State: AOAM531KBakI/SyoUsRwXOD9aQ8JtaO+iV12eSpBm4lmSM96/KmBhmaU
        6tCbByvpyIRONsafA19mw/8vj9kl+4IWNZcrRn3KYkgJa5g2WOHtUU4VtALUZQOy5PgVF96zFJ1
        j0bG67S0o9mysXsa7JX+bX9k0kLufr1LOdg==
X-Received: by 2002:a50:d79d:0:b0:410:82a0:5d76 with SMTP id w29-20020a50d79d000000b0041082a05d76mr3531291edi.130.1645115713910;
        Thu, 17 Feb 2022 08:35:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwy1XOj60hZ2Xgf9leB0ov3CtVqqw7iUj8h3GXaY1TNAUOjvJWy/8ifdMYStkE127/Ixy5g6A==
X-Received: by 2002:a50:d79d:0:b0:410:82a0:5d76 with SMTP id w29-20020a50d79d000000b0041082a05d76mr3531272edi.130.1645115713760;
        Thu, 17 Feb 2022 08:35:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id q5sm1319255ejc.115.2022.02.17.08.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 08:35:13 -0800 (PST)
Message-ID: <2482eae0-ad8c-3fda-1d0e-f8794c50192d@redhat.com>
Date:   Thu, 17 Feb 2022 17:35:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: Add Steam Deck driver
Content-Language: en-US
To:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Mark Gross <markgross@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20220206022023.376142-1-andrew.smirnov@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220206022023.376142-1-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/6/22 03:20, Andrey Smirnov wrote:
> Add a driver exposing various bits and pieces of functionality
> provided by Steam Deck specific VLV0100 device presented by EC
> firmware. This includes but not limited to:
> 
>     - CPU/device's fan control
>     - Read-only access to DDIC registers
>     - Battery tempreature measurements
>     - Various display related control knobs
>     - USB Type-C connector event notification
> 
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-kernel@vger.kernel.org (open list)
> Cc: platform-driver-x86@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

The .c file says: "Copyright (C) 2021-2022 Valve Corporation", yet
you use a personal email address here. This is not really a problem,
but it does look a bit weird.

> ---
> 
> This driver is really a kitchen sink of various small bits. Maybe it
> is worth splitting into an MFD + child drivers/devices?

With the extcon stuff thrown in the mix I think you definitely should
go for using MFD here.

Then you can submit a MFD driver under drivers/mfd for registering the
regmap + the cells + separate extcon + LED + backlight + hwmon drivers to
their resp. subsystems.

As drivers/platform/x86/ maintainer I would be happy to take a driver
for a "misc" cell for any remaining bits if there are any...

<snip>

> +struct steamdeck {
> +	struct acpi_device *adev;
> +	struct device *hwmon;
> +	void *regmap;

That should be:

	struct regmap *regmap;


> +	long fan_target;
> +	struct delayed_work role_work;
> +	struct extcon_dev *edev;
> +	struct device *dev;
> +};

Regards,

Hans

