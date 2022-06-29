Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34148CCA47F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 29 Jun 2022 08:09:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbiF2IJP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 29 Jun 2022 04:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232648AbiF2IJL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Jun 2022 04:09:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6C1B43BBDE
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 01:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656490148;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7hQQnP6ElkRz6EikrOqVkat5RAwQAYxqOhDbZ9zjeug=;
        b=gfG0m6l+r+FCzpEDS2EiQFlsAKnvq8mqtCofhDWIpWrY9vxQhKBlor+D/0I6Sff4LgcVE6
        xiq4o2Wczk6Kollq3z2axdqoau+n/XIHfvM9sr8a7rF+hy614APO82l00pqmNnQ/fP8wQI
        B81k+d6+GWUxcX+BdlcV5NgBhQbp97Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-VXWMZgYSMHWV6fGcQChyqw-1; Wed, 29 Jun 2022 04:09:05 -0400
X-MC-Unique: VXWMZgYSMHWV6fGcQChyqw-1
Received: by mail-wr1-f72.google.com with SMTP id q6-20020adfea06000000b0021bad47edaeso2182681wrm.20
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 01:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7hQQnP6ElkRz6EikrOqVkat5RAwQAYxqOhDbZ9zjeug=;
        b=AyauklOtC4h5ZKT3duncsAsBos8Q74Q/GJl4j2e5udNm3/OUj7TKKuDgKv8VdfytDM
         QfGx6Ra23xTL9VxUmO1IWWfq5zwXqV192L4T3I0txW/lpGiVjvBxi73OPvDp0dQw0rsI
         DIerUNPMeyrBh8ZRpWWPKlasjTDevDR56/fAhXEKRLwazg09jwkJ0hhCG0UsFhxflRk/
         Lzoleh3Q7IF9tsdYCSrTn4UNBsoAa7SEgLICRN1C+COGXJfYEngdE++0TA7BYI59AF76
         UpUgbf/ForAqWsDM046NYK/mO8wINRJ6KaYMteSzPXne0730j7pVZNME0nqH4MTkR71j
         7f1A==
X-Gm-Message-State: AJIora9XfxPEHywyRTgqwWFYQEAGmntYllBwiFBRGMz7yqbJe5OK/fSx
        t8PGXYWb1efk2b08UQIrxBPheAUIDKe8uR+w5fNFiQPNtbk7BL33ooqFT++Ib4tofexc/EjWwr2
        wX7lGXT09W+WuL7GiDARMdNssj5mEN/iWsQ==
X-Received: by 2002:a05:600c:2246:b0:3a0:4d14:e9d5 with SMTP id a6-20020a05600c224600b003a04d14e9d5mr2201651wmm.70.1656490144654;
        Wed, 29 Jun 2022 01:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1usFW/96xeCeX9gWa5EcwEsowhB540yEb4Gaanj9433iMcJH3n1uDXhdEWzSLPQicn1TmuJ9w==
X-Received: by 2002:a05:600c:2246:b0:3a0:4d14:e9d5 with SMTP id a6-20020a05600c224600b003a04d14e9d5mr2201616wmm.70.1656490144372;
        Wed, 29 Jun 2022 01:09:04 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p2-20020a05600c358200b003942a244f47sm2507134wmq.32.2022.06.29.01.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 01:09:03 -0700 (PDT)
Message-ID: <a5a3e2ca-030a-4838-296e-50dbb6d87330@redhat.com>
Date:   Wed, 29 Jun 2022 10:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Content-Language: en-US
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
        "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
        "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "acpi4asus-user@lists.sourceforge.net" 
        <acpi4asus-user@lists.sourceforge.net>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        "openipmi-developer@lists.sourceforge.net" 
        <openipmi-developer@lists.sourceforge.net>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa@kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <60cc6796236f23c028a9ae76dbe00d1917df82a5.camel@codeconstruct.com.au>
 <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
 <5517f329-b6ba-efbd-ccab-3d5caa658b80@csgroup.eu>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <5517f329-b6ba-efbd-ccab-3d5caa658b80@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 6/29/22 09:55, Christophe Leroy wrote:
> 
> 
> Le 29/06/2022 à 09:23, Uwe Kleine-König a écrit :
>> Hello,
>>
>> [I dropped nearly all individuals from the Cc: list because various
>> bounces reported to be unhappy about the long (logical) line.]
> 
> Good idea, even patchwork made a mess of it, see 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220628140313.74984-7-u.kleine-koenig@pengutronix.de/
> 

FYI, for patches like these what I usually use is:

./scripts/get_maintainer.pl --nogit-fallback --no-m --no-r

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

