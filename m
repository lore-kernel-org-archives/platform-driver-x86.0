From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 3/3] platform/x86: asus-wmi: Ignore WMI events with code 0x79
Date: Sun, 10 May 2020 14:24:32 +0200
Message-ID: <20200510122432.123751-3-hdegoede@redhat.com>
References: <20200510122432.123751-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200510122432.123751-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On some Asus devices, e.g. the T100TA, when the charger is connected
we not only get a WMI event with code 0x58, but immediately after that
event we also get an even with code 0x79.

This is likely related to these devices having an Asus WMI device with a
device-id of 0x00120066, which seems to provide some sort of charger-type
info. The T100TA charger over a micro-USB connector, the embedded-
controller register read when calling asus_wmi_get_devstate(0x00120066)
returns different values when connected to a USB port (max 500mA charging)
vs when connected to a 2A capable wall-charger. But the AML code reading
this mangles the return value so that we can no longer tell the difference.
So for now the meaning of the value return when getting the status of
device-id 0x00120066 is unclear.

This commit adds a key-mapping of code 0x79 to KE_IGNORE, silencing the
kernel logging the following message every time the charger is plugged-in:

[   79.639548] asus_wmi: Unknown key 79 pressed

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 6f12747a359a..b2887556fd4d 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -472,6 +472,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
 	{ KE_IGNORE, 0x6E, },  /* Low Battery notification */
 	{ KE_KEY, 0x71, { KEY_F13 } }, /* General-purpose button */
+	{ KE_IGNORE, 0x79, },  /* Charger type dectection notification */
 	{ KE_KEY, 0x7a, { KEY_ALS_TOGGLE } }, /* Ambient Light Sensor Toggle */
 	{ KE_KEY, 0x7c, { KEY_MICMUTE } },
 	{ KE_KEY, 0x7D, { KEY_BLUETOOTH } }, /* Bluetooth Enable */
-- 
2.26.0
