From: Leonid Maksymchuk <leonmaxx@gmail.com>
Subject: [RFC PATCH 3/3] platform/x86: asus_wmi: Set default fan boost mode to
 normal
Date: Mon, 4 Nov 2019 20:29:07 +0200
Message-ID: <a0494561-3e48-d777-f228-e6dbe580f48a@gmail.com>
References: <d3dbac09-3c93-c695-ae52-4b599a0a78c6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d3dbac09-3c93-c695-ae52-4b599a0a78c6@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, chiu@endlessm.com, yurii.pavlovskyi@gmail.com, kristian@klausen.dk, andy@infradead.org, dvhart@infradead.org, corentin.chary@gmail.com
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
  drivers/platform/x86/asus-wmi.c | 13 +++++++++++++
  1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index f4e5840..70c5fbb 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1674,6 +1674,18 @@ static int fan_boost_mode_write(struct asus_wmi *asus)
  	return 0;
  }
  
+static int fan_boost_mode_set_default(struct asus_wmi *asus)
+{
+	int result = 0;
+
+	if (asus->fan_boost_mode_available) {
+		asus->fan_boost_mode = ASUS_FAN_BOOST_MODE_NORMAL;
+		result = fan_boost_mode_write(asus);
+	}
+
+	return result;
+}
+
  static int fan_boost_mode_switch_next(struct asus_wmi *asus)
  {
  	u8 mask = asus->fan_boost_mode_mask;
@@ -2450,6 +2462,7 @@ static int asus_wmi_add(struct platform_device *pdev)
  	err = fan_boost_mode_check_present(asus);
  	if (err)
  		goto fail_fan_boost_mode;
+	fan_boost_mode_set_default(asus);
  
  	err = asus_wmi_sysfs_init(asus->platform_device);
  	if (err)
-- 
1.8.3.1
