Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCC1C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Sep 2021 19:48:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 072F760F92
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Sep 2021 19:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbhIOTtq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Sep 2021 15:49:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22528 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231689AbhIOTto (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Sep 2021 15:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631735303;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5QhPz3aMDmMaiubdIQIAXvCxnYxuMA732ECNckrS7nI=;
        b=XBOdAC9WUH+7hEAWDX35pGmHbFN3jZem9YNeyhjzEZE9c9llRFATq3nBHU5A2i3WqnoqYI
        04d2IPZMaI1D74KK0lAmoT6dqsCl1Oekaj9Jze05n/1wadgOyhGWiKx/xeFLxZ5zr6zLNK
        az5NVDEoiGUvyaOZFvcHVhJarCWGivs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-0lOzcEECPuecLySiGtZdUw-1; Wed, 15 Sep 2021 15:48:22 -0400
X-MC-Unique: 0lOzcEECPuecLySiGtZdUw-1
Received: by mail-qk1-f200.google.com with SMTP id 70-20020a370b49000000b003d2f5f0dcc6so6896243qkl.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Sep 2021 12:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=5QhPz3aMDmMaiubdIQIAXvCxnYxuMA732ECNckrS7nI=;
        b=7WhE5PrF4sJUP2UWJ8lH6b+xCZ+ZbYnzFaI/E4MzlyGw3S2MHjQrjQbPQ+a+HxlEfK
         sHY/dLiZryXPsVah4UGCQwUzjtrmXF85FHQPYZMZs0Qhp9noPdDlXWXv9pE/XuRinIb8
         7j9WECrusLAu0upoIDehXHzvbrsZNh/kYDPB0JoU/P9/Ws9OOnj/wrsP38/HXpbOD47i
         oAkatBW2Q8Zd5QtYDEkWhUnQsvhrVn7VEyeMyxP5F2z+m4bpHO9gLsUrJA/Lde5X9LOg
         xtiP45A7AsXjYZ02yQWhbq8MJeNIXc6luUC0YZ795g3Z0pZwo+2kePvdtiFc5WyaEe1h
         w6Og==
X-Gm-Message-State: AOAM532K3JEUGTVvxvWU1uYmecSEnoCHH0PIj2VK96PxbCnjslbZ/kAH
        B5qjjJCo614HPbG3WftBwIWmUyNpzAEdMoU10zRd14AN7GbA3c42OhX8Rv1sj2JbhtxPk+QMb9N
        zxFdSE8aBxKGhRtaLD5utacbgAcI4kGXnYQ==
X-Received: by 2002:a05:6214:2427:: with SMTP id gy7mr1746760qvb.20.1631735301759;
        Wed, 15 Sep 2021 12:48:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3I5qwk1E3TVUdZmWzVo/ax0LEqjjb9iApw7AxVo+ftr2xVKzWq3gcPWLdHL+NNdd8nFlNeQ==
X-Received: by 2002:a05:6214:2427:: with SMTP id gy7mr1746719qvb.20.1631735301414;
        Wed, 15 Sep 2021 12:48:21 -0700 (PDT)
Received: from [192.168.8.206] (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id i16sm625800qtw.15.2021.09.15.12.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 12:48:20 -0700 (PDT)
Message-ID: <9a843feee4c5b422b63f8cc5890bdfa67bbb0f17.camel@redhat.com>
Subject: Re: [PATCH 1/9] drm/connector: Add support for privacy-screen
 properties (v4)
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
        platform-driver-x86@vger.kernel.org,
        Mario Limonciello <Mario.limonciello@dell.com>
Date:   Wed, 15 Sep 2021 15:48:19 -0400
In-Reply-To: <20210906073519.4615-2-hdegoede@redhat.com>
References: <20210906073519.4615-1-hdegoede@redhat.com>
         <20210906073519.4615-2-hdegoede@redhat.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 2021-09-06 at 09:35 +0200, Hans de Goede wrote:
> From: Rajat Jain <rajatja@google.com>
> 
> Add support for generic electronic privacy screen properties, that
> can be added by systems that have an integrated EPS.
> 
> Changes in v2 (Hans de Goede)
> - Create 2 properties, "privacy-screen sw-state" and
>   "privacy-screen hw-state", to deal with devices where the OS might be
>   locked out of making state changes
> - Write kerneldoc explaining how the 2 properties work together, what
>   happens when changes to the state are made outside of the DRM code's
>   control, etc.
> 
> Changes in v3 (Hans de Goede)
> - Some small tweaks to the kerneldoc describing the 2 properties
> 
> Changes in v4 (Hans de Goede)
> - Change the "Enabled, locked" and "Disabled, locked" hw-state enum value
>   names to "Enabled-locked" and "Disabled-locked". The xrandr command shows
>   all possible enum values separated by commas in its output, so having a
>   comma in an enum name is not a good idea.
> - Do not add a privacy_screen_hw_state member to drm_connector_state
>   since this property is immutable its value must be directly stored in the
>   obj->properties->values array
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> Co-authored-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Reviewed-by: Mario Limonciello <Mario.limonciello@dell.com>
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  Documentation/gpu/drm-kms.rst     |   2 +
>  drivers/gpu/drm/drm_atomic_uapi.c |   4 ++
>  drivers/gpu/drm/drm_connector.c   | 101 ++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h       |  44 +++++++++++++
>  4 files changed, 151 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 1ef7951ded5e..d14bf1c35d7e 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -506,6 +506,8 @@ Property Types and Blob Property Support
>  .. kernel-doc:: drivers/gpu/drm/drm_property.c
>     :export:
>  
> +.. _standard_connector_properties:
> +
>  Standard Connector Properties
>  -----------------------------
>  
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> b/drivers/gpu/drm/drm_atomic_uapi.c
> index 909f31833181..cdd31fc78bfc 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -797,6 +797,8 @@ static int drm_atomic_connector_set_property(struct
> drm_connector *connector,
>                                                    fence_ptr);
>         } else if (property == connector->max_bpc_property) {
>                 state->max_requested_bpc = val;
> +       } else if (property == connector->privacy_screen_sw_state_property)
> {
> +               state->privacy_screen_sw_state = val;
>         } else if (connector->funcs->atomic_set_property) {
>                 return connector->funcs->atomic_set_property(connector,
>                                 state, property, val);
> @@ -874,6 +876,8 @@ drm_atomic_connector_get_property(struct drm_connector
> *connector,
>                 *val = 0;
>         } else if (property == connector->max_bpc_property) {
>                 *val = state->max_requested_bpc;
> +       } else if (property == connector->privacy_screen_sw_state_property)
> {
> +               *val = state->privacy_screen_sw_state;
>         } else if (connector->funcs->atomic_get_property) {
>                 return connector->funcs->atomic_get_property(connector,
>                                 state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c
> b/drivers/gpu/drm/drm_connector.c
> index e0a30e0ee86a..dd1ca68881ba 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1264,6 +1264,46 @@ static const struct drm_prop_enum_list
> dp_colorspaces[] = {
>   *     For DVI-I and TVout there is also a matching property "select
> subconnector"
>   *     allowing to switch between signal types.
>   *     DP subconnector corresponds to a downstream port.
> + *
> + * privacy-screen sw-state, privacy-screen hw-state:
> + *     These 2 optional properties can be used to query the state of the
> + *     electronic privacy screen that is available on some displays; and in
> + *     some cases also control the state. If a driver implements these
> + *     properties then both properties must be present.
> + *
> + *     "privacy-screen hw-state" is read-only and reflects the actual state
> + *     of the privacy-screen, possible values: "Enabled", "Disabled,
> + *     "Enabled-locked", "Disabled-locked". The locked states indicate
> + *     that the state cannot be changed through the DRM API. E.g. there
> + *     might be devices where the firmware-setup options, or a hardware
> + *     slider-switch, offer always on / off modes.
> + *
> + *     "privacy-screen sw-state" can be set to change the privacy-screen
> state
> + *     when not locked. In this case the driver must update the hw-state
> + *     property to reflect the new state on completion of the commit of the
> + *     sw-state property. Setting the sw-state property when the hw-state
> is
> + *     locked must be interpreted by the driver as a request to change the
> + *     state to the set state when the hw-state becomes unlocked. E.g. if
> + *     "privacy-screen hw-state" is "Enabled-locked" and the sw-state
> + *     gets set to "Disabled" followed by the user unlocking the state by
> + *     changing the slider-switch position, then the driver must set the
> + *     state to "Disabled" upon receiving the unlock event.
> + *
> + *     In some cases the privacy-screen's actual state might change outside
> of
> + *     control of the DRM code. E.g. there might be a firmware handled
> hotkey
> + *     which toggles the actual state, or the actual state might be changed
> + *     through another userspace API such as writing
> /proc/acpi/ibm/lcdshadow.
> + *     In this case the driver must update both the hw-state and the sw-
> state
> + *     to reflect the new value, overwriting any pending state requests in
> the
> + *     sw-state. Any pending sw-state requests are thus discarded.
> + *
> + *     Note that the ability for the state to change outside of control of
> + *     the DRM master process means that userspace must not cache the value
> + *     of the sw-state. Caching the sw-state value and including it in
> later
> + *     atomic commits may lead to overriding a state change done through
> e.g.
> + *     a firmware handled hotkey. Therefor userspace must not include the
> + *     privacy-screen sw-state in an atomic commit unless it wants to
> change
> + *     its value.
>   */
>  
>  int drm_connector_create_standard_properties(struct drm_device *dev)
> @@ -2341,6 +2381,67 @@ int drm_connector_set_panel_orientation_with_quirk(
>  }
>  EXPORT_SYMBOL(drm_connector_set_panel_orientation_with_quirk);
>  
> +static const struct drm_prop_enum_list privacy_screen_enum[] = {
> +       { PRIVACY_SCREEN_DISABLED,              "Disabled" },
> +       { PRIVACY_SCREEN_ENABLED,               "Enabled" },
> +       { PRIVACY_SCREEN_DISABLED_LOCKED,       "Disabled-locked" },
> +       { PRIVACY_SCREEN_ENABLED_LOCKED,        "Enabled-locked" },
> +};
> +
> +/**
> + * drm_connector_create_privacy_screen_properties - create the drm
> connecter's
> + *    privacy-screen properties.
> + * @connector: connector for which to create the privacy-screen properties
> + *
> + * This function creates the "privacy-screen sw-state" and "privacy-screen
> + * hw-state" properties for the connector. They are not attached.
> + */
> +void
> +drm_connector_create_privacy_screen_properties(struct drm_connector
> *connector)
> +{
> +       if (connector->privacy_screen_sw_state_property)
> +               return;
> +
> +       /* Note sw-state only supports the first 2 values of the enum */
> +       connector->privacy_screen_sw_state_property =
> +               drm_property_create_enum(connector->dev, DRM_MODE_PROP_ENUM,
> +                               "privacy-screen sw-state",
> +                               privacy_screen_enum, 2);
> +
> +       connector->privacy_screen_hw_state_property =
> +               drm_property_create_enum(connector->dev,
> +                               DRM_MODE_PROP_IMMUTABLE |
> DRM_MODE_PROP_ENUM,
> +                               "privacy-screen hw-state",
> +                               privacy_screen_enum,
> +                               ARRAY_SIZE(privacy_screen_enum));
> +}
> +EXPORT_SYMBOL(drm_connector_create_privacy_screen_properties);
> +
> +/**
> + * drm_connector_attach_privacy_screen_properties - attach the drm
> connecter's
> + *    privacy-screen properties.
> + * @connector: connector on which to attach the privacy-screen properties
> + *
> + * This function attaches the "privacy-screen sw-state" and "privacy-screen
> + * hw-state" properties to the connector. The initial state of both is set
> + * to "Disabled".
> + */
> +void
> +drm_connector_attach_privacy_screen_properties(struct drm_connector
> *connector)
> +{
> +       if (!connector->privacy_screen_sw_state_property)
> +               return;
> +
> +       drm_object_attach_property(&connector->base,
> +                                  connector-
> >privacy_screen_sw_state_property,
> +                                  PRIVACY_SCREEN_DISABLED);
> +
> +       drm_object_attach_property(&connector->base,
> +                                  connector-
> >privacy_screen_hw_state_property,
> +                                  PRIVACY_SCREEN_DISABLED);
> +}
> +EXPORT_SYMBOL(drm_connector_attach_privacy_screen_properties);
> +
>  int drm_connector_set_obj_prop(struct drm_mode_object *obj,
>                                     struct drm_property *property,
>                                     uint64_t value)
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 79fa34e5ccdb..1acbcf0626ce 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -320,6 +320,30 @@ struct drm_monitor_range_info {
>         u8 max_vfreq;
>  };
>  
> +/**
> + * enum drm_privacy_screen_status - privacy screen status
> + *
> + * This enum is used to track and control the state of the integrated
> privacy
> + * screen present on some display panels, via the "privacy-screen sw-state"
> + * and "privacy-screen hw-state" properties. Note the _LOCKED enum values
> + * are only valid for the "privacy-screen hw-state" property.
> + *
> + * @PRIVACY_SCREEN_DISABLED:
> + *  The privacy-screen on the panel is disabled
> + * @PRIVACY_SCREEN_ENABLED:
> + *  The privacy-screen on the panel is enabled
> + * @PRIVACY_SCREEN_DISABLED_LOCKED:
> + *  The privacy-screen on the panel is disabled and locked (cannot be
> changed)
> + * @PRIVACY_SCREEN_ENABLED_LOCKED:
> + *  The privacy-screen on the panel is enabled and locked (cannot be
> changed)
> + */
> +enum drm_privacy_screen_status {
> +       PRIVACY_SCREEN_DISABLED = 0,
> +       PRIVACY_SCREEN_ENABLED,
> +       PRIVACY_SCREEN_DISABLED_LOCKED,
> +       PRIVACY_SCREEN_ENABLED_LOCKED,
> +};
> +
>  /*
>   * This is a consolidated colorimetry list supported by HDMI and
>   * DP protocol standard. The respective connectors will register
> @@ -781,6 +805,12 @@ struct drm_connector_state {
>          */
>         u8 max_bpc;
>  
> +       /**
> +        * @privacy_screen_sw_state: See :ref:`Standard Connector
> +        * Properties<standard_connector_properties>`
> +        */

So THAT'S how you reference other sections. I've always wondered!

> +       enum drm_privacy_screen_status privacy_screen_sw_state;
> +
>         /**
>          * @hdr_output_metadata:
>          * DRM blob property for HDR output metadata
> @@ -1409,6 +1439,18 @@ struct drm_connector {
>          */
>         struct drm_property *max_bpc_property;
>  
> +       /**
> +        * @privacy_screen_sw_state_property: Optional atomic property for
> the
> +        * connector to control the integrated privacy screen.
> +        */
> +       struct drm_property *privacy_screen_sw_state_property;
> +
> +       /**
> +        * @privacy_screen_hw_state_property: Optional atomic property for
> the
> +        * connector to report the actual integrated privacy screen state.
> +        */
> +       struct drm_property *privacy_screen_hw_state_property;
> +
>  #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>  #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>  #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
> @@ -1732,6 +1774,8 @@ int drm_connector_set_panel_orientation_with_quirk(
>         int width, int height);
>  int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>                                           int min, int max);
> +void drm_connector_create_privacy_screen_properties(struct drm_connector
> *conn);
> +void drm_connector_attach_privacy_screen_properties(struct drm_connector
> *conn);
>  
>  /**
>   * struct drm_tile_group - Tile group metadata

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

