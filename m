Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B55C43462
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 May 2021 14:35:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33666611C0
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 May 2021 14:35:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhECOg3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 May 2021 10:36:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52487 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229732AbhECOg1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 May 2021 10:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620052534;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k5l9mji1oYztNVl+ToG36ApOd6oMuk+iglNseyqhqhM=;
        b=Ce+aS45lJzWrm+EDQV2lz3AqV/WSj7JxpQyRtJa3j6PClukJQ6STPnrX9wkNDiFGO5haxi
        H6RcK4GVcXvGgPlpNb8PQa6Do/9bxmRIE343FH9JguCPmG7o6QxxExZKbveb8A5so4UJh6
        /pMSdPUL7UvtCtC2TZjGqduhfsNu2mc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-MFK_TDMLOyuG9n9RQ6lwLA-1; Mon, 03 May 2021 10:35:32 -0400
X-MC-Unique: MFK_TDMLOyuG9n9RQ6lwLA-1
Received: by mail-ej1-f70.google.com with SMTP id r14-20020a1709062cceb0290373a80b4002so2125348ejr.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 May 2021 07:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k5l9mji1oYztNVl+ToG36ApOd6oMuk+iglNseyqhqhM=;
        b=fSPOPDL4dgex1jQhOS5AIBDcRPS4yNouzIUjCKm5qIhZKi9HWf4Qu9CyVWX2dvoHsD
         UkbsR0lEycRXfO3lonzYr0CU32yOANabE9qSF1rLhVT0bTDzHTh9xeAwJxakm/JSTvxc
         qZY4SDmPNgkJwZVXktEiTZz4M0g/d+wyCRAPe28Bx3MqAwEcXTjxkZ8lGY4vrSLXT8+t
         l4Wr221b8xPIQmiHzjmVyGuAZ1dxjNe1EV+L6nzSZ4LlK0T4U4J3Zfk7t4UWLazsLwlW
         4MDXto2MIp1r1v1BQ8v9zqyOpBRMpdZpXK/tG5eoNOnuMgnkTRUQxsFrFwNIwN0iTsMy
         UgbQ==
X-Gm-Message-State: AOAM530OtfVuxu2LWaUWpfTeD/tkogQKojc0+4hwzm5ZVjuoWZfkwZm4
        UJ8FssZspc9EaOksKoiFrwlFxHa3eUTsQj/20mWLcu5H08py9HzwbTVHLuBrY/0yYuZwNRLBgew
        cjWqVdcDJeEWpHc1Kge9ztrcQqCYqjXM3kQ==
X-Received: by 2002:a17:906:6a93:: with SMTP id p19mr17291187ejr.319.1620052530822;
        Mon, 03 May 2021 07:35:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUvT+qkq3EqqF/+Zg6Vh+R8TnTUOqUDXXPQpBdiWawf3Ow/BHIM9//4R5/6uwXK5914Y8riw==
X-Received: by 2002:a17:906:6a93:: with SMTP id p19mr17291172ejr.319.1620052530649;
        Mon, 03 May 2021 07:35:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q25sm12499548edt.51.2021.05.03.07.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 07:35:30 -0700 (PDT)
Subject: Re: [PATCH 4/9] drm/connector: Add support for out-of-band hotplug
 notification
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Imre Deak <imre.deak@intel.com>
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
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-5-hdegoede@redhat.com>
 <YI+tlE35i+6F/WUO@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <00e380b2-0376-0ddb-9b0e-342779b7fc06@redhat.com>
Date:   Mon, 3 May 2021 16:35:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YI+tlE35i+6F/WUO@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/3/21 10:00 AM, Heikki Krogerus wrote:
> Hi Hans,
> 
> On Wed, Apr 28, 2021 at 11:52:52PM +0200, Hans de Goede wrote:
>> +/**
>> + * struct drm_connector_oob_hotplug_event_data: OOB hotplug event data
>> + *
>> + * Contains data about out-of-band hotplug events, signalled through
>> + * drm_connector_oob_hotplug_event().
>> + */
>> +struct drm_connector_oob_hotplug_event_data {
>> +	/**
>> +	 * @connected: New connected status for the connector.
>> +	 */
>> +	bool connected;
>> +	/**
>> +	 * @dp_lanes: Number of available displayport lanes, 0 if unknown.
>> +	 */
>> +	int dp_lanes;
>> +	/**
>> +	 * @orientation: Connector orientation.
>> +	 */
>> +	enum typec_orientation orientation;
>> +};
> 
> I don't think the orientation is relevant. It will always be "normal"
> from DP PoW after muxing, no?

That is what I thought to, but during the discussion of my previous attempt
at this one of the i915 devs mentioned that in some cases the muxes manage
to swap the lane order when the connector upside-down and at least the
Intel GPUs can correct for this on the GPU side, so they asked for this
info to be included.

> I'm also not sure those deatils are enough in the long run. Based on
> what I've understood from our graphics team guys, for example knowing
> if multi-function is preferred may be important in some cases.

The current data being passed is just intended as a starting point,
this is purely a kernel internal API so we can easily add more
data to the struct. As I mentioned in the cover-letter the current
oob_hotplug handler which the i915 patch adds to the i915 driver does
not actually do anything with the data.  ATM it is purely there to
demonstrate that the ability to pass relevant data is there now
(which was an issue with the previous attempt). I believe the current
code is fine as a PoC of "pass event data" once GPU drivers actually
start doing something with the data we can extend or outright replace
it without issues.

> +Imre.
> 
> All of that, and more, is already available in the Configuration VDO
> Status VDO that the we have negotiated with the DP partner. Both those
> VDOs are part of struct typec_displayport_data. I think we should
> simply supply that structure to the DRM code instead of picking those
> details out of it...

I'm not sure I like the idea of passing the raw VDO, but if the
DRM folks think that would be useful we can certainly add it.

Regards,

Hans


> 
>>  /**
>>   * struct drm_tv_connector_state - TV connector related states
>>   * @subconnector: selected subconnector
>> @@ -1110,6 +1132,15 @@ struct drm_connector_funcs {
>>  	 */
>>  	void (*atomic_print_state)(struct drm_printer *p,
>>  				   const struct drm_connector_state *state);
>> +
>> +	/**
>> +	 * @oob_hotplug_event:
>> +	 *
>> +	 * This will get called when a hotplug-event for a drm-connector
>> +	 * has been received from a source outside the display driver / device.
>> +	 */
>> +	void (*oob_hotplug_event)(struct drm_connector *connector,
>> +				  struct drm_connector_oob_hotplug_event_data *data);
> 
> So I would not try to generalise this like that. This callback should
> be USB Type-C DP altmode specific:
> 
> 	void (*oob_hotplug_event)(struct drm_connector *connector,
>                                   struct typec_displayport_data *data);
> 
> Or like this if the orientation can really be reversed after muxing:
> 
> 	void (*oob_hotplug_event)(struct drm_connector *connector,
> 				  struct typec_altmode *altmode,
>                                   struct typec_displayport_data *data);
> 
> You can now check the orientation separately with
> typec_altmode_get_orientation() if necessary.
> 
> 
> thanks,
> 

