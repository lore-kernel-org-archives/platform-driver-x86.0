From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 1/4] platform/x86: silead_dmi: Rename trekstor entries
Date: Fri,  8 Jun 2018 23:45:55 +0200
Message-ID: <20180608214558.30717-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Prefix the entries for trekstor tablets with trekstor_ and drop the
detailed model version (still available as comment in the dmi table)
to keep things within 80 chars.

This is a preparation patch for sorting all the entries alphabetically.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/silead_dmi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index 853a7ce4601c..1f0246e69967 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -81,7 +81,7 @@ static const struct silead_ts_dmi_data dexp_ursus_7w_data = {
 	.properties	= dexp_ursus_7w_props,
 };
 
-static const struct property_entry surftab_twin_10_1_st10432_8_props[] = {
+static const struct property_entry trekstor_surftab_twin_10_1_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1900),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
 	PROPERTY_ENTRY_U32("touchscreen-inverted-y", 1),
@@ -91,12 +91,12 @@ static const struct property_entry surftab_twin_10_1_st10432_8_props[] = {
 	{ }
 };
 
-static const struct silead_ts_dmi_data surftab_twin_10_1_st10432_8_data = {
+static const struct silead_ts_dmi_data trekstor_surftab_twin_10_1_data = {
 	.acpi_name	= "MSSL1680:00",
-	.properties	= surftab_twin_10_1_st10432_8_props,
+	.properties	= trekstor_surftab_twin_10_1_props,
 };
 
-static const struct property_entry surftab_wintron70_st70416_6_props[] = {
+static const struct property_entry trekstor_surftab_wintron70_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 884),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 632),
 	PROPERTY_ENTRY_STRING("firmware-name",
@@ -106,9 +106,9 @@ static const struct property_entry surftab_wintron70_st70416_6_props[] = {
 	{ }
 };
 
-static const struct silead_ts_dmi_data surftab_wintron70_st70416_6_data = {
+static const struct silead_ts_dmi_data trekstor_surftab_wintron70_data = {
 	.acpi_name	= "MSSL1680:00",
-	.properties	= surftab_wintron70_st70416_6_props,
+	.properties	= trekstor_surftab_wintron70_props,
 };
 
 static const struct property_entry gp_electronic_t701_props[] = {
@@ -366,7 +366,7 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 	},
 	{
 		/* TrekStor SurfTab twin 10.1 ST10432-8 */
-		.driver_data = (void *)&surftab_twin_10_1_st10432_8_data,
+		.driver_data = (void *)&trekstor_surftab_twin_10_1_data,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TrekStor"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "SurfTab twin 10.1"),
@@ -374,7 +374,7 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 	},
 	{
 		/* Trekstor Surftab Wintron 7.0 ST70416-6 */
-		.driver_data = (void *)&surftab_wintron70_st70416_6_data,
+		.driver_data = (void *)&trekstor_surftab_wintron70_data,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "ST70416-6"),
@@ -384,7 +384,7 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 	},
 	{
 		/* Trekstor Surftab Wintron 7.0 ST70416-6, newer BIOS */
-		.driver_data = (void *)&surftab_wintron70_st70416_6_data,
+		.driver_data = (void *)&trekstor_surftab_wintron70_data,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TrekStor"),
 			DMI_MATCH(DMI_PRODUCT_NAME,
@@ -395,7 +395,7 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 	},
 	{
 		/* Ployer Momo7w (same hardware as the Trekstor ST70416-6) */
-		.driver_data = (void *)&surftab_wintron70_st70416_6_data,
+		.driver_data = (void *)&trekstor_surftab_wintron70_data,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Shenzhen PLOYER"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "MOMO7W"),
@@ -528,7 +528,7 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 	},
 	{
 		/* I.T.Works TW701 */
-		.driver_data = (void *)&surftab_wintron70_st70416_6_data,
+		.driver_data = (void *)&trekstor_surftab_wintron70_data,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "i71c"),
-- 
2.17.0
