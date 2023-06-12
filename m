Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C675C7EE25
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Jun 2023 11:15:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234564AbjFLLPn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Jun 2023 07:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239069AbjFLLPT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Jun 2023 07:15:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DA532794
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 04:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686567790;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EEptruzE6IPY73ed8K17p2Qlb5Fdz1X6ts4XdMpwfZc=;
        b=QzPBV7wmKNKOhpGSQ9ZRbwPRz0FHqyfXOiJrAVGI5tiWcBcXr3v1g4m4v4utMVZt7BMpWg
        A76UZ5Qfcofjpf02P6Vux8mo9sKD9xz8fvWvu7bzp3MC4oSD0Ml9aI+2oxSSlUl4WpGlC9
        JCYvbAqQQnkGDOITlQEfAqPlMXmyu+s=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-OHtZBQ77OH2ixoR0wWhU4g-1; Mon, 12 Jun 2023 07:03:09 -0400
X-MC-Unique: OHtZBQ77OH2ixoR0wWhU4g-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4f621c76606so2642863e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 04:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686567788; x=1689159788;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EEptruzE6IPY73ed8K17p2Qlb5Fdz1X6ts4XdMpwfZc=;
        b=JK2s3HG0rEayUiSj6ev8EwR/X8Z2VgVAekLQ/hSVhKrxVphp9uLUX81aWaBZjycJ/7
         qsiPYt+uQOvvcIj0aTI6QkmrLUQ9d4SsBtO7Lo6ZciI0uTmQdBTSM6wxF8UeCUdg+Ppm
         HvH4Hg2fAtC/gYdoK9zGtwg6/BfsxVx7kDXyS+iSGsaJoWTxHWBxpLgsi2CDARK0SYpl
         zlgT/mGYaY9B4umwaAEYITBm3s4Uwix+s25bKXRAfQyHLuLzugYj8HVGj8wDCB/un7m3
         9DyMelnsxmR95Fp0ju/pQMVCB5FZMY+u+RQm856PA44gJNyztI36byuq7UygRvlkPNLd
         1XLg==
X-Gm-Message-State: AC+VfDzOwRdlz46XE/ltvLKbEFUm9zt6jw1f8nnrlhYK50QVv64v4cuL
        MK15r4iOWwgB8SLrPARIcas6nNhpg1qfGB8LZL1SB1/BXrZH+lactWmtc6UWqpRmVfJeMOkL3lz
        /IMRjerHAK9L0gZ08FNchnV85ce2KY9dj5w==
X-Received: by 2002:a19:e00b:0:b0:4f6:4c47:d5fe with SMTP id x11-20020a19e00b000000b004f64c47d5femr3676445lfg.14.1686567787941;
        Mon, 12 Jun 2023 04:03:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ65LIRWt7Bwej+Uorv6rU70T630fT6XOS93kQ5V597hkU2IZE1xcRvQAN+/MrtuhHGPKa9xyQ==
X-Received: by 2002:a19:e00b:0:b0:4f6:4c47:d5fe with SMTP id x11-20020a19e00b000000b004f64c47d5femr3676436lfg.14.1686567787603;
        Mon, 12 Jun 2023 04:03:07 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id n24-20020a05640206d800b005169f9365c3sm4911010edy.20.2023.06.12.04.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 04:03:06 -0700 (PDT)
Message-ID: <632ff03d-52d8-4bb6-9445-bb31823650dc@redhat.com>
Date:   Mon, 12 Jun 2023 13:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/3] platform: Switch back to use struct i2c_driver's
 .probe()
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Mark Gross <markgross@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Daniel Scally <djrscally@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de,
        acpi4asus-user@lists.sourceforge.net
References: <20230612073902.840435-1-u.kleine-koenig@pengutronix.de>
 <6649e0b3-1e59-fc1e-4abc-f9c228406aa0@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6649e0b3-1e59-fc1e-4abc-f9c228406aa0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/12/23 12:51, Maximilian Luz wrote:
> On 6/12/23 09:38, Uwe Kleine-König wrote:
>> Hello,
>>
>> these three patches convert three i2c drivers back to use .probe() after
>> its prototype was changed.
>>
>> I was unsure if I should put the surface change together with the two
>> other x86 changes but as surfaces are x86, too, I thought this might be
>> right. If not: The patches are orthogonal to each other, so they can be
>> applied to different trees without interdependencies.
> 
> While Hans is the authority on that, I believe that's fine. Both go
> through Hans' pdx86 tree.

Yes, all 3 look good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

and I'll merge this into my pdx86/review-hans branch soon
(and after that they'll go to -next once the builders have
had a chance to run their test builds on my review-hans branch).

Regards,

Hans


