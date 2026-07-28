Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C294377AAE;
	Tue, 28 Jul 2026 17:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785261433; cv=none; b=qBgDHZNwZ5VB7Z0P8Ecqe1ocOx3mRLdahdL+16tEtiDh9QBpcO6qhSFu7bjjoZwMWa81pXlYPDbvzRTzEqQl4VPfHnH6OArZUl2oilD0t+3S4PxaRojjfudoPkZoV80d43DHzGpmE1bCj8QZtZCLYwnXtCovE39obaaHodGHSgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785261433; c=relaxed/simple;
	bh=3rRa8QJ9Rx3jFilkl+iggy08LPLgSlMmEavY/YhbUrs=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=seIs+YYtqsNSiu1MxjQY6JGAWz6Yl9LnR3knlhTyu5YK1Xp7yGaRzjWnNT6AEV51dQ/uHfNd5ff0okhPGch0TNrIkhiPcrrhLUyUxOu0rGGttu33/JzPrs6tbM5ZnGjQRozw7BAekbCM9RkFuJohYm97kJcSU5w3pn2Gxh152hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=LXKvDSPo; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="LXKvDSPo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1785261425;
	bh=ND/fJ006unrxIWLaK6ZpfuaO0/ZUejBseMRa/lju8XQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LXKvDSPoVf70nbULhbCVAOAzrtnlXCrqTmQLHSbkKIrxyHHYqrEgjZyeNP025RbZI
	 CQoSnfPxz7fyt3fvF7/4+q94ORn6HZ0Cl50oa2qBFboKdYPXrYaWpY5BDBn7fdKAQU
	 /XLaSKAFn3cXBAQNlHIheQS4tSmyG9fta+A8ztp4=
Received: from max-laptop-cachy ([240e:3a1:20e0:1ea0:2fa7:34d4:60dc:c367])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id D6A85AE0; Wed, 29 Jul 2026 01:53:42 +0800
X-QQ-mid: xmsmtpt1785261227tcy3rnblh
Message-ID: <tencent_BE5743F3E30105C8FCA0BA17BAFBE9E27609@qq.com>
X-QQ-XMAILINFO: MGJQUKeBeYZpZnlK4F5vIT7ozMhuead0rArSP2gjTNAhuC2aIwpsS0NVj0YVxR
	 kGc0ya08fG6lZZqoGx+kpG8LfwuhApqMz9/hGqRTKgNAj8cZ0JqJfyNmpll87yNbvQCSpP1Zhcnp
	 aefFhIAaLojZT1jNIuRj3hFWHdq1wQ/XqdM6w7HmjH96lbmhUIleldAsNn+Ru/GNT1/2DUq5P1on
	 kUvyJnjjwRXvizST2dGsOEHht+PvgzD+II7w6fEbeLS32nbgKNmJzH4ehPWrFPypPysoDT8GknnV
	 SgQLTk9zMnDRrdlkb2+2GcHD0zsLeLlcUwnky7FqDpmh7NRWcFqSNWhRhneIheHusv8n0Xbimqev
	 YBnBMwaHxPWJz24TbLo15brBxm41v0SiX2lSblo7kF2Lq9zCeson10nlKXy6arKZig8NWmyfAL4f
	 8LVVs1HeLSjZWgfDo/5y7NmSWO1h8ShlSUAoYaDZcOFKcXwx7CMMCzcOfTt+Kj1MsMCO+p3qNB5j
	 sSfYXA9olU7tN1No9JGfqJxryQ81/FLgqjQISvMbHmBiAw1YOMzyrHDAMp82Ly8xPSJRh3ZU7zYD
	 4FieOBYm7cF5f2AjrDrsQLlgPCGCGRMwpuvqY0z5itdFtfHrdzbvQSO+SAoUmSqF3SJR7uYrF5wY
	 E1C4PbnFClYhtDoHXdMKByQTOe3K6KKWNpbtalgOooBX2DR/LupA9DOOHwE93sQ0vz9p2vUeDEal
	 nLuB4TsyINPkNcH+OQvSj7SmfRT4ULbw7B+XDw83HZDyZWcnjg9A/PITQHiHX0O7LLKlojF4vSm7
	 fQJlf+9vl1rQD/aWLh00geNQlBus1s9YbIqFWwmkEQh3NCzz8AlOh6M1Z+8O22NkDmlcfo/uu5bo
	 FN4+WrDq8oizhRvct260On9IUIjK+ef+7NJXBq+yBoIHVC8JpG55j8fE/gxMugCn+NED5qzoqMPt
	 8VJpllhhVz4eAasyYFgXKvn+pvqu0Jh9NKMZyna7dDmstw2jI2NUFlDJle+Baff+0tsj1cOp0kUg
	 YoPEBFLKpfq3ZDEF+tpAKq1HyjHb8g2Q8m339d+Y/TdHPUbXRfxQBWv7LYFpA=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: wolf109909 <wolf109909@foxmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nabil Danial <nabildanial.93@gmail.com>,
	Yuming Sun <wolf109909@foxmail.com>
