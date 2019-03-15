From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 02/12] software node: Increment parent node's ref count
Date: Fri, 15 Mar 2019 19:57:50 +0300
Message-ID: <20190315165800.5058-3-heikki.krogerus@linux.intel.com>
References: <20190315165800.5058-1-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315165800.5058-1-heikki.krogerus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

If the parent node is removed before its children, release()
may be called first for the parent instead of the last child
when the child's ref count reaches zero. Since the nodes
release their parent's resources in the release callback,
that would cause NULL pointer dereference to happen. To
prevent that from ever happening, incrementing the parent
node's reference count when creating a new child node and
decrementing it when the child node is "released".

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/base/swnode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 3a50a8edd3d3..8d4485d8d0f8 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -560,6 +560,7 @@ static void software_node_release(struct kobject *kobj)
 	if (swnode->parent) {
 		ida_simple_remove(&swnode->parent->child_ids, swnode->id);
 		list_del(&swnode->entry);
+		kobject_put(&swnode->parent->kobj);
 	} else {
 		ida_simple_remove(&swnode_root_ids, swnode->id);
 	}
@@ -610,8 +611,10 @@ fwnode_create_software_node(const struct property_entry *properties,
 	INIT_LIST_HEAD(&swnode->children);
 	swnode->parent = p;
 
-	if (p)
+	if (p) {
+		kobject_get(&p->kobj);
 		list_add_tail(&swnode->entry, &p->children);
+	}
 
 	ret = kobject_init_and_add(&swnode->kobj, &software_node_type,
 				   p ? &p->kobj : NULL, "node%d", swnode->id);
-- 
2.20.1
