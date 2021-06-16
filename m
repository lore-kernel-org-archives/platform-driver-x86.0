Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758D0C48BE5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 00:24:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DF246109E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 00:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbhFPA0W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Jun 2021 20:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbhFPA0W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Jun 2021 20:26:22 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3D5C06175F
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jun 2021 17:24:17 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id i68so870365qke.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jun 2021 17:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=60228.dev; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oCM9AZZ4yGdIuE0IFXRCADnpIOQSrGcB2qvMMLB3nDY=;
        b=CSfTNYfqEkCO03cuXkuqmseuhHxpZ7BX9s2VNPsdln4DDTuxbYJlYgfpE0LgXnV/dP
         Tp0fTXKWw6sJgc4dB3XuzAAQS5MV+xxiHX7yjMgUx7hUu6E84r5yeKAnzgF/B6jDk97v
         VdS+sNHpu/pJJw85DbkT2IbluWD52icrtW3fgpIo8kLPH/28z8wWkmlnlIJj7VKr4GTw
         tjLSH03Xsyh82js10qjPObVJDcYR5HsQ540gNhuH7+h41SigPtcc/48oMWI4vp7dtYHc
         Kl/EAT2IJW9WtW4OWEK/8s7Fkjyd0n7ff54GUO+uUZ7hnFo31m/z0LrXSOprpYJSm4My
         P2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oCM9AZZ4yGdIuE0IFXRCADnpIOQSrGcB2qvMMLB3nDY=;
        b=ZW4R6b7BL5D99Urhm9QNIyuZBttyttRWVm4jof9IwKp9c/o6lp8xpi1VuUeC4k0klZ
         lSpcbmk/aQIHcM3i660bp7B1njZx0NqAn5fTUMvcIf2jpOAuMT9C+kBQsA7hfh+5xgHW
         4XPIZ0xPZRTZ4yyGSq1qR+/FmB1r0HAGygUILR5Hobjzy/f4bttWb+ve7Tvkz9mhtu02
         gDsH5n7CzfjhXLlAItw6m9F/pxWsifLWjkXjFeSrVuyq0Hnw/JHCIffvwuiT4vCZ1QCM
         MJUJCGuorDV8WGOVM4+Qbgx/Ph8Et1suU/P6uxijgOaYQ6Gy4k/AotRW6Ly4CuMlG/0D
         QYhQ==
X-Gm-Message-State: AOAM532FAZzFwZ57zORkmQvyZIFS76BgcpK9dnl7+P7lHR/a/r3rayRv
        Lq9Szubz07Ala2nkx+u0KsspJA==
X-Google-Smtp-Source: ABdhPJwEZ6CEoG2/NFd8wKqduV4VZSlGykM4ULXZpUzzmQKqHxRYY66RdYpzxIFOa5/PnLg2MatvwQ==
X-Received: by 2002:a37:a115:: with SMTP id k21mr2389973qke.255.1623803056427;
        Tue, 15 Jun 2021 17:24:16 -0700 (PDT)
Received: from [192.168.1.107] (cpe-158-222-150-74.nyc.res.rr.com. [158.222.150.74])
        by smtp.gmail.com with ESMTPSA id t139sm467632qka.85.2021.06.15.17.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 17:24:16 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: add support for Acer Predator LEDs
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>
References: <20210615221931.18148-1-leo@60228.dev>
 <YqTP_mhFNQj00M90V9BqAinqDdpQt3Wuu7i6OmgckNDSo0l7htySl7jVBDbA4pHJ5DEH_SGAEGCHgBN1ubghTAcc7ct9AOfD8Nd-KLZFeyc=@protonmail.com>
 <CAPRrO0xZunTfYYSOg-Gvk18FMHPufAURZ=fWjQN1bmP=RuuzGA@mail.gmail.com>
 <3f55eOZ-dLlO0h_YujLrKA1nb5Eg7ztJv6xAse-hRh4_KB8FnidmSGpbkq6KbfpWWAKgG2iU1oziplZWlnPJzAd_on96IFXR6SpuTzPlG9A=@protonmail.com>
From:   leo60228 <leo@60228.dev>
Message-ID: <2e3b08fb-8066-9898-789e-4e4abd8b4bf2@60228.dev>
Date:   Tue, 15 Jun 2021 20:24:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <3f55eOZ-dLlO0h_YujLrKA1nb5Eg7ztJv6xAse-hRh4_KB8FnidmSGpbkq6KbfpWWAKgG2iU1oziplZWlnPJzAd_on96IFXR6SpuTzPlG9A=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 6/15/21 8:21 PM, Barnabás Pőcze wrote:
> please use "reply-all" in the future when replying so that all participants
> receive the email.

Will do.

> I'm not entirely sure what you mean. I'm not aware that LED multicolor class
> devices would be instantiated from 3 ordinary LED devices - although it's possible
> I have missed it.

I misunderstood the docs, I looked a bit more into it and I've figured 
it out. I'm working on moving the driver to use that, thanks for the tip.
