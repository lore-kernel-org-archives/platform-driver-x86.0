Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8F3C433E3
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 14:35:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F99161961
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 14:35:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhCTOfJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 20 Mar 2021 10:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38948 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229588AbhCTOei (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Mar 2021 10:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616250877;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=nMHdsc74d31JJuwmHF0+l+FbAbzKcbe2oap1RNYZJDo=;
        b=HM58DsEhaGRDGGp+rnEjGSH9U1Rj6yoYHFRhrkPN3ws2PndsmG3LrrbGZc3CuhJB1QF4IB
        JzlKmUjVBz0Eiv1P0UpWdlT5t7thYlr1bq0mu18Hur+Kxr/090s3DYUoJ4oDD6GD0a5mdt
        WEWwMmVleJMY/wxjH3sVIwP5HNfsWXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-J7IEoHE8OnK2MRssqqoszQ-1; Sat, 20 Mar 2021 10:34:34 -0400
X-MC-Unique: J7IEoHE8OnK2MRssqqoszQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6787187A826;
        Sat, 20 Mar 2021 14:34:32 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-22.ams2.redhat.com [10.36.112.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D259A60C04;
        Sat, 20 Mar 2021 14:34:30 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/7] platform/x86: dell-wmi-sysman: Various error-handling and robustness fixes
Date:   Sat, 20 Mar 2021 15:34:22 +0100
Message-Id: <20210320143429.76047-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

There have been several bug-reports about crashes related to the
dell-wmi-sysman module:

https://bugzilla.redhat.com/show_bug.cgi?id=1936171
https://bugzilla.kernel.org/show_bug.cgi?id=211895
https://bugs.archlinux.org/task/69702

This patch series contains a bunch of fixes for NULL pointer derefs,
double-frees, etc. Which will hopefully fix this.

I don't have any hardware which actually exposes the used interface,
so I've only been able to verify that the driver now cleanly refuses
to load on Dell devices without the interface.

If someone from Dell can test this to ensure that it does not cause
regressions on devices with the interface that would be great.

Regards,

Hans


Hans de Goede (7):
  platform/x86: dell-wmi-sysman: Fix possible NULL pointer deref on exit
  platform/x86: dell-wmi-sysman: Make it safe to call
    exit_foo_attributes() multiple times
  platform/x86: dell-wmi-sysman: Fix release_attributes_data() getting
    called twice on init_bios_attributes() failure
  platform/x86: dell-wmi-sysman: Cleanup sysman_init() error-exit
    handling
  platform/x86: dell-wmi-sysman: Make sysman_init() return -ENODEV of
    the interfaces are not found
  platform/x86: dell-wmi-sysman: Make init_bios_attributes() ACPI object
    parsing more robust
  platform/x86: dell-wmi-sysman: Cleanup
    create_attributes_level_sysfs_files()

 .../dell/dell-wmi-sysman/enum-attributes.c    |   3 +
 .../x86/dell/dell-wmi-sysman/int-attributes.c |   3 +
 .../dell/dell-wmi-sysman/passobj-attributes.c |   3 +
 .../dell/dell-wmi-sysman/string-attributes.c  |   3 +
 .../x86/dell/dell-wmi-sysman/sysman.c         | 117 +++++++++---------
 5 files changed, 71 insertions(+), 58 deletions(-)

-- 
2.30.2

