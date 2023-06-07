Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A90C77B7A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Jun 2023 05:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233955AbjFGFT6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Jun 2023 01:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbjFGFT4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Jun 2023 01:19:56 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C1C1982
        for <platform-driver-x86@vger.kernel.org>; Tue,  6 Jun 2023 22:19:55 -0700 (PDT)
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6BF903F166
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jun 2023 05:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1686115193;
        bh=Y3mm/I7x2vRn2j9GXKotLgetA+QT35DrsPpKt0Y+YPk=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=bqOLVVxsaPBshvIrGgD6FBrIxW/aRlPuT1CZ/X2ijgJZLG+5bIu8ZjTl0FdQoAvvH
         3xIMKeaxjxksLNs/hPh3dOA7O//r83ir0E8dgCVj29DMk42Idy2ef38scU2wKCr4VB
         pP3NRz+hljEVOpS8GCX1fij+CElw1FuwtLv4QPuE6nE+GU3r7Nl2YfafrWkIjwyda1
         uqz2J8fC4iB+BY3S3BdM7aKObnoFZmrfvoZ23pbgBGLZ56hRyHOWQU8bkyUR09RrT0
         NI7GNO8ap7HJOjxKAG/8OvpdQOl24Ag3EpuIRMQyhmLj473cVhypPKb3nzgGWB+8Iv
         dE+So8XaKUUtw==
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-5659c7dad06so117367067b3.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jun 2023 22:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686115193; x=1688707193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3mm/I7x2vRn2j9GXKotLgetA+QT35DrsPpKt0Y+YPk=;
        b=XX0k/fQNJbcc/g0HuvVapDEcY8AHPT53sKDxCHZoFdKs7xzudY5BZzMhfc9TnCAf73
         FR191hw/QDaaKKNVjaN0oyfrL+CMb/J37WD6TCNnwbcx4jcblHEwi90sRYNvqtYvVXa6
         dIsauHj66A/vroKM0mIt9/O/ewxovvSaENg6dyykS4iOgV+KOygkI6Zl6hO9t3GyiHsw
         dNpHRBIxWXgI69u6fMdPmPpV0hmwddHJ7oNm5QHuD15swxNgtx37+kA70h8ksoVj6bST
         +gqRpF8f43b9g5hTGrgA9ai/u2fVa6WUmNHUY3GcLQ+2QkscAOgJwJSwklCBa8ZQxUJu
         +iPw==
X-Gm-Message-State: AC+VfDwK8IwQhZPrwBPeMNhpecF1QPdE12C0R8VFakZoQN6TxkFecxDr
        FyxYSrHiL8WKaw5TLasMDQ+KPuw2yi0VC+CIJvU5B6bRy9jleblY7voeA8rOR5a1n76NPJCsRep
        829omy2+9/IR7h08RgVvMK9WoJFVFGwON84t8c52TONf72SBclrbZMiM5+6reHBJMtnncRWvqhk
        +H0A==
X-Received: by 2002:a81:494f:0:b0:565:df97:4439 with SMTP id w76-20020a81494f000000b00565df974439mr4470002ywa.37.1686115192728;
        Tue, 06 Jun 2023 22:19:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ40trCB1v0nQlIOadZnNVxmP8YW7DLNgQOAV86JMGej2W+a155jagc5TYTLR7MONXgf3+r3A2uU6DsBFyxrKhI=
X-Received: by 2002:a81:494f:0:b0:565:df97:4439 with SMTP id
 w76-20020a81494f000000b00565df974439mr4469990ywa.37.1686115192461; Tue, 06
 Jun 2023 22:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230607034331.576623-1-acelan.kao@canonical.com> <20230607042032.GA28835@srcf.ucam.org>
In-Reply-To: <20230607042032.GA28835@srcf.ucam.org>
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Wed, 7 Jun 2023 13:19:40 +0800
Message-ID: <CAFv23QmDNUFcPwvSQt5aUxtmHasfr8wrF72ObvcO-X19gfn=LA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Add drm module soft dependency
To:     Matthew Garrett <mjg59@srcf.ucam.org>
Cc:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Gfx drivers(i915/amdgpu/nvidia) depend on the drm driver, so delaying
the loading of dell_laptop after drm can ease the issue the most.
Right, it's still possible to encounter the issue, unfortunately, we
do not have a better solution for it at the moment.


Matthew Garrett <mjg59@srcf.ucam.org> =E6=96=BC 2023=E5=B9=B46=E6=9C=887=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8812:20=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Wed, Jun 07, 2023 at 11:43:31AM +0800, AceLan Kao wrote:
> > From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
> >
> > dell_laptop is somethines loaded before nvidia driver, causing it to
> > create its own backlight interface before native backlight is set.
> > This results in the presence of 2 backlight interfaces in sysfs and
> > leads to the backlight can't be adjusted.
>
> It seems like this approach would still be broken if the nvidia module
> isn't available at the time the dell module is loaded?
