From: Richard Hartmann <richih.mailinglist-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drivers/platform/x86/thinkpad_acpi.c:
	Handle HKEY event 0x6040
Date: Wed, 26 Dec 2012 18:46:13 +0100
Message-ID: <1356543973-18459-1-git-send-email-richih.mailinglist@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
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

The following is a list of causes, affected models, and 'message-id'
from ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org :

AC plug/unplug:

X120e - CAAAujb5v9dHdbdxDVvhNJoG4UrZC1TgKqeB_zGpAy7q8kZHMEQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org
x121e - 20120817143459.GB3462-eWLsEhkZJs/kLsZ8J5Uweg@public.gmane.org
X220  - Confirmed by Richard Hartmann
X220i - 4F406274.7070807-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
X220t - 4F489F5B.9040705-CFLBMwTPW48UNGrzBIF7/Q@public.gmane.org
X230  - CAKx4u7kqvVH0-gstomsiVYdGC0i6=bGxzaQ8sq9gbg76TGme3w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org
T420  - 9c848ee30b006737d0534d906bab0cf6-l1rQmuElw4w5vnOj3qJKwaxOck334EZe@public.gmane.org
T420s - 20120608080824.GS25324-3HqRAUrWAWyGglJvpFV4uA@public.gmane.org
W520  - 20121008181050.GF2549-7RcLWEz+wg2OywUUTrYc/mD+nLXbzpJg6Rye4aHWhBBzbRFIqnYvSA@public.gmane.org

Lid closed/openend:

X220  - 4F4124DF.5030205-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Could not be confirmed by author

Signed-off-by: Richard Hartmann <richih.mailinglist-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/platform/x86/thinkpad_acpi.c |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 75dd651..2645084 100644
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
@@ -3629,6 +3628,13 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 			 "a sensor reports something is extremely hot!\n");
 		/* recommended action: immediate sleep/hibernate */
 		break;
+	case TP_HKEY_EV_AC_CHANGED:
+		pr_info("AC status has changed\n");
+		/* X120e, x121e, X220, X220i, X220t, X230, T420, T420s, W520:
+		 * AC status changed; can be triggered by plugging or
+		 * unplugging AC adapter, docking or undocking, or closing
+		 * or opening the lid. */
+		break;
 
 	case TP_HKEY_EV_KEY_NUMLOCK:
 	case TP_HKEY_EV_KEY_FN:
-- 
1.7.10.4


------------------------------------------------------------------------------
LogMeIn Rescue: Anywhere, Anytime Remote support for IT. Free Trial
Remotely access PCs and mobile devices and provide instant support
Improve your efficiency, and focus on delivering more value-add services
Discover what IT Professionals Know. Rescue delivers
http://p.sf.net/sfu/logmein_12329d2d
