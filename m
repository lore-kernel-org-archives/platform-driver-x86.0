Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE48C64E7C
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Nov 2020 09:41:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF80C21527
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Nov 2020 09:41:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NN//e77+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729251AbgK0Jl0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 27 Nov 2020 04:41:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49048 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729194AbgK0JlY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Nov 2020 04:41:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606470082;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=IMBFuW1kwZcIfsQ9CTbuIBKuzaXOT1XTMro+WzbTZV8=;
        b=NN//e77+7T4dcW6bT9JkWg0JeJbtcgY311+oNoisXflluXwn0d4yCEPeaMvb6eI+3RdeGT
        u8rh7NQgfkqAffR9N7M3i7mzLmitTV7JhMrQeTy8sx0bZiO+rRfuuFTxjOmxCOaoHPaDyM
        3yIqb2b+tuXEIuWZE7MmdmE9mCqqUvE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-iwLC9QjoOcmh-8Hf3fv4eA-1; Fri, 27 Nov 2020 04:41:20 -0500
X-MC-Unique: iwLC9QjoOcmh-8Hf3fv4eA-1
Received: by mail-ed1-f72.google.com with SMTP id bt2so2226547edb.12
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2020 01:41:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=IMBFuW1kwZcIfsQ9CTbuIBKuzaXOT1XTMro+WzbTZV8=;
        b=rMNxfVE9fw3amE0kWS+07QomjdBLkmYwNMsV9y1qMYyDfOFReHaHmCLj63Gyncy/im
         VGRnCNFGi3Afcjb6pb31aXKZTOFjWa3VgzETvpEjGFEstciDI7lLNfLPDB/a5CxsZl1J
         7CMCCKdjMQcvmjtxkNFy8VjrKNYDjgB3mtkaWFufIoNf+uMc5Rk9c9gY/GaspsjqUfro
         DbU7x1jJ5NEs/R074Fql7VSbxm///Jyb3ikerv5/gw4JU6Ew9hBXtFpVmmZNMv/UwRVw
         vm+lFScSeDMmKTj9HJPpjXTwOLtQRhuuQndk38OWX5F3lGbyzmsqx+K0sYcYPiAUvWXv
         Dnkw==
X-Gm-Message-State: AOAM533oxem3ugSDD/OGuMyooQFj0n+v40YUm2MJ92p80ljJMt2zAGpf
        mqlv6IyFD9U2xq9Ks6kEv0A7k3vid+zZHdEqFxiCKZLLYHM/S1pr6EdDPF8oba3xk6ap24Wecle
        I/CrNG6sH0Hef1WOPWFNWrvkgWRhUl5O/SrZk3K3mFEwgPy35eAZlyuKqhxHuzMEOtcvAKpy0nf
        gMRHLpzRXIeg==
X-Received: by 2002:a17:906:2e55:: with SMTP id r21mr7093046eji.46.1606470079298;
        Fri, 27 Nov 2020 01:41:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1xcarjDCPCwzOKQRTlgF7I4yVz7qP0linSSpUxXJJBapznj0WdjI5PL2RriCwJz+eTWeiRg==
X-Received: by 2002:a17:906:2e55:: with SMTP id r21mr7093026eji.46.1606470079062;
        Fri, 27 Nov 2020 01:41:19 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id a3sm2514842edf.23.2020.11.27.01.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 01:41:18 -0800 (PST)
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 5.10-2
Message-ID: <7fadb4fc-4e7f-e335-4c90-c09ee6aafeac@redhat.com>
Date:   Fri, 27 Nov 2020 10:41:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is a set of small, straight-forward fixes for platform-drivers-x86 for 5.10:
 - thinkpad_acpi fixes: 2 bug-fixes and 3 model specific quirks
 - fixes for misc. other drivers: 2 bug-fixes and 3 model specific quirks

Regards,

Hans


The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.10-2

for you to fetch changes up to c9aa128080cbce92f8715a9328f88d8ca3134279:

  platform/x86: touchscreen_dmi: Add info for the Irbis TW118 tablet (2020-11-26 15:49:16 +0100)

----------------------------------------------------------------
platform-drivers-x86 for v5.10-2

Highlights:
 - thinkpad_acpi fixes: 2 bug-fixes and 3 model specific quirks
 - fixes for misc. other drivers: 2 bug-fixes and 3 model specific quirks

The following is an automated git shortlog grouped by driver:

acer-wmi:
 -  add automatic keyboard background light toggle key as KEY_LIGHTS_TOGGLE

intel-vbtn:
 -  Support for tablet mode on HP Pavilion 13 x360 PC

thinkpad_acpi:
 -  Whitelist P15 firmware for dual fan control
 -  Send tablet mode switch at wakeup time
 -  Add BAT1 is primary battery quirk for Thinkpad Yoga 11e 4th gen
 -  Do not report SW_TABLET_MODE on Yoga 11e
 -  add P1 gen3 second fan support

toshiba_acpi:
 -  Fix the wrong variable assignment

touchscreen_dmi:
 -  Add info for the Irbis TW118 tablet
 -  Add info for the Predia Basic tablet

----------------------------------------------------------------
Benjamin Berg (1):
      platform/x86: thinkpad_acpi: Send tablet mode switch at wakeup time

Hans de Goede (4):
      platform/x86: thinkpad_acpi: Do not report SW_TABLET_MODE on Yoga 11e
      platform/x86: thinkpad_acpi: Add BAT1 is primary battery quirk for Thinkpad Yoga 11e 4th gen
      platform/x86: touchscreen_dmi: Add info for the Predia Basic tablet
      platform/x86: touchscreen_dmi: Add info for the Irbis TW118 tablet

Iakov 'Jake' Kirilenko (1):
      platform/x86: thinkpad_acpi: add P1 gen3 second fan support

Kaixu Xia (1):
      platform/x86: toshiba_acpi: Fix the wrong variable assignment

Matthias Maier (1):
      platform/x86: thinkpad_acpi: Whitelist P15 firmware for dual fan control

Max Verevkin (1):
      platform/x86: intel-vbtn: Support for tablet mode on HP Pavilion 13 x360 PC

Timo Witte (1):
      platform/x86: acer-wmi: add automatic keyboard background light toggle key as KEY_LIGHTS_TOGGLE

 drivers/platform/x86/acer-wmi.c        |  1 +
 drivers/platform/x86/intel-vbtn.c      |  6 ++++
 drivers/platform/x86/thinkpad_acpi.c   | 13 ++++++++-
 drivers/platform/x86/toshiba_acpi.c    |  3 +-
 drivers/platform/x86/touchscreen_dmi.c | 50 ++++++++++++++++++++++++++++++++++
 5 files changed, 70 insertions(+), 3 deletions(-)

