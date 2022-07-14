Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FFFC43334
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Jul 2022 21:04:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240129AbiGNVE4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Jul 2022 17:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbiGNVEz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Jul 2022 17:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 727FA3AB28
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 14:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657832693;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V3eV0HtQIeNgwSw4KYhB/lbHU6rdtwImxed2P/gkI6w=;
        b=eFaposEa1dvMTl1DYDfIheLTC7SNYxMzHCQasv7orN01diQQdC4oCQ8zsXgAJiScO3ae7p
        TEOf/v04pgje5pf8a+zrZvGEi7zpIdpPmQwX1jTMw6UZcUgCzvw7/11jBzkloF8c8mGO+O
        HWomoqN21bhemALvd/KQCGA0IhopMao=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-OGhe7AN_MeK_CS7RWl921A-1; Thu, 14 Jul 2022 17:04:52 -0400
X-MC-Unique: OGhe7AN_MeK_CS7RWl921A-1
Received: by mail-qk1-f197.google.com with SMTP id bp14-20020a05620a458e00b006b59195c391so1998138qkb.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 14:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=V3eV0HtQIeNgwSw4KYhB/lbHU6rdtwImxed2P/gkI6w=;
        b=SxLHYRp2Zm728/bEXtBBsEpkhQdz5hd74EbUgZsdZVhke8LP2p/sBIvqrYfna4iRZm
         klI7UbCp6n47DxsFGOtdWQ3pFe2Nbpqx0aw1TABhYNRgD8F+8CGEzS9RfqdRDkeaYwg5
         Eyt/cm/lT4HvyoN73hlmy0FVG/Q5yx4nqMGkhPfofSH2I/NzLALfDJWJEUwZEgbpplXa
         1vKBs2EbgaqJarrJ9lbdlqDpjBQLzm/1V/ABlaxS6I6jNWs9F0EljyjX1wrtFRqynHqe
         h6FpAVtrmOKnR/VRFprLfqaHIYaMoAE4ta6g9zFZVz5CujYFgyAoMkohBzC4/nfqt3ZF
         DLMQ==
X-Gm-Message-State: AJIora8wSsqHTq3JFRGL0WOqhIlZL/dvKhw/W1R8mjZnEaJpdr8NUhSK
        PzVJ7LkylJ54D2PSO3lKsHB70b3q8nqM6EVl6l8b0ZdKMl6p/P5x8GSVNkgjH5XJ19E7Oro94Yo
        JrHnBh6+GgbFBcMBI0y8/s3pz9JpWxo2A4w==
X-Received: by 2002:a05:622a:58d:b0:317:ca0d:91a5 with SMTP id c13-20020a05622a058d00b00317ca0d91a5mr9655874qtb.601.1657832692133;
        Thu, 14 Jul 2022 14:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sbx+zK8/mPtD0D+YyNPAbK5LK8NiDtBFPc01KiEA2vmrSBhdBxGvlsaL94Yg7djHKtma5eHQ==
X-Received: by 2002:a05:622a:58d:b0:317:ca0d:91a5 with SMTP id c13-20020a05622a058d00b00317ca0d91a5mr9655836qtb.601.1657832691869;
        Thu, 14 Jul 2022 14:04:51 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
        by smtp.gmail.com with ESMTPSA id k10-20020ac8474a000000b00304bc2acc25sm2306978qtp.6.2022.07.14.14.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 14:04:50 -0700 (PDT)
Message-ID: <e99fa5b8ff05cbfe9e8db8c551acfed86d23f69e.camel@redhat.com>
Subject: Re: [PATCH v2 05/29] drm/nouveau: Don't register backlight when
 another backlight should be used
From:   Lyude Paul <lyude@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>,
        Daniel Dadap <ddadap@nvidia.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     nouveau@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Date:   Thu, 14 Jul 2022 17:04:49 -0400
In-Reply-To: <20220712193910.439171-6-hdegoede@redhat.com>
References: <20220712193910.439171-1-hdegoede@redhat.com>
         <20220712193910.439171-6-hdegoede@redhat.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Reviewed-by: Lyude Paul <lyude@redhat.com>

You also have permission to push this to drm-misc-whatever

On Tue, 2022-07-12 at 21:38 +0200, Hans de Goede wrote:
> Before this commit when we want userspace to use the acpi_video backlight
> device we register both the GPU's native backlight device and acpi_video's
> firmware acpi_video# backlight device. This relies on userspace preferring
> firmware type backlight devices over native ones.
> 
> Registering 2 backlight devices for a single display really is
> undesirable, don't register the GPU's native backlight device when
> another backlight device should be used.
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index a2141d3d9b1d..91c504c7b82c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -34,6 +34,8 @@
>  #include <linux/backlight.h>
>  #include <linux/idr.h>
>  
> +#include <acpi/video.h>
> +
>  #include "nouveau_drv.h"
>  #include "nouveau_reg.h"
>  #include "nouveau_encoder.h"
> @@ -405,6 +407,11 @@ nouveau_backlight_init(struct drm_connector *connector)
>                 goto fail_alloc;
>         }
>  
> +       if (!acpi_video_backlight_use_native()) {
> +               NV_INFO(drm, "Skipping nv_backlight registration\n");
> +               goto fail_alloc;
> +       }
> +
>         if (!nouveau_get_backlight_name(backlight_name, bl)) {
>                 NV_ERROR(drm, "Failed to retrieve a unique name for the
> backlight interface\n");
>                 goto fail_alloc;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

