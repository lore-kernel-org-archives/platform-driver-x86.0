From: Richard Hartmann <richih.mailinglist-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drivers/platform/x86/thinkpad_acpi.c:
	Handle HKEY event 0x6040
Date: Sat, 29 Dec 2012 22:51:49 +0100
Message-ID: <1356817910-20890-1-git-send-email-richih.mailinglist@gmail.com>
References: <CAD77+gROUfVX=9LPZc6_jf=2Bc_iaf5FW5Z2efwESzORNrq9dQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <CAD77+gROUfVX=9LPZc6_jf=2Bc_iaf5FW5Z2efwESzORNrq9dQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Richard Hartmann <richih.mailinglist-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Handle HKEY event generated on AC power change. The current message
asks users to submit data related to this event which leads to
a lot of confusion and noise on the mailing list.

The following is a list affected models and 'Message-Id'
from ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org of people who saw this
event when either plugging or unplugging the AC adapter or
docking or undocking their laptop.

X120e - CAAAujb5v9dHdbdxDVvhNJoG4UrZC1TgKqeB_zGpAy7q8kZHMEQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org
X121e - 20120817143459.GB3462-eWLsEhkZJs/kLsZ8J5Uweg@public.gmane.org
X220  - Confirmed by Richard Hartmann
X220i - 4F406274.7070807-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
X220t - 4F489F5B.9040705-CFLBMwTPW48UNGrzBIF7/Q@public.gmane.org
X230  - CAKx4u7kqvVH0-gstomsiVYdGC0i6=bGxzaQ8sq9gbg76TGme3w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org
T420  - 9c848ee30b006737d0534d906bab0cf6-l1rQmuElw4w5vnOj3qJKwaxOck334EZe@public.gmane.org
T420s - 20120608080824.GS25324-3HqRAUrWAWyGglJvpFV4uA@public.gmane.org
W520  - 20121008181050.GF2549-7RcLWEz+wg2OywUUTrYc/mD+nLXbzpJg6Rye4aHWhBBzbRFIqnYvSA@public.gmane.org

Signed-off-by: Richard Hartmann <richih.mailinglist-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/platform/x86/thinkpad_acpi.c |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 75dd651..15e2bba 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -209,9 +209,8 @@ enum tpacpi_hkey_event_t {
 	TP_HKEY_EV_ALARM_SENSOR_XHOT	= 0x6022, /* sensor critically hot */
 	TP_HKEY_EV_THM_TABLE_CHANGED	= 0x6030, /* thermal table changed */
 
-	TP_HKEY_EV_UNK_6040		= 0x6040, /* Related to AC change?
-						     some sort of APM hint,
-						     W520 */
+	/* AC-related events */
+	TP_HKEY_EV_AC_CHANGED		= 0x6040, /* AC status changed */
 
 	/* Misc */
 	TP_HKEY_EV_RFKILL_CHANGED	= 0x7000, /* rfkill switch changed */
@@ -3629,6 +3628,12 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 			 "a sensor reports something is extremely hot!\n");
 		/* recommended action: immediate sleep/hibernate */
 		break;
+	case TP_HKEY_EV_AC_CHANGED:
+		/* X120e, X121e, X220, X220i, X220t, X230, T420, T420s, W520:
+		 * AC status changed; can be triggered by plugging or
+		 * unplugging AC adapter, docking or undocking. */
+
+		/* fallthrough */
 
 	case TP_HKEY_EV_KEY_NUMLOCK:
 	case TP_HKEY_EV_KEY_FN:
-- 
1.7.10.4


------------------------------------------------------------------------------
Master Visual Studio, SharePoint, SQL, ASP.NET, C# 2012, HTML5, CSS,
MVC, Windows 8 Apps, JavaScript and much more. Keep your skills current
with LearnDevNow - 3,200 step-by-step video tutorials by Microsoft
MVPs and experts. SALE $99.99 this month only -- learn more at:
http://p.sf.net/sfu/learnmore_122912
