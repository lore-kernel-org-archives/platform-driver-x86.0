Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE6EEEB56E
	for <platform-driver-x86@archiver.kernel.org>; Fri,  8 Sep 2023 21:30:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236350AbjIHVaF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 8 Sep 2023 17:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233899AbjIHVaE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Sep 2023 17:30:04 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66849DC
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Sep 2023 14:30:00 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso43878661fa.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 Sep 2023 14:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694208598; x=1694813398; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qDdudysz/QEH80r6EgYVihuuCpmrfhapLn+3lG+eMs=;
        b=lk0M8VDSF4dVYW7KUFYFSZvb9khIM4fDolhIf3s+VJCbnJM+5WIgsBlIGxDiWWMjZr
         8ZDu1/fA5C2eP02mlVAwDbqFqsdw4ZfwI38/hxYEhgZ2xHPM5RHvy7/pfNN3Gh3TApso
         W4NwWY/C/2RlCkeIinLQMK2MhB6n2m5C50mr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694208598; x=1694813398;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qDdudysz/QEH80r6EgYVihuuCpmrfhapLn+3lG+eMs=;
        b=Ouml/lQi7Uac989t+SG+O/0xSA1mhB/4/SmDCKGr+XsX1zWmwt/Z4W9LWz45Ls6rQo
         RXFHwfECFrX0t3Df3lSMPh/hwkEvR5uD16jc6afn/7+s9t3tz31C4zCDu9WZ9QR1svmJ
         /hmeCVprRWgXhVkn5M9FeqrL0HE40NBw0IG6TKR+Kcz6hg45eyQc1nHMYT6aRgfa+SVb
         lwJvhNs5yEPRlZCaLEl4IpAVOlgGqjomn0IdY71XUDPdJKTLRWN3VzSfhyKWHXsVT/Nr
         ZN6j4gAhNJXyyMEDKxKp1t0CL2eSM0MSyzdi4iAAQqKFofs1Hw14axFYWUxQpB8BsGO9
         Grew==
X-Gm-Message-State: AOJu0YwnZ0dsD5OeCzBDMoX7DdgxdNGMH1vYqiDQQwkvcU+qB9qVSJlW
        /1hPgzJz/MhLYykxcaLTud4ihjvYAzJZiuo81iLXl5+Naz3mwpzk
X-Google-Smtp-Source: AGHT+IHLxc6Pt+LOz/vNpPU9ODhICc7VbTgK0zhU7UukD8vadAWyMGPJPmRY8v9AfR6NmoYisAx+6DTfyXICbK2T2eY=
X-Received: by 2002:ac2:4839:0:b0:500:ac71:8464 with SMTP id
 25-20020ac24839000000b00500ac718464mr2558487lft.66.1694208598596; Fri, 08 Sep
 2023 14:29:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Sep 2023 16:29:57 -0500
MIME-Version: 1.0
In-Reply-To: <20230908045946.GM1599918@black.fi.intel.com>
References: <20230906180944.2197111-1-swboyd@chromium.org> <20230906180944.2197111-2-swboyd@chromium.org>
 <20230907053513.GH1599918@black.fi.intel.com> <CAE-0n51Ut296M2ZetuzXGpX32pS11bbWzfcbaFfqNxgSjzafJw@mail.gmail.com>
 <20230908045946.GM1599918@black.fi.intel.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 8 Sep 2023 16:29:57 -0500
Message-ID: <CAE-0n52VoAFopSgXiLMoSzBAdSLg4=x3i2R9Agjz5L7o8=1hew@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] platform/x86: intel_scu_ipc: Check status after
 timeout in busy_loop()
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

Quoting Mika Westerberg (2023-09-07 21:59:46)
> On Thu, Sep 07, 2023 at 01:11:17PM -0700, Stephen Boyd wrote:
> >
> > We can't use readl_busy_timeout() (you mean readl_poll_timeout() right?)
> > because that implements the timeout with timekeeping and we don't know
> > if this is called from suspend paths after timekeeping is suspended or
> > from early boot paths where timekeeping isn't started.
>
> Yes readl_poll_timeout(). :)
>
> I don't think this code is used anymore outside of regular paths. It
> used to be with the Moorestown/Medfield board support code but that's
> gone already. Grepping for the users also don't reveal anything that
> could be using it early at boot.

Ok. Assuming this isn't used from paths during suspend/resume when
timekeeping is suspended it look like readl_poll_timeout() is the
shorter and simpler approach. So if that works for you I'll send another
round with that and a fix for the ipcdev being overwritten.
