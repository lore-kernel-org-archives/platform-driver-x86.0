From: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 7/8] asus-laptop: pega_accel - Report
	accelerometer orientation change through udev
Date: Fri, 14 Oct 2011 11:13:41 +0200
Message-ID: <1318583622-23518-8-git-send-email-corentincj@iksaif.net>
References: <1318583622-23518-1-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1318583622-23518-1-git-send-email-corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anisse Astier <anisse-fwwRqrJYcP2HXe+LvDLADg@public.gmane.org>, Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Ross <andy.ross-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

From: Anisse Astier <anisse-fwwRqrJYcP2HXe+LvDLADg@public.gmane.org>

Signed-off-by: Anisse Astier <anisse-fwwRqrJYcP2HXe+LvDLADg@public.gmane.org>
Signed-off-by: Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/platform/x86/asus-laptop.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index d67b7b5..0dfd162 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1342,6 +1342,14 @@ static void asus_acpi_notify(struct acpi_device *device, u32 event)
 		}
 		return ;
 	}
+
+	/* Accelerometer "coarse orientation change" event */
+	if (asus->pega_accel_poll && event == 0xEA) {
+		kobject_uevent(&asus->pega_accel_poll->input->dev.kobj,
+			       KOBJ_CHANGE);
+		return ;
+	}
+
 	asus_input_notify(asus, event);
 }
 
-- 
1.7.3.4


------------------------------------------------------------------------------
All the data continuously generated in your IT infrastructure contains a
definitive record of customers, application performance, security
threats, fraudulent activity and more. Splunk takes this data and makes
sense of it. Business sense. IT sense. Common sense.
http://p.sf.net/sfu/splunk-d2d-oct
