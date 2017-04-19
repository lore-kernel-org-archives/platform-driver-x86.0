From: Carlo Caione <carlo@caione.org>
Subject: [PATCH] hp-wmi: Do not shadow error values
Date: Wed, 19 Apr 2017 22:36:39 +0200
Message-ID: <20170419203639.28788-1-carlo@caione.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36731 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753574AbdDSUgv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Apr 2017 16:36:51 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: andy@infradead.org, andy.shevchenko@gmail.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com
Cc: Carlo Caione <carlo@endlessm.com>

From: Carlo Caione <carlo@endlessm.com>

All the helper functions (i.e. hp_wmi_dock_state, hp_wmi_tablet_state,
...) using hp_wmi_perform_query to perform an HP WMI query shadow the
returned value in case of error.

We return -EINVAL only when the HP WMI query returns a positive value
(the specific error code) to not mix this up with the actual value
returned by the helper function.

Signed-off-by: Carlo Caione <carlo@endlessm.com>
---
 drivers/platform/x86/hp-wmi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 2b721fd..454cb2e 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -248,7 +248,7 @@ static int hp_wmi_display_state(void)
 	int ret = hp_wmi_perform_query(HPWMI_DISPLAY_QUERY, 0, &state,
 				       sizeof(state), sizeof(state));
 	if (ret)
-		return -EINVAL;
+		return ret < 0 ? ret : -EINVAL;
 	return state;
 }
 
@@ -258,7 +258,7 @@ static int hp_wmi_hddtemp_state(void)
 	int ret = hp_wmi_perform_query(HPWMI_HDDTEMP_QUERY, 0, &state,
 				       sizeof(state), sizeof(state));
 	if (ret)
-		return -EINVAL;
+		return ret < 0 ? ret : -EINVAL;
 	return state;
 }
 
@@ -268,7 +268,7 @@ static int hp_wmi_als_state(void)
 	int ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, 0, &state,
 				       sizeof(state), sizeof(state));
 	if (ret)
-		return -EINVAL;
+		return ret < 0 ? ret : -EINVAL;
 	return state;
 }
 
@@ -279,7 +279,7 @@ static int hp_wmi_dock_state(void)
 				       sizeof(state), sizeof(state));
 
 	if (ret)
-		return -EINVAL;
+		return ret < 0 ? ret : -EINVAL;
 
 	return state & 0x1;
 }
@@ -290,7 +290,7 @@ static int hp_wmi_tablet_state(void)
 	int ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, 0, &state,
 				       sizeof(state), sizeof(state));
 	if (ret)
-		return -EINVAL;
+		return ret < 0 ? ret : -EINVAL;
 
 	return (state & 0x4) ? 1 : 0;
 }
@@ -323,7 +323,7 @@ static int __init hp_wmi_enable_hotkeys(void)
 	int ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &value,
 				       sizeof(value), 0);
 	if (ret)
-		return -EINVAL;
+		return ret < 0 ? ret : -EINVAL;
 	return 0;
 }
 
@@ -336,7 +336,7 @@ static int hp_wmi_set_block(void *data, bool blocked)
 	ret = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, 1,
 				   &query, sizeof(query), 0);
 	if (ret)
-		return -EINVAL;
+		return ret < 0 ? ret : -EINVAL;
 	return 0;
 }
 
@@ -428,7 +428,7 @@ static int hp_wmi_post_code_state(void)
 	int ret = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, 0, &state,
 				       sizeof(state), sizeof(state));
 	if (ret)
-		return -EINVAL;
+		return ret < 0 ? ret : -EINVAL;
 	return state;
 }
 
@@ -494,7 +494,7 @@ static ssize_t set_als(struct device *dev, struct device_attribute *attr,
 	int ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, 1, &tmp,
 				       sizeof(tmp), sizeof(tmp));
 	if (ret)
-		return -EINVAL;
+		return ret < 0 ? ret : -EINVAL;
 
 	return count;
 }
@@ -515,7 +515,7 @@ static ssize_t set_postcode(struct device *dev, struct device_attribute *attr,
 	ret = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, 1, &tmp,
 				       sizeof(tmp), sizeof(tmp));
 	if (ret)
-		return -EINVAL;
+		return ret < 0 ? ret : -EINVAL;
 
 	return count;
 }
-- 
2.9.3
