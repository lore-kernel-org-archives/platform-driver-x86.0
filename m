Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72F6C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Sep 2021 16:53:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CDA86326A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Sep 2021 16:53:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344312AbhIPQyN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Sep 2021 12:54:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59492 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243673AbhIPQwK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Sep 2021 12:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631811044;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PDF6UEaYgXOPbdgC8r3gLUgk/GLIW2qq4Zlz9YVIF9M=;
        b=Kt2BFy3F2hCxdvy68vzWPyu0gVaW2Skkr/sXikf2uejGo/4DnQsdLn0on6LVTTObhR6V9L
        uQaKBmPtL5weHAeJuK1fuQ852fORGCZGwDNza/FHcmB1iFCgcplbqAAlm2Om05RSNhEETh
        RKvdzvWB9g6W4Cp/fBZOt6pW4ED3QOw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-Uji-YohCPiq6GGri2Z1qmg-1; Thu, 16 Sep 2021 12:50:43 -0400
X-MC-Unique: Uji-YohCPiq6GGri2Z1qmg-1
Received: by mail-qv1-f70.google.com with SMTP id w10-20020a0cb54a000000b0037a9848b92fso60306940qvd.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Sep 2021 09:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=PDF6UEaYgXOPbdgC8r3gLUgk/GLIW2qq4Zlz9YVIF9M=;
        b=0K/Dbn03NJkS2msKArZwYrWQorDX65Skni3qgbp6ARyulffCIN0RwvYoBSJj4wkKYw
         GNEqWDJSM8qrXX1RsHC0VaTjM3qQhlYDbnxg/voYELu7gWGnR570BATZrY9cBIC1BxO2
         7iZR7MwVBSx/TS+fWe3nN2TtmP/AKPuvS7mRqbz6NgfeyOwZRKKjo328KpC2NW4xzlQS
         XoQ9Q1x8erPfqc/qeyhYwO7TBgJfCifyxY2F4jBaJetD9x3NwM6jvrLXnkbXo5vtHbXI
         wAEsaG6YYMKL278taBhvqHWM/IBEhPafI35w1aOo734Ikyyh1V2qYHCFltiqbQG13jXd
         B78g==
X-Gm-Message-State: AOAM530MbQnsq0w2RuhbtnbKIMY9GLcs/gPL7kGK2EuU43P8LF4uuE38
        MFC0giaYGoazFbUaGgMoJ392l7dpE18owvk2Xol91n+bmBbnsiggL7Fc1c2rWM0xov7ZbTTyX7W
        GI9bNx36maEi2Mf2w0cKICK46sO8M/WJzEQ==
X-Received: by 2002:a05:620a:1403:: with SMTP id d3mr5858249qkj.67.1631811042662;
        Thu, 16 Sep 2021 09:50:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyobm/E2u/c0Lwj1wJ2YziNc8T+8u/bHNQuAWK/jnkwBm95wQ/eYuEnWVG8L1TCiUt21VRxew==
X-Received: by 2002:a05:620a:1403:: with SMTP id d3mr5858223qkj.67.1631811042363;
        Thu, 16 Sep 2021 09:50:42 -0700 (PDT)
