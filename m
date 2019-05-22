From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v4 04/16] software node: Use kobject name when finding child nodes by name
Date: Wed, 22 May 2019 13:51:01 +0300
Message-ID: <20190522105113.11153-5-heikki.krogerus@linux.intel.com>
References: <20190522105113.11153-1-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522105113.11153-1-heikki.krogerus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Hans de Goede <hdegoede@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Using the kobject name of the node instead of a device
property "name" in software_node_get_named_child_node().

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/base/swnode.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index ef1a48fec718..2d925fc2255f 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -546,17 +546,13 @@ software_node_get_named_child_node(const struct fwnode_handle *fwnode,
 				   const char *childname)
 {
 	struct swnode *swnode = to_swnode(fwnode);
-	const struct property_entry *prop;
 	struct swnode *child;
 
 	if (!swnode || list_empty(&swnode->children))
 		return NULL;
 
 	list_for_each_entry(child, &swnode->children, entry) {
-		prop = property_entry_get(child->node->properties, "name");
-		if (!prop)
-			continue;
-		if (!strcmp(childname, prop->value.str)) {
+		if (!strcmp(childname, kobject_name(&child->kobj))) {
 			kobject_get(&child->kobj);
 			return &child->fwnode;
 		}
-- 
2.20.1
