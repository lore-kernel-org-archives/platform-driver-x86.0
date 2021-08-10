Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5A8C4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Aug 2021 16:09:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF369610CC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Aug 2021 16:09:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbhHJQJc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Aug 2021 12:09:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54898 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233058AbhHJQJa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Aug 2021 12:09:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628611747;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=bzgkW3LsTO9l2MG/+ZO2oR4zGUytRooe1G5e6npTltk=;
        b=RATPos0oMfAPumVIjaLID083NdDjRsFxO7YNlQ59Tg7HybYp6A0cO2c01pXoNc4cliG/Rp
        kjf8tmTEj531WT1HYP4qBjnM7gEUSsjw5rEkkIwiX8vhwiGW4nHXwQyzNPk0vvRr99nQ4y
        VfTShQp07XPvHkr/t9Su5iMpyU9zoZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-4rpzxcEgP0WGi3hTdvqLlQ-1; Tue, 10 Aug 2021 12:09:04 -0400
X-MC-Unique: 4rpzxcEgP0WGi3hTdvqLlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FDDA1026200;
        Tue, 10 Aug 2021 16:09:03 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 07D83669ED;
        Tue, 10 Aug 2021 16:09:01 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
        Mario Limonciello <mario.limonciello@outlook.com>
Subject: [PATCH] platform/x86: Update Mario Limonciello's email address in the docs
Date:   Tue, 10 Aug 2021 18:09:00 +0200
Message-Id: <20210810160900.106512-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Various pdx86 docs under Documentation/ABI/testing still use Mario's
old, now defunct, <mario.limonciello@dell.com> address.

Update the docs to point to either the new Dell.Client.Kernel@dell.com
email alias for Dell specific drivers, or to Mario's new @outlook.com
address for other drivers.

Cc: Dell.Client.Kernel@dell.com
Cc: Mario Limonciello <mario.limonciello@outlook.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 Documentation/ABI/testing/dell-smbios-wmi                 | 2 +-
 Documentation/ABI/testing/sysfs-bus-thunderbolt           | 2 +-
 Documentation/ABI/testing/sysfs-class-firmware-attributes | 8 ++++----
 Documentation/ABI/testing/sysfs-platform-dell-smbios      | 2 +-
 .../ABI/testing/sysfs-platform-intel-wmi-thunderbolt      | 2 +-
 Documentation/ABI/testing/sysfs-power                     | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/ABI/testing/dell-smbios-wmi b/Documentation/ABI/testing/dell-smbios-wmi
index 5f3a0dc67050..f58229084469 100644
--- a/Documentation/ABI/testing/dell-smbios-wmi
+++ b/Documentation/ABI/testing/dell-smbios-wmi
@@ -1,7 +1,7 @@
 What:		/dev/wmi/dell-smbios
 Date:		November 2017
 KernelVersion:	4.15
-Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
+Contact:	Dell.Client.Kernel@dell.com
 Description:
 		Perform SMBIOS calls on supported Dell machines.
 		through the Dell ACPI-WMI interface.
diff --git a/Documentation/ABI/testing/sysfs-bus-thunderbolt b/Documentation/ABI/testing/sysfs-bus-thunderbolt
index 95c21d6c9a84..b7e87f6c7d47 100644
--- a/Documentation/ABI/testing/sysfs-bus-thunderbolt
+++ b/Documentation/ABI/testing/sysfs-bus-thunderbolt
@@ -232,7 +232,7 @@ Description:	When new NVM image is written to the non-active NVM
 What:		/sys/bus/thunderbolt/devices/.../nvm_authenticate_on_disconnect
 Date:		Oct 2020
 KernelVersion:	v5.9
-Contact:	Mario Limonciello <mario.limonciello@dell.com>
+Contact:	Mario Limonciello <mario.limonciello@outlook.com>
 Description:	For supported devices, automatically authenticate the new Thunderbolt
 		image when the device is disconnected from the host system.
 
diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 3348bf80a37c..0b43997b76e3 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -2,8 +2,8 @@ What:		/sys/class/firmware-attributes/*/attributes/*/
 Date:		February 2021
 KernelVersion:	5.11
 Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
-		Mario Limonciello <mario.limonciello@dell.com>,
 		Prasanth KSR <prasanth.ksr@dell.com>
+		Dell.Client.Kernel@dell.com
 Description:
 		A sysfs interface for systems management software to enable
 		configuration capability on supported systems.  This directory
@@ -130,8 +130,8 @@ What:		/sys/class/firmware-attributes/*/authentication/
 Date:		February 2021
 KernelVersion:	5.11
 Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
-		Mario Limonciello <mario.limonciello@dell.com>,
 		Prasanth KSR <prasanth.ksr@dell.com>
+		Dell.Client.Kernel@dell.com
 Description:
 		Devices support various authentication mechanisms which can be exposed
 		as a separate configuration object.
@@ -220,8 +220,8 @@ What:		/sys/class/firmware-attributes/*/attributes/pending_reboot
 Date:		February 2021
 KernelVersion:	5.11
 Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
-		Mario Limonciello <mario.limonciello@dell.com>,
 		Prasanth KSR <prasanth.ksr@dell.com>
+		Dell.Client.Kernel@dell.com
 Description:
 		A read-only attribute reads 1 if a reboot is necessary to apply
 		pending BIOS attribute changes. Also, an uevent_KOBJ_CHANGE is
@@ -249,8 +249,8 @@ What:		/sys/class/firmware-attributes/*/attributes/reset_bios
 Date:		February 2021
 KernelVersion:	5.11
 Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
-		Mario Limonciello <mario.limonciello@dell.com>,
 		Prasanth KSR <prasanth.ksr@dell.com>
+		Dell.Client.Kernel@dell.com
 Description:
 		This attribute can be used to reset the BIOS Configuration.
 		Specifically, it tells which type of reset BIOS configuration is being
diff --git a/Documentation/ABI/testing/sysfs-platform-dell-smbios b/Documentation/ABI/testing/sysfs-platform-dell-smbios
index e6e0f7f834a7..5583da581025 100644
--- a/Documentation/ABI/testing/sysfs-platform-dell-smbios
+++ b/Documentation/ABI/testing/sysfs-platform-dell-smbios
@@ -1,7 +1,7 @@
 What:		/sys/devices/platform/<platform>/tokens/*
 Date:		November 2017
 KernelVersion:	4.15
-Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
+Contact:	Dell.Client.Kernel@dell.com
 Description:
 		A read-only description of Dell platform tokens
 		available on the machine.
diff --git a/Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt b/Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt
index e19144fd5d86..fd3a7ec79760 100644
--- a/Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt
+++ b/Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt
@@ -1,7 +1,7 @@
 What:		/sys/devices/platform/<platform>/force_power
 Date:		September 2017
 KernelVersion:	4.15
-Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
+Contact:	"Mario Limonciello" <mario.limonciello@outlook.com>
 Description:
 		Modify the platform force power state, influencing
 		Thunderbolt controllers to turn on or off when no
diff --git a/Documentation/ABI/testing/sysfs-power b/Documentation/ABI/testing/sysfs-power
index 51c0f578bfce..90ec4987074b 100644
--- a/Documentation/ABI/testing/sysfs-power
+++ b/Documentation/ABI/testing/sysfs-power
@@ -295,7 +295,7 @@ Description:
 
 What:		/sys/power/resume_offset
 Date:		April 2018
-Contact:	Mario Limonciello <mario.limonciello@dell.com>
+Contact:	Mario Limonciello <mario.limonciello@outlook.com>
 Description:
 		This file is used for telling the kernel an offset into a disk
 		to use when hibernating the system such as with a swap file.
-- 
2.31.1

