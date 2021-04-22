Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666FEC433B4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Apr 2021 08:55:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2628D61435
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Apr 2021 08:55:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbhDVI4Q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Apr 2021 04:56:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60575 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235331AbhDVI4P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Apr 2021 04:56:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619081700;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KlxKTpzv02WkE4l5rSitd/J4pegHSfR6Ij/F7UvDIqc=;
        b=Ek2vJMxHOaaMWOX+c2Qm8qqKDtPwlnH1D/Q9uBTqq2ud/EcTMYdmYXBGvEPCWfzAhiporv
        +g6xcd/FGKmXvhnUV7A4UgHnxPuh/LkqYE+mypnX3ZviOUFTt4kKG6GvpC58T0bt4tui8w
        8/NhSf8OG2DkS5UxC/sDakUjXtvlAAw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-kBTOgDkJOrOTW1tkBwWVhA-1; Thu, 22 Apr 2021 04:54:56 -0400
X-MC-Unique: kBTOgDkJOrOTW1tkBwWVhA-1
Received: by mail-ed1-f71.google.com with SMTP id w15-20020a056402268fb02903828f878ec5so16360754edd.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Apr 2021 01:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KlxKTpzv02WkE4l5rSitd/J4pegHSfR6Ij/F7UvDIqc=;
        b=r2DHhBHozBB0EOaLbLXaxydeZ8jnGShlMU4Gwski1bWHGzbb6iGG7X4183FdF4Ws8V
         iRgEiXkxTWndkUenGldj8oi6g4KNZObvmrLZEmRDxRm+OtUmzWgOKniJDCUyruUh/RFF
         Z/VRvXmuFfs5kqZ7aK13ZUoN5emNkLdj+WZmoSJmTCHJ4IQ0RIzu7vYNN5VNg/orn30K
         X+Up/YagxR5dKzDBtuRxcmfJSoUoQnoC7EOD+3NG0DDBUwtFELAEoSdv7dv50Iuq2p12
         6ZsRMe6J4k/HV2kBDnEXwlYdp7Y5WVzhzDx+MP3IBoAvFvjLHLQQw2Y3ier/mjDQMMO7
         wtww==
X-Gm-Message-State: AOAM531OxK7F2fygREdHP57H7RxX995jwqT0o2NzUvkrcrnLz5skDaZO
        F4yr2mjny8KZ+/JJuVkqd6ce6ld15GEwAmtPWQDQAOrXGUCRBIIa1Iw74hYc1FEsaMjxk2nhq3O
        uoUdgYX+Vp93tJitMasYQK3nroreUOal99Q==
X-Received: by 2002:a17:906:a45a:: with SMTP id cb26mr2174922ejb.537.1619081695704;
        Thu, 22 Apr 2021 01:54:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwthOhzkrvh0hZyVev/S6kp+NplvjcU/ZAG19cBFIAFrTe3SgnQUVwbLfKOsdBqo+hRfIJq+A==
X-Received: by 2002:a17:906:a45a:: with SMTP id cb26mr2174896ejb.537.1619081695495;
        Thu, 22 Apr 2021 01:54:55 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a17sm1391970ejx.13.2021.04.22.01.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 01:54:55 -0700 (PDT)
Subject: Re: [PATCH v2 0/9] drm: Add privacy-screen class and connector
 properties
To:     Simon Ser <contact@emersion.fr>,
        Marco Trevisan <marco.trevisan@canonical.com>
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
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>,
        Mario Limonciello <mario.limonciello@outlook.com>
References: <20210421204804.589962-1-hdegoede@redhat.com>
 <OwVTQDmCbSZMBV41nuJO75afEwmVzcrgF9gLIDqAL4fODvfI-Md_R-Z-ifcVhy6VLc6FyOINwx6lUUz0B1hpykdQYe4b3iZALLftfk6yp_E=@emersion.fr>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <88ad0981-0763-9c8d-fb57-70278bcaffd4@redhat.com>
Date:   Thu, 22 Apr 2021 10:54:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <OwVTQDmCbSZMBV41nuJO75afEwmVzcrgF9gLIDqAL4fODvfI-Md_R-Z-ifcVhy6VLc6FyOINwx6lUUz0B1hpykdQYe4b3iZALLftfk6yp_E=@emersion.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/22/21 10:51 AM, Simon Ser wrote:
> Hi,
> 
> On Wednesday, April 21st, 2021 at 10:47 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> There now is GNOME userspace code using the new properties:
>> https://hackmd.io/@3v1n0/rkyIy3BOw
> 
> Thanks for working on this.
> 
> Can these patches be submitted as merge requests against the upstream
> projects? It would be nice to get some feedback from the maintainers,
> and be able to easily leave some comments there as well.

I guess Marco was waiting for the kernel bits too land before submitting these,
but I agree that it would probably be good to have these submitted now, we
can mark them as WIP to avoid them getting merged before the kernel side
is finalized.

Marco, can you take care of submitting WIP merge-reqs for these?

Regards,

Hans

