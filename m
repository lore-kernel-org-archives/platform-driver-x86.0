From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] x86/wmi: delete unused wmi_data_lock mutex causing gcc warning
Date: Mon, 23 Mar 2015 14:01:37 -0400
Message-ID: <1427133697-7228-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:37575 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752221AbbCWSDT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Mar 2015 14:03:19 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

In commit bff431e49ff531a343fbb2b4426e313000844f32 ("ACPI: WMI: Add
ACPI-WMI mapping driver") this mutex was added, but the rest of the
final commit never actually made use of it, resulting in:

 In file included from include/linux/mutex.h:29:0,
                  from include/linux/kernfs.h:13,
                  from include/linux/sysfs.h:15,
                  from include/linux/kobject.h:21,
                  from include/linux/device.h:17,
                  from drivers/platform/x86/wmi.c:35:
 drivers/platform/x86/wmi.c:48:21: warning: =E2=80=98wmi_data_lock=E2=80=
=99 defined but not used [-Wunused-variable]
  static DEFINE_MUTEX(wmi_data_lock);
                      ^

A git grep shows no other instances/references to the wmi_data_lock.
Delete it, assuming that the mutex addition was just a leftover from
an earlier work in progress version of the change, since the original
dates from 2008.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/platform/x86/wmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 737e56d46f61..26a0bd893b86 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -45,7 +45,6 @@ MODULE_LICENSE("GPL");
=20
 #define ACPI_WMI_CLASS "wmi"
=20
-static DEFINE_MUTEX(wmi_data_lock);
 static LIST_HEAD(wmi_block_list);
=20
 struct guid_block {
--=20
2.2.1
