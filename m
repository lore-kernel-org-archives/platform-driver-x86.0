Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C33C4320A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 07:36:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93AF06113D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 07:36:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbhHSHhR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Aug 2021 03:37:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27592 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234618AbhHSHhQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Aug 2021 03:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629358600;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=EGoAqiXMaqUmTnBvOsdIXNuYmSfBYahpZQJKl7y5rt4=;
        b=H9fWQWV+gPH3r8qy3pSlh3+kT11QlZSPTNL4ISh7I89wBpzNRp4lU47eEjfrTyN+qcn9w4
        lyBbsahe2DYzEGpic0XhpRPlftUZJqSxhZUitrtiKBztJ2pKgVAsIf+Ky68av2/C5hadvX
        SdhsoI/eOoUklnWGFqaXohCThW0ZTeo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-HUlFbjZwNmW2fWTS8ghcUQ-1; Thu, 19 Aug 2021 03:36:37 -0400
X-MC-Unique: HUlFbjZwNmW2fWTS8ghcUQ-1
Received: by mail-ed1-f72.google.com with SMTP id b25-20020a05640202d9b02903be7281a80cso2386270edx.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Aug 2021 00:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=EGoAqiXMaqUmTnBvOsdIXNuYmSfBYahpZQJKl7y5rt4=;
        b=B7nEBhcR5zUYKdySJ5UtrJWicZvJ4QovHiz+WCfLthTTV94zExHENcMfkixktCBPuH
         qwtNnvFelGvI6uB0of0vBTiQk50wgUH+LNOb5G4l5vGuOBT75crVeJfHYIgmC4EE/flP
         KKePquyI83EpR5nO6HwDRSVM+TrdBkoBCbeVt6tQl5WEiCNu7ZxRSsmu3syec2cW2EPG
         RSSW3OBBpkxS+Jpk57Si8LkqZBzLX8/2WskCDUsX6TnJ6LVSUQxjwc+JoGI9k9JxNAfm
         aUlMBJxO2rI9pYCf/98FMdHYdVu4aPaPft/6k42AZM+a/nH5ccJpqz7c74237DRIwD/B
         hz7Q==
X-Gm-Message-State: AOAM5323R2V4T3cGUewA7SG3Gf4OUbBww0YRKQgTWU5JW21QM0DrS9eG
        RgKndb805IBIiRp5qJ3vY9qqhzQD/ry4bq0h61quZ3lAmPJChVLNA/akR5O5VL7gtQWr8wESXaS
        DtcHElloMvdn3k/UPO/+YUL9KNaQCrsSNGEPFNmkpKPCPRnH+s5sag0/W/1f9JuJo8taNNAO74Z
        FnDWTQiPOpcw==
X-Received: by 2002:aa7:c502:: with SMTP id o2mr14981359edq.86.1629358596158;
        Thu, 19 Aug 2021 00:36:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhoishZRqWaTBsxqhiz0xnk+GI815zExuOZ46CXo4J7GQ/QaAj7nnhoVu6BSycVn18zzXFoA==
X-Received: by 2002:aa7:c502:: with SMTP id o2mr14981341edq.86.1629358595936;
        Thu, 19 Aug 2021 00:36:35 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v12sm1285528ede.16.2021.08.19.00.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 00:36:35 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 5.14-4
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Message-ID: <2c41a5a1-f773-06c5-71ab-05537cb276b0@redhat.com>
Date:   Thu, 19 Aug 2021 09:36:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is a small set of pdx86 fixes for 5.14:
- asus-nb-wmi: Enable SW_TABLET_MODE support for the TP200s (DMI quirk)
- gigabyte-wmi: Enable on 2 more Gigabyte motherboards (2 DMI quirks)

Regards,

Hans


The following changes since commit 9d7b132e62e41b7d49bf157aeaf9147c27492e0f:

  platform/x86: pcengines-apuv2: Add missing terminating entries to gpio-lookup tables (2021-08-06 14:04:43 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.14-4

for you to fetch changes up to 1e35b8a7780a0c043cc5389420f069b69343f5d9:

  platform/x86: gigabyte-wmi: add support for B450M S2H V2 (2021-08-18 19:39:31 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v5.14-4

A small set of pdx86 fixes for 5.14:
- asus-nb-wmi: Enable SW_TABLET_MODE support for the TP200s (DMI quirk)
- gigabyte-wmi: Enable on 2 more Gigabyte motherboards (2 DMI quirks)

The following is an automated git shortlog grouped by driver:

asus-nb-wmi:
 -  Add tablet_mode_sw=lid-flip quirk for the TP200s
 -  Allow configuring SW_TABLET_MODE method with a module option

gigabyte-wmi:
 -  add support for B450M S2H V2
 -  add support for X570 GAMING X

----------------------------------------------------------------
Hans de Goede (2):
      platform/x86: asus-nb-wmi: Allow configuring SW_TABLET_MODE method with a module option
      platform/x86: asus-nb-wmi: Add tablet_mode_sw=lid-flip quirk for the TP200s

Thomas Weißschuh (2):
      platform/x86: gigabyte-wmi: add support for X570 GAMING X
      platform/x86: gigabyte-wmi: add support for B450M S2H V2

 drivers/platform/x86/asus-nb-wmi.c  | 28 ++++++++++++++++++++++++++++
 drivers/platform/x86/gigabyte-wmi.c |  2 ++
 2 files changed, 30 insertions(+)

