From: Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH] thinkpad_acpi: Always report scancodes for hotkeys
Date: Fri, 14 Jan 2011 15:54:39 -0600
Message-ID: <1295042079-4832-1-git-send-email-seth.forshee@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:39540 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752145Ab1ANVyv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 14 Jan 2011 16:54:51 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: Matthew Garrett <mjg@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Some thinkpad hotkeys report key codes like KEY_FN_F8 when something
like KEY_VOLUMEDOWN is desired. Always provide the scan codes in
addition to the key codes to assist with debugging these issues. Also
send the scan code before the key code to match what other drivers do,
as some userspace utilities expect this ordering.

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 drivers/platform/x86/thinkpad_acpi.c |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index dd59958..eb99223 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2275,16 +2275,12 @@ static void tpacpi_input_send_key(const unsigned int scancode)
 	if (keycode != KEY_RESERVED) {
 		mutex_lock(&tpacpi_inputdev_send_mutex);
 
+		input_event(tpacpi_inputdev, EV_MSC, MSC_SCAN, scancode);
 		input_report_key(tpacpi_inputdev, keycode, 1);
-		if (keycode == KEY_UNKNOWN)
-			input_event(tpacpi_inputdev, EV_MSC, MSC_SCAN,
-				    scancode);
 		input_sync(tpacpi_inputdev);
 
+		input_event(tpacpi_inputdev, EV_MSC, MSC_SCAN, scancode);
 		input_report_key(tpacpi_inputdev, keycode, 0);
-		if (keycode == KEY_UNKNOWN)
-			input_event(tpacpi_inputdev, EV_MSC, MSC_SCAN,
-				    scancode);
 		input_sync(tpacpi_inputdev);
 
 		mutex_unlock(&tpacpi_inputdev_send_mutex);
-- 
1.7.1
