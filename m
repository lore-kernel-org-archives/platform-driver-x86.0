From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2] toshiba_acpi: Avoid registering input device on WMI event laptops
Date: Wed, 22 Jul 2015 18:09:12 -0600
Message-ID: <1437610153-26382-3-git-send-email-coproscefalo@gmail.com>
References: <1437610153-26382-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437610153-26382-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Commit f11f999e9890 ("toshiba_acpi: Refuse to load on machines with
buggy INFO implementations") denied loading on laptops with a WMI Event
GUID given that such laptops manage the hotkeys via that interface,
however, such laptops have a working Toshiba Configuration Interface
(TCI), and thus, such commit denied several supported features.

This patch avoids registering the input device and ignores all hotkey
events on laptops with such WMI Event GUID, making the supported
features found in those laptops to work.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
Changes since v1:
- Minor typographical corrections in patch description
- Avoid word contractions in kernel messages

 drivers/platform/x86/toshiba_acpi.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 15d8f0d..871b6d6 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2397,6 +2397,11 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 	u32 hci_result;
 	int error;
 
+	if (wmi_has_guid(TOSHIBA_WMI_EVENT_GUID)) {
+		pr_info("WMI event detected, hotkeys will not be monitored\n");
+		return 0;
+	}
+
 	error = toshiba_acpi_enable_hotkeys(dev);
 	if (error)
 		return error;
@@ -2730,6 +2735,14 @@ static void toshiba_acpi_notify(struct acpi_device *acpi_dev, u32 event)
 
 	switch (event) {
 	case 0x80: /* Hotkeys and some system events */
+		/*
+		 * Machines with this WMI GUID aren't supported due to bugs in
+		 * their AML.
+		 *
+		 * Return silently to avoid triggering a netlink event.
+		 */
+		if (wmi_has_guid(TOSHIBA_WMI_EVENT_GUID))
+			return;
 		toshiba_acpi_process_hotkeys(dev);
 		break;
 	case 0x81: /* Dock events */
@@ -2816,14 +2829,6 @@ static int __init toshiba_acpi_init(void)
 {
 	int ret;
 
-	/*
-	 * Machines with this WMI guid aren't supported due to bugs in
-	 * their AML. This check relies on wmi initializing before
-	 * toshiba_acpi to guarantee guids have been identified.
-	 */
-	if (wmi_has_guid(TOSHIBA_WMI_EVENT_GUID))
-		return -ENODEV;
-
 	toshiba_proc_dir = proc_mkdir(PROC_TOSHIBA, acpi_root_dir);
 	if (!toshiba_proc_dir) {
 		pr_err("Unable to create proc dir " PROC_TOSHIBA "\n");
-- 
2.4.5
