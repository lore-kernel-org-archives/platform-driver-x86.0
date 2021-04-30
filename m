Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8DBC43461
	for <platform-driver-x86@archiver.kernel.org>; Fri, 30 Apr 2021 13:45:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9912161409
	for <platform-driver-x86@archiver.kernel.org>; Fri, 30 Apr 2021 13:45:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhD3Nq3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 30 Apr 2021 09:46:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49703 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229707AbhD3Nq3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Apr 2021 09:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619790341;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ngr4LyEkdELa/6PdIZcv+wXD2znntuZQwvgVg8NJ51s=;
        b=UYEYAnxp0JOab1/XjFd4E8KAPeEjfqi5jYdXJjojep2vNInexpZcHwaj6JPjrcPmQNnzWF
        jMLKjbSldtZb1tBnJkdvSsbvzzLGElwrt3Jid45H7fEBQO1N2js+wZ888wK4tWZfbu3Miq
        PAc7vpllgJ1I+q15zazTvpxkrXkvQz4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-jAaHQJm5MZqZiDSQxIIOCQ-1; Fri, 30 Apr 2021 09:45:36 -0400
X-MC-Unique: jAaHQJm5MZqZiDSQxIIOCQ-1
Received: by mail-ej1-f69.google.com with SMTP id z15-20020a170906074fb029038ca4d43d48so5848651ejb.17
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Apr 2021 06:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ngr4LyEkdELa/6PdIZcv+wXD2znntuZQwvgVg8NJ51s=;
        b=hr0f9XtMnDWmm3UWrXEMPBHlrdjTBXaUXJtNB/zUlkWZetbmjtNHZvsTj7et0Iv76Y
         obsLXsP20j/ysDuvit7ziaBJ/I7F9hytU9wbrsDrhfCB1LDphRJwaMQqTdpkpglLiqLo
         +XNUodUZx7lCvcDoVa49XGRM5g2m5k80/eqtDq9HFzVfbrfzzPXCu9ItPIzPiDwVwF2q
         EDPsM9WFuT79yey9CxQ1XbZkfThsqjDMjuAhty/Xo/Z9j7miHzDKjIk//mFBvF7s3vxG
         DQpKxPpmZVqbaXcq+iMHL7By94pedh50is78+pkprVpuIDUG9vVWu+sWHqhtDTVq5EnK
         CmCA==
X-Gm-Message-State: AOAM530CKQ90o+0+psEvGJ3xcloYcOSO2I/w+6Pc0f3rEwOgUmqvsR6l
        v1c+9zRbYRYVTuieJyz93/M/GsGeTUMfkxgisHdtW7zjRDHOKYipqPLUK2mFhuwzt5U/5Dhx5zR
        LG2PeEL769/0IN6Ln4H8MG2+stjSlfZGj1A==
X-Received: by 2002:a05:6402:40d6:: with SMTP id z22mr6005344edb.275.1619790335076;
        Fri, 30 Apr 2021 06:45:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVgln2PsbGBWtD0Y9vGbxqHA4KEKia8ZfjelCngqnsAV0j0ddhk9OZLNm9FE8nL8viwO/OZw==
X-Received: by 2002:a05:6402:40d6:: with SMTP id z22mr6005318edb.275.1619790334881;
        Fri, 30 Apr 2021 06:45:34 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n10sm1933338ejg.124.2021.04.30.06.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Apr 2021 06:45:34 -0700 (PDT)
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-2-hdegoede@redhat.com>
 <YIqbLDIeGXNSjSTS@phenom.ffwll.local> <YIqehmw+kG53LF3t@kroah.com>
 <YIqg59yageIUwiwy@phenom.ffwll.local>
 <4e78d188-f257-ad33-e703-bcbc54a30c31@redhat.com>
 <YIsEfAjFthAyHxUi@phenom.ffwll.local>
 <43ee221e-7151-c0c2-cc52-37b191778221@redhat.com>
 <CAKMK7uFf8n6QfRdSXeB6J+L7NPGbeEyJKhx1Vu7x8env=_7tkA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9c6d5361-c435-521e-d7d7-f8976927f9de@redhat.com>
Date:   Fri, 30 Apr 2021 15:45:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFf8n6QfRdSXeB6J+L7NPGbeEyJKhx1Vu7x8env=_7tkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

p.s.

On 4/30/21 1:38 PM, Daniel Vetter wrote:

Offtopic:

> I'm also not sure why we have to use the kdev stuff here. For other
> random objects we need to look up we're building that functionality on
> that object. It means you need to keep another list_head around for
> that lookup, but that's really not a big cost. E.g. drm_bridge/panel
> work like that.

So I took a peek at the bridge/panel code and that actually seems to
have an issue with removal vs lookup. It is not even just a race,
it seems a lookup does not take a reference and there is nothing
stopping a user from doing an unbind or rmmod causing the panel
to be removed while other code which got a pointer to the panel
through of_drm_find_panel() will not be prepared to deal with
that pointer all of a sudden no longer being valid.

Now this would be a case of the user shooting his-self in the
foot (where as connectors can actually dynamically disappear
under normal circumstances), but ideally we really should do
better here.

Is there a TODO list somewhere for issues like this ?  Or shall
I submit a patch adding a FIXME comment, or is this considered
not worth the trouble of fixing it?

Regards,

Hans

