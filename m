Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E65C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03CFE61934
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:00:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbhCUL7f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 07:59:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27600 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229815AbhCUL7I (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 07:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616327948;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=1jzegD9Rr6YntWpWNwSTgiEhFbIXwevMmdnMU0t1tcM=;
        b=i+vnvJDLzdLtNcqD/eTlqutFmmhKWqhKfect/qd4BsHSNOkqE+qfcP53PF3GPE3y5H+ne/
        qtKsZijexcm51dlrB6S+ogdlSbCScvanhtX6cLX1V/9eMQu/vWZOO+r/CFb4w2xqHP7Ycu
        vmoocWglvB0ByWUZzY6p+Xi+53Hv/pc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-2-lhSMevN8GNrtRPCF7mWw-1; Sun, 21 Mar 2021 07:59:05 -0400
X-MC-Unique: 2-lhSMevN8GNrtRPCF7mWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FB32107ACCD;
        Sun, 21 Mar 2021 11:59:03 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-68.ams2.redhat.com [10.36.112.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2D8A95DAA5;
        Sun, 21 Mar 2021 11:59:02 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/7] platform/x86: dell-wmi-sysman: Various error-handling and robustness fixes
Date:   Sun, 21 Mar 2021 12:58:54 +0100
Message-Id: <20210321115901.35072-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

There have been several bug-reports about crashes related to the
dell-wmi-sysman module:

https://bugzilla.redhat.com/show_bug.cgi?id=1936171
https://bugzilla.kernel.org/show_bug.cgi?id=211895
https://bugs.archlinux.org/task/69702

Here is v2 of my series with a bunch of fixes for NULL pointer derefs,
double-frees, etc. which fixes this.

New in v2:
-New patch: "platform/x86: dell-wmi-sysman: Fix crash caused by calling 
kset_unregister twice" which addresses the direct-cause of
the crash.  Note that the crash was already fixed in v1 because
that removed the code-path where kset_unregister ended up being
called twice.

-Dropped: "platform/x86: dell-wmi-sysman: Make init_bios_attributes() 
ACPI object parsing more robust". This needs more testing / discussion
and is not necessary to fix the boot-failure which people are seeing.

Regards,

Hans


Hans de Goede (7):
  platform/x86: dell-wmi-sysman: Fix crash caused by calling
    kset_unregister twice
  platform/x86: dell-wmi-sysman: Fix possible NULL pointer deref on exit
  platform/x86: dell-wmi-sysman: Make it safe to call
    exit_foo_attributes() multiple times
  platform/x86: dell-wmi-sysman: Fix release_attributes_data() getting
    called twice on init_bios_attributes() failure
  platform/x86: dell-wmi-sysman: Cleanup sysman_init() error-exit
    handling
  platform/x86: dell-wmi-sysman: Make sysman_init() return -ENODEV of
    the interfaces are not found
  platform/x86: dell-wmi-sysman: Cleanup
    create_attributes_level_sysfs_files()

 .../dell/dell-wmi-sysman/enum-attributes.c    |  3 +
 .../x86/dell/dell-wmi-sysman/int-attributes.c |  3 +
 .../dell/dell-wmi-sysman/passobj-attributes.c |  3 +
 .../dell/dell-wmi-sysman/string-attributes.c  |  3 +
 .../x86/dell/dell-wmi-sysman/sysman.c         | 84 +++++++------------
 5 files changed, 44 insertions(+), 52 deletions(-)

-- 
2.30.2

