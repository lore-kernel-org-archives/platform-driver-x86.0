Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589F8EE14D0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Sep 2023 20:22:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244398AbjIFUWv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Sep 2023 16:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244326AbjIFUWv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Sep 2023 16:22:51 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3D7C19A6
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Sep 2023 13:22:45 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bcc4347d2dso4909721fa.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Sep 2023 13:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694031764; x=1694636564; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxKCsV8R8YrR5Gy4S8qpXFuMk6MLJhqEnRXr9jkGcto=;
        b=EhfnE2/SPpAjyK8S4cYUaToslBQkg4F8mbbZkbSAjaz4G9VDCAE04tBN4H/3Mji1O7
         P18hBCHGL96otMv4HbyqPUtF7RSppICJaOK8awnHlN0wBr+1D77Qsc3bLyz3b3Rudh1G
         VfPB2uAv8Se9parOuwKzAJcCzhbeFRYiDCQ5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694031764; x=1694636564;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxKCsV8R8YrR5Gy4S8qpXFuMk6MLJhqEnRXr9jkGcto=;
        b=jNet/N8sVF6VhNuVxImeNTsrmR2Fw4cYF4MmqRQNJISp0WlsVSlH7GxPC6FUdz7USP
         xXKre5wH2UExBjUHvKABSJrLShZM5/DUtpu4IazKZlxQJNJSOvW7ZvN3sLrkDo+7B4RU
         UReygTFmU7fOY6QzkMOU8wZs4K2KlkaIOhUDl1YBJhS957DlW2l4aGR0bl4jccOlKYv2
         kQo3IEqFgtMjfWFUjs/HWFU1GFNs1fdKRQhdDsq0Eu2l9J/cFcCOoxmzeeF9DW68YImd
         B6XXRhftHtEqscgcmVTpK2ZfRGbPVIlryUpjjMhOuV0Dm7vug0DyrjTIzEAbdpQKxUwi
         UqKw==
X-Gm-Message-State: AOJu0YwKIWCH23E6bbpGodDlf2emHSea0Vg2EbyEyOEAPZ4F90fsZJEI
        MmJ6rl+5EqjKHuw1V5Kl+xsAJAAbTZMSxI/RETW94g==
X-Google-Smtp-Source: AGHT+IEmvetndVdOFFwz7V6Ymy0S4rpC+9TPoqGCwOVPobwU6fcOpZdLTjsBJP1lmQrg+aBzt/1Fql+MvEJ3cIL85Eo=
X-Received: by 2002:a2e:8756:0:b0:2b6:e2aa:8fbc with SMTP id
 q22-20020a2e8756000000b002b6e2aa8fbcmr3268617ljj.8.1694031764129; Wed, 06 Sep
 2023 13:22:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 15:22:43 -0500
MIME-Version: 1.0
In-Reply-To: <ZPjdZ3xNmBEBvNiS@smile.fi.intel.com>
References: <20230906180944.2197111-1-swboyd@chromium.org> <20230906180944.2197111-4-swboyd@chromium.org>
 <ZPjdZ3xNmBEBvNiS@smile.fi.intel.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Sep 2023 15:22:43 -0500
Message-ID: <CAE-0n53iGCL3q=CsDKZr28eMjx40miLNG6+-jf12JKMxuAKkKg@mail.gmail.com>
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

Quoting Andy Shevchenko (2023-09-06 13:13:27)
> On Wed, Sep 06, 2023 at 11:09:43AM -0700, Stephen Boyd wrote:
> > It's possible for interrupts to get significantly delayed to the point
> > that callers of intel_scu_ipc_dev_command() and friends can call the
> > function once, hit a timeout, and call it again while the interrupt
> > still hasn't been processed. This driver will get seriously confused if
> > the interrupt is finally processed after the second IPC has been sent
> > with ipc_command(). It won't know which IPC has been completed. This
> > could be quite disastrous if calling code assumes something has happened
> > upon return from intel_scu_ipc_dev_simple_command() when it actually
> > hasn't.
> >
> > Let's avoid this scenario by simply returning -EBUSY in this case.
> > Hopefully higher layers will know to back off or fail gracefully when
> > this happens. It's all highly unlikely anyway, but it's better to be
> > correct here as we have no way to know which IPC the status register is
> > telling us about if we send a second IPC while the previous IPC is still
> > processing.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Also see below.
>
> ...
>
> > @@ -450,6 +468,12 @@ int intel_scu_ipc_dev_simple_command(struct intel_scu_ipc_dev *scu, int cmd,
> >               return -ENODEV;
> >       }
>
> >       scu = ipcdev;
>
> Side observation: Isn't this a bug? We should not override the supplied parameter.

If it is a bug that would be great to know. I wanted to make an API that
got the scu if it wasn't busy but then I ran across this code that
replaced the scu with ipcdev.
