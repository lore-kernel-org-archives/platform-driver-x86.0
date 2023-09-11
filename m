Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AA2CA0ECD
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Sep 2023 03:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241773AbjILDNY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 23:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241777AbjILDNK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 23:13:10 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696AA7AB1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 15:21:45 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31f7400cb74so4129014f8f.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 15:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694470818; x=1695075618; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUB9pQ99asoGOgqvxmkpQIQ255CUSXO571C6qXV5/QY=;
        b=WZmUc9JrY0IPOW7Gh8Rx5CrQseWa0TQz5v2oaMBNKn5Q8vNz+PeV/l6red+bjIafHx
         xR960Q2JndLE3C8V0mgCl3pP+b5bGUFf/+Vg7TRv/wOh95y76GKQUomZYf60YmmgQQYj
         EgZDK5hT+wuf7FwyyUHumDbkFn0tHUv1aU8XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694470818; x=1695075618;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUB9pQ99asoGOgqvxmkpQIQ255CUSXO571C6qXV5/QY=;
        b=MxgSfpGj9nIhatLAdTkJBcoumo+sTtNgIoZdRZnlK3VRWvU4UZOWhxMLO4DGWnvAfF
         6WBiXXA9yJ8oESFuoXWa4Z/zn5lqVfsJ0tBHmgUKSRCHIZwsvTi2M+h/a2SZoYACTRY3
         YLwFIPjHkitdFCgm61eVF+JtKFdMDLezGjUxPOYRqmcqLhUTmSOPlLnejsrcKQ0ca0Xd
         zULse/c9ek9jh9HHRNjDKDF2A4kopWFuxz18FvYMLBIYXuA2eTP4GIZ4rMa91yogF0Yi
         ++vA2hpoDFYwzBc2uwIjSDC4jFkOkSNZ3wxbMTj5550KpiZu2Xt5kR/jqWqnUhz9PvbW
         7qGw==
X-Gm-Message-State: AOJu0Yy++WGARKfegnne7MaMXuo9PYFPzrLu1hrRwIZHIoqJOF/iQH4k
        jN7o4nDFYM7APMRdK7kGQax5q4C9XGGr91LKLMB/AQ/zTIL4druG
X-Google-Smtp-Source: AGHT+IHTfh2/l5NDrFmzs478pSCg3HnYRUxWfxEhRfh3L6QE0nsgCzAHcDa28aBNjuW3dNSDxWds+sBGbPakrgojpHI=
X-Received: by 2002:a2e:321a:0:b0:2bb:a28b:58e1 with SMTP id
 y26-20020a2e321a000000b002bba28b58e1mr8678269ljy.41.1694468510418; Mon, 11
 Sep 2023 14:41:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 Sep 2023 14:41:49 -0700
MIME-Version: 1.0
In-Reply-To: <ZP+D4hlUXhAboFBJ@smile.fi.intel.com>
References: <20230911193937.302552-1-swboyd@chromium.org> <20230911193937.302552-2-swboyd@chromium.org>
 <ZP+D4hlUXhAboFBJ@smile.fi.intel.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 11 Sep 2023 14:41:49 -0700
Message-ID: <CAE-0n52Rs05Grmno5g9YPdDS-nwJuSk0dvbg8SF1D52XJczPCA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] platform/x86: intel_scu_ipc: Check status after
 timeout in busy_loop()
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

Quoting Andy Shevchenko (2023-09-11 14:17:22)
> On Mon, Sep 11, 2023 at 12:39:33PM -0700, Stephen Boyd wrote:
> > It's possible for the polling loop in busy_loop() to get scheduled away
> > for a long time.
> >
> >   status = ipc_read_status(scu); // status = IPC_STATUS_BUSY
> >   <long time scheduled away>
> >   if (!(status & IPC_STATUS_BUSY))
> >
> > If this happens, then the status bit could change while the task is
> > scheduled away and this function would never read the status again after
> > timing out. Instead, the function will return -ETIMEDOUT when it's
> > possible that scheduling didn't work out and the status bit was cleared.
> > Bit polling code should always check the bit being polled one more time
> > after the timeout in case this happens.
> >
> > Fix this by reading the status once more after the while loop breaks.
> > The read_poll_timeout() macro implements all of this, and it is
> > shorter, so use that macro here to consolidate code and fix this.
> >
> > There were some concerns with using read_poll_timeout() because it uses
> > timekeeping, and timekeeping isn't running early on or during the late
> > stages of system suspend or early stages of system resume, but an audit
> > of the code concluded that this code isn't called during those times so
> > it is safe to use the macro.
>
> ...
>
> > +     err = read_poll_timeout(ipc_read_status, status, !(status & IPC_STATUS_BUSY),
> > +                             100, jiffies_to_usecs(IPC_TIMEOUT), false, scu);
>
> Since "false" you probably can utilize readx_poll_timeout().
>

You mean 'addr' will be 'scu'? Ok.
