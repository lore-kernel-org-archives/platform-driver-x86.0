Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A28AC001DE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 Jul 2023 12:38:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjGaMiI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 Jul 2023 08:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232783AbjGaMhy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Jul 2023 08:37:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4762F10FF
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jul 2023 05:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690807016;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GOFjSuz+nzO0XVUy4hfdNTLjsQdAMvC2f0+2gyXsjM0=;
        b=fkC/aUVNYpE64JurGvOthZoMjJ2Qfn+QqSzfw6CsweSjTEurZwtijdkqvdcKER2eR4Cjs9
        1S+L9a4SbfJRcAsv29chJugimdt4I0R2wSdLnRNeKAcsF+BY35GJiSJe7kakoccOrrNjcf
        iEeEDfSm6vba5gEQ2oiQIGs9+DG5mOY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-QuyWkI4PN2WDJEm7RGAVFg-1; Mon, 31 Jul 2023 08:36:54 -0400
X-MC-Unique: QuyWkI4PN2WDJEm7RGAVFg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-51bef8bb689so7606012a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jul 2023 05:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690807013; x=1691411813;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GOFjSuz+nzO0XVUy4hfdNTLjsQdAMvC2f0+2gyXsjM0=;
        b=CiCTlzLwKi7t4XcTAGCu1vWgaG3L+WQ863ksVi7zNGmVdz7IgougNBnwhgnuboSDvF
         aYkDyV4PBFdQ0NLowzBiEZt8cg2+WpuW6uPKPUQnY/NEbv5uxmKZQp2jLEhCszx2g7qE
         PM3TxiydHRKpcDT4KyNvuYJdWReXN9wjbOnoCpu5Ddho04DgnS+ULrYOFLdCwBvqEU/w
         HUEd9AGP9f45izDvjAjd4pKrYNNrEcSlGQ5K1ETtkweBXPA6rNLbMre4mv3rvhp7NHHP
         RIRWNdDS6DtuzJV/wctdNRsQcLF6l9sGhxM0uwaFyaMd8BqF1BAw6SRzLm/1sI6lOCT4
         R1JA==
X-Gm-Message-State: ABy/qLbJjvYxDdnA6+xqMB6yYXOkLH4sHXD/RnkYg1US0TnWavzNNw0A
        uGrTfNfz1iSKnTa8aKUN/xcKJs4GuqFOpHnUvTSy9SaiCQNjpJrq4OE8XuCyKNYB+lMTfB4noTs
        LaE/FdMUh6ItWtXkibAMu0RzJnGGveBOg8g==
X-Received: by 2002:a50:ea82:0:b0:522:3a54:1c05 with SMTP id d2-20020a50ea82000000b005223a541c05mr11936281edo.5.1690807013574;
        Mon, 31 Jul 2023 05:36:53 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEsWInA7GJjO2YOR6fGzgFfUxuF4KQw7pGEuJcvlvlcgQUSMGtQLI2sVc55Zur0oqFTTno/Dw==
X-Received: by 2002:a50:ea82:0:b0:522:3a54:1c05 with SMTP id d2-20020a50ea82000000b005223a541c05mr11936260edo.5.1690807013228;
        Mon, 31 Jul 2023 05:36:53 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id y19-20020aa7ccd3000000b0051d9ee1c9d3sm5370905edt.84.2023.07.31.05.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 05:36:52 -0700 (PDT)
Message-ID: <aea56ab4-e965-204c-4df1-040323c341f9@redhat.com>
Date:   Mon, 31 Jul 2023 14:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] platform/x86: simatic-ipc: add another model
 BX-56A/BX-59A
Content-Language: en-US
To:     xingtong_wu@163.com, markgross@kernel.org,
        andriy.shevchenko@linux.intel.com, lee@kernel.org,
        xingtong.wu@siemens.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gerd Haeussler <gerd.haeussler@t-online.de>
References: <20230731071424.4663-1-xingtong_wu@163.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230731071424.4663-1-xingtong_wu@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/31/23 09:14, xingtong_wu@163.com wrote:
> From: "xingtong.wu" <xingtong.wu@siemens.com>
> 
> These are patches adding features for another Simatic IPC model
> BX-56A/BX-59A, features for led and battery monitor are involved.
> 
> Based on:
>  [PATCH v2 0/3] platform/x86: move simatic drivers into subdir
>  [PATCH v2 0/2] leds: simatic-ipc-leds-gpio: add new model BX-21A
>  [PATCH 0/2] platform/x86/siemens: fixes for CMOS battery hwmon
> 
> xingtong.wu (3):
>   platform/x86: simatic-ipc: add new models BX-56A/BX-59A
>   leds: simatic-ipc-leds-gpio: add support for module BX-59A
>   batt: simatic-ipc-batt: add support for module BX-59A

Thank you. I have merged patches 1/3 and 3/3 into
the platform-drivers-x86-simatic-ipc branch now:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=platform-drivers-x86-simatic-ipc

Lee, I'll send you a pull-req for an immutable tag so that you
can merge 2/3 into lee/leds.git .

Once I've run some tests on this branch the patches there will be
merged into the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans






> 
>  .../leds/simple/simatic-ipc-leds-gpio-core.c  |  1 +
>  .../simple/simatic-ipc-leds-gpio-f7188x.c     | 42 ++++++++++++++++---
>  drivers/platform/x86/siemens/Kconfig          |  1 +
>  .../x86/siemens/simatic-ipc-batt-f7188x.c     | 37 +++++++++++-----
>  .../platform/x86/siemens/simatic-ipc-batt.c   |  3 +-
>  drivers/platform/x86/siemens/simatic-ipc.c    | 12 +++++-
>  .../platform_data/x86/simatic-ipc-base.h      |  1 +
>  include/linux/platform_data/x86/simatic-ipc.h |  2 +
>  8 files changed, 80 insertions(+), 19 deletions(-)
> 

