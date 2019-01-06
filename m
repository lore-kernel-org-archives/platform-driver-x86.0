From: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?=
        <jerome.debretagne@gmail.com>
Subject: [PATCH] platform/x86: intel-hid: Missing power button release on some Dell models
Date: Sun,  6 Jan 2019 18:56:44 +0100
Message-ID: <20190106175644.24872-1-jerome.debretagne@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Hung <alex.hung@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Chih-Wei Huang <cwhuang@android-x86.org>, Tristian Celestin <tristian.celestin@outlook.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Power button suspend for some Dell models was added in:

commit 821b85366284 (intel-hid: Power button suspend on Dell Latitude 7275)

by checking against the power button press notification (0xCE) to report
the power button press event. The corresponding power button release
notification (0xCF) was caught and ignored to stop it from being reported
as an "unknown event" in the logs.

The missing button release event is creating issues on Android-x86, as
reported on the project mailing list for a Dell Latitude 5175 model, since
the events are expected in down/up pairs.

Report the power button release event to fix this issue.

Link: https://groups.google.com/forum/#!topic/android-x86/aSwZK9Nf9Ro
Tested-by: Tristian Celestin <tristian.celestin@outlook.com>
Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 drivers/platform/x86/intel-hid.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index e28bcf61b126..bc0d55a59015 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -363,7 +363,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	 * the 5-button array, but still send notifies with power button
 	 * event code to this device object on power button actions.
 	 *
-	 * Report the power button press; catch and ignore the button release.
+	 * Report the power button press and release.
 	 */
 	if (!priv->array) {
 		if (event == 0xce) {
@@ -372,8 +372,11 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 			return;
 		}
 
-		if (event == 0xcf)
+		if (event == 0xcf) {
+			input_report_key(priv->input_dev, KEY_POWER, 0);
+			input_sync(priv->input_dev);
 			return;
+		}
 	}
 
 	/* 0xC0 is for HID events, other values are for 5 button array */
-- 
2.11.0
