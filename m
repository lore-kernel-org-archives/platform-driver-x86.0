From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: [PATCH 2/2] hp-wmi: remove GPS rfkill support via pre-2009 interface
Date: Sun, 06 Mar 2016 23:40:19 +0100
Message-ID: <56DCB1D3.9070403@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, =?UTF-8?B?VHJlcMOhayBWaWxtb3M=?= <trepo@netcomga.sk>
List-Id: platform-driver-x86.vger.kernel.org

GPS rfkill support via pre-2009 WMI interface uses
hp_wmi_get_sw_state() and hp_wmi_get_hw_state()
to query its current hard and soft block state,
respectively.

In hp_wmi_get_sw_state() a mask is calculated which
bit should be checked in an int value returned by
firmware to get current block state:
0x200 << (r * 8) which with r being 3 for GPS
results in overflow and mask of zero.
The same goes for hp_wmi_get_hw_state().

This effectively means that GPS rfkill on this
WMI interface is considered always both hard and
soft blocked.

Unfortunately, later when rfkill subsystem calls
hp_wmi_set_block() to sync this block to hardware
firmware at least on my old nc6400 gets confused
and sets both hard and soft blocks on WiFi and BT.

This happens for example on hp-wmi module load.

Since due to overflow described above it is dubious that
this ever worked correctly and HP laptops with modems
having GPS support seem to all have been released well past
year 2009 let's just remove GPS rfkill support via
pre-2009 WMI interface.

Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---
 drivers/platform/x86/hp-wmi.c | 38 +-------------------------------------
 1 file changed, 1 insertion(+), 37 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 78cebc0e358c..6f145f2d004d 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -157,7 +157,6 @@ static struct platform_device *hp_wmi_platform_dev;
 static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
 static struct rfkill *wwan_rfkill;
-static struct rfkill *gps_rfkill;
 
 struct rfkill2_device {
 	u8 id;
@@ -613,10 +612,6 @@ static void hp_wmi_notify(u32 value, void *context)
 			rfkill_set_states(wwan_rfkill,
 					  hp_wmi_get_sw_state(HPWMI_WWAN),
 					  hp_wmi_get_hw_state(HPWMI_WWAN));
-		if (gps_rfkill)
-			rfkill_set_states(gps_rfkill,
-					  hp_wmi_get_sw_state(HPWMI_GPS),
-					  hp_wmi_get_hw_state(HPWMI_GPS));
 		break;
 	case HPWMI_CPU_BATTERY_THROTTLE:
 		pr_info("Unimplemented CPU throttle because of 3 Cell battery event detected\n");
@@ -775,30 +770,8 @@ static int __init hp_wmi_rfkill_setup(struct platform_device *device)
 			goto register_wwan_error;
 	}
 
-	if (wireless & 0x8) {
-		gps_rfkill = rfkill_alloc("hp-gps", &device->dev,
-						RFKILL_TYPE_GPS,
-						&hp_wmi_rfkill_ops,
-						(void *) HPWMI_GPS);
-		if (!gps_rfkill) {
-			err = -ENOMEM;
-			goto register_gps_error;
-		}
-		rfkill_init_sw_state(gps_rfkill,
-				     hp_wmi_get_sw_state(HPWMI_GPS));
-		rfkill_set_hw_state(gps_rfkill,
-				    hp_wmi_get_hw_state(HPWMI_GPS));
-		err = rfkill_register(gps_rfkill);
-		if (err)
-			goto register_gps_error;
-	}
-
 	return 0;
-register_gps_error:
-	rfkill_destroy(gps_rfkill);
-	gps_rfkill = NULL;
-	if (wwan_rfkill)
-		rfkill_unregister(wwan_rfkill);
+
 register_wwan_error:
 	rfkill_destroy(wwan_rfkill);
 	wwan_rfkill = NULL;
@@ -907,7 +880,6 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 	wifi_rfkill = NULL;
 	bluetooth_rfkill = NULL;
 	wwan_rfkill = NULL;
-	gps_rfkill = NULL;
 	rfkill2_count = 0;
 
 	if (hp_wmi_bios_2009_later() || hp_wmi_rfkill_setup(device))
@@ -960,10 +932,6 @@ static int __exit hp_wmi_bios_remove(struct platform_device *device)
 		rfkill_unregister(wwan_rfkill);
 		rfkill_destroy(wwan_rfkill);
 	}
-	if (gps_rfkill) {
-		rfkill_unregister(gps_rfkill);
-		rfkill_destroy(gps_rfkill);
-	}
 
 	return 0;
 }
@@ -999,10 +967,6 @@ static int hp_wmi_resume_handler(struct device *device)
 		rfkill_set_states(wwan_rfkill,
 				  hp_wmi_get_sw_state(HPWMI_WWAN),
 				  hp_wmi_get_hw_state(HPWMI_WWAN));
-	if (gps_rfkill)
-		rfkill_set_states(gps_rfkill,
-				  hp_wmi_get_sw_state(HPWMI_GPS),
-				  hp_wmi_get_hw_state(HPWMI_GPS));
 
 	return 0;
 }
