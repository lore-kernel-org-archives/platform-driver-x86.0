From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 1/2] platform: x86: silead_dmi: Constify properties arrays
Date: Wed, 22 Mar 2017 16:55:53 +0100
Message-ID: <20170322155554.8561-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41300 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759587AbdCVP4D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2017 11:56:03 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, russianneuromancer@ya.ru, platform-driver-x86@vger.kernel.org

Now that device_add_properties takes a const property_entry * rather
then a non-const one we can constify the properties arrays.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-This is a new patch in v3 of this patch-set
---
 drivers/platform/x86/silead_dmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index 02e11fd..c3909d2 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -22,10 +22,10 @@
 
 struct silead_ts_dmi_data {
 	const char *acpi_name;
-	struct property_entry *properties;
+	const struct property_entry *properties;
 };
 
-static struct property_entry cube_iwork8_air_props[] = {
+static const struct property_entry cube_iwork8_air_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1660),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 900),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
@@ -39,7 +39,7 @@ static const struct silead_ts_dmi_data cube_iwork8_air_data = {
 	.properties	= cube_iwork8_air_props,
 };
 
-static struct property_entry jumper_ezpad_mini3_props[] = {
+static const struct property_entry jumper_ezpad_mini3_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1700),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1150),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
-- 
2.9.3
