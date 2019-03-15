From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 04/12] software node: Implement .get_reference_args fwnode operation
Date: Fri, 15 Mar 2019 19:57:52 +0300
Message-ID: <20190315165800.5058-5-heikki.krogerus@linux.intel.com>
References: <20190315165800.5058-1-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315165800.5058-1-heikki.krogerus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This makes it possible to support drivers that use
fwnode_property_get_reference_args() function.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/base/swnode.c | 56 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 591f290d25be..b1320a55351d 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -534,6 +534,61 @@ software_node_get_named_child_node(const struct fwnode_handle *fwnode,
 	return NULL;
 }
 
+static int
+software_node_get_reference_args(const struct fwnode_handle *fwnode,
+				 const char *propname, const char *nargs_prop,
+				 unsigned int nargs, unsigned int index,
+				 struct fwnode_reference_args *args)
+{
+	struct software_node *swnode = to_software_node(fwnode);
+	struct software_node_reference *ref;
+	const struct property_entry *prop;
+	int ret = -ENOENT;
+	int i;
+
+	mutex_lock(&swnode->lock);
+
+	if (!swnode || list_empty(&swnode->references))
+		goto err_unlock;
+
+	if (nargs_prop) {
+		prop = property_entry_get(swnode->properties, nargs_prop);
+		if (!prop) {
+			ret = -EINVAL;
+			goto err_unlock;
+		}
+
+		nargs = prop->value.u32_data;
+	}
+
+	if (nargs > NR_FWNODE_REFERENCE_ARGS) {
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+
+	list_for_each_entry(ref, &swnode->references, list) {
+		if (strcmp(ref->name, propname))
+			continue;
+
+		if (index > (ref->nrefs - 1))
+			break;
+
+		args->nargs = nargs;
+		args->fwnode = software_node_get(ref->args[index].fwnode);
+
+		for (i = 0; i < nargs; i++)
+			args->args[i] = ref->args[index].args[i];
+
+		ret = 0;
+		break;
+	}
+
+err_unlock:
+	mutex_unlock(&swnode->lock);
+
+	return ret;
+}
+
 static const struct fwnode_operations software_node_ops = {
 	.get = software_node_get,
 	.put = software_node_put,
@@ -543,6 +598,7 @@ static const struct fwnode_operations software_node_ops = {
 	.get_parent = software_node_get_parent,
 	.get_next_child_node = software_node_get_next_child,
 	.get_named_child_node = software_node_get_named_child_node,
+	.get_reference_args = software_node_get_reference_args,
 };
 
 /* -------------------------------------------------------------------------- */
-- 
2.20.1
