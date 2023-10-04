Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D4FE7B5E6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Oct 2023 10:22:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242090AbjJDKWt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Oct 2023 06:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242069AbjJDKWt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2023 06:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD3F95
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Oct 2023 03:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696414922;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZOckhT2d20/B3Q1UPonVQaksk/X+wk99lTUJzRh5soQ=;
        b=YYuIwt9zXudnvCd1wOKntJBk1lhnsKk8yNgbrfaUiUY9dxjN9op4QjwRxVFqcXEzwc9YfD
        6zfp6NCctAUAsWdDf6uIZnfr5WysJc+o/0/NaINXCGBh+NrfKwR+IWLuSIUo66gNvxZPKv
        QFmtpO/IiqLIoM8OAJ95M+fhdBSJFzQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-7KDyKsjOMPexWAbJoPJGeg-1; Wed, 04 Oct 2023 06:22:00 -0400
X-MC-Unique: 7KDyKsjOMPexWAbJoPJGeg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9a621359127so176749566b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Oct 2023 03:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696414919; x=1697019719;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOckhT2d20/B3Q1UPonVQaksk/X+wk99lTUJzRh5soQ=;
        b=IgoXtCSo+KwiDtRbtfOAxY7tqv1HU2Iy7PE9zJHiRBh83+dl7+SGvndJ2j+pxfVwY8
         wYfQ5CH1lNFL1qk0GUA2bBZmUbIh+7gxwIMRtqIZSwaKEfAvoysfrFdc8z8RwMX+9Rq3
         IExxv1VH+OcLZ7HZ2DHp104/ufPotYgRwQTeJWIhKNdRGeQZ27TT8Jkz0oGrbmKmtr90
         TFB4Fy4JorB+h7hmLcCjJS3NaLY/FUrWY1LAxBlBrcgdwVUYes7UaOCSP53hK8jTcr0F
         L0XEsJcusg6LP5bhP5/UVosgfbz0cyGcAyNSngDwLoKDL2ICbZKYPlsEBQNs5DqI3KMk
         AMzw==
X-Gm-Message-State: AOJu0YxyehFln7KdTfCGJfdOibV1J7dO0y7jE2/nniFaOpN3PluKm4o4
        zF60gJDiKjHBa3z3Of+LV1axUnprTIbGVoW66we0cuHpzTv14LTAuaY5s8hp9nk8qA0pgItYd5a
        85Bcq38CQNPYcJQAAGpaQKvZl/Ri47jgrmIyF3Dx1Sw==
X-Received: by 2002:a17:906:cc0f:b0:9ae:5120:514c with SMTP id ml15-20020a170906cc0f00b009ae5120514cmr1741453ejb.0.1696414918854;
        Wed, 04 Oct 2023 03:21:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXql19UMEo0QZH90ly32+44GXWoYc8emudAuHUM8QSG+m7jhnnVjrADhOqDH4X+30xAJmnzQ==
X-Received: by 2002:a17:906:cc0f:b0:9ae:5120:514c with SMTP id ml15-20020a170906cc0f00b009ae5120514cmr1741443ejb.0.1696414918502;
        Wed, 04 Oct 2023 03:21:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l5-20020a1709061c4500b0099ce025f8ccsm2538090ejg.186.2023.10.04.03.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 03:21:58 -0700 (PDT)
Message-ID: <68e89309-77ab-4852-babb-a68a9b60ab75@redhat.com>
Date:   Wed, 4 Oct 2023 12:21:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the BUSH Bush
 Windows tablet
Content-Language: en-US, nl
To:     =?UTF-8?Q?Tomasz_=c5=9awi=c4=85tek?= <swiatektomasz99@gmail.com>
References: <24afb7c4-1ea4-44bc-957d-f019b3684bc3@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
In-Reply-To: <24afb7c4-1ea4-44bc-957d-f019b3684bc3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Tomasz,

On 9/24/23 14:28, Tomasz Świątek wrote:
> It was tested using gslx680_ts_acpi module and on patched kernel installed on device
> 
> https://github.com/onitake/gsl-firmware/pull/215 for the firmware
> https://github.com/systemd/systemd/pull/29268 for systemd proper screen rotation support
> 
> Signed-off-by: Tomasz Swiatek <swiatektomasz99@gmail.com>

Thank you for your patch/series, I've applied this patch
(series) to the pdx86 fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in the pdx86 fixes branch once I've pushed
my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



