From: Leonid Maksymchuk <leonmaxx@gmail.com>
Subject: [PATCH v3 3/3] asus_wmi: Set default fan boost mode to normal
Date: Fri,  8 Nov 2019 01:04:58 +0200
Message-ID: <20191107230458.30922-1-leonmaxx@gmail.com>
References: <20191107230105.30574-1-leonmaxx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191107230105.30574-1-leonmaxx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, chiu@endlessm.com, yurii.pavlovskyi@gmail.com, kristian@klausen.dk, andy@infradead.org, dvhart@infradead.org, corentin.chary@gmail.com, Leonid Maksymchuk <leonmaxx@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Set default fan boost mode to normal for multiple reasons:

1) existing code assumes that laptop started in normal mode and that is
   not always correct.
2) FX705DY/FX505DY starts in silent mode and under heavy CPU load it
   overheats and drops CPU frequency to 399MHz [1]. Setting fan mode to
   normal avoids overheating.

[1] Link: https://bugzilla.kernel.org/show_bug.cgi?id=203733

Signed-off-by: Leonid Maksymchuk <leonmaxx@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 311658807dfe..435e1420fb40 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1678,6 +1678,15 @@ static int fan_boost_mode_write(struct asus_wmi *asus)
 	return 0;
 }
 
+static int fan_boost_mode_set_default(struct asus_wmi *asus)
+{
+	if (!asus->fan_boost_mode_available)
+		return 0;
+
+	asus->fan_boost_mode = ASUS_FAN_BOOST_MODE_NORMAL;
+	return fan_boost_mode_write(asus);
+}
+
 static int fan_boost_mode_switch_next(struct asus_wmi *asus)
 {
 	u8 mask = asus->fan_boost_mode_mask;
@@ -2454,6 +2463,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 	err = fan_boost_mode_check_present(asus);
 	if (err)
 		goto fail_fan_boost_mode;
+	fan_boost_mode_set_default(asus);
 
 	err = asus_wmi_sysfs_init(asus->platform_device);
 	if (err)
-- 
2.23.0
