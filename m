From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v4 2/3] dell-rbtn: Export notifier for other kernel modules
Date: Wed, 27 May 2015 23:28:24 +0200
Message-ID: <1432762105-13723-3-git-send-email-pali.rohar@gmail.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1432762105-13723-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:35273 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753454AbbE0V3C (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 May 2015 17:29:02 -0400
In-Reply-To: <1432762105-13723-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis.Kletnieks@vt.edu, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@linux.intel.com>

This patch exports notifier functions so other modules can receive HW
switch events. By default when some module register notifier, dell-rbtn
driver automatically remove rfkill interfaces from system (it is expect=
ed
that other module will use events for other rfkill interface). This
behaviour can be changed with new module parameter "auto_remove_rfkill"=
=2E

This patch is designed for dell-laptop module for receiving those event=
s.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Tested-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>

Cleanup MODULE_PARM_DESC formatting and grammar.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
Changes for v4:
 - check for RBTN_SLIDER in rbtn_switch_dev()
 - remove #ifdef CONFIG_DELL_RBTN guards in dell-rbtn.h (not needed any=
more)
 - do not ignore error code in module_init() (now in module_acpi_driver=
())
---
 drivers/platform/x86/dell-rbtn.c |   93 ++++++++++++++++++++++++++++++=
+++++++-
 drivers/platform/x86/dell-rbtn.h |   24 ++++++++++
 2 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/dell-rbtn.h

diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/de=
ll-rbtn.c
index 1c19fff..cd410e3 100644
--- a/drivers/platform/x86/dell-rbtn.c
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -233,6 +233,86 @@ static struct acpi_driver rbtn_driver =3D {
=20
=20
 /*
+ * notifier export functions
+ */
+
+static bool auto_remove_rfkill =3D true;
+
+static ATOMIC_NOTIFIER_HEAD(rbtn_chain_head);
+
+static int rbtn_inc_count(struct device *dev, void *data)
+{
+	struct acpi_device *device =3D to_acpi_device(dev);
+	struct rbtn_data *rbtn_data =3D device->driver_data;
+	int *count =3D data;
+
+	if (rbtn_data->type =3D=3D RBTN_SLIDER)
+		(*count)++;
+
+	return 0;
+}
+
+static int rbtn_switch_dev(struct device *dev, void *data)
+{
+	struct acpi_device *device =3D to_acpi_device(dev);
+	struct rbtn_data *rbtn_data =3D device->driver_data;
+	bool enable =3D data;
+
+	if (rbtn_data->type !=3D RBTN_SLIDER)
+		return 0;
+
+	if (enable)
+		rbtn_rfkill_init(device);
+	else
+		rbtn_rfkill_exit(device);
+
+	return 0;
+}
+
+int dell_rbtn_notifier_register(struct notifier_block *nb)
+{
+	bool first;
+	int count;
+	int ret;
+
+	count =3D 0;
+	ret =3D driver_for_each_device(&rbtn_driver.drv, NULL, &count,
+				     rbtn_inc_count);
+	if (ret || count =3D=3D 0)
+		return -ENODEV;
+
+	first =3D !rbtn_chain_head.head;
+
+	ret =3D atomic_notifier_chain_register(&rbtn_chain_head, nb);
+	if (ret !=3D 0)
+		return ret;
+
+	if (auto_remove_rfkill && first)
+		ret =3D driver_for_each_device(&rbtn_driver.drv, NULL,
+					     (void *)false, rbtn_switch_dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dell_rbtn_notifier_register);
+
+int dell_rbtn_notifier_unregister(struct notifier_block *nb)
+{
+	int ret;
+
+	ret =3D atomic_notifier_chain_unregister(&rbtn_chain_head, nb);
+	if (ret !=3D 0)
+		return ret;
+
+	if (auto_remove_rfkill && !rbtn_chain_head.head)
+		ret =3D driver_for_each_device(&rbtn_driver.drv, NULL,
+					     (void *)true, rbtn_switch_dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dell_rbtn_notifier_unregister);
+
+
+/*
  * acpi driver functions
  */
=20
@@ -266,7 +346,10 @@ static int rbtn_add(struct acpi_device *device)
 		ret =3D rbtn_input_init(rbtn_data);
 		break;
 	case RBTN_SLIDER:
-		ret =3D rbtn_rfkill_init(device);
+		if (auto_remove_rfkill && rbtn_chain_head.head)
+			ret =3D 0;
+		else
+			ret =3D rbtn_rfkill_init(device);
 		break;
 	default:
 		ret =3D -EINVAL;
@@ -313,6 +396,7 @@ static void rbtn_notify(struct acpi_device *device,=
 u32 event)
 		break;
 	case RBTN_SLIDER:
 		rbtn_rfkill_event(device);
+		atomic_notifier_call_chain(&rbtn_chain_head, event, device);
 		break;
 	default:
 		break;
@@ -326,6 +410,13 @@ static void rbtn_notify(struct acpi_device *device=
, u32 event)
=20
 module_acpi_driver(rbtn_driver);
=20
+module_param(auto_remove_rfkill, bool, 0444);
+
+MODULE_PARM_DESC(auto_remove_rfkill, "Automatically remove rfkill devi=
ces when "
+				     "other modules start receiving events "
+				     "from this module and re-add them when "
+				     "the last module stops receiving events "
+				     "(default true)");
 MODULE_DEVICE_TABLE(acpi, rbtn_ids);
 MODULE_DESCRIPTION("Dell Airplane Mode Switch driver");
 MODULE_AUTHOR("Pali Roh=C3=A1r <pali.rohar@gmail.com>");
diff --git a/drivers/platform/x86/dell-rbtn.h b/drivers/platform/x86/de=
ll-rbtn.h
new file mode 100644
index 0000000..c59cc6b
--- /dev/null
+++ b/drivers/platform/x86/dell-rbtn.h
@@ -0,0 +1,24 @@
+/*
+    Dell Airplane Mode Switch driver
+    Copyright (C) 2014-2015  Pali Roh=C3=A1r <pali.rohar@gmail.com>
+
+    This program is free software; you can redistribute it and/or modi=
fy
+    it under the terms of the GNU General Public License as published =
by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+*/
+
+#ifndef _DELL_RBTN_H_
+#define _DELL_RBTN_H_
+
+struct notifier_block;
+
+int dell_rbtn_notifier_register(struct notifier_block *nb);
+int dell_rbtn_notifier_unregister(struct notifier_block *nb);
+
+#endif
--=20
1.7.9.5
