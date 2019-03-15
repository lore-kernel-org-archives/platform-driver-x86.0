From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 11/12] drm: Add fwnode member to the struct drm_connector
Date: Fri, 15 Mar 2019 19:57:59 +0300
Message-ID: <20190315165800.5058-12-heikki.krogerus@linux.intel.com>
References: <20190315165800.5058-1-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315165800.5058-1-heikki.krogerus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

If the system firmware supplies nodes that represent the connectors,
they need to be associated with the connector entries.

ACPI tables at least always supply a device node for every connector
on integrated video hardware - this is explained in ACPI
specification's ch. "Appendix B Video Extension". Many drivers appear
to already deal with those connector firmware nodes "indirectly"
in order to support custom Operation Regions, _DSM (device specific
method) and access other resources the nodes supply for the
connectors.

This commit will only add the fwnode member. It's first up to the
drivers to assign and take advantage of it. For convenience, the nodes
are assigned to the device entries that are used for exposing the
connectors to the user space via sysfs. That makes it possible to see
the link between the connector and its node also from user space. In
case of ACPI, the connector's sysfs directory will have a symlink
named "firmware_node" pointing to the node object directory in sysfs
if a node is associated with the connector.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/gpu/drm/drm_sysfs.c | 49 +++++++++++++++++++++++++------------
 include/drm/drm_connector.h |  2 ++
 2 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index ecb7b33002bb..7667939ef1c0 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -264,26 +264,50 @@ static const struct attribute_group *connector_dev_groups[] = {
 	NULL
 };
 
+static void drm_sysfs_release(struct device *dev)
+{
+	kfree(dev);
+}
+
 int drm_sysfs_connector_add(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
+	struct device *kdev;
+	int ret;
 
 	if (connector->kdev)
 		return 0;
 
-	connector->kdev =
-		device_create_with_groups(drm_class, dev->primary->kdev, 0,
-					  connector, connector_dev_groups,
-					  "card%d-%s", dev->primary->index,
-					  connector->name);
-	DRM_DEBUG("adding \"%s\" to sysfs\n",
-		  connector->name);
+	kdev = kzalloc(sizeof(*kdev), GFP_KERNEL);
+	if (!kdev)
+		return -ENOMEM;
 
-	if (IS_ERR(connector->kdev)) {
-		DRM_ERROR("failed to register connector device: %ld\n", PTR_ERR(connector->kdev));
-		return PTR_ERR(connector->kdev);
+	device_initialize(kdev);
+	kdev->class = drm_class;
+	kdev->parent = dev->primary->kdev;
+	kdev->fwnode = connector->fwnode;
+	kdev->groups = connector_dev_groups;
+	kdev->release = drm_sysfs_release;
+	dev_set_drvdata(kdev, connector);
+
+	ret = dev_set_name(kdev, "card%d-%s", dev->primary->index,
+			   connector->name);
+	if (ret) {
+		kfree(kdev);
+		return ret;
+	}
+
+	DRM_DEBUG("adding \"%s\" to sysfs\n", connector->name);
+
+	ret = device_add(kdev);
+	if (ret) {
+		DRM_ERROR("failed to register connector device: %d\n", ret);
+		put_device(kdev);
+		return ret;
 	}
 
+	connector->kdev = kdev;
+
 	/* Let userspace know we have a new connector */
 	drm_sysfs_hotplug_event(dev);
 
@@ -330,11 +354,6 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_sysfs_hotplug_event);
 
-static void drm_sysfs_release(struct device *dev)
-{
-	kfree(dev);
-}
-
 struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 {
 	const char *minor_str;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8fe22abb1e10..e30b7743e019 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -851,6 +851,8 @@ struct drm_connector {
 	struct device *kdev;
 	/** @attr: sysfs attributes */
 	struct device_attribute *attr;
+	/** @fwnode: associated device node supplied by platform firmware */
+	struct fwnode_handle *fwnode;
 
 	/**
 	 * @head:
-- 
2.20.1
