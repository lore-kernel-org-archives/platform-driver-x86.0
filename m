From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 1/2] mux: add mux_control_get_optional() API
Date: Fri,  8 Sep 2017 17:45:13 +0200
Message-ID: <20170908154514.4463-2-peda@axentia.se>
References: <20170905164221.11266-6-hdegoede@redhat.com>
 <20170908154514.4463-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170908154514.4463-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Stephen Boyd <stephen.boyd@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Peter Rosin <peda@axentia.se>
List-Id: platform-driver-x86.vger.kernel.org

From: Stephen Boyd <stephen.boyd@linaro.org>

Sometimes drivers only use muxes under certain scenarios. For
example, the chipidea usb controller may be connected to a usb
switch on some platforms, and connected directly to a usb port on
others. The driver won't know one way or the other though, so add
a mux_control_get_optional() API that allows the driver to
differentiate errors getting the mux from there not being a mux
for the driver to use at all.
---
 Documentation/driver-model/devres.txt |   1 +
 drivers/mux/core.c                    | 104 +++++++++++++++++++++++++++-------
 include/linux/mux/consumer.h          |   4 ++
 3 files changed, 89 insertions(+), 20 deletions(-)

I haven't tested this patch, and hence I have not signed it and I also
removed the sign-off from Stephen...

Cheers,
peda

diff --git a/Documentation/driver-model/devres.txt b/Documentation/driver-model/devres.txt
index 30e04f7a690d..4fdd3e63ff8b 100644
--- a/Documentation/driver-model/devres.txt
+++ b/Documentation/driver-model/devres.txt
@@ -342,6 +342,7 @@ MUX
   devm_mux_chip_alloc()
   devm_mux_chip_register()
   devm_mux_control_get()
+  devm_mux_control_get_optional()
 
 PER-CPU MEM
   devm_alloc_percpu()
diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 2260063b0ea8..2eb234300669 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -289,6 +289,9 @@ EXPORT_SYMBOL_GPL(devm_mux_chip_register);
  */
 unsigned int mux_control_states(struct mux_control *mux)
 {
+	if (!mux)
+		return 0;
+
 	return mux->states;
 }
 EXPORT_SYMBOL_GPL(mux_control_states);
