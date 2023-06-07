Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6082DC77B7A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Jun 2023 07:42:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239234AbjFGHmu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Jun 2023 03:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238408AbjFGHmQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Jun 2023 03:42:16 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596F91BD0
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jun 2023 00:39:48 -0700 (PDT)
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7C52F3F15C
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jun 2023 07:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1686123585;
        bh=a+IsLMCDpVZ5o6KdPBMxK1oLOZYb4TM7DWXj0EndxK0=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=gUKjcJcWL8fEc+/Ttr3tFKtMsrS61LQbWezn+hHiGkYfB8PiMXK8rRyN8D0/PNQOu
         deQwS9e5lNwanFdpUFhrbKLgtNxiw3BwdLikjeJKaRdk/X0g74lu+8dIeAODZYHYjr
         xBQMyatvwohzKORtGww/1+sN9s5aJ4lgeExfNIBMJrUS03zOGIgm3XEiKAcp77YzhA
         npnZMQdjL2y7VzZjtTD4XUAKwq+XQSqaEUPsmuOceszt1JqAjolWBlkYSYQG4et9Dr
         r317Gb1oQDp5xbLPqJpp9nPo+hQtFPHYCTJKiWGlR+MUQHHydImvghtAu+KkRqR6EB
         v9wCYvPPebhiQ==
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-569ca440bf0so42021207b3.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Jun 2023 00:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123584; x=1688715584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+IsLMCDpVZ5o6KdPBMxK1oLOZYb4TM7DWXj0EndxK0=;
        b=Ap3Ry5AuQ9P/vsUSJqkjj4/Lf10rRMv35s9h6QBQswoavCYmcFCQur3V0ALuxWb4UV
         g8Us/uEA6Vv0PYra/Bb/yLPATan/quqLW7cLdUgeltsIcNGj9CGiTCuy4NdOumjoUx1O
         FW8+iVbGfRa7vDA3z2eVGHbdRDmyT9xWyVoVSS5pvzLF8aqYy6wQn7UQSxeLRf3sa64o
         XdwFXVTmBZnHh2DVx82u9DybqeCaaBmJ2UOq6P444kuLaIvLVg9wMyfzKS1kZt3Gia/L
         55ohAssY7lBSnLqAp4pbRUXE3JRujroqKWYc4CpdtZuLTwonr+44458afAEQBm+lmTAP
         fX/Q==
X-Gm-Message-State: AC+VfDxnYrJIeQaSNoF/kmsaUUJGSLSjEkrP+56bAG14+zKTulSN76Wd
        g3+V3iQZC4OQN8HoXiIvPW7vdC7ZLjX8Tl/qL8SpBPosDuRU0Ye+BMjNVBcdm30kgfnBRvX4DfP
        0zxHKakBixdF0oClbJXPGKqPAjVrCT86GZYMJmVI3A0SySsPYIzQZ8+OWWWc5sSpAdY8=
X-Received: by 2002:a81:5c03:0:b0:561:baee:ee8 with SMTP id q3-20020a815c03000000b00561baee0ee8mr5044614ywb.32.1686123584509;
        Wed, 07 Jun 2023 00:39:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6L4HVvHy/GOEAO2TXPFsXsHE/3PcRoxTjbR0PztArJXfMLUc+TtpXzedeSTv0A8K3pvSAEXQf4ONq4OwqMlNo=
X-Received: by 2002:a81:5c03:0:b0:561:baee:ee8 with SMTP id
 q3-20020a815c03000000b00561baee0ee8mr5044591ywb.32.1686123584194; Wed, 07 Jun
 2023 00:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230607034331.576623-1-acelan.kao@canonical.com>
 <20230607042032.GA28835@srcf.ucam.org> <CAFv23QmDNUFcPwvSQt5aUxtmHasfr8wrF72ObvcO-X19gfn=LA@mail.gmail.com>
 <20230607052724.GA29834@srcf.ucam.org> <CAFv23QkEdGnEz1q7vbyFCa9S9Dqh-zec72nRGyZ3wAz-8wpbvA@mail.gmail.com>
 <20230607062341.GA30618@srcf.ucam.org> <20230607065604.yaivqbbd3dkawxo4@pali>
In-Reply-To: <20230607065604.yaivqbbd3dkawxo4@pali>
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Wed, 7 Jun 2023 15:39:33 +0800
Message-ID: <CAFv23Q==r4newMXE3OWavRSRt-bEi5-qR0Vo-5HGLw4r9J36MA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Add drm module soft dependency
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc:     Matthew Garrett <mjg59@srcf.ucam.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Pali Roh=C3=A1r <pali@kernel.org> =E6=96=BC 2023=E5=B9=B46=E6=9C=887=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=882:56=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wednesday 07 June 2023 07:23:41 Matthew Garrett wrote:
> > On Wed, Jun 07, 2023 at 02:13:31PM +0800, AceLan Kao wrote:
> > > Matthew Garrett <mjg59@srcf.ucam.org> =E6=96=BC 2023=E5=B9=B46=E6=9C=
=887=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=881:27=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > > >
> > > > On Wed, Jun 07, 2023 at 01:19:40PM +0800, AceLan Kao wrote:
> > > > > Gfx drivers(i915/amdgpu/nvidia) depend on the drm driver, so dela=
ying
> > > > > the loading of dell_laptop after drm can ease the issue the most.
> > > > > Right, it's still possible to encounter the issue, unfortunately,=
 we
> > > > > do not have a better solution for it at the moment.
> > > >
> > > > We could unregister inappropriate backlight drivers when a more
> > > > appropriate one is loaded, or the policy decision around which driv=
er to
> > > > use could be made in userland?
> > > It's hard to decide which backlight driver is redundant, and it's kin=
d of ugly
> > > to unregister the backlight driver which is registered by other drive=
r and maybe
> > > problematic.
> >
> > But you're relying on registering the working backlight first, which is
> > an inherently racy thing? We shouldn't be relying on order of
> > initialisation to make this work, either we should only export a workin=
g
> > interface or we should expose enough information for whatever is using
> > the interfaces to make an appropriate policy decision itself.
>
> IIRC, drm drivers unregister redundant fbcon drivers (vesafb), so cannot
> drm drivers use similar strategy also for backlight drivers and
> unregister the redundant? If every backlight driver would have some
> "flag" which say if it should be unregistered by drm then maybe it could
> work? Or are there some other pitfalls?
Matthew,

What do you think if we unregister backlight devices if the backlight type
is larger than the current registered one.
Do this check in backlight_device_register() and unregister backlight
devices by the order raw(1) > platform(2) > firmware(3)
And maybe introduce a sticky bit into the backlight device if the backlight
driver doesn't want to be removed.

Pali,

No, it doesn't work by doing this in the drm driver if the backlight driver
is registered after the drm driver has been loaded.
