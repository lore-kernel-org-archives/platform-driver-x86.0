Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243EECA101A
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Sep 2023 22:42:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232089AbjIEWmd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Sep 2023 18:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjIEWmc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Sep 2023 18:42:32 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C187B6
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Sep 2023 15:42:29 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-500d13a8fafso5341557e87.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Sep 2023 15:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693953747; x=1694558547; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3FWuqZR2Wn3X9VZ8AH7iRg0Yr6/SImaXIioCz91p84=;
        b=gdtyn6dmQC0cNRm74vwmKxDjArsJN6EBKNj3037pRubvyIyP74D6PBoS7rsbhgxq+H
         84vC/I0322pd7L4Ze5qhiYSNCBEiYQ5FQ2cIxfasmJQ/m0Xa01ilO2mFHMq+hpOCUfXR
         1S9lD4A5Qvndj+SiMHbK8rF1ZRQLNiHHu9fIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693953747; x=1694558547;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3FWuqZR2Wn3X9VZ8AH7iRg0Yr6/SImaXIioCz91p84=;
        b=EMi4DjKbkJOZHG5qOeRUHNEV3XMirRPqTgqcwNUjxfPW1QFEk8N9Vezggdgqg+2oQW
         dNRZw0KbtFi8ace7NGUELqjeLSx0e1xsC3pMLk3LjQmVew0uovFjDbl9q8xYIfZAdKQ9
         ihDUhOUdr4nL/1G5L6FF8dhocVyV85ngPdncsnVyqEO9cb+JlIjRBtUYjTK7Bl2MM+6Q
         vL0pZkb+kzDESnKbrrwQrw0ZLYFGfvpqVV5RF6LWFUYr9jHUlww/byz/3sAsHRM03JQD
         MzeVQ9YwqJgz0NEeloJV2O5a4TkA91yYz7V8fEenltSN/UkBwWHECNMleWndCPPVwHqP
         cXKg==
X-Gm-Message-State: AOJu0YypUgFNReqbGEl8tQ+wB9/81694m6Kv4z7qwuo1s733JQ5DO+Q8
        +1xO6cvy6UsbwGLbCaPriKQ/SI+ZovcaZvLqovPgCA==
X-Google-Smtp-Source: AGHT+IFAFTA7ToqE4LPj1zlDe/EZ6SMMTBm5ce+e69KM0+H1Ghgh2PkfFeJBhIhAxnlD514dPoH0B4MpsmAYuo8mZWw=
X-Received: by 2002:ac2:5326:0:b0:4ff:8863:be01 with SMTP id
 f6-20020ac25326000000b004ff8863be01mr863011lfh.8.1693953747163; Tue, 05 Sep
 2023 15:42:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Sep 2023 17:42:26 -0500
MIME-Version: 1.0
In-Reply-To: <20230901060633.GV3465@black.fi.intel.com>
References: <20230831011405.3246849-1-swboyd@chromium.org> <20230831011405.3246849-4-swboyd@chromium.org>
 <ZPCenoPp/SDesUek@smile.fi.intel.com> <20230901060633.GV3465@black.fi.intel.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Sep 2023 17:42:26 -0500
Message-ID: <CAE-0n508ae9ygTNU+HVk08L2zPy85izLLsyNS-DS7d-LPrffNA@mail.gmail.com>
Subject: Re: [PATCH 3/3] platform/x86: intel_scu_ipc: Fail IPC send if still busy
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
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

Quoting Mika Westerberg (2023-08-31 23:06:33)
> On Thu, Aug 31, 2023 at 05:07:26PM +0300, Andy Shevchenko wrote:
> > On Wed, Aug 30, 2023 at 06:14:03PM -0700, Stephen Boyd wrote:
> > > It's possible for interrupts to get significantly delayed to the point
> > > that callers of intel_scu_ipc_dev_command() and friends can call the
> > > function once, hit a timeout, and call it again while the interrupt
> > > still hasn't been processed. This driver will get seriously confused if
> > > the interrupt is finally processed after the second IPC has been sent
> > > with ipc_command(). It won't know which IPC has been completed. This
> > > could be quite disastrous if calling code assumes something has happened
> > > upon return from intel_scu_ipc_dev_simple_command() when it actually
> > > hasn't.
> > >
> > > Let's avoid this scenario by simply returning -EBUSY in this case.
> > > Hopefully higher layers will know to back off or fail gracefully when
> > > this happens. It's all highly unlikely anyway, but it's better to be
> > > correct here as we have no way to know which IPC the status register is
> > > telling us about if we send a second IPC while the previous IPC is still
> > > processing.
> >
> > > +static bool intel_scu_ipc_busy(struct intel_scu_ipc_dev *scu)
> >
> > static int ?
> >
> > > +{
> > > +   u8 status;
> > > +
> > > +   status = ipc_read_status(scu);
> > > +   if (status & IPC_STATUS_BUSY) {
> >
> > > +           dev_err(&scu->dev, "device is busy\n");
> >
> > 1. Wouldn't it exaggerate the logs? Shouldn't be rate limited?
> > 2. OTOH if we return -EBUSY directly from here, do we need this at all?
>
> Agree w/ returning -EBUSY here and dropping the dev_err() (or using
> dev_dbg()).

Ok. I'll change to dev_dbg(). I assume that this should never happen,
but you never know if some calling code will ignore the return -EBUSY
from the previous round and call again while the previous IPC is
processing.
