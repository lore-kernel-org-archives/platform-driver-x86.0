Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D18C352A1
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Dec 2022 17:25:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiLGRZB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Dec 2022 12:25:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiLGRY5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Dec 2022 12:24:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1BD5B588
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Dec 2022 09:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670433833;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=nMgzAShnLdForNGMjNIaEeNq02GBD9lKBSGwVOBvyx4=;
        b=fMsRd5AtslDEaZv82LY7JZTJ7er2ltYDQ3ppEzplea7c8P55dLzZF/Q/eB1EYA/5acjuYJ
        R6U9EWyKTdbJb2WVFQR4B9yoJPBylDxw4IpZe0/K6He3XixIPzkrbVzgo7EHR5wEGgx/9T
        ZGvQe3PXa2UMvGt7D6ujDrZW0NH1fvo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-346-VlFaHFrKPju6ywAtQ_O4CA-1; Wed, 07 Dec 2022 12:23:52 -0500
X-MC-Unique: VlFaHFrKPju6ywAtQ_O4CA-1
Received: by mail-ed1-f69.google.com with SMTP id i2-20020a05640242c200b0046c66305ebaso7351145edc.15
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Dec 2022 09:23:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nMgzAShnLdForNGMjNIaEeNq02GBD9lKBSGwVOBvyx4=;
        b=Vyi4LCiXDRKjDURGFi0pjPGzsH4AVRe11ezHDpl3WhWv1md6+H03JRJGGhjDENIfk6
         OuDIljb7DdVcSsrwpdvEAi4lf8gasa0t1nj7LOkxFyIGxrifEuJbFl8GJrAijD+ztyCN
         NCszC2FAjVzZcnoELmNxHtTvG6if8vKIcxs6BiSeotkR0uaWEe8mfMIF6VlvRfFHSYHl
         Gu98cKVlInaf/a1ZnK9SZQqTbkdGXkOv4DgqMpUVQJwLNzhMiy+VZ5LSPxy0DFXnQV+w
         n73ahp7VWS8NmCiGplvfQJWzIdRSMHrjHcdtzJmE/54RtIHtunn3lB9TaZyXJcbwfqgS
         niZg==
X-Gm-Message-State: ANoB5pl17kjApl9JDDKMUvC53g++ykarnYSKHC/4hJwCmfkfcfRMxrl3
        9TZ9KhVlxG8xi9Sjg3ICuF8x92ThLOy3oP3RTZ5JVdn6paIlTzor2DAc6o7HaysBXOsmVvJZimm
        adtxPEBN21cYnySha0e+0Tboz2gYAuKt6Lg==
X-Received: by 2002:a17:906:6c7:b0:78d:4061:5e1b with SMTP id v7-20020a17090606c700b0078d40615e1bmr68462281ejb.47.1670433831650;
        Wed, 07 Dec 2022 09:23:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6zR2ok+8go9F2u9gfBWO48RBSHJSLFRvL00jiX6h0au8DS60ohMtM45BvjG5DKhbRVp2iz6w==
X-Received: by 2002:a17:906:6c7:b0:78d:4061:5e1b with SMTP id v7-20020a17090606c700b0078d40615e1bmr68462273ejb.47.1670433831506;
        Wed, 07 Dec 2022 09:23:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 24-20020a170906309800b0078c1e174e11sm8774730ejv.136.2022.12.07.09.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 09:23:50 -0800 (PST)
Message-ID: <de32d340-7723-f980-4519-d8204a14d504@redhat.com>
Date:   Wed, 7 Dec 2022 18:23:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.1-5
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is one final platform-drivers-x86 fix for 6.1,
fixing a suspend/resume issue on some AMD laptops.

This fix has actually been in linux-next for 2 weeks already,
at first it seemed that this bug was hard to trigger, so the plan
was to send this with the main pull-req for 6.2.

But it turns out this is easier to trigger then expected.

Regards,

Hans


The following changes since commit b44fd994e45112b58b6c1dec4451d9a925784589:

  platform/x86: ideapad-laptop: Add module parameters to match DMI quirk tables (2022-11-16 08:47:08 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.1-5

for you to fetch changes up to e4678483f9bc400642bbc05c6b75a1b44bcb6c25:

  platform/x86/amd: pmc: Add a workaround for an s0i3 issue on Cezanne (2022-12-07 15:27:49 +0100)

----------------------------------------------------------------
platform-drivers-x86 for v6.1-5

A single fix for 6.12 for suspend/resume issues on some AMD systems.

The following is an automated git shortlog grouped by driver:

platform/x86/amd:
 -  pmc: Add a workaround for an s0i3 issue on Cezanne

----------------------------------------------------------------
Mario Limonciello (1):
      platform/x86/amd: pmc: Add a workaround for an s0i3 issue on Cezanne

 drivers/platform/x86/amd/pmc.c | 6 ++++++
 1 file changed, 6 insertions(+)



