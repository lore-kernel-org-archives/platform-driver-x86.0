Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15788C00140
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Aug 2022 18:12:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237976AbiHXSMX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Aug 2022 14:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240436AbiHXSMV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Aug 2022 14:12:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B966D9CE
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 11:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661364739;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zQ3qZtEYF9kIZvb5A1H9IxOTwvdPfHqi1+4CI8j2JWY=;
        b=cmdcz3/aE0EiHKXTs/dw6orYmLpo06czB4O9H4wnuNSGtXKOy0KDB04XEUPLOaLLyvYQdZ
        CUXuNaIMxkJsDMd34BhU/AjxGGSp10EyRIX9H6ZFoZzGTDnZl7RNHCLKXEf72DnzGCgiOh
        kGMBtbPO7pmMDzafMxB5eGhR8I5Qps0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-183-3kbW6XBjNQ-kiP0K5Itf_w-1; Wed, 24 Aug 2022 14:12:18 -0400
X-MC-Unique: 3kbW6XBjNQ-kiP0K5Itf_w-1
Received: by mail-qk1-f198.google.com with SMTP id w22-20020a05620a445600b006bb7f43d1cfso15386397qkp.16
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 11:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc;
        bh=zQ3qZtEYF9kIZvb5A1H9IxOTwvdPfHqi1+4CI8j2JWY=;
        b=zYbPiHthmZDloARE66CGRX3eSbg5wCLJN2zRKVUQ8ix9VKZt1VSQ+8gKQJGLn3VxmV
         eOZlFHK3Yqp83GxNSvZDKI0Hjb3z9wCzqlHYqfdmKR5oRZ0XWliVSduguNV0VGOikxHC
         YiTuckweiCeYC1P24J0lspUfrGSDVUWbLWtONIRsQnteKrG4ZjfMo/IcaWIbYDKSlCR+
         AKg1D6L1QfF5l4Ry7DDKR5D98KveendyOpkHWqF6GSaGCk4SH0ZicfnRBHCUhaKAkyLd
         6Ur0DMignqRQpCAbswHgcbBYFKDtqy+Ca3zLDF0tmSjGzNVeUgYXSHeeAtl1TCznvUzM
         3CLQ==
X-Gm-Message-State: ACgBeo0BICooU044pTOyDSs2Q3JCMbA+EZPL4Cbt+5DshsVbDtbhg5NW
        GTCUW7iIQIrwpahqh0xFBcIf1BcS5fAWF5GBn63vMtPhj2w4xzYurPjG/f3M+0VWjjxbFSdPrcO
        gGEANjAS57YxmRP47Jupd/gVFjHiUEShQ+A==
X-Received: by 2002:a05:6214:27ee:b0:496:f17b:7459 with SMTP id jt14-20020a05621427ee00b00496f17b7459mr338520qvb.101.1661364737695;
        Wed, 24 Aug 2022 11:12:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4SOi3GajklItGmlUgJlLLhtanN0frscFinRBtNfwg/Jh8eIC0ruh9bVuC+aRmJv5zCKqZZxQ==
X-Received: by 2002:a05:6214:27ee:b0:496:f17b:7459 with SMTP id jt14-20020a05621427ee00b00496f17b7459mr338488qvb.101.1661364737427;
        Wed, 24 Aug 2022 11:12:17 -0700 (PDT)
Received: from [192.168.8.139] (pool-100-0-245-4.bstnma.fios.verizon.net. [100.0.245.4])
        by smtp.gmail.com with ESMTPSA id u4-20020a05620a454400b006bbe7ded98csm12598653qkp.112.2022.08.24.11.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 11:12:16 -0700 (PDT)
