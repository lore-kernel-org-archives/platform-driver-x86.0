From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 02/11] mux: core: Add support for getting a mux controller on
 a non DT platform
Date: Fri,  1 Sep 2017 23:48:36 +0200
Message-ID: <20170901214845.7153-3-hdegoede@redhat.com>
References: <20170901214845.7153-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170901214845.7153-1-hdegoede@redhat.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Hans de Goede <hdegoede@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

On non DT platforms we cannot get the mux_chip by pnode. Other subsystems
(regulator, clock, pwm) have the same problem and solve this by allowing
platform / board-setup code to add entries to a lookup table and then use
this table to look things up.

This commit adds support for getting a mux controller on a non DT platform
following this pattern. It is based on a simplified version of the pwm
subsys lookup code, the dev_id and mux_name parts of a lookup table entry
are mandatory in the mux-core implementation.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mux/core.c           | 96 +++++++++++++++++++++++++++++++++++++++++++-
 include/linux/mux/consumer.h | 11 +++++
 2 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 6142493c327b..8864cc745506 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -24,6 +24,9 @@
 #include <linux/of_platform.h>
 #include <linux/slab.h>
 
+static DEFINE_MUTEX(mux_lookup_lock);
+static LIST_HEAD(mux_lookup_list);
+
 /*
  * The idle-as-is "state" is not an actual state that may be selected, it
  * only implies that the state should not be changed. So, use that state
@@ -408,6 +411,23 @@ int mux_control_deselect(struct mux_control *mux)
 }
 EXPORT_SYMBOL_GPL(mux_control_deselect);
 
+static int parent_name_match(struct device *dev, const void *data)
+{
+	const char *parent_name = dev_name(dev->parent);
+	const char *name = data;
+
+	return strcmp(parent_name, name) == 0;
+}
+
+static struct mux_chip *mux_chip_get_by_name(const char *name)
+{
+	struct device *dev;
+
+	dev = class_find_device(&mux_class, NULL, name, parent_name_match);
+
+	return dev ? to_mux_chip(dev) : NULL;
+}
+
 static int of_dev_node_match(struct device *dev, const void *data)
 {
 	return dev->of_node == data;
@@ -479,6 +499,42 @@ static struct mux_control *of_mux_control_get(struct device *dev,
 }
 
 /**
+ * mux_add_table() - register PWM device consumers
+ * @table: array of consumers to register
+ * @num: number of consumers in table
+ */
+void mux_add_table(struct mux_lookup *table, size_t num)
+{
+	mutex_lock(&mux_lookup_lock);
+
+	while (num--) {
+		list_add_tail(&table->list, &mux_lookup_list);
+		table++;
+	}
+
+	mutex_unlock(&mux_lookup_lock);
+}
+EXPORT_SYMBOL_GPL(mux_add_table);
+
+/**
+ * mux_remove_table() - unregister PWM device consumers
+ * @table: array of consumers to unregister
+ * @num: number of consumers in table
+ */
+void mux_remove_table(struct mux_lookup *table, size_t num)
+{
+	mutex_lock(&mux_lookup_lock);
+
+	while (num--) {
+		list_del(&table->list);
+		table++;
+	}
+
+	mutex_unlock(&mux_lookup_lock);
+}
+EXPORT_SYMBOL_GPL(mux_remove_table);
+
+/**
  * mux_control_get() - Get the mux-control for a device.
  * @dev: The device that needs a mux-control.
  * @mux_name: The name identifying the mux-control.
@@ -487,11 +543,49 @@ static struct mux_control *of_mux_control_get(struct device *dev,
  */
 struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
 {
+	struct mux_lookup *m, *chosen = NULL;
+	const char *dev_id = dev_name(dev);
+	struct mux_chip *mux_chip;
+
 	/* look up via DT first */
 	if (IS_ENABLED(CONFIG_OF) && dev->of_node)
 		return of_mux_control_get(dev, mux_name);
 
-	return ERR_PTR(-ENODEV);
+	/*
+	 * For non DT we look up the provider in the static table typically
+	 * provided by board setup code.
+	 *
+	 * If a match is found, the provider mux chip is looked up by name
+	 * and a mux-control is requested using the table provided index.
+	 */
+	mutex_lock(&mux_lookup_lock);
+	list_for_each_entry(m, &mux_lookup_list, list) {
+		if (WARN_ON(!m->dev_id || !m->mux_name || !m->provider))
+			continue;
+
+		if (strcmp(m->dev_id, dev_id) == 0 &&
+		    strcmp(m->mux_name, mux_name) == 0) {
+			chosen = m;
+			break;
+		}
+	}
+	mutex_unlock(&mux_lookup_lock);
+
+	if (!chosen)
+		return ERR_PTR(-ENODEV);
+
+	mux_chip = mux_chip_get_by_name(chosen->provider);
+	if (!mux_chip)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	if (chosen->index >= mux_chip->controllers) {
+		dev_err(dev, "Mux lookup table index out of bounds %u >= %u\n",
+			chosen->index, mux_chip->controllers);
+		put_device(&mux_chip->dev);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return &mux_chip->mux[chosen->index];
 }
 EXPORT_SYMBOL_GPL(mux_control_get);
 
diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
index ea96d4c82be7..912dd48a3a5d 100644
--- a/include/linux/mux/consumer.h
+++ b/include/linux/mux/consumer.h
@@ -18,6 +18,17 @@
 struct device;
 struct mux_control;
 
+struct mux_lookup {
+	struct list_head list;
+	const char *provider;
+	unsigned int index;
+	const char *dev_id;
+	const char *mux_name;
+};
+
+void mux_add_table(struct mux_lookup *table, size_t num);
+void mux_remove_table(struct mux_lookup *table, size_t num);
+
 unsigned int mux_control_states(struct mux_control *mux);
 int __must_check mux_control_select(struct mux_control *mux,
 				    unsigned int state);
-- 
2.13.5
