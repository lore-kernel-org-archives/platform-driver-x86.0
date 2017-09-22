From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 02/14] mux: core: Add explicit hook to leave the mux as-is
 on init/registration
Date: Fri, 22 Sep 2017 20:37:51 +0200
Message-ID: <20170922183803.10701-2-hdegoede@redhat.com>
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

From: Peter Rosin <peda@axentia.se>

A board may need a mux controller to stay as-is for a while longer, e.g.
if setting the normally preferred idle state destroys booting.

The mechanism provided here is not perfect in two ways.
1. As soon as the mux controller is registered, some mux consumer can
   access it and set a state that destroys booting all the same.
2. The mux controller might linger in a state that is not the
   preferred idle state indefinitely, if no mux consumer ever selects
   and then deselects the mux.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mux/core.c         | 3 +++
 include/linux/mux/driver.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 244bceb17877..d0ad56abca2a 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -155,6 +155,9 @@ int mux_chip_register(struct mux_chip *mux_chip)
 	for (i = 0; i < mux_chip->controllers; ++i) {
 		struct mux_control *mux = &mux_chip->mux[i];
 
+		if (mux->init_as_is)
+			continue;
+
 		if (mux->idle_state == mux->cached_state)
 			continue;
 
diff --git a/include/linux/mux/driver.h b/include/linux/mux/driver.h
index 35c3579c3304..21cf6041a962 100644
--- a/include/linux/mux/driver.h
+++ b/include/linux/mux/driver.h
@@ -36,6 +36,9 @@ struct mux_control_ops {
  * @states:		The number of mux controller states.
  * @idle_state:		The mux controller state to use when inactive, or one
  *			of MUX_IDLE_AS_IS and MUX_IDLE_DISCONNECT.
+ * @init_as_is:		Set to true to have the core leave the mux controller
+ *			state as-is until first selection. If @idle_state is
+ *			MUX_IDLE_AS_IS, @init_as_is is irrelevant.
  *
  * Mux drivers may only change @states and @idle_state, and may only do so
  * between allocation and registration of the mux controller. Specifically,
@@ -50,6 +53,7 @@ struct mux_control {
 
 	unsigned int states;
 	int idle_state;
+	bool init_as_is;
 };
 
 /**
-- 
2.14.1
