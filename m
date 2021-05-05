Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33418C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 09:17:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB7F1613C7
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 09:17:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbhEEJS2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 May 2021 05:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbhEEJS2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 May 2021 05:18:28 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D128AC061574;
        Wed,  5 May 2021 02:17:30 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id e2so778158plh.8;
        Wed, 05 May 2021 02:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+hdlGV1cUN6NljB1f2reBcd8Q4DpmutRMc4/6Gf8iqI=;
        b=P3sG7lnDmSPXT3uYXXvYoTUTIKUqeGvsiITgKApsDfTuVzIVm8UEBQD8XQlsDSaVJv
         Dg9KdKkliWDCbFd65g7X8Ydef+UkFU6tmG1mWrWLcQeVc6S8m8w8cwJ+7FuMJZOFNgBl
         fd4Jevni6iNb9Px7sdZeI0scw3ANCqwZherMQgYkzIboGvj0w4Zi8ulD3NZN3hX1utDu
         gFNO2WIQF16Q/N9dqdI3v0QwnjyjGLqRH8o3nZrQziSrC55YHahuVYbwv4OllmEMHVGI
         Ihkr8GyXoZqa3MXLnWsA1b0pg+liRKsaHpwyWpKUyelxPhpEEKqaHMe5A1mnsOAvrLlk
         gy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+hdlGV1cUN6NljB1f2reBcd8Q4DpmutRMc4/6Gf8iqI=;
        b=l5lDYAqi90pDRqEY2dx2IxBV4zSrbSXnvoybhmqx8zhwYYth2Oejb4G1G3bjiFQIBf
         HneSWeQlOCHWmaDRi7vsDa5RVr9tAEDwrSxlWWNSo7kCvyj1x6IDAaRCowpqZmf/aQ4z
         wlYPf+odnU91Ytp1INfp0UKM3A/kBQCilk9cL1W6C7NaXzvzwbfbweiqbijkv5jv2cS6
         YfrjRR9LkTw/wjyK9oCqh1LlHrEWsPGMhifjnHaNqhaCxg7X2eNbPLLakQ9d2lELXFIz
         LeqtAN3wNzRjiLOzsclf6eDWEsLgm0SJ21M31TGpnnIadeaTZCBnc3tza1jsvvsnbKNs
         V9qg==
X-Gm-Message-State: AOAM532QQrOD1E2c84FZb5ykcq61BviRWolPLmCj1/r7AEn9MuNEDLK2
        Ljc4LcVMqpFH8y34v9dFc0qAGi+swxGmfTKxYlVLAlyHBmw=
X-Google-Smtp-Source: ABdhPJxrjEyuzY1Uv6PT4uCbsCv1WEw2n5HqFzucR460BX9AZAaLE6eEDP9sSAIcg1VcepGwk/mWxNQ6/srQ85SDJXY=
X-Received: by 2002:a17:902:264:b029:eb:3d3a:a09c with SMTP id
 91-20020a1709020264b02900eb3d3aa09cmr30516458plc.0.1620206250236; Wed, 05 May
 2021 02:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210503154647.142551-1-hdegoede@redhat.com> <20210503154647.142551-6-hdegoede@redhat.com>
 <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com> <ee230261-423d-0e2f-16b0-852d264afa2b@redhat.com>
In-Reply-To: <ee230261-423d-0e2f-16b0-852d264afa2b@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 5 May 2021 12:17:14 +0300
Message-ID: <CAHp75VcfkcaVAu2-8-5he7PN=W_tRHiHAgXYn04gRnLehDVsyQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/i915: Associate ACPI connector nodes with
 connector entries
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, May 5, 2021 at 12:07 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 5/4/21 9:52 AM, Andy Shevchenko wrote:
> > On Monday, May 3, 2021, Hans de Goede <hdegoede@redhat.com <mailto:hdeg=
oede@redhat.com>> wrote:

...

> >     +               fwnode =3D device_get_next_child_node(kdev, fwnode)=
;

> > Who is dropping reference counting on fwnode ?
>
> We are dealing with ACPI fwnode-s here and those are not ref-counted, the=
y
> are embedded inside a struct acpi_device and their lifetime is tied to
> that struct. They should probably still be ref-counted (with the count
> never dropping to 0) so that the generic fwnode functions behave the same
> anywhere but atm the ACPI nodes are not refcounted, see: acpi_get_next_su=
bnode()
> in drivers/acpi/property.c which is the get_next_child_node() implementat=
ion
> for ACPI fwnode-s.

Yes, ACPI currently is exceptional, but fwnode API is not.
If you may guarantee that this case won't ever be outside of ACPI and
even though if ACPI won't ever gain a reference counting for fwnodes,
we can leave it as is.

> > I=E2=80=99m in the middle of a pile of fixes for fwnode refcounting whe=
n for_each_child or get_next_child is used. So, please double check you dro=
p a reference.
>
> The kdoc comments on device_get_next_child_node() / fwnode_get_next_child=
_node()
> do not mention anything about these functions returning a reference.

It's possible. I dunno if it had to be done earlier. Sakari?

> So I think we need to first make up our mind here how we want this all to
> work and then fix the actual implementation and docs before fixing caller=
s.

We have already issues, so I prefer not to wait for a documentation
update, because for old kernels it will still be an issue.

In any case most of my fixes are against LED subsystem (drivers) and
they are valid due to use in the OF environment.

--=20
With Best Regards,
Andy Shevchenko
