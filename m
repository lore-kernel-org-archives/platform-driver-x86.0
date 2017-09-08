From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 2/2] mux: add explicit hook to leave the mux as-is on init/registration
Date: Fri,  8 Sep 2017 17:45:14 +0200
Message-ID: <20170908154514.4463-3-peda@axentia.se>
References: <20170905164221.11266-6-hdegoede@redhat.com>
 <20170908154514.4463-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170908154514.4463-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Peter Rosin <peda@axentia.se>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

A board may need a mux controller to stay as-is for a while longer, e.g.
if setting the normally preferred idle state destroys booting.

The mechanism provided here is not perfect in two ways.
1. As soon as the mux controller is registered, some mux consumer can
   access it and set a state that destroys booting all the same.
2. The mux controller might linger in a state that is not the
   preferred idle state indefinitely, if no mux consumer ever selects
   and then deselects the mux.
---
 drivers/mux/core.c         | 3 +++
 include/linux/mux/driver.h | 4 ++++
 2 files changed, 7 insertions(+)

Untested -> no sign-off, and I'm also really unsure about it because of
the imperfections mentioned in the commit message.

Cheers,
peda

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 2eb234300669..c81db7d4f9c8 100644
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
2.11.0
