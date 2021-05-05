Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F906C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 12:55:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDDDF610C8
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 12:55:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233051AbhEEM4f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 May 2021 08:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbhEEM4e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 May 2021 08:56:34 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD73C061574;
        Wed,  5 May 2021 05:55:38 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id t2-20020a17090ae502b029015b0fbfbc50so772288pjy.3;
        Wed, 05 May 2021 05:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZhuV1fIZkH25YePI0Y3P6MxQ5i4J7rTme3KQYtyR73Y=;
        b=gRI6Ic2tMSpnsSMhV6oDdci/E4PlN6TPeYZ6VGH7yYcXBOfTtOXVaQvWyKUvhThmrN
         JqBm5/kmvoOPA6RqgKpOkINzlUtnVrtvqDCtkTmqhq5FxJJgmGoLXJGYsRjI4YBcghkh
         A4meN/1fuuQMhxEmvLyhFbeliG/A22YQ7JllWCKLnlzDeMNt4ALzf06o+YabaeOChbg3
         u1LFxMvxUYcUDW4p2t+95kvBwtLAfCAu7Gz/5mOHDlGjI7nwUfPhpmjIH9B/4aQZnKar
         gwZ06pliPHDiHPWGjU7ti2fGSjqdDLxvTiOpPny151NLZtRYjNcsA+2Kmqu4BdeDiSq+
         XjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZhuV1fIZkH25YePI0Y3P6MxQ5i4J7rTme3KQYtyR73Y=;
        b=qu0JV4KhCsMIBdD+B/9zepW5uiLeODjdJz2q4f3LTBA6JRWkOtzLJ9hpSjdzaPh5sb
         vZFRZO5vvmM8iZ5/ileMD1yjFeTnDKc1YQWNVrxq3EOn9Aab2jte8EzlS2MoJoU5VeyP
         q+RG/QBjefP/BjUrF6GOEJJNneBDKSJy3+lfacQHk02W++/y6cJG4tgqbl944oJUgLy0
         02+BQoMmCPbdC45fe2/9Kng3pUicl/PHZaK4vMxaDWbyEp5GftGyNd5Sn5z+0Z74Kh+a
         JLAhbtsXoOA65lR1wrC5CVAsKuGsrsLOxn9yhd1r4zYeHGPhkZ8Jl+jz7E9OgGMnEmiu
         7FoQ==
X-Gm-Message-State: AOAM530lSj/cd3iWo+3/FIOJkPm+DfgN7QOqe6Akm5g1CjyFeXc+KXQX
        x4rekacY/ltUSMprxM7C3gfJMm67Mgl9wTXdmms=
X-Google-Smtp-Source: ABdhPJzCTkEkc6x9bPHAS+mMVokm63i+ft0JaoTpGrUgTTekG8+kZol92XMK91SVh8Y2tQwk7nOjar/WpkGDyy7r//k=
X-Received: by 2002:a17:90a:d90c:: with SMTP id c12mr11705143pjv.129.1620219337894;
 Wed, 05 May 2021 05:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210503154647.142551-1-hdegoede@redhat.com> <20210503154647.142551-6-hdegoede@redhat.com>
 <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
 <ee230261-423d-0e2f-16b0-852d264afa2b@redhat.com> <CAHp75VcfkcaVAu2-8-5he7PN=W_tRHiHAgXYn04gRnLehDVsyQ@mail.gmail.com>
 <ffb46bb6-3548-4ec2-f176-99f3674e7f6d@redhat.com> <CAHp75VcHEMaZ67yy7TD8f8Nk=+oiLT-vRCt9A6fT9K6LeR78Ew@mail.gmail.com>
 <adb9be8a-70c7-b515-48c3-7e372e5d8801@redhat.com>
In-Reply-To: <adb9be8a-70c7-b515-48c3-7e372e5d8801@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 5 May 2021 15:55:21 +0300
Message-ID: <CAHp75Vcd0U0MBisj3jYb2gptNk7JU61Jtv-MbwnsDK2hzuxU7Q@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/i915: Associate ACPI connector nodes with
 connector entries
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, May 5, 2021 at 1:30 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 5/5/21 12:02 PM, Andy Shevchenko wrote:

...

> But we do really need to document the behavior better here
> in the kdoc for fwnode_get_next_child_node() and
> device_get_next_child_node().

Totally agree!

> of_get_next_child has this bit, which applies to those too:
>
>  *      Returns a node pointer with refcount incremented, use of_node_put() on
>  *      it when done. Returns NULL when prev is the last child. Decrements the
>  *      refcount of prev.
>
> I'll prepare a patch to add this to the kdoc for fwnode_get_next_child_node()
> and device_get_next_child_node() once I'm done with readying v3 of this series.

Thanks!

-- 
With Best Regards,
Andy Shevchenko
