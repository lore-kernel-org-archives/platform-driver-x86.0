Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358EFC433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:37:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CB94611B0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241304AbhESNir (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 09:38:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35126 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232354AbhESNir (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 09:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621431447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bU4pryl0+5U5KV31mW2OweQfTQ6FVvGmzl3RdTyAV38=;
        b=EMrNeZLxc1QI1CtG/j+3AQR4VhE1xcRFAw7YN6Dyfnq+5MjdjG7s6ynzrAhNl+6j+c2CKn
        h1Q+cWcHkjS6tYyvhE2Pa7PtGLljixmI99efF/mqPjMksaHsWh9KSmcPn6gvKDhxYkxj+Y
        f3xco9nx9Iezpu1nTfNz+Ow8IgFObdY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-syf9yjGlMjSCg_zP0470DQ-1; Wed, 19 May 2021 09:37:25 -0400
X-MC-Unique: syf9yjGlMjSCg_zP0470DQ-1
Received: by mail-ed1-f70.google.com with SMTP id cn20-20020a0564020cb4b029038d0b0e183fso7705814edb.22
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 06:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bU4pryl0+5U5KV31mW2OweQfTQ6FVvGmzl3RdTyAV38=;
        b=YuZk5uqQEUZvukKpD0K0YanRar19HpeUCMKnTdWlTKxSpUUwEVdYNVvRfsUldMfb7/
         Z/ZXff+rubZx/ZpmxUwE9QU6e7UcrDVkJ/MZJwBtVMCIAB6xOGehqWFqY0IQ9FaZfb/N
         DJAPsQ54Gz8f+WRyC+ufcdUSG3R/QFhnHIWY9rP2u5Gjxv79dpQkgyyFMcar7K+Kjyg+
         5wDeElnf/Fhp7IGN6ipaZDDVyW2vfCZerDqEqkWTKQCu1EVY4vyHQwmckHJ732MIGOst
         3ANPbtpLQwt9rzI7UrvRkHJClnkWYYvb53Sf4vqwRqem2HQQaINdipJlD7cFJ9oRYWs7
         Otww==
X-Gm-Message-State: AOAM531Z0plW5DpP3VnvaaDomDUBzqbgI16B3e283jHA2T3Z9awaQk/E
        5JsEbBWhvok4DEthIGMkQ3W92JiBwDECRuyUglyCkkhFlGhSdcyg9VUbeb/K1/Fv0pGuQNMGOFN
        sknZlc3g0WFO97nzr9F4uo/9i7A8lKUA/Ow==
X-Received: by 2002:a05:6402:3098:: with SMTP id de24mr14306454edb.339.1621431444237;
        Wed, 19 May 2021 06:37:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtmP5ppUfGnIYTS3emu23ErVRxU0Y2zdN/m68QRjcWJURyvbcDG+r+AD2UiWx7vPUAM3F1gg==
X-Received: by 2002:a05:6402:3098:: with SMTP id de24mr14306432edb.339.1621431444058;
        Wed, 19 May 2021 06:37:24 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a7sm4664820edr.15.2021.05.19.06.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:37:23 -0700 (PDT)
Subject: Re: [PATCH 9/9] platform/x86/intel_cht_int33fe: Correct "displayport"
 fwnode reference
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
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-10-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2d02c9ba-1385-41cf-6150-ca8ed5e835ba@redhat.com>
Date:   Wed, 19 May 2021 15:37:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210503154647.142551-10-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/3/21 5:46 PM, Hans de Goede wrote:
> The Type-C connector on these devices is connected to DP-2 not DP-1,
> so the reference must be to the DD04 child-node of the GPU, rather
> then the DD02 child-node.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Since this is pretty much independent from the rest of the series,
I'll take this upstream through the pdx86 tree.

I've added this to my review-hans branch now, and it will get added
to for-next from there.

Regards,

Hans



> ---
>  drivers/platform/x86/intel_cht_int33fe_typec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_cht_int33fe_typec.c b/drivers/platform/x86/intel_cht_int33fe_typec.c
> index b61bad9cc8d2..d59544167430 100644
> --- a/drivers/platform/x86/intel_cht_int33fe_typec.c
> +++ b/drivers/platform/x86/intel_cht_int33fe_typec.c
> @@ -168,8 +168,8 @@ static int cht_int33fe_setup_dp(struct cht_int33fe_data *data)
>  		return -ENODEV;
>  	}
>  
> -	/* Then the DP child device node */
> -	data->dp = device_get_named_child_node(&pdev->dev, "DD02");
> +	/* Then the DP-2 child device node */
> +	data->dp = device_get_named_child_node(&pdev->dev, "DD04");
>  	pci_dev_put(pdev);
>  	if (!data->dp)
>  		return -ENODEV;
> 

