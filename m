Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B5EC433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Apr 2021 21:57:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E763C61289
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Apr 2021 21:57:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhD1V62 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Apr 2021 17:58:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35986 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229890AbhD1V62 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Apr 2021 17:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619647062;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PcNRGfKq+Fp/bSii4FdmrVznfLn2Epwo2TJlsZcxTEk=;
        b=isMk/ShDTvrjBD0s2tf3AYdgo6t81kDv9JZHu69oQWqIIwIMdBDtLryYFzb5tCTGoKS3r3
        YGzOuLnXdCcZKMcu/qs8pBWIpL32Gw5blzGn3wuF4xjiaByy//sL5G5czsnhzukCOXLXdB
        d5nzXZptyTvyjfzDKyF2qxwTrV8g5tI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-vTwUVBkbMYuS5EGLIAxshA-1; Wed, 28 Apr 2021 17:57:40 -0400
X-MC-Unique: vTwUVBkbMYuS5EGLIAxshA-1
Received: by mail-ej1-f71.google.com with SMTP id ji8-20020a1709079808b029037c921a9ea0so12882308ejc.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Apr 2021 14:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PcNRGfKq+Fp/bSii4FdmrVznfLn2Epwo2TJlsZcxTEk=;
        b=ezOeg/Ty8LYCmZNsnqCyxr3Ir6F12KtirC7TPg4wBtP1ed7/p830fFTn4plu1xjlz5
         nzbSlnnPBMqSMWR39t77+L2kLIrQgtGjsdi7DQoif85GYE7Is5VKmZgF3Jq8TTkxHBw8
         TGEOSV1UKocqceKZ3+h47uGZkCf4Rzh2WqEdNr3WcU9Rk3RIxW3ACPWu4ym6kda8f++g
         IahjjXWAMZhMp+EusDKiiMUtz8zK8Rs9wdit/WXU1EVBtJwz2oBmCZuqhmK42u6+ZdWr
         zLB7Wmq0BLlzzq/JZQaYgrGzBm0mJV86PPgLJZAogQMZ/vgljmsXHvx9YTgtWDqa5jLX
         6NgA==
X-Gm-Message-State: AOAM533nV9K2a9FSnMnPjyXVrK2RRrQfh48W3a4yLiehAaFSRdTXuZZI
        KJ8LYj9RTOtSepjDdLVYwCZe3TbhjYcRvnnmGOo8A9KrQ3ugENOmlFQfQugjHhDtDPpQwVpXW/F
        SxTTbv1Hrv/DkP2riz986Y8qvsahMkfRi1w==
X-Received: by 2002:a17:906:858:: with SMTP id f24mr24786316ejd.347.1619647059450;
        Wed, 28 Apr 2021 14:57:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBzmKGVeKYZXxAE1Z2T5grGU6G8KanK3krK5U625IYhTpXdUp6CVhhZxRndNJbLKTcxcgQdg==
X-Received: by 2002:a17:906:858:: with SMTP id f24mr24786299ejd.347.1619647059283;
        Wed, 28 Apr 2021 14:57:39 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r17sm819538edt.70.2021.04.28.14.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 14:57:38 -0700 (PDT)
Subject: Re: [PATCH 0/9] drm + usb-type-c: Add support for out-of-band hotplug
 notification
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
References: <20210428215257.500088-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <81d7d021-d8b7-74ec-784b-40b50bba3f21@redhat.com>
Date:   Wed, 28 Apr 2021 23:57:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428215257.500088-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/28/21 11:52 PM, Hans de Goede wrote:
> Hi All,
> 
> Here is a new attempt to make DP over Type-C work on devices where the
> Type-C controller does not drive the HPD pin on the GPU, but instead
> we need to forward HPD events from the Type-C controller to the DRM driver.
> 
> For anyone interested here are the old (2019!) patches for this:
> 
> https://patchwork.freedesktop.org/patch/288491/
> https://patchwork.freedesktop.org/patch/288493/
> https://patchwork.freedesktop.org/patch/288495/
> 
> Last time I posted this the biggest change requested was for more info to
> be included in the event send to the DRM-subsystem, specifically sending
> the following info was requested:
> 
> 1. Which DP connector on the GPU the event is for
> 2. How many lanes are available
> 3. Connector orientation
> 
> This series is basically an entirely new approach, which no longer
> uses the notifier framework at all. Instead the Type-C code looksup
> a connector based on a fwnode (this was suggested by Heikki Krogerus)
> and then calls a new oob_hotplug_event drm_connector_func directly
> on the connector, passing the requested info as argument.

p.s.

Info such as the orientation and the number of dp-lanes is now passed
to the drm_connector_oob_hotplug_event() function as requested in the
review of the old code, but nothing is done with it for now.
Using this info falls well outside of my knowledge of the i915 driver
so this is left to a follow-up patch (I will be available to test
patches for this).

Regards,

Hans

