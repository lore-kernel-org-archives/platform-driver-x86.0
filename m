Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9D4C4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Aug 2021 15:52:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A167E60ED8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Aug 2021 15:52:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242444AbhHJPw2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Aug 2021 11:52:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25947 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242374AbhHJPw0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Aug 2021 11:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628610723;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=8+QhO5R75wolOCQVyYM50mwRqjZzXTj65snO0lyfuGM=;
        b=XeTvcnjf62Dk0PKHvZ9Rkza9zgc49X1LFjp8wssPN58mrJOj1F/FIneHo9trSOKtzNJwUs
        IvtZMskw80w9ALEQRcE86X3CS09RPmYSrmZRUkSl4JbWTBcxacZHeIpxHlncyt7povF6Qb
        smcEv9tdtz6+GOiMCyRZwNE9V1lVJb8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-rKmxW95kNL2UUNKqV2B2JQ-1; Tue, 10 Aug 2021 11:52:02 -0400
X-MC-Unique: rKmxW95kNL2UUNKqV2B2JQ-1
Received: by mail-ed1-f71.google.com with SMTP id l3-20020aa7c3030000b02903bccf1897f9so10943413edq.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Aug 2021 08:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=8+QhO5R75wolOCQVyYM50mwRqjZzXTj65snO0lyfuGM=;
        b=eRQcLkKQ2Dnj5YtaKmNaM2EoQUH6a3/lv6VVTaQVFjmMneHGOecmQOOnDUQMUS4e2n
         YRRKNYo4nOxQjRxfpSG6srsAsx739pvmvp5Dv7Tqi6WQ6Vhen51EZGkhnc9Spu5P9iVr
         UUjD8u2fugSmzcrce0x13n89rekWB8b0qmPz0Cpo85mR2+yRlGA3MMwRoSaZxJRPeSTt
         xqlTZsmsy+CrkD5iIv1ac12VnoV+c0ThQJkwx8jPb2Eg45e9SVic0svrKzkjeXy7Bc4k
         1WW6G81aH+CoMY6dqOtZP+PiK8mZUuG4TO6fqptDouvlUo1ZqwR7yTAGbkjAe78YG5Er
         ciiw==
X-Gm-Message-State: AOAM532DKEPZ/l8v+9K4kwUXVM6/AjcbHOKvnnGBi6bcm/3UcFL9dD61
        SOxtGRIGNX+GdHzPqXZXjOuxSLQZnlTdRe2C+6VyiQXoK+0TpIY7hpB5ZjUeC1TqiY4o5dWMmOo
        FE9WJuBckxo800ixrvoimInUMn1HJF78c52jBrc9K0pgwr3G1IWKg1VSlTIRmuoFKK907cxhhdK
        CKBEF2ByHhNw==
X-Received: by 2002:a17:907:b07:: with SMTP id h7mr2927088ejl.406.1628610721296;
        Tue, 10 Aug 2021 08:52:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNMQpCTpDI7d7U6IVVwQrHpVV6R8mc5voCRACa9wB697FdRlvx9PgzsEjavckRkg+rdDttEA==
X-Received: by 2002:a17:907:b07:: with SMTP id h7mr2927063ejl.406.1628610721000;
        Tue, 10 Aug 2021 08:52:01 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w6sm9689190edq.58.2021.08.10.08.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 08:52:00 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 5.14-3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Message-ID: <22dd7348-7f62-a99c-9f3b-3fdd00bb3772@redhat.com>
Date:   Tue, 10 Aug 2021 17:52:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is a small set of bug-fixes for 5.14, 2 patches for dealing with
360 degree/ yoga-style 2-in-1s with 2 accelerometers and one other
trivial patch.

Regards,

Hans


The following changes since commit 2b2c66f607d00d17f879c0d946d44340bfbdc501:

  platform/x86: gigabyte-wmi: add support for B550 Aorus Elite V2 (2021-07-28 12:05:33 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.14-3

for you to fetch changes up to 9d7b132e62e41b7d49bf157aeaf9147c27492e0f:

  platform/x86: pcengines-apuv2: Add missing terminating entries to gpio-lookup tables (2021-08-06 14:04:43 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v5.14-3

Second (small) set of pdx86 fixes for 5.14.

The following is an automated git shortlog grouped by driver:

Add and use a dual_accel_detect() helper:
 - Add and use a dual_accel_detect() helper

Make dual_accel_detect() KIOX010A + KIOX020A detect more robust:
 - Make dual_accel_detect() KIOX010A + KIOX020A detect more robust

pcengines-apuv2:
 -  Add missing terminating entries to gpio-lookup tables

----------------------------------------------------------------
Hans de Goede (3):
      platform/x86: Add and use a dual_accel_detect() helper
      platform/x86: Make dual_accel_detect() KIOX010A + KIOX020A detect more robust
      platform/x86: pcengines-apuv2: Add missing terminating entries to gpio-lookup tables

 drivers/platform/x86/Kconfig             |  3 ++
 drivers/platform/x86/dual_accel_detect.h | 76 ++++++++++++++++++++++++++++++++
 drivers/platform/x86/intel-hid.c         | 21 +++------
 drivers/platform/x86/intel-vbtn.c        | 18 ++++++--
 drivers/platform/x86/pcengines-apuv2.c   |  2 +
 drivers/platform/x86/thinkpad_acpi.c     |  3 +-
 6 files changed, 104 insertions(+), 19 deletions(-)
 create mode 100644 drivers/platform/x86/dual_accel_detect.h

