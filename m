From: Leonid Maksymchuk <leonmaxx@gmail.com>
Subject: [PATCH v5 2/2] platform/x86 asus_wmi: Set throttle thermal policy to default
Date: Sun, 24 Nov 2019 16:08:41 +0200
Message-ID: <20191124140841.20929-1-leonmaxx@gmail.com>
References: <20191124140625.20736-1-leonmaxx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191124140625.20736-1-leonmaxx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, chiu@endlessm.com, kristian@klausen.dk, andy@infradead.org, dvhart@infradead.org, corentin.chary@gmail.com, Leonid Maksymchuk <leonmaxx@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

ASUS TUF FX705DY/FX505DY starts in silent mode and under heavy
CPU load it overheats and drops CPU frequency to 399MHz and stays
at it until reboot [1]. Set throttle thermal policy to default
to avoid overheating and throttlig.

[1] Link: https://bugzilla.kernel.org/show_bug.cgi?id=203733

Signed-off-by: Leonid Maksymchuk <leonmaxx@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 88faea6..fe571d1 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1782,6 +1782,15 @@ static int throttle_thermal_policy_write(struct asus_wmi *asus)
 	return 0;
 }
 
+static int throttle_thermal_policy_set_default(struct asus_wmi *asus)
+{
+	if (!asus->throttle_thermal_policy_available)
+		return 0;
+
+	asus->throttle_thermal_policy_mode = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
+	return throttle_thermal_policy_write(asus);
+}
+
 static int throttle_thermal_policy_switch_next(struct asus_wmi *asus)
 {
 	u8 new_mode = asus->throttle_thermal_policy_mode + 1;
@@ -2552,6 +2561,8 @@ static int asus_wmi_add(struct platform_device *pdev)
 	err = throttle_thermal_policy_check_present(asus);
 	if (err)
 		goto fail_throttle_thermal_policy;
+	else
+		throttle_thermal_policy_set_default(asus);
 
 	err = asus_wmi_sysfs_init(asus->platform_device);
 	if (err)
-- 
1.8.3.1
