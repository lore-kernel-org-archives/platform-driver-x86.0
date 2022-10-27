Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F5BC38A2D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Oct 2022 10:37:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235030AbiJ0Kh4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Oct 2022 06:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233403AbiJ0Khz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Oct 2022 06:37:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E85D6F27E
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 03:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666867073;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KIrIm83XlmkQEHvLgMNI62dGgv/hpRuvnAfiEarWzlw=;
        b=OHGWG0YHNBiMFKLKAcQDT1KtbGf2FrcBxY2yfsk9zKclprYVL0Vfvq/QNHGLS5SUWjpqaR
        Mi7znTXIfahKwOx7HysHLQ6C7RGV716ZCCT0K207WRKHQneP+NWtiuYDXEd3uJGAdLyTiR
        8M97wGP51arPMxcQ+uJQIN7IpQWcWo8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-449-vXKlFrJUPZyp873Vy81YGA-1; Thu, 27 Oct 2022 06:37:52 -0400
X-MC-Unique: vXKlFrJUPZyp873Vy81YGA-1
Received: by mail-ed1-f71.google.com with SMTP id z15-20020a05640240cf00b00461b253c220so835347edb.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 03:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KIrIm83XlmkQEHvLgMNI62dGgv/hpRuvnAfiEarWzlw=;
        b=ngk+NOiXKUV1Ov7/l1D4w4qTrmouAgaNpVxciTlYnmJ+6zQgXBCX2ikOVjQDxp6QiP
         3iqNJ94mwjsRl5ALNKqAsxzpkhruGBR8ElpHPYlxyJyaNgaflQ66HM3ZIMUVKbUCcupO
         K9+/Q1hFEV+ZJd01eHT74W5WDpROAr+YDduaiw7g9mnrXkSTsPiWaz21j/35kpjTken6
         j7hHmxrlO1TqjzSaMoO+EwuI4JwvqMiLQYphX2ttc3qH+ehA51rNfWsm1wGIqhGupb8j
         GFeFfiHW6vZSdjF1Ymp+3iVEWvlQyMEG4BPptAItQMAu3Qx+BIEkOClPe0tHvmJKC7U6
         3k4Q==
X-Gm-Message-State: ACrzQf07aJLsqR2KCVuh1IWmhxoDm+0/DVnt/Xbre/qhl4WHToe9jwpU
        WTEXesi8q6PIs7TJN1CRBuP43NKQ5rkV9IohKAC/KhuejwjUx+Rds3q+jp5lui28cKKrx93Tb/1
        4RJNPz5Mk8tVKQ2vplo/RNgq29+QEFgzXpA==
X-Received: by 2002:a17:906:9bd8:b0:78d:85f9:36ae with SMTP id de24-20020a1709069bd800b0078d85f936aemr42186631ejc.342.1666867071255;
        Thu, 27 Oct 2022 03:37:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5SZMU3P4Zsb6VMxou+01MOar68Mbr9wEuDuf/meiI+Zmby9PhRAPjCmSxwGQr42Uzv+ipmOg==
X-Received: by 2002:a17:906:9bd8:b0:78d:85f9:36ae with SMTP id de24-20020a1709069bd800b0078d85f936aemr42186603ejc.342.1666867071054;
        Thu, 27 Oct 2022 03:37:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id i14-20020a50c3ce000000b004587c2b5048sm739068edf.52.2022.10.27.03.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 03:37:50 -0700 (PDT)
Message-ID: <6df2016d-ed2d-57fa-dcad-48537732895f@redhat.com>
Date:   Thu, 27 Oct 2022 12:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 02/31] drm/i915: Don't register backlight when another
 backlight should be used (v2)
Content-Language: en-US, nl
To:     Matthew Garrett <mjg59@srcf.ucam.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
        Daniel Dadap <ddadap@nvidia.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Xinhui <Xinhui.Pan@amd.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-acpi@vger.kernel.org,
        Jani Nikula <jani.nikula@intel.com>,
        nouveau@lists.freedesktop.org,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        David Airlie <airlied@redhat.com>, Len Brown <lenb@kernel.org>
References: <20221025193248.GA21457@srcf.ucam.org>
 <144cd47e-42dc-2b84-1a90-ea5e080e08a3@redhat.com>
 <20221025204043.GA23306@srcf.ucam.org>
 <cb5add36-c13c-ccd5-1b4b-71b45163a170@redhat.com>
 <20221025234040.GA27673@srcf.ucam.org>
 <fa6cc1d9-6740-b495-2c72-cae18c429ca6@redhat.com>
 <20221026204920.GA15326@srcf.ucam.org>
 <099dee98-8aeb-af36-828c-110f5ac6e9a3@redhat.com>
 <20221027091123.GA28089@srcf.ucam.org>
 <933be908-0bc2-56cc-8d6f-38f2d208ef20@redhat.com>
 <20221027095249.GA28666@srcf.ucam.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221027095249.GA28666@srcf.ucam.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/27/22 11:52, Matthew Garrett wrote:
> On Thu, Oct 27, 2022 at 11:39:38AM +0200, Hans de Goede wrote:
> 
>> The *only* behavior which actually is new in 6.1 is the native GPU
>> drivers now doing the equivalent of:
>>
>> 	if (acpi_video_get_backlight_type() != acpi_backlight_native)
>> 		return;
>>
>> In their backlight register paths (i), which is causing the native
>> backlight to disappear on your custom laptop setup and on Chromebooks
>> (with the Chromebooks case being already solved I hope.).
> 
> It's causing the backlight control to vanish on any machine that isn't 
> ((acpi_video || vendor interface) || !acpi). Most machines that fall 
> into that are either weird or Chromebooks or old, but there are machines 
> that fall into that.

I acknowledge that their are machines that fall into this category,
but I expect / hope there to be so few of them that we can just DMI
quirk our way out if this.

I believe the old group to be small because:

1. Generally speaking the "native" control method is usually not
present on the really old (pre ACPI video spec) mobile GPUs.

2. On most old laptops I would still expect there to be a vendor
interface too, and if both get registered standard desktop environments
will prefer the vendor one, so then we need a native DMI quirk to
disable the vendor interface anyways and we already have a bunch of
those, so some laptops in this group are already covered by DMI quirks.

And a fix for the Chromebook case is already in Linus' tree, which
just leaves the weird case, of which there will hopefully be only
a few.

I do share your worry that this might break some machines, but
the only way to really find out is to get this code out there
I'm afraid.

I have just written a blog post asking for people to check if
their laptop might be affected; and to report various details
to me of their laptop is affected:

https://hansdegoede.dreamwidth.org/26548.html

Lets wait and see how this goes. If I get (too) many reports then
I will send a revert of the addition of the:

 	if (acpi_video_get_backlight_type() != acpi_backlight_native)
 		return;

check to the i915 / radeon / amd / nouveau drivers.

(And if I only get a couple of reports I will probably just submit
DMI quirks for the affected models).

Regards,

Hans



