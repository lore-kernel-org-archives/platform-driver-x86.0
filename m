From: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] thinkpad_acpi: Don't repeat ourselves
	in hotkey_init_tablet_mode()
Date: Mon,  7 Nov 2016 12:10:31 -0500
Message-ID: <1478538633-11450-2-git-send-email-lyude@redhat.com>
References: <1478538633-11450-1-git-send-email-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1478538633-11450-1-git-send-email-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Cc: Daniel Martin <consume.noise-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

There's no need to have multiple copies of the logic we use for checking
whether or not we're in tablet mode, so just use
hotkey_get_tablet_mode() when checking the initial state in
hotkey_init_tablet_mode().

Cc: Daniel Martin <consume.noise-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index dfa1af8..ad93c41 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3130,13 +3130,16 @@ hotkey_init_tablet_mode(void)
 	/* For X41t, X60t, X61t Tablets... */
 	if (acpi_evalf(hkey_handle, &res, "MHKG", "qd")) {
 		tp_features.hotkey_tablet = TP_HOTKEY_TABLET_USES_MHKG;
-		in_tablet_mode = !!(res & TP_HOTKEY_TABLET_MASK);
 		type = "MHKG";
 	}
 
 	if (!tp_features.hotkey_tablet)
 		return 0;
 
+	res = hotkey_get_tablet_mode(&in_tablet_mode);
+	if (res)
+		return res;
+
 	pr_info("Tablet mode switch found (type: %s), currently in %s mode\n",
 		type, in_tablet_mode ? "tablet" : "laptop");
 
-- 
2.7.4


------------------------------------------------------------------------------
Developer Access Program for Intel Xeon Phi Processors
Access to Intel Xeon Phi processor-based developer platforms.
With one year of Intel Parallel Studio XE.
Training and support from Colfax.
Order your platform today. http://sdm.link/xeonphi
