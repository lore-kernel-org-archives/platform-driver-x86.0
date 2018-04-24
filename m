From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: [PATCH 1/3] thinkpad-acpi: silence HKEY 0x6032,
 0x60f0, 0x6030
Date: Tue, 24 Apr 2018 16:56:03 -0300
Message-ID: <20180424195605.17526-1-hmh@hmh.eng.br>
References: <CAHp75VciLyh1Y1sws69Hn=vN39suV+HH-JwNLcbeUnZ_dwrc0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <CAHp75VciLyh1Y1sws69Hn=vN39suV+HH-JwNLcbeUnZ_dwrc0Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Christian Kellner <ckellner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Golden_Miller83-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org, Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, FP1 Zhang <zhangfp1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Demote to debug level one existing thermal-control related event, and
also add two new ones that would otherwise trigger unknown event
warnings.  These events are Windows-only for now.

We do report them to userspace in case they become useful in the future.

Signed-off-by: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Reported-by: Jordan Glover <Golden_Miller83-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
Tested-by: Jordan Glover <Golden_Miller83-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
---
 Documentation/laptops/thinkpad-acpi.txt |  2 ++
 drivers/platform/x86/thinkpad_acpi.c    | 19 +++++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/laptops/thinkpad-acpi.txt b/Documentation/laptops/thinkpad-acpi.txt
index 00b6dfed573c..6cced88de6da 100644
--- a/Documentation/laptops/thinkpad-acpi.txt
+++ b/Documentation/laptops/thinkpad-acpi.txt
@@ -540,8 +540,10 @@ Events that are propagated by the driver to userspace:
 0x6021		ALARM: a sensor is too hot
 0x6022		ALARM: a sensor is extremely hot
 0x6030		System thermal table changed
+0x6032		Thermal Control command set completion  (DYTC, Windows)
 0x6040		Nvidia Optimus/AC adapter related (TO BE VERIFIED)
 0x60C0		X1 Yoga 2016, Tablet mode status changed
+0x60F0		Thermal Transformation changed (GMTS, Windows)
 
 Battery nearly empty alarms are a last resort attempt to get the
 operating system to hibernate or shutdown cleanly (0x2313), or shutdown
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index da1ca4856ea1..cf25f0121d3b 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -212,7 +212,12 @@ enum tpacpi_hkey_event_t {
 	TP_HKEY_EV_ALARM_BAT_XHOT	= 0x6012, /* battery critically hot */
 	TP_HKEY_EV_ALARM_SENSOR_HOT	= 0x6021, /* sensor too hot */
 	TP_HKEY_EV_ALARM_SENSOR_XHOT	= 0x6022, /* sensor critically hot */
-	TP_HKEY_EV_THM_TABLE_CHANGED	= 0x6030, /* thermal table changed */
+	TP_HKEY_EV_THM_TABLE_CHANGED	= 0x6030, /* windows; thermal table changed */
+	TP_HKEY_EV_THM_CSM_COMPLETED    = 0x6032, /* windows; thermal control set
+						   * command completed. Related to
+						   * AML DYTC */
+	TP_HKEY_EV_THM_TRANSFM_CHANGED  = 0x60F0, /* windows; thermal transformation
+						   * changed. Related to AML GMTS */
 
 	/* AC-related events */
 	TP_HKEY_EV_AC_CHANGED		= 0x6040, /* AC status changed */
@@ -4042,7 +4047,17 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 
 	switch (hkey) {
 	case TP_HKEY_EV_THM_TABLE_CHANGED:
-		pr_info("EC reports that Thermal Table has changed\n");
+		pr_debug("EC reports: Thermal Table has changed\n");
+		/* recommended action: do nothing, we don't have
+		 * Lenovo ATM information */
+		return true;
+	case TP_HKEY_EV_THM_CSM_COMPLETED:
+		pr_debug("EC reports: Thermal Control Command set completed (DYTC)\n");
+		/* recommended action: do nothing, we don't have
+		 * Lenovo ATM information */
+		return true;
+	case TP_HKEY_EV_THM_TRANSFM_CHANGED:
+		pr_debug("EC reports: Thermal Transformation changed (GMTS)\n");
 		/* recommended action: do nothing, we don't have
 		 * Lenovo ATM information */
 		return true;
-- 
2.11.0


------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
