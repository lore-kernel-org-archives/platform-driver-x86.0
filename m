Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55442C47092
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Jun 2021 16:50:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3951E610A8
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Jun 2021 16:50:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbhFAQwU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Jun 2021 12:52:20 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50460 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbhFAQwT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Jun 2021 12:52:19 -0400
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <marco.trevisan@canonical.com>)
        id 1lo7bA-0003TP-19
        for platform-driver-x86@vger.kernel.org; Tue, 01 Jun 2021 16:50:36 +0000
Received: by mail-wr1-f69.google.com with SMTP id i102-20020adf90ef0000b029010dfcfc46c0so5158518wri.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Jun 2021 09:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=iTrKi3oqRMBuOtiLPrLLphRsYza82qg3+M0S5I+h4is=;
        b=sRwh1j8JIF5luyZMmBlvdsi8jy16uIck5yqtDflvxBXf5H2aw/JP/YccVBKXms5s9X
         dx9dTDIgIIw+7FCJrw/g/RUdzUxFRJYKsgeTKSkn6dHFm1dqo0cGeRtcYauJWBQJRo2R
         LpP0NXzZtLso+e1GVo7ebwja9iDjhyfY15mNJ3j1J4rC9+kREX5khnUlLlfOdtPu6ocF
         tt54yqLWNsu22DZrK8qb4eXTQzi4e/9h6LuyOk0ZMIN6roexjop9QRvxmdWY3mrCC77s
         pbSi6kv21s6bvphrOXWq1TQ2Tk6zAMaRB4uhVUGu8H/Ee7yQAr/zeBROs4QJKgskw1m1
         D5lw==
X-Gm-Message-State: AOAM532WGwhLKjrNadtSPCS9knc6cujnghJMDhT7/UO48zIVWfhpNouf
        lE6Y6YTILGUmkZLJvTAB220f37zI08WT1SnmRlWe1N+M+9IN6OF6Ux35G8hoOpB7vGZ7dw4liN6
        XG0MNGZwDZdAclKbrWfffc4+Tmj5KKTqAgslpk/T2ReeY1UaZsOw=
X-Received: by 2002:a05:600c:154e:: with SMTP id f14mr871808wmg.36.1622566235790;
        Tue, 01 Jun 2021 09:50:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygCvzkOOEdkehhNOGbTNUEUrWeb4BZSr7fwfbIpmPYmZOqAJBI2SD1NKf+9uEpdefvnRVcQA==
X-Received: by 2002:a05:600c:154e:: with SMTP id f14mr871784wmg.36.1622566235628;
        Tue, 01 Jun 2021 09:50:35 -0700 (PDT)
Received: from tricky (84.127.144.65.dyn.user.ono.com. [84.127.144.65])
        by smtp.gmail.com with ESMTPSA id t4sm2270986wru.53.2021.06.01.09.50.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jun 2021 09:50:35 -0700 (PDT)
Date:   Tue, 1 Jun 2021 18:50:33 +0200
From:   Marco Trevisan <marco.trevisan@canonical.com>
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
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
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        "=?utf-8?Q?platform-driver-x86=40vger.kernel.org?=" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Mario Limonciello <mario.limonciello@outlook.com>
Message-ID: <ADF0C848-D7E9-4AC8-AFFD-0A717418B011@getmailspring.com>
In-Reply-To: <CACvgo50onXuRvtXySYNHJZshSkmX8ukcMitNJAKC4dEMPTyXYw@mail.gmail.com>
References: <CACvgo50onXuRvtXySYNHJZshSkmX8ukcMitNJAKC4dEMPTyXYw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/9] drm: Add privacy-screen class
 (v2)
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Emil,

On giu 1 2021, at 5:31 pm, Emil Velikov <emil.l.velikov@gmail.com> wrote:

> Hi Hans,
> 
> What happened with this series, did it fall through the cracks?

It's mostly waiting me to finish to propose the changes to GNOME,
unfortunately I've been busy in the past weeks with downstream work, so
I couldn't finish it, but I hope I can be back at it soon.

Cheers

> 
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_privacy_screen.c
> 
>> +#include "drm_internal.h"
> 
> I think we don't need this include, do we?
> 
> 
>> --- /dev/null
>> +++ b/include/drm/drm_privacy_screen_consumer.h
> 
>> +#include <drm/drm_connector.h>
> 
> Ditto
> 
>> --- /dev/null
>> +++ b/include/drm/drm_privacy_screen_driver.h
> 
>> +#include <drm/drm_connector.h>
> 
> Ditto
> 
> I like how you avoided leaking any DRM details within the new code,
> modulo the includes above. With above tweaks, the series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> 
> Theoretically one could also remove the `depends on DRM` from patch
> 8/9 but I'm not sure how much that saves us.
> 
> HTH
> -Emil
> 
