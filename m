From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 03/14] mux: core: Add of_mux_control_get helper function
Date: Fri, 22 Sep 2017 20:37:52 +0200
Message-ID: <20170922183803.10701-3-hdegoede@redhat.com>
References: <20170922183803.10701-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170922183803.10701-1-hdegoede@redhat.com>
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

Currently the mux_control_get implementation only deals with getting
mux controllers on DT platforms. This commit renames the current
implementation to of_mux_control_get to reflect this and makes
mux_control_get a wrapper around of_mux_control_get.

This is a preparation patch for adding support for getting muxes on
non DT platforms.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mux/core.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index d0ad56abca2a..8c0a4c83cdc5 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -439,7 +439,7 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
 }
 
 static struct mux_control *
-__mux_control_get(struct device *dev, const char *mux_name, bool optional)
+of_mux_control_get(struct device *dev, const char *mux_name, bool optional)
 {
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args args;
@@ -500,6 +500,16 @@ __mux_control_get(struct device *dev, const char *mux_name, bool optional)
 	return &mux_chip->mux[controller];
 }
 
+static struct mux_control *
+__mux_control_get(struct device *dev, const char *mux_name, bool optional)
+{
+	/* look up via DT first */
+	if (IS_ENABLED(CONFIG_OF) && dev->of_node)
+		return of_mux_control_get(dev, mux_name, optional);
+
+	return optional ? NULL : ERR_PTR(-ENODEV);
+}
+
 /**
  * mux_control_get() - Get the mux-control for a device.
  * @dev: The device that needs a mux-control.
-- 
2.14.1
