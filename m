From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add min-x and min-y settings for various models
Date: Sat, 20 Oct 2018 12:21:00 +0200
Message-ID: <20181020102100.14111-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add min-x and min-y settings now that we've support for this and for some
models also update the width/height settings with slighly more accurate
values.

This fixes touches along the edges registering at the wrong coordinates.

While at it also set max-fingers to 10 in a couple of cases where the
touchpad can handle 10 fingers (rather then the default 5) and that was
missing.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 33 +++++++++++++++++++-------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index f852009e0e30..3a65a37f8ac8 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -51,10 +51,13 @@ static const struct ts_dmi_data chuwi_hi8_data = {
 };
 
 static const struct property_entry chuwi_hi8_pro_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 6),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 3),
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1728),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1148),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-chuwi-hi8-pro.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	PROPERTY_ENTRY_BOOL("efi-embedded-firmware"),
 	{ }
@@ -75,6 +78,8 @@ static const struct ts_dmi_data chuwi_hi8_pro_data = {
 };
 
 static const struct property_entry chuwi_vi8_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 6),
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1724),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
@@ -121,9 +126,9 @@ static const struct ts_dmi_data chuwi_vi10_data = {
 
 static const struct property_entry connect_tablet9_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 9),
-	PROPERTY_ENTRY_U32("touchscreen-min-y", 8),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 10),
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1664),
-	PROPERTY_ENTRY_U32("touchscreen-size-y", 878),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 880),
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-connect-tablet9.fw"),
@@ -137,8 +142,10 @@ static const struct ts_dmi_data connect_tablet9_data = {
 };
 
 static const struct property_entry cube_iwork8_air_props[] = {
-	PROPERTY_ENTRY_U32("touchscreen-size-x", 1660),
-	PROPERTY_ENTRY_U32("touchscreen-size-y", 900),
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 1),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 3),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1664),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 896),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3670-cube-iwork8-air.fw"),
 	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
@@ -222,11 +229,14 @@ static const struct ts_dmi_data gp_electronic_t701_data = {
 };
 
 static const struct property_entry itworks_tw891_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 1),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 5),
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1600),
-	PROPERTY_ENTRY_U32("touchscreen-size-y", 890),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 896),
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3670-itworks-tw891.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	{ }
 };
 
@@ -250,8 +260,10 @@ static const struct ts_dmi_data jumper_ezpad_6_pro_data = {
 };
 
 static const struct property_entry jumper_ezpad_mini3_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 23),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 16),
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1700),
-	PROPERTY_ENTRY_U32("touchscreen-size-y", 1150),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1138),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3676-jumper-ezpad-mini3.fw"),
 	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
@@ -403,11 +415,14 @@ static const struct ts_dmi_data pov_mobii_wintab_p800w_v20_data = {
 };
 
 static const struct property_entry pov_mobii_wintab_p800w_v21_props[] = {
-	PROPERTY_ENTRY_U32("touchscreen-size-x", 1800),
-	PROPERTY_ENTRY_U32("touchscreen-size-y", 1150),
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 1),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 8),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1794),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1148),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name",
 			      "gsl3692-pov-mobii-wintab-p800w.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -494,6 +509,8 @@ static const struct ts_dmi_data trekstor_surftab_twin_10_1_data = {
 };
 
 static const struct property_entry trekstor_surftab_wintron70_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 12),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 8),
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 884),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 632),
 	PROPERTY_ENTRY_STRING("firmware-name",
-- 
2.19.0
