From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Update Trekstor Twin 10.1 entry
Date: Sun, 31 May 2020 17:05:24 +0200
Message-ID: <20200531150524.89576-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add minimum values for the x and y axis, correct the max value for the
x-axis and add support for the capacitive home-button these tablets have.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 931814e62454..48ffe90ec3ce 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -679,11 +679,14 @@ static const struct ts_dmi_data trekstor_primetab_t13b_data = {
 };
 
 static const struct property_entry trekstor_surftab_twin_10_1_props[] = {
-	PROPERTY_ENTRY_U32("touchscreen-size-x", 1900),
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 20),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 0),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1890),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
 	PROPERTY_ENTRY_U32("touchscreen-inverted-y", 1),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3670-surftab-twin-10-1-st10432-8.fw"),
 	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
 
-- 
2.26.2
