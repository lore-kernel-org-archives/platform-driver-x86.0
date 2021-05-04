Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A2BC433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 12:35:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B291061175
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 12:35:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhEDMgk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 May 2021 08:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbhEDMgk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 May 2021 08:36:40 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD221C061574;
        Tue,  4 May 2021 05:35:44 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id v191so7236622pfc.8;
        Tue, 04 May 2021 05:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KqcdT0AytEeEDnmzSPRzsUTe5DmaHnZ6X4D1SBv+COU=;
        b=B9T7YBXKHqVxJHLtHOeib4Xb0ga07E594q1u/8YKnkC42vAnZKk1Ew46Zr1IZCt09L
         E7WF0of1wrtEEyfp5coaotoYYgwkaKGwOVH6BXKyzluAYtiXnUT9Mj3a/ULxajOA31Db
         qypPcDi2s+5NYkVwGZzfxzGUDRxPyQpbYjqFSD2u0htBDOQ5utxQqnd611hxvmcWkZ6f
         BKr8qnew1kaC+U/+dB6oMdy5BXw2vDD5gxXLH/rBTi0kCVwGbDRpJNJolH7RnHNrvh+o
         mNDV5rO9FXaDtUDrG4I5+Ec4zktpGqBaBxF37W347EJ8nsF4NAbkP2PdcnJG7D61d7cV
         UEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KqcdT0AytEeEDnmzSPRzsUTe5DmaHnZ6X4D1SBv+COU=;
        b=q8f+WZKdOaSCYMrlFm5hBB4c6knL8BFrCSy8LjNKFSJuqfKw8xPSpC4HsLVNC6ZAUX
         Rgs5kFKuP5HXtbjjBTWmxX8pJ+8tsLEX16p/gOYRLyBzipTA6dZld8d8W+znjXXbB2xU
         +fhXFqCqptmOU6T3ntjgVtgie07cYeB/dhOOy8XGOTRmIx3Syw/wzTgSSqjuGlQCJFml
         aSRx7FpMrdpOgLx0DC1AXMTJ1mZEd9IP8nwF4OvwUsA1L7lWfelEN++19vHnGLpsKJqj
         8yBBN1fAvjBpgskrdfvvqyGH+h5LryGiNtpxRPje32h9OOlXAnYW2s5WRGpLBMkrnqBs
         cP2A==
X-Gm-Message-State: AOAM532OxJ6PN4lDRI68cRu3j5IMQWKX2JqFejH16rSCgo4BxFKJeD0o
        2EqNmeCSbKpwpuJ0geft4jtTMqKnRa1QQ1oWrr0=
X-Google-Smtp-Source: ABdhPJwSoLhvTnD73IQz/RnLoQJJpiUnljhDPe3utWq+p163MQ3/DiGswekMo/ZKS7WjTzC0d9RxJaV5qSki/pnamGs=
X-Received: by 2002:a17:90a:246:: with SMTP id t6mr12653680pje.228.1620131743200;
 Tue, 04 May 2021 05:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210503154647.142551-1-hdegoede@redhat.com> <20210503154647.142551-4-hdegoede@redhat.com>
 <CAHp75Vcv=sUHafBMjV+BMJgmpsXF0iUn5gudb26E2xGapCiMxg@mail.gmail.com> <afbfa6fb-8b1d-3d3c-96b4-d3045584d2b8@redhat.com>
In-Reply-To: <afbfa6fb-8b1d-3d3c-96b4-d3045584d2b8@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 4 May 2021 15:35:27 +0300
Message-ID: <CAHp75VcsyiWQ_LN8qNQU72SgWyzy0TWcq=N0BLTHHWLSA9Rz1Q@mail.gmail.com>
Subject: Re: [PATCH 3/9] drm/connector: Add drm_connector_find_by_fwnode()
 function (v2)
To:     Hans de Goede <hdegoede@redhat.com>
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
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 4, 2021 at 2:53 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 5/4/21 10:00 AM, Andy Shevchenko wrote:
> > On Monday, May 3, 2021, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:

...

> >     +struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >     +{
> >     +       struct drm_connector *connector, *found = ERR_PTR(-ENODEV);
> >     +
> >     +       if (!fwnode)
> >     +               return ERR_PTR(-ENODEV);
> >     +
> >     +       mutex_lock(&connector_list_lock);
> >     +
> >     +       list_for_each_entry(connector, &connector_list, global_connector_list_entry) {
> >     +               if (connector->fwnode == fwnode ||
> >     +                   (connector->fwnode && connector->fwnode->secondary == fwnode)) {
> >     +                       drm_connector_get(connector);
> >     +                       found = connector;
> >     +                       break;
> >     +               }
> >     +       }
> >     +
> >     +       mutex_unlock(&connector_list_lock);
> >     +
> >     +       return found;
> >
> > If I am not mistaken you can replace this with
> >
> > return list_entry_is_head();
> >
> > call and remove additional Boolean variable.
>
> Found is not a boolean, it is a pointer to the found connector (or ERR_PTR(-ENODEV)).

Ah, perhaps giving a better name? `match` ?

And to the initial topic, it's either an additional variable or
additional branch in this case. I think additional branch (taking into
account the length of the line or amount of lines) doesn't buy us
anything.

> >     +}

-- 
With Best Regards,
Andy Shevchenko
