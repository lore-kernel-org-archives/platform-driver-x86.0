From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v4 08/16] device property: Introduce fwnode_find_reference()
Date: Wed, 22 May 2019 13:51:05 +0300
Message-ID: <20190522105113.11153-9-heikki.krogerus@linux.intel.com>
References: <20190522105113.11153-1-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522105113.11153-1-heikki.krogerus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Hans de Goede <hdegoede@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

In most cases the references that the drivers look for don't
have any arguments. This introduces a wrapper function for
fwnode_property_get_reference_args() that looks for
references by using only the name and index.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/base/property.c  | 24 ++++++++++++++++++++++++
 include/linux/property.h |  4 ++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 348b37e64944..81bd01ed4042 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -484,6 +484,30 @@ int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_property_get_reference_args);
 
+/**
+ * fwnode_find_reference - Find named reference to a fwnode_handle
+ * @fwnode: Firmware node where to look for the reference
+ * @name: The name of the reference
+ * @index: Index of the reference
+ *
+ * @index can be used when the named reference holds a table of references.
+ *
+ * Returns pointer to the reference fwnode, or ERR_PTR. Caller is responsible to
+ * call fwnode_handle_put() on the returned fwnode pointer.
+ */
+struct fwnode_handle *fwnode_find_reference(const struct fwnode_handle *fwnode,
+					    const char *name,
+					    unsigned int index)
+{
+	struct fwnode_reference_args args;
+	int ret;
+
+	ret = fwnode_property_get_reference_args(fwnode, name, NULL, 0, index,
+						 &args);
+	return ret ? ERR_PTR(ret) : args.fwnode;
+}
+EXPORT_SYMBOL_GPL(fwnode_find_reference);
+
 /**
  * device_remove_properties - Remove properties from a device object.
  * @dev: Device whose properties to remove.
diff --git a/include/linux/property.h b/include/linux/property.h
index abcde2f236a0..088d4db7e949 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -79,6 +79,10 @@ int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
 				       unsigned int nargs, unsigned int index,
 				       struct fwnode_reference_args *args);
 
+struct fwnode_handle *fwnode_find_reference(const struct fwnode_handle *fwnode,
+					    const char *name,
+					    unsigned int index);
+
 struct fwnode_handle *fwnode_get_parent(const struct fwnode_handle *fwnode);
 struct fwnode_handle *fwnode_get_next_parent(
 	struct fwnode_handle *fwnode);
-- 
2.20.1
