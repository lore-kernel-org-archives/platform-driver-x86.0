Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E77C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Nov 2022 17:24:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbiKARY0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Nov 2022 13:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiKARYZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Nov 2022 13:24:25 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D76120BC
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 10:24:24 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id t25so38803137ejb.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Nov 2022 10:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uI6kpWIoJxkOMk1R26NK02/okOguX+poh3iNl8T8BbY=;
        b=bDSNrrXeg9qyQlzb8dF2Cu9wziw0kx0uUv/+Vn8hkvB26FVea8iZsZzZ7GgAtRdJUS
         n5biy6LDqqrKP92AgGqWGE5CJ1Ib/P1258GOTT+ZVuhH1fNrD5CJuzjn0htgWUzsXFt2
         4IfDCFlBNefKoj7ro9bAZBqX7w1PneCcJc/jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uI6kpWIoJxkOMk1R26NK02/okOguX+poh3iNl8T8BbY=;
        b=0tF2u210uT49/dcfo5Bs/EK7ePBixBFYbDO08bvDH7DOC895s43DUjkVH9m3HUG981
         1xi6Mu8XSJL3dpM1pC3I6ZY/OoL3aSg0r0CDZuUvm3ETmn19Q4u+tQUwiEabivPCA21X
         DW5N3B7pXscBWkgenLC2Y59xtQ7Y2RWuJGo61+3qVvPKxtlvGlbzM3/HcwlpW1DIaopz
         lD7Ldukgtd6IWz5mi9WQ9nkTV3RuQ2qF9Rsri3bHPRPCfy7cDB/JGEXp846ctDBiZ4/H
         BUS7X6K/grCU8sGhO5NOCBIi1L4YyrcM7EMRZgwQe+QubwS033Jm2AqLR/y90EZJfquf
         58DA==
X-Gm-Message-State: ACrzQf2rgvhiCx/KtCl9tZLXJX8Qb+VyFbmyLN9jCmDzL2pGnbliksbk
        56zghp/298HJx2B407Dy9p9n4iABncubCu7J
X-Google-Smtp-Source: AMsMyM4T59eNaX54SePf+DowYSIIthPcOqX7nUiKO9XBM/8jX8idvGY1sYfE0L6KvVT2Nb1n6zuPMg==
X-Received: by 2002:a17:907:802:b0:781:8017:b2df with SMTP id wv2-20020a170907080200b007818017b2dfmr19334335ejb.606.1667323463293;
        Tue, 01 Nov 2022 10:24:23 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id f14-20020a056402150e00b004610899742asm4691431edw.13.2022.11.01.10.24.22
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 10:24:22 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id n12so38680074eja.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Nov 2022 10:24:22 -0700 (PDT)
X-Received: by 2002:a17:907:96a0:b0:7ad:960d:1789 with SMTP id
 hd32-20020a17090796a000b007ad960d1789mr19755941ejc.305.1667323461701; Tue, 01
 Nov 2022 10:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221027151908.v1.1.I295e65357f06f162b46ea6fc6c03be37e3978bdc@changeid>
 <4b7304c0-8dd5-9add-7c84-4e9f0aa9396b@redhat.com> <MN0PR12MB6101BCCA364437A76FED924AE2339@MN0PR12MB6101.namprd12.prod.outlook.com>
 <CAG-rBijvNoN3ppz6bdkEUofYPPBxCtFfo1nWBK5TdG69fcKMnA@mail.gmail.com>
 <CAE2upjS6qRGRcuVYuAB5DMf66A7VcfCKKYEkpsr1My7RnKDFtQ@mail.gmail.com>
 <CAG-rBihDRq1y61tAp56yYCoTOSZXO9OZNzn7gXb_y8XaiO_zqg@mail.gmail.com>
 <MN0PR12MB610109F448E3FC8CE71FBA76E2379@MN0PR12MB6101.namprd12.prod.outlook.com>
 <CACK8Z6E7=xt118d47FTpmgKHgUBgH48FQzTi5iL90C3MjHb-3Q@mail.gmail.com> <29e7c8f5-0784-6501-e3fb-f2ab33d3f438@amd.com>
In-Reply-To: <29e7c8f5-0784-6501-e3fb-f2ab33d3f438@amd.com>
From:   Sven van Ashbrook <svenva@chromium.org>
Date:   Tue, 1 Nov 2022 13:24:10 -0400
X-Gmail-Original-Message-ID: <CAM7w-FUTHEAis-F3bDWSsxzQdT-koD-UO54ee9NzbBpKiQhPzQ@mail.gmail.com>
Message-ID: <CAM7w-FUTHEAis-F3bDWSsxzQdT-koD-UO54ee9NzbBpKiQhPzQ@mail.gmail.com>
Subject: Re: [PATCH v1] platform/x86: intel_pmc_core: promote S0ix failure
 warn() to WARN()
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Rajat Jain <rajatja@google.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "rrangel@chromium.org" <rrangel@chromium.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Rafael J Wysocki <rjw@rjwysocki.net>,
        David E Box <david.e.box@intel.com>,
        Mark Gross <markgross@kernel.org>,
        "swboyd@chromium.org" <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Oct 31, 2022 at 4:55 PM Limonciello, Mario
<mario.limonciello@amd.com> wrote:
>
> I just spun together an RFC series for this idea and while doing it I
> had the same realization.  So I left the warning messages in place for
> both drivers.
>
> You can take a look at the series here:
>
> https://lore.kernel.org/platform-driver-x86/20221031204320.22464-1-mario.limonciello@amd.com/T/#m6c7db55c98b8a3ce8c48d451fc01c1d9b0df37fb
>

We've had some internal discussions within ChromeOS intel big core,
and we believe this is a worthwhile effort, and we are supportive, as
long as our current S0ix fail detection will not break for the
foreseeable future, i.e. as long as the warning message and register
dump stays in place. Which is the case for your RFC.

+swboyd@chromium.org who expressed interest in doing something similar for ARM.
