From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 12/12] drm/i915: Associate the ACPI connector nodes with connector entries
Date: Fri, 15 Mar 2019 19:58:00 +0300
Message-ID: <20190315165800.5058-13-heikki.krogerus@linux.intel.com>
References: <20190315165800.5058-1-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315165800.5058-1-heikki.krogerus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Intel platforms we know that the ACPI connector device
node order will follow the order the driver (i915) decides.
The decision is made using the Intel OpRegion
intel_opregion.c), though, the driver does not know that the
values it supplies are used for associating a device node
for the connectors, and assigning address for them.

In reality it means we end up violating ACPI specification
(we supply dynamic information to objects that are defined
static, for example _ADR), however, it makes associating the
connector nodes with the connector entries straightforward
(one-on-one mapping).

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/gpu/drm/i915/intel_display.c | 41 ++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
index ccb616351bba..512dc7ad0604 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -15304,6 +15304,46 @@ static int intel_initial_commit(struct drm_device *dev)
 	return ret;
 }
 
+/* NOTE: The connector order must be final before this is called. */
+static void intel_assign_connector_fwnodes(struct drm_device *dev)
+{
+	struct drm_connector_list_iter conn_iter;
+	struct device *kdev = &dev->pdev->dev;
+	struct fwnode_handle *fwnode = NULL;
+	struct drm_connector *connector;
+	struct acpi_device *adev;
+
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		/* Always getting the next, even when the last was not used. */
+		fwnode = device_get_next_child_node(kdev, fwnode);
+		if (!fwnode)
+			break;
+
+		switch (connector->connector_type) {
+		case DRM_MODE_CONNECTOR_LVDS:
+		case DRM_MODE_CONNECTOR_eDP:
+		case DRM_MODE_CONNECTOR_DSI:
+			/*
+			 * Integrated displays use a specific address 0x1f on
+			 * most Intel platforms, but not all of them.
+			 */
+			adev = acpi_find_child_device(ACPI_COMPANION(kdev),
+						      0x1f, 0);
+			if (adev) {
+				connector->fwnode = acpi_fwnode_handle(adev);
+				break;
+			}
+			/* fallthrough */
+		default:
+			connector->fwnode = fwnode;
+			break;
+		}
+
+	}
+	drm_connector_list_iter_end(&conn_iter);
+}
+
 int intel_modeset_init(struct drm_device *dev)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
@@ -15406,6 +15446,7 @@ int intel_modeset_init(struct drm_device *dev)
 
 	drm_modeset_lock_all(dev);
 	intel_modeset_setup_hw_state(dev, dev->mode_config.acquire_ctx);
+	intel_assign_connector_fwnodes(dev);
 	drm_modeset_unlock_all(dev);
 
 	for_each_intel_crtc(dev, crtc) {
-- 
2.20.1
