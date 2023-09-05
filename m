Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D834CA101F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Sep 2023 22:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjIEW1e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Sep 2023 18:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243167AbjIEW1b (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Sep 2023 18:27:31 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656F1185
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Sep 2023 15:27:25 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-500c37d479aso4807088e87.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Sep 2023 15:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693952843; x=1694557643; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUOKbypPycGaibquhiHpCbUwj8/Cuiw080z6tXHBtyE=;
        b=DU8PaC+A6PiaCIN0W/5eAIERZW2J7dMciDr95uHg86wdH2ui0csKVJts97Wy+DIemA
         /X96u2PozmXDW6jePcKPnKplGmWsex11kqp0MRWJnCPtO1OB7PoDD0xxKIdou/mRnWjS
         t111Sr5qLvL2X9gRVaQF7tdA3BOQlWsqPqqzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693952843; x=1694557643;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUOKbypPycGaibquhiHpCbUwj8/Cuiw080z6tXHBtyE=;
        b=CKu5+skO/im7HijIvlIFZNFfJfhbk8ui73C0CXk0qQCuHC4xOTZVo0qaGb916t1+rc
         h7A6aHwsr8o8EtTSqwVjXiM+4x3vSbRlOqwOMsUTfpnzEWNsIN+jd+CWI9/kmV2rqEpS
         Yl23IDuw6od+vszBlDzDwsexItAd5ibwWM+fInClqKn+rp4grJK0j1uukBooS9ag6Oxe
         cFY32lNCD59O+OLRgS3uIuXlWUljcWrytAh0XDtn2rM0kgpVi5OfqLnKnFF/aANN0mDg
         ncEopevOJ2a23O2umTgteY5mbW7gBOm+jntTt+eE8tSkNNGF2hlwnm9uWkWuD8+DhDsL
         Tw2A==
X-Gm-Message-State: AOJu0YyxveD0iF8HEQyFJ1gFMjOHrdGeWMm3IzmMQHyC1A/JGE8u1Ou2
        ywHguV0XCgYAvzowZEUKH3tgxwdSIahGOyxvw7yYxg==
X-Google-Smtp-Source: AGHT+IEFY5QAWw0Wz8S+7TKv5jGQ8nerbW6isiVGv1RG13u+enH77qyZg81YHw/ApBgnGwd3cNZNPgH/BHzjwSYFpdc=
X-Received: by 2002:a05:6512:291:b0:4fd:f7a8:a9f3 with SMTP id
 j17-20020a056512029100b004fdf7a8a9f3mr845683lfp.38.1693952843686; Tue, 05 Sep
 2023 15:27:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Sep 2023 17:27:23 -0500
MIME-Version: 1.0
In-Reply-To: <20230901055011.GT3465@black.fi.intel.com>
References: <20230831011405.3246849-1-swboyd@chromium.org> <20230831011405.3246849-2-swboyd@chromium.org>
 <20230901055011.GT3465@black.fi.intel.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Sep 2023 17:27:23 -0500
Message-ID: <CAE-0n50XCw7ugkoTAUfb5Jrr6-Vh=bvXfTOSeHV_ymyOQfRB2g@mail.gmail.com>
Subject: Re: [PATCH 1/3] platform/x86: intel_scu_ipc: Check status after
 timeouts in busy_loop()
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Prashant Malani <pmalani@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Quoting Mika Westerberg (2023-08-31 22:50:11)
> On Wed, Aug 30, 2023 at 06:14:01PM -0700, Stephen Boyd wrote:
> > It's possible for the polling loop in busy_loop() to get scheduled away
> > for a long time.
> >
> >   status = ipc_read_status(scu);
> >   <long time scheduled away>
> >   if (!(status & IPC_STATUS_BUSY))
>
> How can the status bit change here as we are the only user and the SCU
> access is serialized by ipclock?

I don't know how the SCU works. I thought that IPC_STATUS_BUSY bit was
cleared by the SCU when it was done processing. With that assumption, I
tried to show that the status is read and then the process schedules
away for a long time and has an outdated view of the busy bit.
