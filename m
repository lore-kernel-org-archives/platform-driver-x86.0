Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5806C433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 11:53:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B19E760240
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 11:53:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhEDLyE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 May 2021 07:54:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60971 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230160AbhEDLyE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 May 2021 07:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620129189;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yee3w8iZUHuQvVU0tVn+mMd8+ER6FdOTDfqaVEY8CUI=;
        b=cNcW26+E1W/Vh5bWtOX1xJrJ/S2+8KsgZxkS4XqrkQ/qEtiHR9Mh16bXSNFgZ9AXR6K2y2
        LhXBLLN2gCqhjZrXY3vE/84sDe/JliCF4JSIYyvsqxKMmsG4XcL7ao2wVpbfICzJB1ZKb0
        hq+Lt+CRvfKrFLDcdpUrKh1BYgVepkc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-9ZlKMRmbPLmY12xAmEHu3w-1; Tue, 04 May 2021 07:53:07 -0400
X-MC-Unique: 9ZlKMRmbPLmY12xAmEHu3w-1
Received: by mail-ej1-f71.google.com with SMTP id yh1-20020a17090706e1b029038d0f848c7aso3019266ejb.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 May 2021 04:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yee3w8iZUHuQvVU0tVn+mMd8+ER6FdOTDfqaVEY8CUI=;
        b=nSVmTOJFrRlSyjtZG7QeRb/PKs2+7VDP9Tvm3PAHToMshvxFV9raKt/TJThYiYxN6+
         2uqFSkouyiuWoshjLwMTriENoA/UNwJVUm+LFhGvbiqEaqSfJP0Q72XNU/iGBzGwPU8S
         CVEwJ+mHNQ0kPNEB/f5OEKpu4xW5Ot3nY2nP4oqpfF6XHDIKdDIvoznt0S9IHgAo6Ivl
         af2Ryh8SEEmPJxxtv9HyOEDDAQ+9tNArRNDjacrNb6E1Lon6IsggaaL3+02Ax2o8rFm5
         cj/SDyo/LxipZpNNd6Fn51OTue7wHI17xXYC7f0NA+Ha1Iwc46NvZBkVS0jrf4u1CMvT
         Biqw==
X-Gm-Message-State: AOAM533aZ8IXiWEagnm3Xl6OQywNY1W5cG4I5bLqh07Apjh1OEp8/QAL
        9Bg2QS/VTCfMXolvr8QBLi/jzizEfP3sxMuJlYxtdU5X9BoSO6bNB5QLKBusftGb9kshhtpApmb
        7wNZVvX/X3G4bMM/DBOTmCVA1vB3BQ5Feyg==
X-Received: by 2002:a17:906:f742:: with SMTP id jp2mr21976380ejb.199.1620129186565;
        Tue, 04 May 2021 04:53:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF8yI5YRN5Dn4MM8i27YZLLYc9QVgyAQck1bu98Cnu+eyl5Bmy1ysUEsdFrI2ZPx5MNTqoVA==
X-Received: by 2002:a17:906:f742:: with SMTP id jp2mr21976358ejb.199.1620129186332;
        Tue, 04 May 2021 04:53:06 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s4sm914556edq.96.2021.05.04.04.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 04:53:05 -0700 (PDT)
Subject: Re: [PATCH 3/9] drm/connector: Add drm_connector_find_by_fwnode()
 function (v2)
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-4-hdegoede@redhat.com>
 <CAHp75Vcv=sUHafBMjV+BMJgmpsXF0iUn5gudb26E2xGapCiMxg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <afbfa6fb-8b1d-3d3c-96b4-d3045584d2b8@redhat.com>
