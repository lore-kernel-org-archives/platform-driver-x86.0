Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E56EC433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 09:07:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2348E613BF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 09:07:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbhEEJI3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 May 2021 05:08:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28521 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229529AbhEEJI3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 May 2021 05:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620205652;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pz7sbaRfy/0TDXOC1f1al0lW9VaNbTkpWQsSLCYv29M=;
        b=MB2CXRQ08vb43pBqzfSfBiqlly3VHZaz2w2FhMdp3kphXJwFAlwNhzwNbze6RbncsNBpE1
        Cb6elvIQJv/AR5x+0+qDIefo0yQuadbZf9wKRkyc1uEj7Rp26U62ImoUqoBufWHsuC89+f
        PBb8hYq+1ihRq3YmnT53D2PrPtKa01U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-JmUvrOzXPI2cBOBF9hAgZg-1; Wed, 05 May 2021 05:07:30 -0400
X-MC-Unique: JmUvrOzXPI2cBOBF9hAgZg-1
Received: by mail-ed1-f71.google.com with SMTP id d8-20020a0564020008b0290387d38e3ce0so548845edu.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 May 2021 02:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pz7sbaRfy/0TDXOC1f1al0lW9VaNbTkpWQsSLCYv29M=;
        b=C1FnZi6yZIgguk86IW46pJ9i5ZF+Wzx26ayePlPz1CTFu/TDRspUwtRaMe9+DqxuGG
         WUy2OYVqAo1gIYcW8isAzUiTFdnzTx1Uz2TMhFMX7qPM/3x2xUYnhFFQA7QrPN6Vp+N0
         qvolhVmfwe7XZRyrzgDoKJMib0tgJu12qbGrIP/hNk5FQwLre8eOHgdNVfcrEc7+vDy3
         zK4G4KdVAnutGUL7Rhak1pKk13LV1XDCB8avpPrXYWGQq1lrz/riV1YAFTtwLg6OLZpv
         2KXW5bqWWcETVT7G1O4yM/IuNcqwbK8WcQrvQBGomFiMoEO55091klu+AM+8hyjBZVPk
         klRQ==
X-Gm-Message-State: AOAM5337lahPt4H4Ll5iWMhQZ9hmKkJH/vdTDVN37sDtg/wfaB0REKUF
        kFoNYuqHSH69s8l+SOIpwoscK15IuRgtq9+qu+PHb5lAb9THU0DY8wgo4+dkbnyrWI8IeL8/Cgu
        she4p2VvyOkWnHnxfU34B2D7BYn2H6Y3ReA==
X-Received: by 2002:a17:906:c44d:: with SMTP id ck13mr10615488ejb.371.1620205649546;
        Wed, 05 May 2021 02:07:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYSqa+65exu1dZH3dzcl5zEnOuL6llMbBzQ2JuYFwFzYzWAo51kMx9iphvKpmwQvNoBgHgUA==
X-Received: by 2002:a17:906:c44d:: with SMTP id ck13mr10615471ejb.371.1620205649348;
        Wed, 05 May 2021 02:07:29 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z26sm2553845ejl.38.2021.05.05.02.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 02:07:28 -0700 (PDT)
Subject: Re: [PATCH 5/9] drm/i915: Associate ACPI connector nodes with
 connector entries
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
 <20210503154647.142551-6-hdegoede@redhat.com>
 <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ee230261-423d-0e2f-16b0-852d264afa2b@redhat.com>
