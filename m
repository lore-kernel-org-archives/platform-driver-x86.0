Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317B4C77B7A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Jun 2023 06:14:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234601AbjFGGOP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Jun 2023 02:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235056AbjFGGOD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Jun 2023 02:14:03 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E734AA
        for <platform-driver-x86@vger.kernel.org>; Tue,  6 Jun 2023 23:13:46 -0700 (PDT)
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7AE2F3F15E
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jun 2023 06:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1686118424;
        bh=z2S8w94wmO6gro0MOA3TrsuV0coxncdiS+T7jLmq+Vg=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=HZCXsNewWWWExbEKznaJ2w6AUilDsEmzOcsiyH93Hg7h9O1+zNQxRp9VcbKku3y2H
         0xDhzLhTDWEW/mpSvqcRlK27k+vRTOLwSaccNGKitkXS5z15Ex0WQqlNUgJzJfeRNq
         oTrjdmt+9aB6UrlI+ksAQJDXn2SdrodgOLe748VGpd1kKSfSJwglHSBtUjeiAh8gkr
         CfzFttrMylgM09YJXCzmwV7sX+Z3eGQBqulFvlSPxcjgpBJqaCy6CdnYeJZVr5tZ4I
         Bdt9ovQSYJaTEddQM6updNwJt6O5yX4Tvur/Ven9qhF51vZuOqWOhpjJjlh70xwh0a
         tDrzDlr6xmtCQ==
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-568a8704f6dso105417107b3.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jun 2023 23:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686118423; x=1688710423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2S8w94wmO6gro0MOA3TrsuV0coxncdiS+T7jLmq+Vg=;
        b=hJzBoK1zwapEa3gc9BoNDTvabqXZ45PZPihOzubgjGkUJ6dqBsrPV1f0ktOvGva76s
         ffb+xxX7TrIeUAoDaSGO0kpXlDW6wi3gswWqu+OiV//gZuQljqO9HjKvocRM6IB2LnvY
         1rAPc+iu08OSFq5Fm60eCj/6StPbwquq1PrMbOONsVIufGpg5ehpbpSCo2GljpJlRhs8
         D1RAnL93dordwTTN69RjuR05zv963eMOoD79BS3Myi0L9hvs+9JBQPRrc0oLBcXxHp8C
         KjDh7mr2+MUoktELqQ9CG+MJQCEFI1ffEWuASWtnPZUy4ZkFYLuSg8Cd862E55fyzego
         Iq+g==
X-Gm-Message-State: AC+VfDydByQkP/UTMy0txEKqkprALlRETOhwS4ucN7uwqCmquKRDSwlS
        FO/4YXcxwWJe7/O/ye+fdvBkHAfWDxLzAoutDxzL7s+x0+SDejkOtPQGeHcUMZX6ynOODg6PW29
        YtuBHf6ByI+HeMu3n8Vvtvd4uSfKTf9cHBfmfiM2zZX8xwwBFwHQEeBySXFy1LZl1WyR0BTqa9L
        M=
X-Received: by 2002:a81:a511:0:b0:565:9105:d043 with SMTP id u17-20020a81a511000000b005659105d043mr6024561ywg.9.1686118423001;
        Tue, 06 Jun 2023 23:13:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4rqvSoUhUn313mKwOLENsS5/zsi+enZgGIKlhgSKjCfVKJNE7d+wcq6fSsidRJ7F0ZeuQPx9J9eS9I3TEuY1U=
X-Received: by 2002:a81:a511:0:b0:565:9105:d043 with SMTP id
 u17-20020a81a511000000b005659105d043mr6024548ywg.9.1686118422733; Tue, 06 Jun
 2023 23:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230607034331.576623-1-acelan.kao@canonical.com>
 <20230607042032.GA28835@srcf.ucam.org> <CAFv23QmDNUFcPwvSQt5aUxtmHasfr8wrF72ObvcO-X19gfn=LA@mail.gmail.com>
 <20230607052724.GA29834@srcf.ucam.org>
In-Reply-To: <20230607052724.GA29834@srcf.ucam.org>
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Wed, 7 Jun 2023 14:13:31 +0800
Message-ID: <CAFv23QkEdGnEz1q7vbyFCa9S9Dqh-zec72nRGyZ3wAz-8wpbvA@mail.gmail.com>
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

Matthew Garrett <mjg59@srcf.ucam.org> =E6=96=BC 2023=E5=B9=B46=E6=9C=887=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=881:27=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Jun 07, 2023 at 01:19:40PM +0800, AceLan Kao wrote:
> > Gfx drivers(i915/amdgpu/nvidia) depend on the drm driver, so delaying
> > the loading of dell_laptop after drm can ease the issue the most.
> > Right, it's still possible to encounter the issue, unfortunately, we
> > do not have a better solution for it at the moment.
>
> We could unregister inappropriate backlight drivers when a more
> appropriate one is loaded, or the policy decision around which driver to
> use could be made in userland?
It's hard to decide which backlight driver is redundant, and it's kind of u=
gly
to unregister the backlight driver which is registered by other driver and =
maybe
problematic.

I'm not familiar with userland, but I think we should handle this
issue within the
kernel and aim to register only one functional backlight driver.
