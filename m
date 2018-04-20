From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: [UNTESTED 2/3] thinkpad-acpi: do not report
 thermal sensor state for tablet mode switch
Date: Fri, 20 Apr 2018 12:16:28 -0300
Message-ID: <20180420151629.12993-2-hmh@hmh.eng.br>
References: <20180420151629.12993-1-hmh@hmh.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20180420151629.12993-1-hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
In-Reply-To: <-B_kuLAsoL7HNLV_as9l197VeKXFOu7R-GfEj_oV2TRu40VHMh4SRkEpgaOEMhEqi5-t9Qdk4c8_vMNOXDk_QHuNj-EPKs2afxrL0zTBZxc=@protonmail.ch>
References: <-B_kuLAsoL7HNLV_as9l197VeKXFOu7R-GfEj_oV2TRu40VHMh4SRkEpgaOEMhEqi5-t9Qdk4c8_vMNOXDk_QHuNj-EPKs2afxrL0zTBZxc=@protonmail.ch>
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

We should not do a thermal sensors state dump to the kernel log just
because the laptop is reporting that it changed into or out of tablet
mode.

Signed-off-by: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index cf25f0121d3b..3d70ef7e8a68 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4098,7 +4098,7 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 		tpacpi_input_send_tabletsw();
 		hotkey_tablet_mode_notify_change();
 		*send_acpi_ev = false;
-		break;
+		return true;
 
 	case TP_HKEY_EV_PALM_DETECTED:
 	case TP_HKEY_EV_PALM_UNDETECTED:
-- 
2.11.0


------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
