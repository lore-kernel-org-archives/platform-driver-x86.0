Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C547CC4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 15:20:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A55F460184
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 15:20:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234206AbhHCPUt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Aug 2021 11:20:49 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:57814
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236321AbhHCPUo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Aug 2021 11:20:44 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 5564E3F248
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Aug 2021 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628004030;
        bh=HaHeoSpc0/w45l3bVizKObUtZFG4/fyFOXwhQ5XDWl8=;
        h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
         MIME-Version:Content-Type;
        b=SleQ2M9HASkOwKeWRJta7iwZATA0OSbLb7hZUsODPiE+cbc115+wy5TWfEMG7uc7q
         lQTlWHnqUjeF+YKNaWyXEdG0DfLtxylcmDWLJCS7IR1+WKKh1mAvCka5RJeBa8HKyT
         O4axDJf3WIYpTT3vCW6xK6kYtRTp3FaE8wo6EtD0kHYoz3iVQl0hKma2zmuSs/ly1R
         v4NWXcu4e4tdQWQBm4G4YVoTiWM7+1hgM7NXJFJZZU8R6EmmUQMwy/Fbpp2DWHfSyh
         F7vjzxmp9aioA3eSNH4LLPJdIpBcVnifup66rMNGgFe5mypJugoDWBPzAf8E1Juhx3
         WgfQ+Y5wKzGbQ==
Received: by mail-wr1-f70.google.com with SMTP id j16-20020a5d44900000b02901549fdfd4fcso637365wrq.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Aug 2021 08:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=HaHeoSpc0/w45l3bVizKObUtZFG4/fyFOXwhQ5XDWl8=;
        b=DVvyd93xdBk+HSvzREiAdcoHWZiNFc+nwDXHDjYbdUHVYbQNt/nJKjjshZZXotE/BF
         yCw+ScHIApb9rIAOR75hu6UJuNeeTPgR2Kx/OoNRfVudkwFR4RgT28KipI4n5FejQDsK
         hAiGLus2hlD3szcup1EZBoiw9wtnikNTSFJI4cyM/JVOGz0GG6KGwZVEy9Q7NhSq5gZG
         FX2qk5I8L4+RhLG8x4JFbTzPOAZyoO91x9ls81cCOecgY6qTQs/K++RTxQOzHrhbUv3Y
         TLlPYsy5rTBlvpRr79YmlRvigc5VF9RfqSsFPHFYxcRB1q3WPB4jcuHS4mD61s4R5zcJ
         Zz+w==
X-Gm-Message-State: AOAM531XEulhRN1pZKC3igSrSA7CANZGAD4nuqcwTW5fO/sj6xiA2DF3
        CuZgjHIjTHBrRfE48nXWKLhCbjKf80hK1xlAVMNGbckrJmutbp1trEoJdRRNhIwJKhbVeE+6wFE
        Ma5c0ZKHPyjTqrVd6ZeABuOgwUSyEKz+COdNjhO9s58Eqdeh8oBI=
X-Received: by 2002:a1c:7e85:: with SMTP id z127mr22444739wmc.11.1628004029954;
        Tue, 03 Aug 2021 08:20:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEzjC+/pW0C1Sqw4ydhWVDqpDLVx+zCm1JU0utSrWeKobmQxeo9gpJI0BDCGIcWIUMPwlMxA==
X-Received: by 2002:a1c:7e85:: with SMTP id z127mr22444711wmc.11.1628004029751;
        Tue, 03 Aug 2021 08:20:29 -0700 (PDT)
Received: from tricky (net-93-71-200-33.cust.vodafonedsl.it. [93.71.200.33])
        by smtp.gmail.com with ESMTPSA id d16sm14876581wrx.76.2021.08.03.08.20.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Aug 2021 08:20:29 -0700 (PDT)
Date:   Tue, 3 Aug 2021 17:20:33 +0200
From:   Marco Trevisan <marco.trevisan@canonical.com>
To:     Rajat Jain <rajatja@google.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Simon Ser <contact@emersion.fr>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
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
Message-ID: <78260D21-AD73-4EBC-8E69-A5B16F1A72D5@getmailspring.com>
In-Reply-To: <CACK8Z6FPsywe49fP=5pVc5DFm--4xt0daYLDzpbujA1_qoK7Dg@mail.gmail.com>
References: <CACK8Z6FPsywe49fP=5pVc5DFm--4xt0daYLDzpbujA1_qoK7Dg@mail.gmail.com>
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

Hi Rajat,

The merge proposals are now in place after discussing a bit more with upstream:

 - https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/-/merge_requests/49
 - https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1952
 - https://gitlab.gnome.org/GNOME/gnome-control-center/-/merge_requests/1032

This is all implemented and working for the wayland backend, for X11 I'm
looking at it right now, even though it seems that we don't get any
RRScreenChangeNotify on hotkey changes, and monitoring udev directly
seems overkill. Anything should be adjusted at lower levels?

Cheers

On lug 13 2021, at 9:25 pm, Rajat Jain <rajatja@google.com> wrote:

> Hello Hans, Marco, et al,
> 
> On Tue, Apr 27, 2021 at 10:03 AM Marco Trevisan
> <marco.trevisan@canonical.com> wrote:
>> 
>> Hi,
>> 
>> >>> There now is GNOME userspace code using the new properties:
>> >>> https://hackmd.io/@3v1n0/rkyIy3BOw
>> >>
>> >> Thanks for working on this.
>> >>
>> >> Can these patches be submitted as merge requests against the upstream
>> >> projects? It would be nice to get some feedback from the maintainers,
>> >> and be able to easily leave some comments there as well.
>> 
>> FYI, I've discussed with other uptream developers about these while
>> doing them, and afterwards on how to improve them.
>> 
>> > I guess Marco was waiting for the kernel bits too land before
>> > submitting these,
>> > but I agree that it would probably be good to have these submitted
>> > now, we
>> > can mark them as WIP to avoid them getting merged before the kernel side
>> > is finalized.
>> 
>> I'll submit them in the next days once I'm done with the refactor I've
>> in mind, and will notify the list.
> 
> Any updates on the privacy-screen patchset? Can Hans' patchset be
> accepted upstream now?
> 
> Thanks,
> 
> Rajat
> 
>> 
>> And for sure we can keep them in WIP till the final bits aren't completed.
>> 
>> Cheers
> 
