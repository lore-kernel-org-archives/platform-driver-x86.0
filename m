Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E062CA101E
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Sep 2023 22:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238072AbjIEWYk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Sep 2023 18:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239218AbjIEWYj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Sep 2023 18:24:39 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40EAA191
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Sep 2023 15:24:31 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5007f3d3235so4835342e87.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Sep 2023 15:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693952669; x=1694557469; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYhc2Ab3VZYZ8IlYXlqDSrtZZTVSJAYsW6CaMnCEvOs=;
        b=fJSIIJVchoB7n5gLLbTZacHcpY77kdZ0865xIwjRn3YmnV5IzVdxJIIwW+LPfSd/6H
         WmQBbKvRwW5pgmfHOhGX1ldV82KMqJRXckAKILv5usKPEwLX8tvzdeDqXqyGaKApqAw8
         5X6Uso/Ccp/T0hZA2kx4r12bw76OUAycr7TEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693952669; x=1694557469;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYhc2Ab3VZYZ8IlYXlqDSrtZZTVSJAYsW6CaMnCEvOs=;
        b=cvfTFGWi+8og17y+14iFgk+nzqx+w69a57bbc79vdbD43UzjGQL+PtzA7FZsVFxu/Y
         ARQdUtLsKSPv3RANwIpaYds1a4XFA5uM+wjRcbEd84p1fZCG9DyTSC3r6TpnKUX+gmyx
         ymd2NASTr4eqq6pMclfYHdQ22KEZ/TO7Rif4wvonH7AF01urynD1ng5eyjAUu4G8xp6z
         4JFUD0kMsPrEwRxQ/beR4pVK0sAJP/uCFeQMfHKLTBecGnWPkH3CubHaVVJzH4RRfD4X
         T8Y+L86i6NSgy2t/c7mILq43j3gPtC4vC/06SRInRRISWsGmMR3kcQzRmtCwF7Cbpzow
         r2Rg==
X-Gm-Message-State: AOJu0YzfAD2OUDggbEaMuOpN53YK/E8ZnAwTkuqd/b4e9MaVf4KHJnoS
        urotymUE+O9lgcsRfs1lCEWge5JWFJu9qf+K48oMNAuMlDu6XFZu
X-Google-Smtp-Source: AGHT+IEaJFDN/Ujwzx4KejG+aid9NsVzxVXssaZhS2Q/zd9KxlbT13Wu7F94SUSUesxv5jh0Q1PZ3bqmbbOc3qbXw0A=
X-Received: by 2002:a19:7913:0:b0:501:b960:e1af with SMTP id
 u19-20020a197913000000b00501b960e1afmr732260lfc.23.1693952669541; Tue, 05 Sep
 2023 15:24:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Sep 2023 17:24:29 -0500
MIME-Version: 1.0
In-Reply-To: <ZPCbSse3J6ksZwJa@smile.fi.intel.com>
References: <20230831011405.3246849-1-swboyd@chromium.org> <20230831011405.3246849-2-swboyd@chromium.org>
 <ZPCbSse3J6ksZwJa@smile.fi.intel.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Sep 2023 17:24:29 -0500
Message-ID: <CAE-0n52wAqsmm4cs6JX2W2G10VxjLzocXVmF9c_GC+52Fi4djQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] platform/x86: intel_scu_ipc: Check status after
 timeouts in busy_loop()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        platform-driver-x86@vger.kernel.org,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Prashant Malani <pmalani@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Quoting Andy Shevchenko (2023-08-31 06:53:14)
> On Wed, Aug 30, 2023 at 06:14:01PM -0700, Stephen Boyd wrote:
> > It's possible for the polling loop in busy_loop() to get scheduled away
> > for a long time.
> >
> >   status = ipc_read_status(scu);
> >   <long time scheduled away>
> >   if (!(status & IPC_STATUS_BUSY))
> >
> > If this happens, then the status bit could change and this function
> > would never test it again after checking the jiffies against the timeout
> > limit. Polling code should check the condition one more time after the
> > timeout in case this happens.
> >
> > The read_poll_timeout() helper implements this logic, and is shorter, so
> > simply use that helper here.
>
> I don't remember by heart, but on some older Intel hardware this might have
> been called during early stages where ktime() is not functional yet.
>
> Is this still a case here?

I have no idea if that happens in early stages. What about
suspend/resume though? I suppose timekeeping could be suspended in that
case, so we can't really check anything with ktime.

I can rework this patch to simply recheck the busy bit so that we don't
have to figure out if the code is called early or from suspend paths.