Date:   Wed, 5 May 2021 11:07:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/4/21 9:52 AM, Andy Shevchenko wrote:
> 
> 
> On Monday, May 3, 2021, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> 
>     From: Heikki Krogerus <heikki.krogerus@linux.intel.com <mailto:heikki.krogerus@linux.intel.com>>
> 
>     On Intel platforms we know that the ACPI connector device
>     node order will follow the order the driver (i915) decides.
>     The decision is made using the custom Intel ACPI OpRegion
>     (intel_opregion.c), though the driver does not actually know
>     that the values it sends to ACPI there are used for
>     associating a device node for the connectors, and assigning
>     address for them.
> 
>     In reality that custom Intel ACPI OpRegion actually violates
>     ACPI specification (we supply dynamic information to objects
>     that are defined static, for example _ADR), however, it
>     makes assigning correct connector node for a connector entry
>     straightforward (it's one-on-one mapping).
> 
>     Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com <mailto:heikki.krogerus@linux.intel.com>>
>     [hdegoede@redhat.com <mailto:hdegoede@redhat.com>: Move intel_acpi_assign_connector_fwnodes() to
>      intel_acpi.c]
>     Signed-off-by: Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>>
>     ---
>      drivers/gpu/drm/i915/display/intel_acpi.c    | 40 ++++++++++++++++++++
>      drivers/gpu/drm/i915/display/intel_acpi.h    |  3 ++
>      drivers/gpu/drm/i915/display/intel_display.c |  1 +
>      3 files changed, 44 insertions(+)
> 
>     diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
>     index 833d0c1be4f1..9f266dfda7dd 100644
>     --- a/drivers/gpu/drm/i915/display/intel_acpi.c
>     +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
>     @@ -263,3 +263,43 @@ void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
>             }
>             drm_connector_list_iter_end(&conn_iter);
>      }
>     +
>     +/* NOTE: The connector order must be final before this is called. */
>     +void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915)
>     +{
>     +       struct drm_connector_list_iter conn_iter;
>     +       struct drm_device *drm_dev = &i915->drm;
>     +       struct device *kdev = &drm_dev->pdev->dev;
>     +       struct fwnode_handle *fwnode = NULL;
>     +       struct drm_connector *connector;
>     +       struct acpi_device *adev;
>     +
>     +       drm_connector_list_iter_begin(drm_dev, &conn_iter);
>     +       drm_for_each_connector_iter(connector, &conn_iter) {
>     +               /* Always getting the next, even when the last was not used. */
>     +               fwnode = device_get_next_child_node(kdev, fwnode);
>     +               if (!fwnode)
>     +                       break;
> 
> 
> 
> Who is dropping reference counting on fwnode ?

We are dealing with ACPI fwnode-s here and those are not ref-counted, they
are embedded inside a struct acpi_device and their lifetime is tied to
that struct. They should probably still be ref-counted (with the count
never dropping to 0) so that the generic fwnode functions behave the same
anywhere but atm the ACPI nodes are not refcounted, see: acpi_get_next_subnode()
in drivers/acpi/property.c which is the get_next_child_node() implementation
for ACPI fwnode-s.

> I’m in the middle of a pile of fixes for fwnode refcounting when for_each_child or get_next_child is used. So, please double check you drop a reference.

The kdoc comments on device_get_next_child_node() / fwnode_get_next_child_node()
do not mention anything about these functions returning a reference.

So I think we need to first make up our mind here how we want this all to
work and then fix the actual implementation and docs before fixing callers.

Regards,

Hans




>  
> 
>     +
>     +               switch (connector->connector_type) {
>     +               case DRM_MODE_CONNECTOR_LVDS:
>     +               case DRM_MODE_CONNECTOR_eDP:
>     +               case DRM_MODE_CONNECTOR_DSI:
>     +                       /*
>     +                        * Integrated displays have a specific address 0x1f on
>     +                        * most Intel platforms, but not on all of them.
>     +                        */
>     +                       adev = acpi_find_child_device(ACPI_COMPANION(kdev),
>     +                                                     0x1f, 0);
>     +                       if (adev) {
>     +                               connector->fwnode = acpi_fwnode_handle(adev);
>     +                               break;
>     +                       }
>     +                       fallthrough;
>     +               default:
>     +                       connector->fwnode = fwnode;
>     +                       break;
>     +               }
>     +       }
>     +       drm_connector_list_iter_end(&conn_iter);
>     +}
>     diff --git a/drivers/gpu/drm/i915/display/intel_acpi.h b/drivers/gpu/drm/i915/display/intel_acpi.h
>     index e8b068661d22..d2435691f4b5 100644
>     --- a/drivers/gpu/drm/i915/display/intel_acpi.h
>     +++ b/drivers/gpu/drm/i915/display/intel_acpi.h
>     @@ -12,11 +12,14 @@ struct drm_i915_private;
>      void intel_register_dsm_handler(void);
>      void intel_unregister_dsm_handler(void);
>      void intel_acpi_device_id_update(struct drm_i915_private *i915);
>     +void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915);
>      #else
>      static inline void intel_register_dsm_handler(void) { return; }
>      static inline void intel_unregister_dsm_handler(void) { return; }
>      static inline
>      void intel_acpi_device_id_update(struct drm_i915_private *i915) { return; }
>     +static inline
>     +void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915) { return; }
>      #endif /* CONFIG_ACPI */
> 
>      #endif /* __INTEL_ACPI_H__ */
>     diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>     index 828ef4c5625f..87cad549632c 100644
>     --- a/drivers/gpu/drm/i915/display/intel_display.c
>     +++ b/drivers/gpu/drm/i915/display/intel_display.c
>     @@ -14970,6 +14970,7 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
> 
>             drm_modeset_lock_all(dev);
>             intel_modeset_setup_hw_state(dev, dev->mode_config.acquire_ctx);
>     +       intel_acpi_assign_connector_fwnodes(i915);
>             drm_modeset_unlock_all(dev);
> 
>             for_each_intel_crtc(dev, crtc) {
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

