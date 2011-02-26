From: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 10/14] asus-wmi: allow debugfs interface to
	call arbitrary method
Date: Sat, 26 Feb 2011 10:20:39 +0100
Message-ID: <1298712045-17671-11-git-send-email-corentincj@iksaif.net>
References: <1298712045-17671-1-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1298712045-17671-1-git-send-email-corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ASUS NOTEBOOKS AN..." <acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, "open list:ASUS NOTEBOOKS AN..." <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Also add some # format flags to debugfs output.

Signed-off-by: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
---
 drivers/platform/x86/asus-wmi.c |   47 +++++++++++++++++++++++++++++++++++++-
 1 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 88596ea..9095c28 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -112,11 +112,14 @@ struct bios_args {
  * <platform>/    - debugfs root directory
  *   dev_id      - current dev_id
  *   ctrl_param  - current ctrl_param
+ *   method_id   - current method_id
  *   devs        - call DEVS(dev_id, ctrl_param) and print result
  *   dsts        - call DSTS(dev_id)  and print result
+ *   call        - call method_id(dev_id, ctrl_param) and print result
  */
 struct asus_wmi_debug {
 	struct dentry *root;
+	u32 method_id;
 	u32 dev_id;
 	u32 ctrl_param;
 };
@@ -1138,7 +1141,7 @@ static int show_dsts(struct seq_file *m, void *data)
 	if (err < 0)
 		return err;
 
-	seq_printf(m, "DSTS(%x) = %x\n", asus->debug.dev_id, retval);
+	seq_printf(m, "DSTS(%#x) = %#x\n", asus->debug.dev_id, retval);
 
 	return 0;
 }
@@ -1155,15 +1158,50 @@ static int show_devs(struct seq_file *m, void *data)
 	if (err < 0)
 		return err;
 
-	seq_printf(m, "DEVS(%x, %x) = %x\n", asus->debug.dev_id,
+	seq_printf(m, "DEVS(%#x, %#x) = %#x\n", asus->debug.dev_id,
 		   asus->debug.ctrl_param, retval);
 
 	return 0;
 }
 
+static int show_call(struct seq_file *m, void *data)
+{
+	struct asus_wmi *asus = m->private;
+	struct bios_args args = {
+		.arg0 = asus->debug.dev_id,
+		.arg1 = asus->debug.ctrl_param,
+	};
+	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+
+	status = wmi_evaluate_method(ASUS_WMI_MGMT_GUID,
+				     1, asus->debug.method_id,
+				     &input, &output);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj = (union acpi_object *)output.pointer;
+	if (obj && obj->type == ACPI_TYPE_INTEGER)
+		seq_printf(m, "%#x(%#x, %#x) = %#x\n", asus->debug.method_id,
+			   asus->debug.dev_id, asus->debug.ctrl_param,
+			   (u32) obj->integer.value);
+	else
+		seq_printf(m, "%#x(%#x, %#x) = t:%d\n", asus->debug.method_id,
+			   asus->debug.dev_id, asus->debug.ctrl_param,
+			   obj->type);
+
+	kfree(obj);
+
+	return 0;
+}
+
 static struct asus_wmi_debugfs_node asus_wmi_debug_files[] = {
 	{NULL, "devs", show_devs},
 	{NULL, "dsts", show_dsts},
+	{NULL, "call", show_call},
 };
 
 static int asus_wmi_debugfs_open(struct inode *inode, struct file *file)
@@ -1197,6 +1235,11 @@ static int asus_wmi_debugfs_init(struct asus_wmi *asus)
 		goto error_debugfs;
 	}
 
+	dent = debugfs_create_x32("method_id", S_IRUGO | S_IWUSR,
+				  asus->debug.root, &asus->debug.method_id);
+	if (!dent)
+		goto error_debugfs;
+
 	dent = debugfs_create_x32("dev_id", S_IRUGO | S_IWUSR,
 				  asus->debug.root, &asus->debug.dev_id);
 	if (!dent)
-- 
1.7.4


------------------------------------------------------------------------------
Free Software Download: Index, Search & Analyze Logs and other IT data in 
Real-Time with Splunk. Collect, index and harness all the fast moving IT data 
generated by your applications, servers and devices whether physical, virtual
or in the cloud. Deliver compliance at lower cost and gain new business 
insights. http://p.sf.net/sfu/splunk-dev2dev 
