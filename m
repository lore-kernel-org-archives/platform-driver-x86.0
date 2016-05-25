From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@intel.com>
Subject: [PATCH] intel_menlow: prevent NULL pointer dereference
Date: Wed, 25 May 2016 16:20:11 +0200
Message-ID: <1464186011-732-1-git-send-email-vincent.stehle@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@intel.com>, Sujith Thomas <sujith.thomas@intel.com>, Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>, Len Brown <len.brown@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

The function acpi_driver_data() will dereference its parameter; make su=
re
to check for NULL pointer before we call it.

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@intel.com>
Cc: Sujith Thomas <sujith.thomas@intel.com>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: Len Brown <len.brown@intel.com>
---
 drivers/platform/x86/intel_menlow.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_menlow.c b/drivers/platform/x86=
/intel_menlow.c
index 0a919d8..185a1bd 100644
--- a/drivers/platform/x86/intel_menlow.c
+++ b/drivers/platform/x86/intel_menlow.c
@@ -196,9 +196,13 @@ static int intel_menlow_memory_add(struct acpi_dev=
ice *device)
=20
 static int intel_menlow_memory_remove(struct acpi_device *device)
 {
-	struct thermal_cooling_device *cdev =3D acpi_driver_data(device);
+	struct thermal_cooling_device *cdev;
+
+	if (!device)
+		return -EINVAL;
=20
-	if (!device || !cdev)
+	cdev =3D acpi_driver_data(device);
+	if (!cdev)
 		return -EINVAL;
=20
 	sysfs_remove_link(&device->dev.kobj, "thermal_cooling");
--=20
2.8.1
