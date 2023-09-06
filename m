Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A22FEE14C3
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Sep 2023 20:24:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243926AbjIFUYF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Sep 2023 16:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234528AbjIFUYD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Sep 2023 16:24:03 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8636419B3
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Sep 2023 13:23:58 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-501b9f27eb2so1678179e87.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Sep 2023 13:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694031837; x=1694636637; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8vp0InoF118I1Lx55kge76Tlc99H/PzqwsKSdDvIug=;
        b=K/uJEtSbgZ8/EJcNBjwrvnxeRem3GKWhKTXTT4OZrn6zj3/4i60KkazaNO7U3tCxkZ
         0ULXTfrqwY8RbhkPlGnpGTC5R35jn3d/5+SaNTJkf6hB5QRfaXa5lxKsPcLQmZLnieRE
         XLNc2qf6IKIUyj1sD6s8MUg5/UJ9wrA+7z+iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694031837; x=1694636637;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8vp0InoF118I1Lx55kge76Tlc99H/PzqwsKSdDvIug=;
        b=EfBnnWx7ip/uvUIQt95ZS8rbOvc8TAsac6x/4V0jf6kI+7XI9iH0llS9Sj8iN459NJ
         H1GxBUVqnluE/SaMCYARtmcVl2iBASFzLcrzZ0UVmxyKOYle2IoQ/x2t220dEZ8rIso1
         eZcTOoC9AXc0SGKVZBp1+wbGciP6pgVwLkShYfftT/ZAzTuBmVanUAmgiUbGGZ+/mBC/
         G66+wJuruteaSudsO9P5m9E12bjZi/JNpb/GrPajJoBFN7P5gGkm48NiyUVLbS2lM1HI
         zzGzArthEfluWVp41cmnZtg4lorFIWh1a//0sfzxqnp9dc+819jWfIIFrIDbbEte0E1v
         MHSA==
X-Gm-Message-State: AOJu0Yx09QH2jeGyGaLs+MrUcpn0c5rx6ax0Kn7isuNpfrIyZBAwnuCE
        /TkfmVqs1y7C68hDsuJbazeK2iSCVF2j2Da4O47VDQ==
X-Google-Smtp-Source: AGHT+IF91IQYI5GqRkLRbE6KJZwPvsZO4fx9EKPszpEGrDsMSaQQVATEVcB2k3W+rGLwzdLsjPLNriROA4FYiIp2JNc=
X-Received: by 2002:a05:6512:158b:b0:500:b102:d1c9 with SMTP id
 bp11-20020a056512158b00b00500b102d1c9mr226970lfb.29.1694031836716; Wed, 06
 Sep 2023 13:23:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 15:23:56 -0500
MIME-Version: 1.0
In-Reply-To: <1248ebb9-ff14-418a-ae01-cfa5c8ca9d68@linux.intel.com>
References: <20230906180944.2197111-1-swboyd@chromium.org> <20230906180944.2197111-2-swboyd@chromium.org>
 <ZPjbZqIQBlIGpoCK@smile.fi.intel.com> <CAE-0n52REGuVrqG8LUdWzjgqAun7uvDFPJeSkjX02OxD=fUhqg@mail.gmail.com>
 <1248ebb9-ff14-418a-ae01-cfa5c8ca9d68@linux.intel.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Sep 2023 15:23:56 -0500
Message-ID: <CAE-0n53Tqcq8KHaYA8+1_kxy2nPmcRp3t1NK_vAZM=9tfCxqjA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] platform/x86: intel_scu_ipc: Check status after
 timeout in busy_loop()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        platform-driver-x86@vger.kernel.org,
        Prashant Malani <pmalani@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Quoting Kuppuswamy Sathyanarayanan (2023-09-06 13:20:49)
> On 9/6/2023 1:14 PM, Stephen Boyd wrote:
> > Quoting Andy Shevchenko (2023-09-06 13:04:54)
> >> On Wed, Sep 06, 2023 at 11:09:41AM -0700, Stephen Boyd wrote:
> >>>               status = ipc_read_status(scu);
> >>>               if (!(status & IPC_STATUS_BUSY))
> >>
> >>> -                     return (status & IPC_STATUS_ERR) ? -EIO : 0;
> >>> +                     goto not_busy;
> >>
> >> Wouldn't simple 'break' suffice here?
> >
> > Yes, at the cost of reading the status again when it isn't busy, or
> > checking the busy bit after the loop breaks out and reading it once
> > again when it is busy. I suppose the compiler would figure that out and
> > optimize so that break would simply goto the return statement.
> >
> > The code could look like this without a goto.
> >
> >       do {
> >               status = ipc_read_status(scu);
> >               if (!(status & IPC_STATUS_BUSY))
> >                       break;
> >       } while (time_before(jiffies, end));
> >
> >       if (status & IPC_STATUS_BUSY)
> >               status = ipc_read_status(scu);
>
> IMO, you can remove the if condition and read again the status in all cases.
> It is more readable. But it is up to you.
>

I don't really care either way. Just let me know what makes the
maintainers happy here.
