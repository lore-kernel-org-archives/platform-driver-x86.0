Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDCDC433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 15:35:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CAD86115B
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 15:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbhEDPgu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 May 2021 11:36:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41810 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230360AbhEDPgt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 May 2021 11:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620142554;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FjANuhmunmxl1tjd4moAyPGINXbx5GlWhcPk5Awa2JU=;
        b=J3cm8yJMBhCYCRRMruAKc4Pyo/MeksX/PT2NysDL8jTzxGQ9GkKWvuSeSCHiN6tSrEvbE1
        YNumQDDvUc/pdyuczhZe5iyB4VQT8nmAdQEttEPPeLFtXwYZwvTPxcEB6prZRqygUj3BXY
        ccAeRRom/ifU10SpSLFtSUW09l02o0U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-_6e814-_ONyndUD82u6Y5Q-1; Tue, 04 May 2021 11:35:51 -0400
X-MC-Unique: _6e814-_ONyndUD82u6Y5Q-1
Received: by mail-ed1-f69.google.com with SMTP id d8-20020a0564020008b0290387d38e3ce0so6607094edu.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 May 2021 08:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FjANuhmunmxl1tjd4moAyPGINXbx5GlWhcPk5Awa2JU=;
        b=RqIoJ/ZW0tV1XZunZ+CddbRhJShB3eyWsR/UVK7PPPbgBbhDM+lfPIonm3nKDSzEiR
         35ygM8AUuuWVeoZoVW/7feN8BuOus7xl8y3vrY8dZXxgNLkURW5gvLlFAsy7mbspi5rr
         hyMolrSrz3E+1qvagZO9qGGRLCVeuskAzs8BwQav2l+PUmBEU2FrAIfIU4EowqyD/Jcy
         ibmWeSvOX7qaCx0o0YeVPlBJP/ZVTq9DjTVDhwB/WaAEptaGCzklBNevbgkyR+lZuOCC
         zGkKl3mugmKBGptE70aNlZBXOwaUe9GKvf57F6UKAigqQtuDFIdX2G0vlp7GIMoAPCbh
         VJRQ==
X-Gm-Message-State: AOAM533QJdQQD2yWlRnIMa8fVF6GeCbXM2gKt9+728PXGuINGSOEsL39
        KKpazt+zv7YARyBAt/dIkvLtu+OOWv3tyWkUMD7duPV1/+QxXJVDtGZZf7cKcfbkh5LiI9NQ0tU
        /xFKQcNWNugyPCnjzc1DDybKGIe53P8Ep2A==
X-Received: by 2002:a17:906:cd27:: with SMTP id oz39mr18874304ejb.129.1620142550773;
        Tue, 04 May 2021 08:35:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmyw0dujywRY0BkQgCLf9VxiL7liqXtJ0bEMhZiU1xqc+xgw8QvX8u6muUU7TbNtZxdprzkg==
X-Received: by 2002:a17:906:cd27:: with SMTP id oz39mr18874288ejb.129.1620142550583;
        Tue, 04 May 2021 08:35:50 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id d18sm1584825eja.71.2021.05.04.08.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 08:35:50 -0700 (PDT)
Subject: Re: [PATCH 4/9] drm/connector: Add support for out-of-band hotplug
 notification (v2)
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
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-5-hdegoede@redhat.com>
 <YJFj5Vk7xOcj+ISZ@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <326621fe-cc4e-ad77-c87e-922a655bfbc8@redhat.com>
Date:   Tue, 4 May 2021 17:35:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJFj5Vk7xOcj+ISZ@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/4/21 5:10 PM, Heikki Krogerus wrote:
>> +/**
>> + * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
>> + * @connector: connector to report the event on
>> + * @data: data related to the event
>> + *
>> + * On some hardware a hotplug event notification may come from outside the display
>> + * driver / device. An example of this is some USB Type-C setups where the hardware
>> + * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
>> + * status bit to the GPU's DP HPD pin.
>> + *
>> + * This function can be used to report these out-of-band events after obtaining
>> + * a drm_connector reference through calling drm_connector_find_by_fwnode().
>> + */
>> +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
>> +				     struct drm_connector_oob_hotplug_event_data *data)
>> +{
>> +	struct drm_connector *connector;
>> +
>> +	connector = drm_connector_find_by_fwnode(connector_fwnode);
>> +	if (IS_ERR(connector))
>> +		return;
>> +
>> +	if (connector->funcs->oob_hotplug_event)
>> +		connector->funcs->oob_hotplug_event(connector, data);
>> +
>> +	drm_connector_put(connector);
>> +}
>> +EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
> 
> So it does looks like the "data" parameter is not needed at all:

Well Imre did indicate that having the number of lanes is useful, so
for the next version I'll drop the orientation but I plan to keep
the number of lanes if that is ok with you.

Not having passing along this info was one of the reasons why my
previous attempt at this was nacked, so dropping it all together
feels wrong.

Regards,

Hans

