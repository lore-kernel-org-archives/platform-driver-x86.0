Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA074C47096
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Jun 2021 11:59:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6AE4613D6
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Jun 2021 11:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhFCMBT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Jun 2021 08:01:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21641 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229747AbhFCMBT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Jun 2021 08:01:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622721574;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e/FZoX4WIIm6XZW0ArQELD2C1vsdBoERWuy3oEiMfj0=;
        b=Hkh54+7cL4aVEvsXcbUMlOUXoOBYJhyVj7nnjnd1GI9QfZKMmIumMHU8IyFGqeoHmvm6zO
        qP/AL6b3ifcTpY8y5IJPQt4Y0I3ynSFZTmCY9eZiKXvnx8wU1ZD6gZzxD6CoaaaxbGXd1G
        Kkc0MgAiiF9pxjddkPbYjSK//g2Zv4c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-gPUhNNusMtePVOyGGL8Tsg-1; Thu, 03 Jun 2021 07:59:33 -0400
X-MC-Unique: gPUhNNusMtePVOyGGL8Tsg-1
Received: by mail-ed1-f72.google.com with SMTP id d8-20020a0564020008b0290387d38e3ce0so3148368edu.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Jun 2021 04:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e/FZoX4WIIm6XZW0ArQELD2C1vsdBoERWuy3oEiMfj0=;
        b=emZnK4ntBoM04CmU2bXjIQmnrXL7cn2zdRM9Myf0edtPmCBoTJ79kOIlWdTelOEKPK
         zVvdFWesLNGg+HuMQaQ6v9xW3d7xCcUU6QigVxnKlfiwDtZtjH6OYffhz9r+kSjlwEHB
         a4GggGryA2lS7YlLSj7ClfJlMNK+kcxEpFCdkdLGNPvb0+npTfZNx2nEyNdg0r2yoyZy
         l3RZzf4f2SdGKxTKP/n5DVyOaVHV9PD+RcCQrwkXr0iYB70w3v2mPLhnnCy4jEvqDiq1
         5PNt7rTKOYZk2tgXThLNa1FN7ceYxWeFD6dVkkhbnxtJomyYqxogMsFUdp2XJ7mTdpWo
         SoRg==
X-Gm-Message-State: AOAM532g3DrykvCaux8rkRFG1MUSNEeX3B+KmZDAVBUHHeSx5F8oteCW
        vUa8j/phNCVaSELr0B6zcJ62u9IbPQ+DwkahewHQb4ZQJobntJhKNrnbm05HWep5jHo5K8CtweC
        QwJkdomcy+uNH8vX52FF806U/f5GMIUgoeg==
X-Received: by 2002:a17:906:2b85:: with SMTP id m5mr39462375ejg.141.1622721572027;
        Thu, 03 Jun 2021 04:59:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLrhoVTSXNrq9oOLzdqRELKVnqXPHLA//ELnJuvPrh+jVnzjKXUa2Z3o+3O301UXhhaYNPDA==
X-Received: by 2002:a17:906:2b85:: with SMTP id m5mr39462359ejg.141.1622721571851;
        Thu, 03 Jun 2021 04:59:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id j22sm1484711ejt.11.2021.06.03.04.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 04:59:31 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH v2 2/9] drm: Add privacy-screen class (v2)
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rajat Jain <rajatja@google.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>,
        Mario Limonciello <mario.limonciello@outlook.com>
References: <20210421204804.589962-1-hdegoede@redhat.com>
 <20210421204804.589962-3-hdegoede@redhat.com>
 <CACvgo50onXuRvtXySYNHJZshSkmX8ukcMitNJAKC4dEMPTyXYw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <fb2209f1-a6d8-4a1e-de58-00ee788aa6c2@redhat.com>
Date:   Thu, 3 Jun 2021 13:59:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CACvgo50onXuRvtXySYNHJZshSkmX8ukcMitNJAKC4dEMPTyXYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/1/21 5:31 PM, Emil Velikov wrote:
> Hi Hans,
> 
> What happened with this series, did it fall through the cracks?