Message-ID: <341368d96c5c3bdbcab48d48a0d9b702a930ea05.camel@redhat.com>
Subject: Re: [PATCH v4 31/31] drm/todo: Add entry about dealing with
 brightness control on devices with > 1 panel
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
        Pan Xinhui <Xinhui.Pan@amd.com>,
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
Date:   Wed, 24 Aug 2022 14:12:15 -0400
In-Reply-To: <20220824121523.1291269-32-hdegoede@redhat.com>
References: <20220824121523.1291269-1-hdegoede@redhat.com>
         <20220824121523.1291269-32-hdegoede@redhat.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2022-08-24 at 14:15 +0200, Hans de Goede wrote:
> Add an entry summarizing the discussion about dealing with brightness
> control on devices with more then 1 internal panel.
> 
> The original discussion can be found here:
> https://lore.kernel.org/dri-devel/20220517152331.16217-1-hdegoede@redhat.com/
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  Documentation/gpu/todo.rst | 68 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 7634c27ac562..393d218e4a0c 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -679,6 +679,74 @@ Contact: Sam Ravnborg
>  
>  Level: Advanced
>  
> +Brightness handling on devices with multiple internal panels
> +============================================================
> +
> +On x86/ACPI devices there can be multiple backlight firmware interfaces:
> +(ACPI) video, vendor specific and others. As well as direct/native (PWM)
> +register programming by the KMS driver.
> +
> +To deal with this backlight drivers used on x86/ACPI call
> +acpi_video_get_backlight_type() which has heuristics (+quirks) to select
> +which backlight interface to use; and backlight drivers which do not match
> +the returned type will not register themselves, so that only one backlight
> +device gets registered (in a single GPU setup, see below).
> +
> +At the moment this more or less assumes that there will only
> +be 1 (internal) panel on a system.
> +
> +On systems with 2 panels this may be a problem, depending on
> +what interface acpi_video_get_backlight_type() selects:
> +
> +1. native: in this case the KMS driver is expected to know which backlight
> +   device belongs to which output so everything should just work.
> +2. video: this does support controlling multiple backlights, but some work
> +   will need to be done to get the output <-> backlight device mapping
> +
> +The above assumes both panels will require the same backlight interface type.
> +Things will break on systems with multiple panels where the 2 panels need
> +a different type of control. E.g. one panel needs ACPI video backlight control,
> +where as the other is using native backlight control. Currently in this case
> +only one of the 2 required backlight devices will get registered, based on
> +the acpi_video_get_backlight_type() return value.
> +
> +If this (theoretical) case ever shows up, then supporting this will need some
> +work. A possible solution here would be to pass a device and connector-name
> +to acpi_video_get_backlight_type() so that it can deal with this.
> +
> +Note in a way we already have a case where userspace sees 2 panels,
> +in dual GPU laptop setups with a mux. On those systems we may see
> +either 2 native backlight devices; or 2 native backlight devices.
> +
> +Userspace already has code to deal with this by detecting if the related
> +panel is active (iow which way the mux between the GPU and the panels
> +points) and then uses that backlight device. Userspace here very much
> +assumes a single panel though. It picks only 1 of the 2 backlight devices
> +and then only uses that one.
> +
> +Note that all userspace code (that I know off) is currently hardcoded
> +to assume a single panel.
> +
> +Before the recent changes to not register multiple (e.g. video + native)
> +/sys/class/backlight devices for a single panel (on a single GPU laptop),
> +userspace would see multiple backlight devices all controlling the same
> +backlight.
> +
> +To deal with this userspace had to always picks one preferred device under
> +/sys/class/backlight and will ignore the others. So to support brightness
> +control on multiple panels userspace will need to be updated too.
> +
> +There are plans to allow brightness control through the KMS API by adding
> +a "display brightness" property to drm_connector objects for panels. This
> +solves a number of issues with the /sys/class/backlight API, including not
> +being able to map a sysfs backlight device to a specific connector. Any
> +userspace changes to add support for brightness control on devices with
> +multiple panels really should build on top of this new KMS property.
> +
> +Contact: Hans de Goede
> +
> +Level: Advanced
> +
>  Outside DRM
>  ===========
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

