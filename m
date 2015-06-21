From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 1/4] dell-laptop: Update information about wireless control
Date: Sun, 21 Jun 2015 10:39:26 +0200
Message-ID: <1434875967-13370-2-git-send-email-pali.rohar@gmail.com>
References: <1434875967-13370-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434875967-13370-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Make sure that all existing SMBIOS calls for wireless control are prope=
rly
documented. This commit also add new documentation released by Dell.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
 drivers/platform/x86/dell-laptop.c |  158 +++++++++++++++++++++++++++-=
--------
 1 file changed, 119 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index 83e3d7f..ab89103 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -423,45 +423,125 @@ static inline int dell_smi_error(int value)
 	}
 }
=20
-/* Derived from information in DellWirelessCtl.cpp:
-   Class 17, select 11 is radio control. It returns an array of 32-bit=
 values.
-
-   Input byte 0 =3D 0: Wireless information
-
-   result[0]: return code
-   result[1]:
-     Bit 0:      Hardware switch supported
-     Bit 1:      Wifi locator supported
-     Bit 2:      Wifi is supported
-     Bit 3:      Bluetooth is supported
-     Bit 4:      WWAN is supported
-     Bit 5:      Wireless keyboard supported
-     Bits 6-7:   Reserved
-     Bit 8:      Wifi is installed
-     Bit 9:      Bluetooth is installed
-     Bit 10:     WWAN is installed
-     Bits 11-15: Reserved
-     Bit 16:     Hardware switch is on
-     Bit 17:     Wifi is blocked
-     Bit 18:     Bluetooth is blocked
-     Bit 19:     WWAN is blocked
-     Bits 20-31: Reserved
-   result[2]: NVRAM size in bytes
-   result[3]: NVRAM format version number
-
-   Input byte 0 =3D 2: Wireless switch configuration
-   result[0]: return code
-   result[1]:
-     Bit 0:      Wifi controlled by switch
-     Bit 1:      Bluetooth controlled by switch
-     Bit 2:      WWAN controlled by switch
-     Bits 3-6:   Reserved
-     Bit 7:      Wireless switch config locked
-     Bit 8:      Wifi locator enabled
-     Bits 9-14:  Reserved
-     Bit 15:     Wifi locator setting locked
-     Bits 16-31: Reserved
-*/
+/*
+ * Derived from information in smbios-wireless-ctl:
+ *
+ * cbSelect 17, Value 11
+ *
+ * Return Wireless Info
+ * cbArg1, byte0 =3D 0x00
+ *
+ *     cbRes1 Standard return codes (0, -1, -2)
+ *     cbRes2 Info bit flags:
+ *
+ *     0 Hardware switch supported (1)
+ *     1 WiFi locator supported (1)
+ *     2 WLAN supported (1)
+ *     3 Bluetooth (BT) supported (1)
+ *     4 WWAN supported (1)
+ *     5 Wireless KBD supported (1)
+ *     6 Uw b supported (1)
+ *     7 WiGig supported (1)
+ *     8 WLAN installed (1)
+ *     9 BT installed (1)
+ *     10 WWAN installed (1)
+ *     11 Uw b installed (1)
+ *     12 WiGig installed (1)
+ *     13-15 Reserved (0)
+ *     16 Hardware (HW) switch is On (1)
+ *     17 WLAN disabled (1)
+ *     18 BT disabled (1)
+ *     19 WWAN disabled (1)
+ *     20 Uw b disabled (1)
+ *     21 WiGig disabled (1)
+ *     20-31 Reserved (0)
+ *
+ *     cbRes3 NVRAM size in bytes
+ *     cbRes4, byte 0 NVRAM format version number
+ *
+ *
+ * Set QuickSet Radio Disable Flag
+ *     cbArg1, byte0 =3D 0x01
+ *     cbArg1, byte1
+ *     Radio ID     value:
+ *     0        Radio Status
+ *     1        WLAN ID
+ *     2        BT ID
+ *     3        WWAN ID
+ *     4        UWB ID
+ *     5        WIGIG ID
+ *     cbArg1, byte2    Flag bits:
+ *             0 QuickSet disables radio (1)
+ *             1-7 Reserved (0)
+ *
+ *     cbRes1    Standard return codes (0, -1, -2)
+ *     cbRes2    QuickSet (QS) radio disable bit map:
+ *     0 QS disables WLAN
+ *     1 QS disables BT
+ *     2 QS disables WWAN
+ *     3 QS disables UWB
+ *     4 QS disables WIGIG
+ *     5-31 Reserved (0)
+ *
+ * Wireless Switch Configuration
+ *     cbArg1, byte0 =3D 0x02
+ *
+ *     cbArg1, byte1
+ *     Subcommand:
+ *     0 Get config
+ *     1 Set config
+ *     2 Set WiFi locator enable/disable
+ *     cbArg1,byte2
+ *     Switch settings (if byte 1=3D=3D1):
+ *     0 WLAN sw itch control (1)
+ *     1 BT sw itch control (1)
+ *     2 WWAN sw itch control (1)
+ *     3 UWB sw itch control (1)
+ *     4 WiGig sw itch control (1)
+ *     5-7 Reserved (0)
+ *    cbArg1, byte2 Enable bits (if byte 1=3D=3D2):
+ *     0 Enable WiFi locator (1)
+ *
+ *    cbRes1     Standard return codes (0, -1, -2)
+ *    cbRes2 QuickSet radio disable bit map:
+ *     0 WLAN controlled by sw itch (1)
+ *     1 BT controlled by sw itch (1)
+ *     2 WWAN controlled by sw itch (1)
+ *     3 UWB controlled by sw itch (1)
+ *     4 WiGig controlled by sw itch (1)
+ *     5-6 Reserved (0)
+ *     7 Wireless sw itch config locked (1)
+ *     8 WiFi locator enabled (1)
+ *     9-14 Reserved (0)
+ *     15 WiFi locator setting locked (1)
+ *     16-31 Reserved (0)
+ *
+ * Read Local Config Data (LCD)
+ *     cbArg1, byte0 =3D 0x10
+ *     cbArg1, byte1 NVRAM index low byte
+ *     cbArg1, byte2 NVRAM index high byte
+ *     cbRes1 Standard return codes (0, -1, -2)
+ *     cbRes2 4 bytes read from LCD[index]
+ *     cbRes3 4 bytes read from LCD[index+4]
+ *     cbRes4 4 bytes read from LCD[index+8]
+ *
+ * Write Local Config Data (LCD)
+ *     cbArg1, byte0 =3D 0x11
+ *     cbArg1, byte1 NVRAM index low byte
+ *     cbArg1, byte2 NVRAM index high byte
+ *     cbArg2 4 bytes to w rite at LCD[index]
+ *     cbArg3 4 bytes to w rite at LCD[index+4]
+ *     cbArg4 4 bytes to w rite at LCD[index+8]
+ *     cbRes1 Standard return codes (0, -1, -2)
+ *
+ * Populate Local Config Data from NVRAM
+ *     cbArg1, byte0 =3D 0x12
+ *     cbRes1 Standard return codes (0, -1, -2)
+ *
+ * Commit Local Config Data to NVRAM
+ *     cbArg1, byte0 =3D 0x13
+ *     cbRes1 Standard return codes (0, -1, -2)
+ */
=20
 static int dell_rfkill_set(void *data, bool blocked)
 {
--=20
1.7.9.5
