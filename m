Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C244C761A6
	for <platform-driver-x86@archiver.kernel.org>; Fri, 31 Mar 2023 19:07:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbjCaTHZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 31 Mar 2023 15:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbjCaTHY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 31 Mar 2023 15:07:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D006522933
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Mar 2023 12:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680289597;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=GfL4asY+ZnHcLZiDdqOI9tltGi48G8yGqEg4NgPtO4A=;
        b=Kw03Ty0YoTuB+3N/nVmxWP2AlsprBF+kEkh8KP/nc2PzaHbJA3IQsaBJ6MORV0ahRPTAP+
        dA3MTzFR8wGdodVFSPtO9OPfvdGjD1uPRft8JaK9pkKvgi+Jtnz+1/ERyLKW5Pem3cX5fC
        iXSf/KCcYAFmiQQ1eluSbjX/yOhftPA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-M0TsRMwyOay5hm1HjzvGgA-1; Fri, 31 Mar 2023 15:06:35 -0400
X-MC-Unique: M0TsRMwyOay5hm1HjzvGgA-1
Received: by mail-ed1-f72.google.com with SMTP id c1-20020a0564021f8100b004acbe232c03so32648817edc.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Mar 2023 12:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680289594;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GfL4asY+ZnHcLZiDdqOI9tltGi48G8yGqEg4NgPtO4A=;
        b=3nMoTWH/wpaAYGpejDL0dm+QOtZDsb1/eJkGkT+uv/6dNpxClJ+nrQdU3QsxpPuXCS
         EmNVAwAbT0rpTiUWP5Stawo+QKuyJtBnbIfRo9j6Pbp5zJSBfgi7RwbgHzu/MmtKRJhI
         VeHnIuw1dMOBXa5l4nECVXzbN9cGme4pdI+rzhfQvDERJnFTfyrav4GLPX0By3Kviuc/
         38O5zlod2WHWlvNla3ayXrOTmKXdpjbCS1LxayGBnNU81/9R2tMO9xKv42wS/JgxvwDX
         vMntzM/TM4x9RcfZ4flmMUjyblLLtZY/rWE5C+mpe+InT7fUmZI6Ai6g8qT7yjFslfj8
         bocg==
X-Gm-Message-State: AAQBX9eO1XPIm3Cp4uTMMF04/oBNG3JLpPtNCfWDBSSHL5oBuD6FaQ7b
        oCZiTAX1lkVcSviw6Ir8DfIxRAk/s0pmwACCbfqOn/hKGEpIZ6BsZOOi1v2xHt+ZYU0NaJRSzWe
        RPuMDm5Cd+AmFwav0WF2AA3DKkm8dxEuZPw==
X-Received: by 2002:aa7:d39a:0:b0:4fd:2b05:aa2 with SMTP id x26-20020aa7d39a000000b004fd2b050aa2mr27475765edq.42.1680289594404;
        Fri, 31 Mar 2023 12:06:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350YA+ItNnwj/ji7Kbipg9PlB9562AAtBo6LkVXgG3d4qMLvslyY4/p0Nlhc9ppxbyjf2LJTyzg==
X-Received: by 2002:aa7:d39a:0:b0:4fd:2b05:aa2 with SMTP id x26-20020aa7d39a000000b004fd2b050aa2mr27475750edq.42.1680289594134;
        Fri, 31 Mar 2023 12:06:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v14-20020a50a44e000000b004bc15a440f1sm1367864edb.78.2023.03.31.12.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 12:06:33 -0700 (PDT)
Message-ID: <531dfb17-bdc6-00a2-cbf2-7a7c096896b0@redhat.com>
Date:   Fri, 31 Mar 2023 21:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.3-4
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is another round of fixes for platform-drivers-x86 for 6.3.

Highlights:
 -  Fix a regression in ideapad-laptop which caused the touchpad
    to stop working after a suspend/resume on some models
 -  1 other small fix and 3 hw-id additions

Regards,

Hans


The following changes since commit acd0acb802b90f88d19ad4337183e44fd0f77c50:

  platform/surface: aggregator: Add missing fwnode_handle_put() (2023-03-22 15:23:03 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.3-4

for you to fetch changes up to e3271a5917d1501089b1a224d702aa053e2877f4:

  platform/x86: ideapad-laptop: Stop sending KEY_TOUCHPAD_TOGGLE (2023-03-31 19:37:18 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.3-4

Highlights
 -  Fix a regression in ideapad-laptop which caused the touchpad
    to stop working after a suspend/resume on some models
 -  1 other small fix and 3 hw-id additions

The following is an automated git shortlog grouped by driver:

asus-nb-wmi:
 -  Add quirk_asus_tablet_mode to other ROG Flow X13 models

gigabyte-wmi:
 -  add support for X570S AORUS ELITE
 -  add support for B650 AORUS ELITE AX

ideapad-laptop:
 -  Stop sending KEY_TOUCHPAD_TOGGLE

platform/x86/intel/pmc:
 -  Alder Lake PCH slp_s0_residency fix

----------------------------------------------------------------
Hans de Goede (2):
      platform/x86: gigabyte-wmi: add support for X570S AORUS ELITE
      platform/x86: ideapad-laptop: Stop sending KEY_TOUCHPAD_TOGGLE

Rajvi Jingar (1):
      platform/x86/intel/pmc: Alder Lake PCH slp_s0_residency fix

Thomas Weißschuh (1):
      platform/x86: gigabyte-wmi: add support for B650 AORUS ELITE AX

weiliang1503 (1):
      platform/x86: asus-nb-wmi: Add quirk_asus_tablet_mode to other ROG Flow X13 models

 drivers/platform/x86/asus-nb-wmi.c    |  3 ++-
 drivers/platform/x86/gigabyte-wmi.c   |  2 ++
 drivers/platform/x86/ideapad-laptop.c | 23 ++++++++++-------------
 drivers/platform/x86/intel/pmc/core.c | 13 ++++++++++++-
 4 files changed, 26 insertions(+), 15 deletions(-)

