Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178ADC64EC7
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 10:21:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjCAKVp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 05:21:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjCAKVo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 05:21:44 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC753B23E
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 02:21:43 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id nv15so8854016qvb.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 02:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGvFtcsd/CA80yE0+89wp68XrzSJW/IhVFHZJXYUPcU=;
        b=O7OoAW0b3s1RQH4PPQBmIFuatTVsNMrY9lwFpVskNIOEnE+83HOyFXfGU47a5nN22v
         kWO475dii4pGdOcrzLVgG2O/Sz88Wf/Fp64ipVaHqGgoecq1EZG+RphQafDUAlv47s2H
         dzjBUFunpamhiDp/DP8plIG+cGL0nsR6EAvUWoishDanA2oR0Hky22lQw0JghXhO61iw
         0PwhNgG19KkJdwjU8UyAS8FCbtviKZb7LuI4DvIdH0CIwq4+Z0iIVQ9qUPkk2TJRS2c6
         DyqSQav2pHsPBQyXGXfX7/OcWYnrRGSxcGgtSHYEq7MuyvkOl+7wGeJdrCgmnKstgukt
         KPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGvFtcsd/CA80yE0+89wp68XrzSJW/IhVFHZJXYUPcU=;
        b=sUwOKyhDsrH4XMZmXVs8LzuBXbgY80/w1p33N1tFEUQepnSmGl4SiY7zRoPr3pQXGD
         oANcBLUnujQe1zrSsW7LYJtBDHE+1fL0FU12eIhs2Y4Wsbgte+9w0G65LyIm0IhAlFHT
         s+pEcPkksUmdDlsBPbZBNE5cUO0sxruu+3Ef2EErJ7RdUKStWI8HcGuYyOSMpKAAfmBF
         UZ1R3B9iqH1yyxX2EiJ31Pygp1KoqIiTxfPHKqqaSNV+avggDJRZFB+ZXPfcy4NF5ef9
         mBV/oBYFwYp5fCjtJ58hBehu1D+o4Y8tHQuQ008+cxyQASxkoMyzz94h7yRLUoXjoKMa
         8vbA==
X-Gm-Message-State: AO0yUKW+GcR9iO6xgLpZR7N2zjV+TKSlBX3HmlGxMNqn7g5dhmhe7k7Q
        Gs5RhYLdCmNLX9NApMr0SR1i9kVzyOeWXm5ekz4=
X-Google-Smtp-Source: AK7set+MFZHsHI+7OoWvYEfvoXDq9TmnAEmWLGhWb1jkDs5dXnzFpKZ71Po1xXXV2UEpOXhag8EDVpUbWTQYUKG0kiU=
X-Received: by 2002:ad4:58c3:0:b0:56e:9339:a0c9 with SMTP id
 dh3-20020ad458c3000000b0056e9339a0c9mr1489689qvb.1.1677666102728; Wed, 01 Mar
 2023 02:21:42 -0800 (PST)
MIME-Version: 1.0
References: <20230301092331.7038-1-hdegoede@redhat.com> <20230301092331.7038-5-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-5-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 1 Mar 2023 12:21:06 +0200
Message-ID: <CAHp75VeGF7M76qGpkjcZrWFd-yGmBMaxcvbftUtE6wU9ywFMgQ@mail.gmail.com>
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

On Wed, Mar 1, 2023 at 11:23=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> In order to have a single MODULE_DEVICE_TABLE(dmi, ...), while allowing
> splitting the board descriptions into multiple files, add a new separate
> file for the DMI match table.

...

> +#include <linux/dmi.h>
> +#include <linux/mod_devicetable.h>

+ init.h for __initconst

+ module.h for MODULE_DEVICE_TABLE()

> +#include "x86-android-tablets.h"

--=20
With Best Regards,
Andy Shevchenko
