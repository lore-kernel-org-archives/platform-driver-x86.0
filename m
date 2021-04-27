Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D61AC433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Apr 2021 17:03:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D83761026
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Apr 2021 17:03:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235512AbhD0RE2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Apr 2021 13:04:28 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44731 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235411AbhD0RE1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Apr 2021 13:04:27 -0400
Received: from mail-wr1-f71.google.com ([209.85.221.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <marco.trevisan@canonical.com>)
        id 1lbR7f-0003Ae-9M
        for platform-driver-x86@vger.kernel.org; Tue, 27 Apr 2021 17:03:43 +0000
Received: by mail-wr1-f71.google.com with SMTP id h60-20020adf90420000b029010418c4cd0cso20103439wrh.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Apr 2021 10:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=gnEyX5fDEIQaKbYtkkxkqc3nHbncbHwyaQBt7C02tuY=;
        b=M5aDZHgJ5+mowwIte3ZhGT+aEgzKU4c4dH656mnAHVpAVWB5z7KYi2wObLYTyYnlmR
         6PgEiNxz7XovZse1LArD3yhStg81MGpeV8CmT4hjNK639Lyt7676TfBQNeqaT8KoTyBg
         p5H3a45E6tv/0E2xrkmcxyL87Ge7Vde+/bkqsG+OTUefAYvsvSfAWquxNLuDU9iuFbXA
         J9spoE5NWiNAPcH+dO6J5wwnAnxzS2zoxaR+W7zutxUa9mbShfsjN/bAK0wiDTuKcFVA
         wBxdKUXlzlKWoUUUIImdzKi1CjrEP/FoIjAkrr7mv+WBrrGiR7PccGEvP6usDQi9RTRI
         +rGg==
X-Gm-Message-State: AOAM5301YmvVzcYRYdJhjhk0eNW+CysJzWPpxtTUkDbzHgQF0bCQ5tox
        7h8jguBpvb/RHEzzUC3wADoiINHO4O+QmpG7sWJkWvcyyMgJKl3v2CvCgHNuf0+39tSAZaK2drF
        oHzF4EEZkYQx1ou6PkGCtJ7xi6AaV5eAV+nKrNU3lLGN7TC4pp9U=
X-Received: by 2002:adf:ab1d:: with SMTP id q29mr10642654wrc.208.1619543022580;
        Tue, 27 Apr 2021 10:03:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwL0ufwLghuP8tca8A6GO+T2IGUzbrSmZeoJP3/C3qPre2LHA9JV0wX0Ok6IpJiGWrDg6uyaw==
X-Received: by 2002:adf:ab1d:: with SMTP id q29mr10642619wrc.208.1619543022376;
        Tue, 27 Apr 2021 10:03:42 -0700 (PDT)
Received: from tricky (84.127.144.65.dyn.user.ono.com. [84.127.144.65])
        by smtp.gmail.com with ESMTPSA id b12sm5935152wrn.18.2021.04.27.10.03.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 10:03:41 -0700 (PDT)
Date:   Tue, 27 Apr 2021 19:03:39 +0200
From:   Marco Trevisan <marco.trevisan@canonical.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Simon Ser <contact@emersion.fr>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        "=?utf-8?Q?dri-devel=40lists.freedesktop.org?=" 
        <dri-devel@lists.freedesktop.org>,
        "=?utf-8?Q?platform-driver-x86=40vger.kernel.org?=" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Mario Limonciello <mario.limonciello@outlook.com>
Message-ID: <0D708B40-20DB-4D5C-BFAD-74A30D5DE477@getmailspring.com>
In-Reply-To: <88ad0981-0763-9c8d-fb57-70278bcaffd4@redhat.com>
References: <88ad0981-0763-9c8d-fb57-70278bcaffd4@redhat.com>
Subject: Re: [PATCH v2 0/9] drm: Add privacy-screen class and connector
 properties
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

>>> There now is GNOME userspace code using the new properties:
>>> https://hackmd.io/@3v1n0/rkyIy3BOw
>> 
>> Thanks for working on this.
>> 
>> Can these patches be submitted as merge requests against the upstream
>> projects? It would be nice to get some feedback from the maintainers,
>> and be able to easily leave some comments there as well.

FYI, I've discussed with other uptream developers about these while
doing them, and afterwards on how to improve them.

> I guess Marco was waiting for the kernel bits too land before
> submitting these,
> but I agree that it would probably be good to have these submitted
> now, we
> can mark them as WIP to avoid them getting merged before the kernel side
> is finalized.

I'll submit them in the next days once I'm done with the refactor I've
in mind, and will notify the list.

And for sure we can keep them in WIP till the final bits aren't completed.

Cheers
