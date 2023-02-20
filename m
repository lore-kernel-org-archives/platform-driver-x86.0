Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B332C678D5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Feb 2023 22:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbjBTWNP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Feb 2023 17:13:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232640AbjBTWNN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2023 17:13:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D95B1E1D0
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Feb 2023 14:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676931143;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=BeUn6FKw9DMlGJZ2kL7lmfEUgCJapUnXQB0U5h8X45s=;
        b=FMkbgEUNr/ocoHMPPdZvnsBp/LvP1W3lldPMGLu+EsG09F1TjlTHCU13EFvtr06id4qvkm
        MXCd/JIu0oDWBrzmzNukJzzW9cBvfzbO7FwVMlnXT8R7Mdb9TTFQ28Esu+lvQ9WlONEoe1
        pTJuila/Iz5178RPbP76ujXk8saPxWw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-SEmpdskTPgC4IHye2nD4uA-1; Mon, 20 Feb 2023 17:12:21 -0500
X-MC-Unique: SEmpdskTPgC4IHye2nD4uA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72B581C05198;
        Mon, 20 Feb 2023 22:12:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CC49A140EBF6;
        Mon, 20 Feb 2023 22:12:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/9] platform/x86: x86-android-tablets: Split into multiple files + gpio_keys rework
Date:   Mon, 20 Feb 2023 23:12:03 +0100
Message-Id: <20230220221212.196009-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

The single x86-android-tablets.c file was becoming a bit unyieldly,
so this series splits it into multiple files. Besides the split this
also reworks the gpio_keys a bit and uses the new gpio_keys code
to replace the (ugly, buggy) peaq-wmi code for the special button
on the Peaq C1010.

Regards,

Hans


Hans de Goede (9):
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

 MAINTAINERS                                   |    2 +-
 drivers/platform/x86/Kconfig                  |   24 +-
 drivers/platform/x86/Makefile                 |    3 +-
 drivers/platform/x86/peaq-wmi.c               |  128 --
 drivers/platform/x86/x86-android-tablets.c    | 1884 -----------------
 .../platform/x86/x86-android-tablets/Kconfig  |   21 +
 .../platform/x86/x86-android-tablets/Makefile |    9 +
 .../platform/x86/x86-android-tablets/asus.c   |  324 +++
 .../platform/x86/x86-android-tablets/core.c   |  391 ++++
 .../platform/x86/x86-android-tablets/dmi.c    |  175 ++
 .../platform/x86/x86-android-tablets/lenovo.c |  417 ++++
 .../platform/x86/x86-android-tablets/other.c  |  518 +++++
 .../x86/x86-android-tablets/shared-psy-info.c |  100 +
 .../x86/x86-android-tablets/shared-psy-info.h |   32 +
 .../x86-android-tablets/x86-android-tablets.h |   81 +
 15 files changed, 2071 insertions(+), 2038 deletions(-)
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

