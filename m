Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F84C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 May 2022 17:05:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240725AbiERRF0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 May 2022 13:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240706AbiERRF0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 May 2022 13:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EF59E20CA51
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 May 2022 10:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652893524;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TRLEjcaMw89+h7bBWjlXiLnoDwDJpSdbFcWF9EAQdJc=;
        b=iNUmQIkRmsm1KR7VvjIoVxRedimexCmgzVhIvdB8YUrO6He+03T484L+OmP74ihaFE/sW0
        MHBEWW8vjSK1Hz8wsbgqNgQFelOc0WYx/zpAhXciCmNtLdzqKB/PiIlXo7Ihl7bggipQvE
        n3rk2cNSqerD3uZOEdJ6+IloPyLwGfg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-VcFWt4AjMPGx5VGdRDzWyQ-1; Wed, 18 May 2022 13:05:22 -0400
X-MC-Unique: VcFWt4AjMPGx5VGdRDzWyQ-1
Received: by mail-qk1-f199.google.com with SMTP id a5-20020ae9e805000000b006a034b31384so2017638qkg.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 May 2022 10:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=TRLEjcaMw89+h7bBWjlXiLnoDwDJpSdbFcWF9EAQdJc=;
        b=fZoTx+VEN4Fei3sWrNOits+2Eq4BE49eG/4S76konZIIhMd7YKK4qjgRc4gDlg/tI8
         m3HjeTU+e/yz/LSjFH6uqMnQHxKey2qfVzsOBiFf7iQOd6sSjysT6zfnwgMcmJOXUbx3
         vS+/cnJJSj64gjS1yl9U+SJ5WG/FpI4Ee/GafWDHYMkKjEGbQTdbZOWW247qizr0WdYL
         7nQePXD4Snzix+7AOeqw1KHsdvMGap7iGdyxZiwgroyYysHSG4EmueqeePTlGF9jAeni
         NRYeHTks/N45/eUVOtfrvwOnGpoTwSOJo7XSYkH513RqHtoc4tU2cVaC7PWeur9ZqTq0
         Totg==
X-Gm-Message-State: AOAM532WPJ+k6XmMfm8/a0dPUIaoVMKJsDSrr8I2Mc7GDbeH7Hx411BY
        23lcByUpR3R6BPAytuABjFYwmlfpMn9z+ce45LixtQ0pXmmaPyUb8JJ3mgOmwaeCnqe+B3dRxOJ
        DW39lIRaKlGzWvtwbDYB9g69Y9F1fHzbj+w==
X-Received: by 2002:a05:622a:13d2:b0:2f3:d2aa:7c5a with SMTP id p18-20020a05622a13d200b002f3d2aa7c5amr688786qtk.155.1652893521989;
        Wed, 18 May 2022 10:05:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWXT+ucokDAqDDNsvHx45rk/kOMhw7MyDKCGHWLD4jc69TnlXtDtdyumDrgdXUe4O3YCGvOQ==
X-Received: by 2002:a05:622a:13d2:b0:2f3:d2aa:7c5a with SMTP id p18-20020a05622a13d200b002f3d2aa7c5amr688757qtk.155.1652893521745;
        Wed, 18 May 2022 10:05:21 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net. [71.184.137.158])
        by smtp.gmail.com with ESMTPSA id u24-20020a05622a199800b002f3ce9c0601sm1719763qtc.3.2022.05.18.10.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 10:05:21 -0700 (PDT)
Message-ID: <e67e2a183d40181420a3536b0a400161357aaee6.camel@redhat.com>
Subject: Re: [PATCH 05/14] drm/nouveau: Don't register backlight when
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
        "Pan, Xinhui" <Xinhui.Pan@amd.com>, Xinhui <Xinhui.Pan@amd.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     nouveau@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Date:   Wed, 18 May 2022 13:05:19 -0400
In-Reply-To: <20220517152331.16217-6-hdegoede@redhat.com>
References: <20220517152331.16217-1-hdegoede@redhat.com>
         <20220517152331.16217-6-hdegoede@redhat.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Reviewed-by: Lyude Paul <lyude@redhat.com>

Also, ack on this being pushed to drm-misc, along with any other patches I r-b

On Tue, 2022-05-17 at 17:23 +0200, Hans de Goede wrote:
> Before this commit when we want userspace to use the acpi_video backlight
> device we register both the GPU's native backlight device and acpi_video's
> firmware acpi_video# backlight device. This relies on userspace preferring
> firmware type backlight devices over native ones.
> 
> Registering 2 backlight devices for a single display really is
> undesirable, don't register the GPU's native backlight device when
> another backlight device should be used.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index daf9f87477ba..f56ff797c78c 100644
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
> @@ -404,6 +406,11 @@ nouveau_backlight_init(struct drm_connector *connector)
>                 goto fail_alloc;
>         }
>  
> +       if (acpi_video_get_backlight_type(true) != acpi_backlight_native) {
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