Subject: [PATCH 4/5] platform/x86: bitland-mifs-wmi: drive lid switch via EC poll on Xiaomi Book Pro 14
Date: Wed, 29 Jul 2026 01:53:40 +0800
X-OQ-MSGID: <20260728175341.45927-5-wolf109909@foxmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728175341.45927-1-wolf109909@foxmail.com>
References: <20260728175341.45927-1-wolf109909@foxmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuming Sun <wolf109909@foxmail.com>

The Xiaomi Book Pro 14 (2026, Panther Lake) ships with broken
firmware: ECON, referenced by \_SB.PC00.LPCB.Q_EC._STA, is not defined
in any of the 34 SSDTs the firmware loads (boot log: "Could not
resolve symbol [\_SB.PC00.LPCB.Q_EC._STA.ECON], AE_NOT_FOUND"). The
ACPI EC driver therefore never binds and none of the EC query handlers
execute - including _Q0C/_Q0D which notify the PNP0C0D lid device. As
a result closing the lid generates no SW_LID event: the screen stays
on and keys depressed by the closed lid keep typing into the visible
lock screen, locking the user account after repeated failed logins.

The EC itself is alive and its shared-memory window at 0xFE0B0300
(DSDT region "ERAM") tracks the lid state bit LSTE (offset 0x14, bit
0). Poll it from a delayed-work item and, on a change, evaluate the
very AML methods the EC query would have run (_Q0C/_Q0D), which update
the GFX CLID field and notify LID0 so the button driver emits SW_LID.

Gate the quirk on both the MIFS v2 firmware variant and DMI matching
so no other machine gets polled. Verified on the affected machine: lid
close/open now produce proper switch events handled by systemd-logind
(Lid closed -> suspend -> Lid opened -> resume).

Signed-off-by: Yuming Sun <wolf109909@foxmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 94 ++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 5f7c85a8..550ee981 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -14,6 +14,7 @@
 #include <linux/dev_printk.h>
 #include <linux/device.h>
 #include <linux/device/devres.h>
+#include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/init.h>
@@ -34,6 +35,7 @@
 #include <linux/unaligned.h>
 #include <linux/units.h>
 #include <linux/wmi.h>
+#include <linux/workqueue.h>
 
 #define DRV_NAME		"bitland-mifs-wmi"
 #define BITLAND_MIFS_GUID	"B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
@@ -161,6 +163,11 @@ struct bitland_mifs_output {
 #define MIFS_V2_EC_MEM_SIZE	0x100
 #define MIFS_V2_EC_REG_FAN1	0x69
 #define MIFS_V2_EC_REG_FAN2	0x6B
+#define MIFS_V2_EC_REG_LID	0x14	/* bit 0: LSTE, 1 = lid open */
+#define MIFS_V2_EC_LID_OPEN	BIT(0)
+
+/* Interval for the lid-state poll; see bitland_mifs_lid_poll() */
+#define MIFS_V2_LID_POLL_MS	250
 
 static u16 mifs_status(const struct bitland_mifs_output *out)
 {
@@ -200,6 +207,9 @@ struct bitland_mifs_wmi_data {
 	bool profile_valid;
 	bool is_v2;	/* MIFS v2 firmware: QFAN perf-mode codes */
 	u8 __iomem *ec_mem;	/* v2 EC shared-memory window */
+	struct delayed_work lid_work;
+	u8 last_lid;
+	bool lid_quirk;
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
@@ -390,6 +400,9 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 	if (!data->pp_dev)
 		return 0;
 
+	if (data->lid_quirk)
+		cancel_delayed_work_sync(&data->lid_work);
+
 	/*
 	 * Never abort suspend: some firmware revisions answer the perf-mode
 	 * query with values this driver cannot map, or fail the call
@@ -410,6 +423,11 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 	if (!data->pp_dev)
 		return 0;
 
+	if (data->lid_quirk) {
+		data->last_lid = 0xff;
+		schedule_delayed_work(&data->lid_work, 0);
+	}
+
 	if (!data->profile_valid)
 		return 0;
 
@@ -549,6 +567,57 @@ static const struct hwmon_chip_info laptop_chip_info = {
 	.info = laptop_hwmon_info,
 };
 
+/*
+ * Lid switch quirk (Xiaomi Book Pro 14 2026):
+ *
+ * The firmware of this machine never defines ECON, which is referenced
+ * by \_SB.PC00.LPCB.Q_EC._STA, so the ACPI EC driver never binds and
+ * none of the EC query handlers run. This kills the lid events
+ * (_Q0C/_Q0D) as well as every other EC-driven event. Poll the lid
+ * state bit (LSTE) in the EC shared-memory window and, on a change,
+ * evaluate the very AML methods the EC query would have run: they
+ * update the GFX CLID field and notify the PNP0C0D lid device, which
+ * makes the button driver emit the SW_LID event.
+ */
+#define MIFS_LID_CLOSE_METHOD	"\\_SB.PC00.LPCB.Q_EC._Q0C"
+#define MIFS_LID_OPEN_METHOD	"\\_SB.PC00.LPCB.Q_EC._Q0D"
+
+static void bitland_mifs_lid_poll(struct work_struct *work)
+{
+	struct bitland_mifs_wmi_data *data =
+		container_of(to_delayed_work(work), struct bitland_mifs_wmi_data,
+			     lid_work);
+	u8 lid;
+
+	lid = readb(data->ec_mem + MIFS_V2_EC_REG_LID) & MIFS_V2_EC_LID_OPEN;
+	if (lid != data->last_lid && data->last_lid != 0xff) {
+		acpi_status status;
+		acpi_string method = (acpi_string)(lid ? MIFS_LID_OPEN_METHOD :
+						    MIFS_LID_CLOSE_METHOD);
+
+		status = acpi_evaluate_object(NULL, method, NULL, NULL);
+		if (ACPI_FAILURE(status))
+			dev_warn(&data->wdev->dev,
+				 "lid %s AML failed: %s\n",
+				 lid ? "open" : "close",
+				 acpi_format_exception(status));
+	}
+	data->last_lid = lid;
+
+	schedule_delayed_work(&data->lid_work,
+			      msecs_to_jiffies(MIFS_V2_LID_POLL_MS));
+}
+
+static const struct dmi_system_id bitland_mifs_lid_quirk_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Xiaomi Book Pro 14"),
+		},
+	},
+	{ }
+};
+
 static int laptop_kbd_led_set(struct led_classdev *led_cdev,
 			      enum led_brightness value)
 {
@@ -843,6 +912,9 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 			if (!drv_data->ec_mem)
 				dev_warn(&wdev->dev,
 					 "cannot map EC window, fan tach unavailable\n");
+
+			drv_data->lid_quirk = drv_data->ec_mem &&
+				dmi_check_system(bitland_mifs_lid_quirk_table);
 		}
 	}
 
