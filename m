From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 01/11] mux: core: Add of_mux_control_get helper function
Date: Fri,  1 Sep 2017 23:48:35 +0200
Message-ID: <20170901214845.7153-2-hdegoede@redhat.com>
References: <20170901214845.7153-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170901214845.7153-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Currently the mux_control_get implementation only deals with getting
mux controllers on DT platforms. This commit renames the current
implementation to of_mux_control_get to reflect this and makes
mux_control_get a wrapper around of_mux_control_get.

This is a preparation patch for adding support for getting muxes on
non DT platforms.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mux/core.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index e75d5adc5949..6142493c327b 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -422,14 +422,8 @@ static struct mux_chip *of_get_mux_chip_by_node(struct device_node *np)
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
+static struct mux_control *of_mux_control_get(struct device *dev,
+					      const char *mux_name)
 {
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args args;
@@ -483,6 +477,22 @@ struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
 
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
+	/* look up via DT first */
+	if (IS_ENABLED(CONFIG_OF) && dev->of_node)
+		return of_mux_control_get(dev, mux_name);
+
+	return ERR_PTR(-ENODEV);
+}
 EXPORT_SYMBOL_GPL(mux_control_get);
 
 /**
-- 
2.13.5
