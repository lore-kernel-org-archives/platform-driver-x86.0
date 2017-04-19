From: Carlo Caione <carlo@caione.org>
Subject: [PATCH v2 1/2] hp-wmi: Do not shadow error values
Date: Wed, 19 Apr 2017 19:41:53 +0200
Message-ID: <20170419174154.16518-2-carlo@caione.org>
References: <20170419174154.16518-1-carlo@caione.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170419174154.16518-1-carlo@caione.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com
Cc: Carlo Caione <carlo@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Carlo Caione <carlo@endlessm.com>

All the helper functions (i.e. hp_wmi_dock_state, hp_wmi_tablet_state,
...) using hp_wmi_perform_query to perform an HP WMI query shadow the
returned value in case of error.

We return -EINVAL only when the HP WMI query returns a positive value
(the specific error code) to not mix this up with the actual value
returned by the helper function.

Signed-off-by: Carlo Caione <carlo@endlessm.com>
---
 drivers/platform/x86/hp-wmi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 96ffda4..8c7773a 100644
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
-		return ret;
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
 
-- 
2.9.3
