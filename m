Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70AAC48BE5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 16:01:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7D8861042
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 16:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbhFPQDV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Jun 2021 12:03:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37049 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230515AbhFPQDV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Jun 2021 12:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623859274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qtoS4RSweIcJxk9Ubj7Daq4H+J0o47ZCZnoM2js3aJA=;
        b=fBPq4TSxnE9KyLHY2ap6BtTz01wrw3MdNu+yEL8yMWWLQRlzDyORMHSmAa/oSdQKuiqppU
        dKv/8wt15mc6GU1z3IF3bs65LVj01pbX8JvDoqOYwHFMa52ddOxyt5Q2tNMxJzFKQxInzH
        e5SdpesNiPm1SfCpd0ax5De1xcHGWuA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-_th0X5yzNOWXLpSLliQ6ZA-1; Wed, 16 Jun 2021 12:00:29 -0400
X-MC-Unique: _th0X5yzNOWXLpSLliQ6ZA-1
Received: by mail-ed1-f72.google.com with SMTP id j3-20020aa7c3430000b0290393f7aad447so1301578edr.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jun 2021 09:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qtoS4RSweIcJxk9Ubj7Daq4H+J0o47ZCZnoM2js3aJA=;
        b=nQqEMYpO+a2I+8QNGJTd/SVIofSrcf/VRL7JUfrW34ifc38rL+QVAKKK06k/jBxLkS
         4EOAe9Nle++zTVDJ9QSIZure4wuGmxjaC0EDbKUJW7yYDddPzGG6VWgaDh1CaUU5U+7r
         35g12ZOfLzcphmArohkfyjvl/CfqGQ4wW+mykw8EPZsiSGwJXtvKjj+AfTMUWT2p4+Cs
         bsNkclY5vSpjilDUUyN4qs31MkFq8JHxiBYa/4Nq1Lx75Qpt9dM0an7WOlBu6slblnbj
         tj8kBzkPhaXAoApFhjrkPiHd6aWssILYumPRUnnFHQEUE41zCJxE+J5EfmTYwBb6xFyl
         CvDg==
X-Gm-Message-State: AOAM5318XG4CPkNV9dieInGq1igccy889K/VJ+7aoH+xtm39B2aJGmYS
        IJlEtnWErkGu/k5Tzqm2sBMnAz7tW3gh+Pegzes/55QvaWwUqfUABHErw0F+sWgBTy0FP3UbX2h
        E+d7xi5H9zjNcZ95sADhoH7y2WlsrvU5n8g==
X-Received: by 2002:a05:6402:510e:: with SMTP id m14mr373482edd.225.1623859227971;
        Wed, 16 Jun 2021 09:00:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5aftk0Vs4L/JrCLqgKlKLDnwHff9fZwzkCuvs9Ff7m+4jdt72bJ5UqPAMEbZ3MrVLoNkGNQ==
X-Received: by 2002:a05:6402:510e:: with SMTP id m14mr373470edd.225.1623859227858;
        Wed, 16 Jun 2021 09:00:27 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h24sm1950316ejf.20.2021.06.16.09.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 09:00:27 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: add support for Acer Predator LEDs
To:     leo60228 <leo@60228.dev>, platform-driver-x86@vger.kernel.org,
        Jafar Akhondali <jafar.akhoondali@gmail.com>
References: <20210615221931.18148-1-leo@60228.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2731fa44-7727-df4a-9214-91a5311ef3cc@redhat.com>
Date:   Wed, 16 Jun 2021 18:00:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615221931.18148-1-leo@60228.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/16/21 12:19 AM, leo60228 wrote:
> The Acer Predator Helios 500's keyboard has four zones of RGB LEDs.
> 
> This driver allows them to be controlled from Linux.
> 
> Signed-off-by: leo60228 <leo@60228.dev>

We only accept contributions under real-names, so you need to
use your real first + lastname here.

Also the GUID you are using:

#define ACER_LED_METHOD_GUID "7A4DDFE7-5B5D-40B4-8595-4408E0CC7F56"

Is the same one as used by another recent patch for adding
keyboard LED zones support for Acer laptops:

https://lore.kernel.org/platform-driver-x86/CAMW3L+24ZGowtpURUbjoCoA+eZMF0wDae1izxS+HM2uz1L9Rig@mail.gmail.com/

I've added Jafar to the Cc here.

So it looks like we have 2 people working on the same driver,
please coordinate between the 2 of you to submit a single driver.

FWIW I do believe that this submission, which adds this as a new
driver for the new UUID, rather then adding extra code to acer-wmi.c
is the better approach. Jafar's version does have the benefit of
also adding support for some of the special effect modes, but
there is still a discussion ongoing on how the userspace API should
look for those, so starting with a clean driver like this, which does
not support the effects might be best for now.

<snip>

I've not done anything close to a full review, but one thing stood
out on a quick scan of the driver:

> +static int __init acer_led_init(void)
> +{
> +	return wmi_driver_register(&acer_led_driver);
> +}
> +late_initcall(acer_led_init);
> +
> +static void __exit acer_led_exit(void)
> +{
> +	wmi_driver_unregister(&acer_led_driver);
> +}
> +module_exit(acer_led_exit);

All these lines can be replaced by a single:

module_wmi_driver(acer_led_driver);

statement.

Regards,

Hans

