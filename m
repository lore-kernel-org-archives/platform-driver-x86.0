From: Vasiliy Kulikov <segoon-cxoSlKxDwOJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 15/20] platform: x86: asus_acpi:
	world-writable procfs files
Date: Fri,  4 Feb 2011 15:23:59 +0300
Message-ID: <59f50c896fa91e8b7822c71800c76063b0b58d2b.1296818921.git.segoon@openwall.com>
References: <cover.1296818921.git.segoon@openwall.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <cover.1296818921.git.segoon-cxoSlKxDwOJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: security-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Karol Kozimor <sziwan-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Don't allow everybody to change ACPI settings.  The comment says that it
is done deliberatelly, however, the comment before disp_proc_write()
says that at least one of these setting is experimental.

Signed-off-by: Vasiliy Kulikov <segoon-cxoSlKxDwOJWk0Htik3J/w@public.gmane.org>
---
 Compile tested only.

 drivers/platform/x86/asus_acpi.c |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/asus_acpi.c b/drivers/platform/x86/asus_acpi.c
index 4633fd8..fe49593 100644
--- a/drivers/platform/x86/asus_acpi.c
+++ b/drivers/platform/x86/asus_acpi.c
@@ -1081,14 +1081,8 @@ static int asus_hotk_add_fs(struct acpi_device *device)
 	struct proc_dir_entry *proc;
 	mode_t mode;
 
-	/*
-	 * If parameter uid or gid is not changed, keep the default setting for
-	 * our proc entries (-rw-rw-rw-) else, it means we care about security,
-	 * and then set to -rw-rw----
-	 */
-
 	if ((asus_uid == 0) && (asus_gid == 0)) {
-		mode = S_IFREG | S_IRUGO | S_IWUGO;
+		mode = S_IFREG | S_IRUGO | S_IWUSR | S_IWGRP;
 	} else {
 		mode = S_IFREG | S_IRUSR | S_IRGRP | S_IWUSR | S_IWGRP;
 		printk(KERN_WARNING "  asus_uid and asus_gid parameters are "
-- 
1.7.0.4


------------------------------------------------------------------------------
The modern datacenter depends on network connectivity to access resources
and provide services. The best practices for maximizing a physical server's
connectivity to a physical network are well understood - see how these
rules translate into the virtual world? 
http://p.sf.net/sfu/oracle-sfdevnlfb
