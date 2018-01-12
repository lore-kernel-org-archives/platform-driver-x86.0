From: David Herrmann <dh.herrmann@gmail.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: suppress warning about palm detection
Date: Fri, 12 Jan 2018 12:04:45 +0100
Message-ID: <20180112110445.1876-1-dh.herrmann@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Platform Driver <platform-driver-x86@vger.kernel.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org, David Herrmann <dh.herrmann@gmail.com>, Matthew Thode <mthode@mthode.org>
List-Id: platform-driver-x86.vger.kernel.org

This patch prevents the thinkpad_acpi driver from warning about 2 event
codes returned for keyboard palm-detection. No behavioral changes,
other than suppressing the warning in the kernel log. The events are
still forwarded via acpi-netlink channels.

We could, optionally, decide to forward the event through a
input-switch on the tpacpi input device. However, so far no suitable
input-code exists, and no similar drivers report such events. Hence,
leave it an acpi event for now.

Note that the event-codes are named based on empirical studies. On the
ThinkPad X1 5th Gen the sensor can be found underneath the arrow key.

Cc: Matthew Thode <mthode@mthode.org>
Signed-off-by: David Herrmann <dh.herrmann@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 117be48ff4de..128f91af716e 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -214,6 +214,10 @@ enum tpacpi_hkey_event_t {
 	/* AC-related events */
 	TP_HKEY_EV_AC_CHANGED		= 0x6040, /* AC status changed */
 
+	/* Further user-interface events */
+	TP_HKEY_EV_PALM_DETECTED	= 0x60b0, /* palm hoveres keyboard */
+	TP_HKEY_EV_PALM_UNDETECTED	= 0x60b1, /* palm removed */
+
 	/* Misc */
 	TP_HKEY_EV_RFKILL_CHANGED	= 0x7000, /* rfkill switch changed */
 };
@@ -4079,6 +4083,12 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 		*send_acpi_ev = false;
 		break;
 
+	case TP_HKEY_EV_PALM_DETECTED:
+	case TP_HKEY_EV_PALM_UNDETECTED:
+		/* palm detected hovering the keyboard, forward to user-space
+		 * via netlink for consumption */
+		return true;
+
 	default:
 		pr_warn("unknown possible thermal alarm or keyboard event received\n");
 		known = false;
-- 
2.15.1