@@ -897,9 +969,20 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 	if (ret)
 		return ret;
 
-	return devm_add_action_or_reset(&wdev->dev,
+	ret = devm_add_action_or_reset(&wdev->dev,
 				       bitland_notifier_unregister,
 				       &drv_data->notifier);
+	if (ret)
+		return ret;
+
+	if (drv_data->lid_quirk) {
+		INIT_DELAYED_WORK(&drv_data->lid_work, bitland_mifs_lid_poll);
+		drv_data->last_lid = 0xff;
+		schedule_delayed_work(&drv_data->lid_work,
+				      msecs_to_jiffies(MIFS_V2_LID_POLL_MS));
+	}
+
+	return 0;
 }
 
 static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
@@ -982,6 +1065,14 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 	}
 }
 
+static void bitland_mifs_wmi_remove(struct wmi_device *wdev)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
+
+	if (data->lid_quirk)
+		cancel_delayed_work_sync(&data->lid_work);
+}
+
 static const struct wmi_device_id bitland_mifs_wmi_id_table[] = {
 	{ BITLAND_MIFS_GUID, (void *)BITLAND_WMI_CONTROL },
 	{ BITLAND_EVENT_GUID, (void *)BITLAND_WMI_EVENT },
@@ -999,6 +1090,7 @@ static struct wmi_driver bitland_mifs_wmi_driver = {
 	.id_table = bitland_mifs_wmi_id_table,
 	.min_event_size = sizeof(struct bitland_mifs_event),
 	.probe = bitland_mifs_wmi_probe,
+	.remove = bitland_mifs_wmi_remove,
 	.notify_new = bitland_mifs_wmi_notify,
 };
 
-- 
2.55.0

