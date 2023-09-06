Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A112FEE14C3
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Sep 2023 20:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243699AbjIFU7j (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Sep 2023 16:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236495AbjIFU7j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Sep 2023 16:59:39 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51AAE9
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Sep 2023 13:59:35 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-500c7796d8eso343022e87.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Sep 2023 13:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694033974; x=1694638774; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nEi+MWXrvIx8jzHRqj96TK8TejuRSgL7GuIT6Vvp9U0=;
        b=kHwWGB08k9FvQC8v2HJrIM2G4326A+d/+494mJSdR1FxMZOJNZuXhuO8V6bc1H8Mid
         0oV7nb1V6HX3CekeVk1CqFxFdWpqPI6idkB2XP+PJAIU0mUHkPuaE79IVzIV9dFpe3MB
         OSFw3X9flfcqFxAs8GYXujqr8kXN4UZwLwBjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694033974; x=1694638774;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEi+MWXrvIx8jzHRqj96TK8TejuRSgL7GuIT6Vvp9U0=;
        b=ZFDk/eTfFRKGt7FEy4ls4Mx2gncUu+yBA3WZLerOmOKbkqBFvFhqJ5q6mgIdozsiNG
         SfsRnw9p4oMOG6I6+nCSduiKVuiUIHEGjSGc93TV7r32nuJiOKTy+M5W/3HlQ8jsmFJ6
         JAIVzNSSHraD9Yu/ybC1GApg1ssEHvvj0NPjSEGUX/b3fgJsuTHFKz1q7sAXABNSCCOh
         wlANsK7VreyAN+JS2NHa3b2aG/rJ41tM0H97Nmwihc4NhvYiq5c4oiQGTlOOCXdHmx1F
         LWlNkTUTwBOzsGtM6XwFBTMFobVqSDkJLj2OjVF/nlO0VbsDd0iudyvdUlXS96RVJmc+
         IPEw==
X-Gm-Message-State: AOJu0YzVv3DpRcDcNsteDn/rodcpQWNgRpHhD4skTi1/UPq/N7lVYQsM
        Do4mXOVQ/Uc1RwFokZLSQoeH8kbecsiZngZQz30kcQ==
X-Google-Smtp-Source: AGHT+IExyQ6B5Nq4kK03+qra5dZ0VH65Eg+voPe+M/hd6T+GvGGoxMqejIJxTzOTvbr11ghTCOdd+KOwOCaSt4hl81w=
X-Received: by 2002:a05:6512:3703:b0:4fe:d0f:1f1e with SMTP id
 z3-20020a056512370300b004fe0d0f1f1emr2918944lfr.25.1694033973824; Wed, 06 Sep
 2023 13:59:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 15:59:33 -0500
MIME-Version: 1.0
In-Reply-To: <ZPjlIhDykHd44YTz@smile.fi.intel.com>
References: <20230906180944.2197111-1-swboyd@chromium.org> <20230906180944.2197111-4-swboyd@chromium.org>
 <ZPjdZ3xNmBEBvNiS@smile.fi.intel.com> <CAE-0n53iGCL3q=CsDKZr28eMjx40miLNG6+-jf12JKMxuAKkKg@mail.gmail.com>
 <ZPjlIhDykHd44YTz@smile.fi.intel.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Sep 2023 15:59:33 -0500
Message-ID: <CAE-0n500OCS0nh_7v_FL1rtTccAJxKhoD8vuBE7AER1fwWihsQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] platform/x86: intel_scu_ipc: Fail IPC send if
 still busy
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

Quoting Andy Shevchenko (2023-09-06 13:46:26)
> On Wed, Sep 06, 2023 at 03:22:43PM -0500, Stephen Boyd wrote:
> > Quoting Andy Shevchenko (2023-09-06 13:13:27)
> > > On Wed, Sep 06, 2023 at 11:09:43AM -0700, Stephen Boyd wrote:
>
> ...
>
> > > > @@ -450,6 +468,12 @@ int intel_scu_ipc_dev_simple_command(struct intel_scu_ipc_dev *scu, int cmd,
> > > >               return -ENODEV;
> > > >       }
> > >
> > > >       scu = ipcdev;
> > >
> > > Side observation: Isn't this a bug? We should not override the supplied parameter.
> >
> > If it is a bug that would be great to know. I wanted to make an API that
> > got the scu if it wasn't busy but then I ran across this code that
> > replaced the scu with ipcdev.
>
> To me this seems like a bug, because in other similar code we don't do that.
> And even reading this one, why do we have a parameter if it's always being
> rewritten?

Yes. From what I can tell looking at commit f57fa18583f5 ("platform/x86:
intel_scu_ipc: Introduce new SCU IPC API") it was an unintentional bug
to leave that line there.
