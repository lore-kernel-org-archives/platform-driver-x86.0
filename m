From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/6] software node: Allow register and unregister software node groups
Date: Wed,  8 Apr 2020 19:09:02 +0300
Message-ID: <20200408160905.12101-3-andriy.shevchenko@linux.intel.com>
References: <20200408160905.12101-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200408160905.12101-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Sometimes it's more convenient to register a set of individual software nodes
grouped together. Add couple of functions for that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/swnode.c    | 48 ++++++++++++++++++++++++++++++++++++++++
 include/linux/property.h |  3 +++
 2 files changed, 51 insertions(+)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index de8d3543e8fe..2079937ddb51 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -726,6 +726,54 @@ void software_node_unregister_nodes(const struct software_node *nodes)
 }
 EXPORT_SYMBOL_GPL(software_node_unregister_nodes);
 
+/**
+ * software_node_register_node_group - Register a group of software nodes
+ * @node_group: NULL terminated array of software node pointers to be registered
+ *
+ * Register multiple software nodes at once.
+ */
+int software_node_register_node_group(const struct software_node **node_group)
+{
+	unsigned int i;
+	int ret;
+
+	if (!node_group)
+		return 0;
+
+	for (i = 0; node_group[i]; i++) {
+		ret = software_node_register(node_group[i]);
+		if (ret) {
+			software_node_unregister_node_group(node_group);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(software_node_register_node_group);
+
+/**
+ * software_node_unregister_node_group - Unregister a group of software nodes
+ * @node_group: NULL terminated array of software node pointers to be unregistered
+ *
+ * Unregister multiple software nodes at once.
+ */
+void software_node_unregister_node_group(const struct software_node **node_group)
+{
+	struct swnode *swnode;
+	unsigned int i;
+
+	if (!node_group)
+		return;
+
+	for (i = 0; node_group[i]; i++) {
+		swnode = software_node_to_swnode(node_group[i]);
+		if (swnode)
+			fwnode_remove_software_node(&swnode->fwnode);
+	}
+}
+EXPORT_SYMBOL_GPL(software_node_unregister_node_group);
+
 /**
  * software_node_register - Register static software node
  * @node: The software node to be registered
diff --git a/include/linux/property.h b/include/linux/property.h
index d86de017c689..c7b5f3db36aa 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -440,6 +440,9 @@ software_node_find_by_name(const struct software_node *parent,
 int software_node_register_nodes(const struct software_node *nodes);
 void software_node_unregister_nodes(const struct software_node *nodes);
 
+int software_node_register_node_group(const struct software_node **node_group);
+void software_node_unregister_node_group(const struct software_node **node_group);
+
 int software_node_register(const struct software_node *node);
 
 int software_node_notify(struct device *dev, unsigned long action);
-- 
2.25.1
