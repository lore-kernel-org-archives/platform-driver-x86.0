Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DA6C64EC7
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 09:24:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjCAJY3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjCAJY2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 04:24:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F8F3250E
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 01:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677662620;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Z1EirTu1pg1Hxyq2N8vwcnMM4ZUp7Q0YCKWtK8fRQG4=;
        b=g5wfRLXxSFXwWQDFGYGOWbSY3OVkfMYIa+jxGQj2hGzqK5QMVFtGxciO4spKl8uFuimXos
        rEL59uTEZqLi0xgUdfonqkLtsjkt06G7GDnbCPDXOQM2KDeitukvBVPCoWE5InaVHPxiFB
        CKOgGa73Q2c7ReyK8lv/aNniNv1YBC0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-NRh0eSaVOiqT6s5mm-A_Zg-1; Wed, 01 Mar 2023 04:23:39 -0500
X-MC-Unique: NRh0eSaVOiqT6s5mm-A_Zg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51D5486476D;
        Wed,  1 Mar 2023 09:23:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A46C640CF8EC;
        Wed,  1 Mar 2023 09:23:37 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 00/14] platform/x86: x86-android-tablets: Split in multiple files + misc additions
Date:   Wed,  1 Mar 2023 10:23:17 +0100
Message-Id: <20230301092331.7038-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

Here is version 2 of my series to move the x86-android-tablets
driver into its own subdir and to split it into multiple-files.

Changes in v2:
-Gather all outstanding x86-android-tablets changes in 1 series.
-Address all Andy's review remarks, see individual commit messages
 for details. Thank you for all the reviews Andy!
-New patches:
 -Add LID switch support to Yoga Tablet 2 1050/830 series
 -Lenovo Yoga Book match is for YB1-X91 models only

Regards,

Hans


Hans de Goede (14):
  platform/x86: x86-android-tablets: Add Acer Iconia One 7 B1-750 data
  platform/x86: x86-android-tablets: Move into its own subdir
  platform/x86: x86-android-tablets: Move core code into new core.c file
  platform/x86: x86-android-tablets: Move DMI match table into its own
    dmi.c file
  platform/x86: x86-android-tablets: Move shared power-supply fw-nodes
    to a separate file
  platform/x86: x86-android-tablets: Move Asus tablets to their own file
  platform/x86: x86-android-tablets: Move Lenovo tablets to their own
    file
  platform/x86: x86-android-tablets: Move remaining tablets to other.c
  platform/x86: x86-android-tablets: Add gpio_keys support to
    x86_android_tablet_init()
  platform/x86: x86-android-tablets: Add support for the Dolby button on
    Peaq C1010
  platform/x86: x86-android-tablets: Add touchscreen support for Lenovo
    Yoga Tab 3 Pro YT3-X90F
  platform/x86: x86-android-tablets: Add backlight ctrl for Lenovo Yoga
    Tab 3 Pro YT3-X90F
  platform/x86: x86-android-tablets: Add LID switch support for Yoga
    Tablet 2 1050/830 series
  platform/x86: x86-android-tablets: Lenovo Yoga Book match is for
    YB1-X91 models only

 MAINTAINERS                                   |    8 +-
 drivers/platform/x86/Kconfig                  |   24 +-
 drivers/platform/x86/Makefile                 |    3 +-
 drivers/platform/x86/peaq-wmi.c               |  128 --
 drivers/platform/x86/x86-android-tablets.c    | 1803 -----------------
 .../platform/x86/x86-android-tablets/Kconfig  |   21 +
 .../platform/x86/x86-android-tablets/Makefile |    9 +
 .../platform/x86/x86-android-tablets/asus.c   |  325 +++
 .../platform/x86/x86-android-tablets/core.c   |  391 ++++
 .../platform/x86/x86-android-tablets/dmi.c    |  154 ++
 .../platform/x86/x86-android-tablets/lenovo.c |  502 +++++
 .../platform/x86/x86-android-tablets/other.c  |  522 +++++
 .../x86/x86-android-tablets/shared-psy-info.c |  101 +
 .../x86/x86-android-tablets/shared-psy-info.h |   32 +
 .../x86-android-tablets/x86-android-tablets.h |  108 +
 15 files changed, 2168 insertions(+), 1963 deletions(-)
 delete mode 100644 drivers/platform/x86/peaq-wmi.c
 delete mode 100644 drivers/platform/x86/x86-android-tablets.c
 create mode 100644 drivers/platform/x86/x86-android-tablets/Kconfig
 create mode 100644 drivers/platform/x86/x86-android-tablets/Makefile
 create mode 100644 drivers/platform/x86/x86-android-tablets/asus.c
 create mode 100644 drivers/platform/x86/x86-android-tablets/core.c
 create mode 100644 drivers/platform/x86/x86-android-tablets/dmi.c
 create mode 100644 drivers/platform/x86/x86-android-tablets/lenovo.c
 create mode 100644 drivers/platform/x86/x86-android-tablets/other.c
 create mode 100644 drivers/platform/x86/x86-android-tablets/shared-psy-info.c
 create mode 100644 drivers/platform/x86/x86-android-tablets/shared-psy-info.h
 create mode 100644 drivers/platform/x86/x86-android-tablets/x86-android-tablets.h

-- 
2.39.1

