From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH 5/9] platform/x86: hp-wmi: Cleanup wireless get_(hw|sw)state functions
Date: Wed, 19 Apr 2017 19:25:17 -0700
Message-ID: <1e756d4791b043df3c1251a2b016466bb0bce555.1492654448.git.dvhart@infradead.org>
References: <cover.1492654448.git.dvhart@infradead.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1492654448.git.dvhart@infradead.org>
In-Reply-To: <cover.1492654448.git.dvhart@infradead.org>
References: <cover.1492654448.git.dvhart@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, carlo@caione.org
List-Id: platform-driver-x86.vger.kernel.org

From: "Darren Hart (VMware)" <dvhart@infradead.org>

Use the new hp_wmi_read_int() function and add a WARN_ONCE() to the TBD
regarding passing the error through. These are used in a null return
function unfortunately.

Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 drivers/platform/x86/hp-wmi.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 758c229..e46b61c 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -337,33 +337,25 @@ static const struct rfkill_ops hp_wmi_rfkill_ops = {
 static bool hp_wmi_get_sw_state(enum hp_wmi_radio r)
 {
 	int mask = 0x200 << (r * 8);
-	int wireless = 0;
 
-	hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_READ,
-			     &wireless, sizeof(wireless),
-			     sizeof(wireless));
+	int wireless = hp_wmi_read_int(HPWMI_WIRELESS_QUERY);
+
 	/* TBD: Pass error */
+	WARN_ONCE(wireless < 0, "error executing HPWMI_WIRELESS_QUERY");
 
-	if (wireless & mask)
-		return false;
-	else
-		return true;
+	return !(wireless & mask);
 }
 
 static bool hp_wmi_get_hw_state(enum hp_wmi_radio r)
 {
 	int mask = 0x800 << (r * 8);
-	int wireless = 0;
 
-	hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_READ,
-			     &wireless, sizeof(wireless),
-			     sizeof(wireless));
+	int wireless = hp_wmi_read_int(HPWMI_WIRELESS_QUERY);
+
 	/* TBD: Pass error */
+	WARN_ONCE(wireless < 0, "error executing HPWMI_WIRELESS_QUERY");
 
-	if (wireless & mask)
-		return false;
-	else
-		return true;
+	return !(wireless & mask);
 }
 
 static int hp_wmi_rfkill2_set_block(void *data, bool blocked)
-- 
2.9.3