Received: from [192.168.8.206] (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id e25sm2811178qka.83.2021.09.16.09.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 09:50:41 -0700 (PDT)
Message-ID: <f9157235d0a163a1eb4127412cbea39978a213f5.camel@redhat.com>
Subject: Re: [PATCH 4/9] drm/privacy-screen: Add notifier support
From:   Lyude Paul <lyude@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rajat Jain <rajatja@google.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org
Date:   Thu, 16 Sep 2021 12:50:40 -0400
In-Reply-To: <b3583afa-6801-7c32-daab-6085e463c137@redhat.com>
References: <20210906073519.4615-1-hdegoede@redhat.com>
         <20210906073519.4615-5-hdegoede@redhat.com>
         <6c9daf86dbbd5fe98f84efd3bae3240f0bf93387.camel@redhat.com>
         <b3583afa-6801-7c32-daab-6085e463c137@redhat.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 2021-09-16 at 11:06 +0200, Hans de Goede wrote:
> Hi,
> 
> On 9/15/21 10:26 PM, Lyude Paul wrote:
> > On Mon, 2021-09-06 at 09:35 +0200, Hans de Goede wrote:
> > > Add support for privacy-screen consumers to register a notifier to
> > > be notified of external (e.g. done by the hw itself on a hotkey press)
> > > state changes.
> > > 
> > > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > >  drivers/gpu/drm/drm_privacy_screen.c      | 67 +++++++++++++++++++++++
> > >  include/drm/drm_privacy_screen_consumer.h | 15 +++++
> > >  include/drm/drm_privacy_screen_driver.h   |  4 ++
> > >  3 files changed, 86 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_privacy_screen.c
> > > b/drivers/gpu/drm/drm_privacy_screen.c
> > > index 294a09194bfb..7a5f878c3171 100644
> > > --- a/drivers/gpu/drm/drm_privacy_screen.c
> > > +++ b/drivers/gpu/drm/drm_privacy_screen.c
> > > @@ -255,6 +255,49 @@ void drm_privacy_screen_get_state(struct
> > > drm_privacy_screen *priv,
> > >  }
> > >  EXPORT_SYMBOL(drm_privacy_screen_get_state);
> > >  
> > > +/**
> > > + * drm_privacy_screen_register_notifier - register a notifier
> > > + * @priv: Privacy screen to register the notifier with
> > > + * @nb: Notifier-block for the notifier to register
> > > + *
> > > + * Register a notifier with the privacy-screen to be notified of
> > > changes
> > > made
> > > + * to the privacy-screen state from outside of the privacy-screen
> > > class.
> > > + * E.g. the state may be changed by the hardware itself in response to
> > > a
> > > + * hotkey press.
> > > + *
> > > + * The notifier is called with no locks held. The new hw_state and
> > > sw_state
> > > + * can be retrieved using the drm_privacy_screen_get_state() function.
> > > + * A pointer to the drm_privacy_screen's struct is passed as the void
> > > *data
> > > + * argument of the notifier_block's notifier_call.
> > > + *
> > > + * The notifier will NOT be called when changes are made through
> > > + * drm_privacy_screen_set_sw_state(). It is only called for external
> > > changes.
> > > + *
> > > + * Return: 0 on success, negative error code on failure.
> > > + */
> > > +int drm_privacy_screen_register_notifier(struct drm_privacy_screen
> > > *priv,
> > > +                                        struct notifier_block *nb)
> > > +{
> > > +       return blocking_notifier_chain_register(&priv->notifier_head,
> > > nb);
> > > +}
> > > +EXPORT_SYMBOL(drm_privacy_screen_register_notifier);
> > > +
> > > +/**
> > > + * drm_privacy_screen_unregister_notifier - unregister a notifier
> > > + * @priv: Privacy screen to register the notifier with
> > > + * @nb: Notifier-block for the notifier to register
> > > + *
> > > + * Unregister a notifier registered with
> > > drm_privacy_screen_register_notifier().
> > > + *
> > > + * Return: 0 on success, negative error code on failure.
> > > + */
> > > +int drm_privacy_screen_unregister_notifier(struct drm_privacy_screen
> > > *priv,
> > > +                                          struct notifier_block *nb)
> > > +{
> > > +       return blocking_notifier_chain_unregister(&priv->notifier_head,
> > > nb);
> > > +}
> > > +EXPORT_SYMBOL(drm_privacy_screen_unregister_notifier);
> > > +
> > >  /*** drm_privacy_screen_driver.h functions ***/
> > >  
> > >  static ssize_t sw_state_show(struct device *dev,
> > > @@ -352,6 +395,7 @@ struct drm_privacy_screen
> > > *drm_privacy_screen_register(
> > >                 return ERR_PTR(-ENOMEM);
> > >  
> > >         mutex_init(&priv->lock);
> > > +       BLOCKING_INIT_NOTIFIER_HEAD(&priv->notifier_head);
> > >  
> > >         priv->dev.class = drm_class;
> > >         priv->dev.type = &drm_privacy_screen_type;
> > > @@ -399,3 +443,26 @@ void drm_privacy_screen_unregister(struct
> > > drm_privacy_screen *priv)
> > >         device_unregister(&priv->dev);
> > >  }
> > >  EXPORT_SYMBOL(drm_privacy_screen_unregister);
> > > +
> > > +/**
> > > + * drm_privacy_screen_call_notifier_chain - notify consumers of state
> > > change
> > > + * @priv: Privacy screen to register the notifier with
> > > + *
> > > + * A privacy-screen provider driver can call this functions upon
> > > external
> > > + * changes to the privacy-screen state. E.g. the state may be changed
> > > by
> > > the
> > > + * hardware itself in response to a hotkey press.
> > > + * This function must be called without holding the privacy-screen
> > > lock.
> > > + * the driver must update sw_state and hw_state to reflect the new
> > > state
> > > before
> > > + * calling this function.
> > > + * The expected behavior from the driver upon receiving an external
> > > state
> > > + * change event is: 1. Take the lock; 2. Update sw_state and hw_state;
> > > + * 3. Release the lock. 4. Call
> > > drm_privacy_screen_call_notifier_chain().
> > > + */
> > > +void drm_privacy_screen_call_notifier_chain(struct drm_privacy_screen
> > > *priv)
> > > +{
> > > +       if (WARN_ON(mutex_is_locked(&priv->lock)))
> > > +               return;
> > 
> > Are we sure about this check? mutex_is_locked() checks whether a mutex is
> > locked by anyone, not just us. So this seems like it would cause us to
> > WARN_ON() and abort if anyone else (not just ourselves) is holding the
> > lock to
> > read the privacy screen state.
> 
> Thank you for catching this, yes this check indeed is wrong. AFAIK
> there is no way to check that the mutex has been locked by us, so this
> extra sanity check simply needs to be removed.
> 
> I'll drop the check before pushing this to drm-misc-next (more on
> that in a reply to the cover letter), if that is ok with you.

Sounds fine to me!

> 
> Or do you want me to do a new version addressing this?
> 
> Regards,
> 
> Hans
> 
> 
> 
> > 
> > > +
> > > +       blocking_notifier_call_chain(&priv->notifier_head, 0, priv);
> > > +}
> > > +EXPORT_SYMBOL(drm_privacy_screen_call_notifier_chain);
> > > diff --git a/include/drm/drm_privacy_screen_consumer.h
> > > b/include/drm/drm_privacy_screen_consumer.h
> > > index 0cbd23b0453d..7f66a90d15b7 100644
> > > --- a/include/drm/drm_privacy_screen_consumer.h
> > > +++ b/include/drm/drm_privacy_screen_consumer.h
> > > @@ -24,6 +24,11 @@ int drm_privacy_screen_set_sw_state(struct
> > > drm_privacy_screen *priv,
> > >  void drm_privacy_screen_get_state(struct drm_privacy_screen *priv,
> > >                                   enum drm_privacy_screen_status
> > > *sw_state_ret,
> > >                                   enum drm_privacy_screen_status
> > > *hw_state_ret);
> > > +
> > > +int drm_privacy_screen_register_notifier(struct drm_privacy_screen
> > > *priv,
> > > +                                        struct notifier_block *nb);
> > > +int drm_privacy_screen_unregister_notifier(struct drm_privacy_screen
> > > *priv,
> > > +                                          struct notifier_block *nb);
> > >  #else
> > >  static inline struct drm_privacy_screen *drm_privacy_screen_get(struct
> > > device *dev,
> > >                                                                 const
> > > char
> > > *con_id)
> > > @@ -45,6 +50,16 @@ static inline void
> > > drm_privacy_screen_get_state(struct
> > > drm_privacy_screen *priv,
> > >         *sw_state_ret = PRIVACY_SCREEN_DISABLED;
> > >         *hw_state_ret = PRIVACY_SCREEN_DISABLED;
> > >  }
> > > +static inline int drm_privacy_screen_register_notifier(struct
> > > drm_privacy_screen *priv,
> > > +                                                      struct
> > > notifier_block
> > > *nb)
> > > +{
> > > +       return -ENODEV;
> > > +}
> > > +static inline int drm_privacy_screen_unregister_notifier(struct
> > > drm_privacy_screen *priv,
> > > +                                                        struct
> > > notifier_block *nb)
> > > +{
> > > +       return -ENODEV;
> > > +}
> > >  #endif
> > >  
> > >  #endif
> > > diff --git a/include/drm/drm_privacy_screen_driver.h
> > > b/include/drm/drm_privacy_screen_driver.h
> > > index 5187ae52eb03..24591b607675 100644
> > > --- a/include/drm/drm_privacy_screen_driver.h
> > > +++ b/include/drm/drm_privacy_screen_driver.h
> > > @@ -54,6 +54,8 @@ struct drm_privacy_screen {
> > >         struct mutex lock;
> > >         /** @list: privacy-screen devices list list-entry. */
> > >         struct list_head list;
> > > +       /** @notifier_head: privacy-screen notifier head. */
> > > +       struct blocking_notifier_head notifier_head;
> > >         /**
> > >          * @ops: &struct drm_privacy_screen_ops for this privacy-screen.
> > >          * This is NULL if the driver has unregistered the privacy-
> > > screen.
> > > @@ -77,4 +79,6 @@ struct drm_privacy_screen
> > > *drm_privacy_screen_register(
> > >         struct device *parent, const struct drm_privacy_screen_ops
> > > *ops);
> > >  void drm_privacy_screen_unregister(struct drm_privacy_screen *priv);
> > >  
> > > +void drm_privacy_screen_call_notifier_chain(struct drm_privacy_screen
> > > *priv);
> > > +
> > >  #endif
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