Sorta, as Marco already mentioned I think people are waiting for the
user-space branches which he has on his personal git repos to be submitted
as offical merge-req-s to GNOME.

> On Wed, 21 Apr 2021 at 21:48, Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_privacy_screen.c
> 
>> +#include "drm_internal.h"
> 
> I think we don't need this include, do we?

The drm_privacy_screen device registered by a provider
uses /sys/class/drm as its class, quoting from
drm_privacy_screen.c drm_privacy_screen_register():

        priv->dev.class = drm_class;
        priv->dev.type = &drm_privacy_screen_type;
        priv->dev.parent = parent;
        priv->dev.release = drm_privacy_screen_device_release;
        dev_set_name(&priv->dev, "privacy_screen-%s", dev_name(parent));
        priv->ops = ops;

        priv->ops->get_hw_state(priv);

        ret = device_register(&priv->dev);

Notice the "priv->dev.class = drm_class", the drm_class
variable is declared in "drm_internal.h".

Note this was not present in v2. As I mentioned in the commit msg:

Changes in v2:
- Make CONFIG_DRM_PRIVACY_SCREEN a bool which controls if the drm_privacy
  code gets built as part of the main drm module rather then making it
  a tristate which builds its own module.
- Add a #if IS_ENABLED(CONFIG_DRM_PRIVACY_SCREEN) check to
  drm_privacy_screen_consumer.h and define stubs when the check fails.
  Together these 2 changes fix several dependency issues.
- Remove module related code now that this is part of the main drm.ko
- Use drm_class as class for the privacy-screen devices instead of
  adding a separate class for this

This is something which I changed in v2. I changed this since I didn't
really see any good reason for drm_privacy_screen devices having their
own class, rather then just having them sit under /sys/class/drm .

I'm open to changing this if people dislike this choice.



>> --- /dev/null
>> +++ b/include/drm/drm_privacy_screen_consumer.h
> 
>> +#include <drm/drm_connector.h>
> 
> Ditto

The "enum drm_privacy_screen_status" used in various places
comes from drm/drm_connector.h (it is the same enum which is
used for the possible values of the drm-connector properties).


>> --- /dev/null
>> +++ b/include/drm/drm_privacy_screen_driver.h
> 
>> +#include <drm/drm_connector.h>
> 
> Ditto
> 
> I like how you avoided leaking any DRM details within the new code,
> modulo the includes above.

I'm glad you like it. I did indeed try to make the code mostly
independent, but as you can see above there are still some
inter-dependencies.

Because of this, the CONFIG_DRM_PRIVACY_SCREEN option also does
not control building this into a separate module. Like many other
DRM Kconfig options, this controls if the privacy-screen code will
be added to drm.ko or not.

Despite being 99% independent, the 2 are still intertwined at such
a level that this is necessary. Specifically drm_core_init() calls
drm_privacy_screen_lookup_init() to initialize the static lookup
table which is used to see if there is a privacy-screen (and to which
GPU,output combo it should be mapped). So if CONFIG_DRM_PRIVACY_SCREEN
is enabled and drm.ko is builtin then it must be builtin too, at which
point it is easiest to just make it part of drm.ko .

And there also is the later added dep from drm_privacy_screen.c on
the drm_class symbol, which means there are now symbol-deps in both
directions, which makes building the code into drm.ko the only option.

> With above tweaks, the series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

As I've tried to explain, the includes are necessary, does your
Reviewed-by still stands when I keep the includes ?

> Theoretically one could also remove the `depends on DRM` from patch
> 8/9 but I'm not sure how much that saves us.

The depends in is necessary since CONFIG_DRM_PRIVACY_SCREEN just controls
if privacy-screen support will be added to drm.ko, if it is enabled we
still need drm.ko ti actually be built for things to work.

> HTH

Yes, actually getting a review of this code helps a lot, thank you.

Regards,

Hans

