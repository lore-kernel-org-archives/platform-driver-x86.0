Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6865C64ED6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 10:28:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjCAK2R (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 05:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjCAK2Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 05:28:16 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 996AD22A11
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 02:28:15 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id nf5so8884581qvb.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 02:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPw3riMWtpQDNyilr6rDtyVPvXvT2YQPWAi//HB8wmw=;
        b=O5aYAaQgsV5pQHyX0nGEYL8tm6RedvDt+qKfypDZPVsxt2muNMtC5zz2E/aTGc7/IK
         OmZbqYhWW3BXCpPsHxUIDSJY1JQwIYx/rgPgMO9eH0sUDkxHLwwLl5mA5XsS2Nk5TBDv
         GywWHJ+S2f+WAzV/D9YpvW4WzVXX7Us89GLJhRLu+oOMgIRhnbi2AYd3GmSsLpAhD+HM
         FsGGDu83Yh8JkXB6EJ50kI9z/FhFpLw/gyxhyxzvJBLhDGiEK7Iy1aSaE7gkafsCnB1R
         f1SHXLNgNveYFlPrAd4yjkgIGb17ubgKK1jCM75m8dkAr3sehDpAJs0Rcvsx/u/YfTHl
         jtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPw3riMWtpQDNyilr6rDtyVPvXvT2YQPWAi//HB8wmw=;
        b=fCQqNsiTW7uBTtjn+VbyDhvG1sGyxlNu2kMnckU2ueY5Wtq6GVsg/zHmIRBgB4Ae9P
         CM1iD2tMkrzS320yeorVCoyrIUO0ocQsuRFIwuwvB7bh2PmVkDYAL075tyAKDEaky4eC
         TyINKooL1+UP+J0ahlPeI71LEvK9in/xDhJb5k/uJN76w7XfxTGgToq3HjBtbAI5Tdhb
         pN2nlgAOJH0AJ+1AZRWHA4ekAIECHnnV0K6vbgae6QWbjEnD5IqRwPLIChbnu0jdfa1q
         3ACwChXaKcknIXHP/a+mkcqlHFLZPzbxxj8X6hQSH2OQBFCcaVwY7H4pJYfYj6MQRAm3
         Njww==
X-Gm-Message-State: AO0yUKXGTwMNklGdgHsfNLmbn4me508tyB04kHIobpO/Jb7l6cA2lHtH
        uTfd5AR85wf20AURiWGEyKlc/qXv0dEaQRYfo4lzUlpvc2E4Rg==
X-Google-Smtp-Source: AK7set/Q9npJA0gjNVPQukHMwhDEnu7BP5qluJsPvaOd4fX3eVHBNG1R0PGXV+sHFQr7cCxYorM+zzVwijkz4/GYXZE=
X-Received: by 2002:ad4:4b6f:0:b0:56f:fe44:f257 with SMTP id
 m15-20020ad44b6f000000b0056ffe44f257mr1705739qvx.1.1677666494719; Wed, 01 Mar
 2023 02:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20230301092331.7038-1-hdegoede@redhat.com> <20230301092331.7038-5-hdegoede@redhat.com>
 <CAHp75VeGF7M76qGpkjcZrWFd-yGmBMaxcvbftUtE6wU9ywFMgQ@mail.gmail.com> <345ced66-f4ad-58ba-5c55-12e9217e20e3@redhat.com>
In-Reply-To: <345ced66-f4ad-58ba-5c55-12e9217e20e3@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 1 Mar 2023 12:27:38 +0200
Message-ID: <CAHp75VcoHwWMfq8PqQiXJbx00dnv-A07w_Z4LymKm641TR2y+g@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] platform/x86: x86-android-tablets: Move DMI
 match table into its own dmi.c file
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Mar 1, 2023 at 12:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 3/1/23 11:21, Andy Shevchenko wrote:

...

> Weird that MODULE_DEVICE_TABLE() is inside module.h though
> and not actually in mod_devicetable.h as the name of both
> would suggest.

Yep, but I can speculate that the edge is on user space vs. kernel, as
the latter is used in the tooling for modules which is user space
code.

--=20
With Best Regards,
Andy Shevchenko