@@ -338,6 +341,9 @@ int mux_control_select(struct mux_control *mux, unsigned int state)
 {
 	int ret;
 
+	if (!mux)
+		return 0;
+
 	ret = down_killable(&mux->lock);
 	if (ret < 0)
 		return ret;
@@ -370,6 +376,9 @@ int mux_control_try_select(struct mux_control *mux, unsigned int state)
 {
 	int ret;
 
+	if (!mux)
+		return 0;
+
 	if (down_trylock(&mux->lock))
 		return -EBUSY;
 
@@ -398,6 +407,9 @@ int mux_control_deselect(struct mux_control *mux)
 {
 	int ret = 0;
 
+	if (!mux)
+		return 0;
+
 	if (mux->idle_state != MUX_IDLE_AS_IS &&
 	    mux->idle_state != mux->cached_state)
 		ret = mux_control_set(mux, mux->idle_state);
@@ -422,14 +434,8 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
 	return dev ? to_mux_chip(dev) : NULL;
 }
 
-/**
- * mux_control_get() - Get the mux-control for a device.
- * @dev: The device that needs a mux-control.
- * @mux_name: The name identifying the mux-control.
- *
- * Return: A pointer to the mux-control, or an ERR_PTR with a negative errno.
- */
-struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
+static struct mux_control *
+__mux_control_get(struct device *dev, const char *mux_name, bool optional)
 {
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args args;
@@ -441,16 +447,22 @@ struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
 	if (mux_name) {
 		index = of_property_match_string(np, "mux-control-names",
 						 mux_name);
+		if ((index == -EINVAL || index == -ENODATA) && optional)
+			return NULL;
 		if (index < 0) {
 			dev_err(dev, "mux controller '%s' not found\n",
 				mux_name);
 			return ERR_PTR(index);
 		}
+		/* OF does point to a mux, so it's no longer optional */
+		optional = false;
 	}
 
 	ret = of_parse_phandle_with_args(np,
 					 "mux-controls", "#mux-control-cells",
 					 index, &args);
+	if (ret == -ENOENT && optional)
+		return NULL;
 	if (ret) {
 		dev_err(dev, "%pOF: failed to get mux-control %s(%i)\n",
 			np, mux_name ?: "", index);
@@ -482,9 +494,36 @@ struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
 	get_device(&mux_chip->dev);
 	return &mux_chip->mux[controller];
 }
+
+/**
+ * mux_control_get() - Get the mux-control for a device.
+ * @dev: The device that needs a mux-control.
+ * @mux_name: The name identifying the mux-control.
+ *
+ * Return: A pointer to the mux-control, or an ERR_PTR with a negative errno.
+ */
+struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
+{
+	return __mux_control_get(dev, mux_name, false);
+}
 EXPORT_SYMBOL_GPL(mux_control_get);
 
 /**
+ * mux_control_get_optional() - Get the optional mux-control for a device.
+ * @dev: The device that needs a mux-control.
+ * @mux_name: The name identifying the mux-control.
+ *
+ * Return: NULL if no mux with the provided name is found, a pointer to
+ * the named mux-control or an ERR_PTR with a negative errno.
+ */
+struct mux_control *
+mux_control_get_optional(struct device *dev, const char *mux_name)
+{
+	return __mux_control_get(dev, mux_name, true);
+}
+EXPORT_SYMBOL_GPL(mux_control_get_optional);
+
+/**
  * mux_control_put() - Put away the mux-control for good.
  * @mux: The mux-control to put away.
  *
@@ -492,6 +531,9 @@ EXPORT_SYMBOL_GPL(mux_control_get);
  */
 void mux_control_put(struct mux_control *mux)
 {
+	if (!mux)
+		return;
+
 	put_device(&mux->chip->dev);
 }
 EXPORT_SYMBOL_GPL(mux_control_put);
@@ -503,16 +545,8 @@ static void devm_mux_control_release(struct device *dev, void *res)
 	mux_control_put(mux);
 }
 
-/**
- * devm_mux_control_get() - Get the mux-control for a device, with resource
- *			    management.
- * @dev: The device that needs a mux-control.
- * @mux_name: The name identifying the mux-control.
- *
- * Return: Pointer to the mux-control, or an ERR_PTR with a negative errno.
- */
-struct mux_control *devm_mux_control_get(struct device *dev,
-					 const char *mux_name)
+static struct mux_control *
+__devm_mux_control_get(struct device *dev, const char *mux_name, bool optional)
 {
 	struct mux_control **ptr, *mux;
 
@@ -520,8 +554,8 @@ struct mux_control *devm_mux_control_get(struct device *dev,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	mux = mux_control_get(dev, mux_name);
-	if (IS_ERR(mux)) {
+	mux = __mux_control_get(dev, mux_name, optional);
+	if (IS_ERR_OR_NULL(mux)) {
 		devres_free(ptr);
 		return mux;
 	}
@@ -531,8 +565,38 @@ struct mux_control *devm_mux_control_get(struct device *dev,
 
 	return mux;
 }
+
+/**
+ * devm_mux_control_get() - Get the mux-control for a device, with resource
+ *			    management.
+ * @dev: The device that needs a mux-control.
+ * @mux_name: The name identifying the mux-control.
+ *
+ * Return: Pointer to the mux-control, or an ERR_PTR with a negative errno.
+ */
+struct mux_control *
+devm_mux_control_get(struct device *dev, const char *mux_name)
+{
+	return __devm_mux_control_get(dev, mux_name, false);
+}
 EXPORT_SYMBOL_GPL(devm_mux_control_get);
 
+/**
+ * devm_mux_control_get_optional() - Get the optional mux-control for a device,
+ *				     with resource management.
+ * @dev: The device that needs a mux-control.
+ * @mux_name: The name identifying the mux-control.
+ *
+ * Return: NULL if no mux with the provided name is found, a pointer to
+ * the named mux-control or an ERR_PTR with a negative errno.
+ */
+struct mux_control *
+devm_mux_control_get_optional(struct device *dev, const char *mux_name)
+{
+	return __devm_mux_control_get(dev, mux_name, true);
+}
+EXPORT_SYMBOL_GPL(devm_mux_control_get_optional);
+
 /*
  * Using subsys_initcall instead of module_init here to try to ensure - for
  * the non-modular case - that the subsystem is initialized when mux consumers
diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
index ea96d4c82be7..fc98547bf494 100644
--- a/include/linux/mux/consumer.h
+++ b/include/linux/mux/consumer.h
@@ -26,9 +26,13 @@ int __must_check mux_control_try_select(struct mux_control *mux,
 int mux_control_deselect(struct mux_control *mux);
 
 struct mux_control *mux_control_get(struct device *dev, const char *mux_name);
+struct mux_control *mux_control_get_optional(struct device *dev,
+					     const char *mux_name);
 void mux_control_put(struct mux_control *mux);
 
 struct mux_control *devm_mux_control_get(struct device *dev,
 					 const char *mux_name);
+struct mux_control *devm_mux_control_get_optional(struct device *dev,
+						  const char *mux_name);
 
 #endif /* _LINUX_MUX_CONSUMER_H */
-- 
2.11.0