Date:   Tue, 4 May 2021 13:53:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vcv=sUHafBMjV+BMJgmpsXF0iUn5gudb26E2xGapCiMxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/4/21 10:00 AM, Andy Shevchenko wrote:
> 
> 
> On Monday, May 3, 2021, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> 
>     Add a function to find a connector based on a fwnode.
> 
>     This will be used by the new drm_connector_oob_hotplug_event()
>     function which is added by the next patch in this patch-set.
> 
>     Changes in v2:
>     - Complete rewrite to use a global connector list in drm_connector.c
>       rather then using a class-dev-iter in drm_sysfs.c
> 
>     Signed-off-by: Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>>
>     ---
>      drivers/gpu/drm/drm_connector.c     | 50 +++++++++++++++++++++++++++++
>      drivers/gpu/drm/drm_crtc_internal.h |  1 +
>      include/drm/drm_connector.h         |  8 +++++
>      3 files changed, 59 insertions(+)
> 
>     diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>     index 87c68563e6c3..ef759d6add81 100644
>     --- a/drivers/gpu/drm/drm_connector.c
>     +++ b/drivers/gpu/drm/drm_connector.c
>     @@ -66,6 +66,14 @@
>       * support can instead use e.g. drm_helper_hpd_irq_event().
>       */
> 
>     +/*
>     + * Global connector list for drm_connector_find_by_fwnode().
>     + * Note drm_connector_[un]register() first take connector->lock and then
>     + * take the connector_list_lock.
>     + */
>     +static DEFINE_MUTEX(connector_list_lock);
>     +static LIST_HEAD(connector_list);
>     +
>      struct drm_conn_prop_enum_list {
>             int type;
>             const char *name;
>     @@ -267,6 +275,7 @@ int drm_connector_init(struct drm_device *dev,
>                     goto out_put_type_id;
>             }
> 
>     +       INIT_LIST_HEAD(&connector->global_connector_list_entry);
>             INIT_LIST_HEAD(&connector->probed_modes);
>             INIT_LIST_HEAD(&connector->modes);
>             mutex_init(&connector->mutex);
>     @@ -540,6 +549,9 @@ int drm_connector_register(struct drm_connector *connector)
>                     drm_privacy_screen_register_notifier(connector->privacy_screen,
>                                                &connector->privacy_screen_notifier);
> 
>     +       mutex_lock(&connector_list_lock);
>     +       list_add_tail(&connector->global_connector_list_entry, &connector_list);
>     +       mutex_unlock(&connector_list_lock);
>             goto unlock;
> 
>      err_debugfs:
>     @@ -568,6 +580,10 @@ void drm_connector_unregister(struct drm_connector *connector)
>                     return;
>             }
> 
>     +       mutex_lock(&connector_list_lock);
>     +       list_del_init(&connector->global_connector_list_entry);
>     +       mutex_unlock(&connector_list_lock);
>     +
>             if (connector->privacy_screen)
>                     drm_privacy_screen_unregister_notifier(
>                                             connector->privacy_screen,
>     @@ -2676,6 +2692,40 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
>             return ret;
>      }
> 
>     +/**
>     + * drm_connector_find_by_fwnode - Find a connector based on the associated fwnode
>     + * @fwnode: fwnode for which to find the matching drm_connector
>     + *
>     + * This functions looks up a drm_connector based on its associated fwnode. When
>     + * a connector is found a reference to the connector is returned. The caller must
>     + * call drm_connector_put() to release this reference when it is done with the
>     + * connector.
>     + *
>     + * Returns: A reference to the found connector or an ERR_PTR().
>     + */
>     +struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>     +{
>     +       struct drm_connector *connector, *found = ERR_PTR(-ENODEV);
>     +
>     +       if (!fwnode)
>     +               return ERR_PTR(-ENODEV);
>     +
>     +       mutex_lock(&connector_list_lock);
>     +
>     +       list_for_each_entry(connector, &connector_list, global_connector_list_entry) {
>     +               if (connector->fwnode == fwnode ||
>     +                   (connector->fwnode && connector->fwnode->secondary == fwnode)) {
>     +                       drm_connector_get(connector);
>     +                       found = connector;
>     +                       break;
>     +               }
>     +       }
>     +
>     +       mutex_unlock(&connector_list_lock);
>     +
>     +       return found;
> 
> 
> 
> If I am not mistaken you can replace this with
> 
> return list_entry_is_head();
> 
> call and remove additional Boolean variable.

Found is not a boolean, it is a pointer to the found connector (or ERR_PTR(-ENODEV)).

Regards,

Hans


>  
> 
>     +}
>     +
> 
>      /**
>       * DOC: Tile group
>     diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
>     index 54d4cf1233e9..6e28fc00a740 100644
>     --- a/drivers/gpu/drm/drm_crtc_internal.h
>     +++ b/drivers/gpu/drm/drm_crtc_internal.h
>     @@ -185,6 +185,7 @@ int drm_connector_set_obj_prop(struct drm_mode_object *obj,
>      int drm_connector_create_standard_properties(struct drm_device *dev);
>      const char *drm_get_connector_force_name(enum drm_connector_force force);
>      void drm_connector_free_work_fn(struct work_struct *work);
>     +struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode);
> 
>      /* IOCTL */
>      int drm_connector_property_set_ioctl(struct drm_device *dev,
>     diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>     index d20bfd7576ed..ae377354e48e 100644
>     --- a/include/drm/drm_connector.h
>     +++ b/include/drm/drm_connector.h
>     @@ -1267,6 +1267,14 @@ struct drm_connector {
>              */
>             struct list_head head;
> 
>     +       /**
>     +        * @global_connector_list_entry:
>     +        *
>     +        * Connector entry in the global connector-list, used by
>     +        * drm_connector_find_by_fwnode().
>     +        */
>     +       struct list_head global_connector_list_entry;
>     +
>             /** @base: base KMS object */
>             struct drm_mode_object base;
>      
>     -- 
>     2.31.1
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

