From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 11/14] staging: typec: tcpm: Set mux to device mode when configured as such
Date: Fri, 22 Sep 2017 20:38:00 +0200
Message-ID: <20170922183803.10701-11-hdegoede@redhat.com>
References: <20170922183803.10701-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170922183803.10701-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Setting the mux to TYPEC_MUX_NONE, TCPC_USB_SWITCH_DISCONNECT when the
data-role is device is not correct. Plenty of devices support operating
as USB device through a (separate) USB device controller.

So this commit instead splits out TYPEC_MUX_USB into TYPEC_MUX_USB_HOST
and TYPEC_MUX_USB_DEVICE and makes tcpm_set_roles() set the mux
accordingly.

Likewise TCPC_MUX_DP gets renamed to TCPC_MUX_DP_SRC to make clear that
this is for configuring the Type-C port as a Display Port source, not a
sink.

Last this commit makes tcpm_reset_port() call tcpm_mux_set(port,
TYPEC_MUX_NONE, TCPC_USB_SWITCH_DISCONNECT) so that the mux does _not_
stay in its last mode after a detach.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v3:
-Improve / reword last paragraph of the commit message
-Add Guenter's Reviewed-by
---
 drivers/usb/typec/tcpm.c |  7 ++++---
 include/linux/usb/tcpm.h | 22 ++++++++++++++--------
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index f557c479fdc2..e104c218cb4a 100644
--- a/drivers/usb/typec/tcpm.c
+++ b/drivers/usb/typec/tcpm.c
@@ -751,11 +751,11 @@ static int tcpm_set_roles(struct tcpm_port *port, bool attached,
 	int ret;
 
 	if (data == TYPEC_HOST)
-		ret = tcpm_mux_set(port, TYPEC_MUX_USB,
+		ret = tcpm_mux_set(port, TYPEC_MUX_USB_HOST,
 				   TCPC_USB_SWITCH_CONNECT);
 	else
-		ret = tcpm_mux_set(port, TYPEC_MUX_NONE,
-				   TCPC_USB_SWITCH_DISCONNECT);
+		ret = tcpm_mux_set(port, TYPEC_MUX_USB_DEVICE,
+				   TCPC_USB_SWITCH_CONNECT);
 	if (ret < 0)
 		return ret;
 
@@ -1995,6 +1995,7 @@ static void tcpm_reset_port(struct tcpm_port *port)
 	tcpm_init_vconn(port);
 	tcpm_set_current_limit(port, 0, 0);
 	tcpm_set_polarity(port, TYPEC_POLARITY_CC1);
+	tcpm_mux_set(port, TYPEC_MUX_NONE, TCPC_USB_SWITCH_DISCONNECT);
 	tcpm_set_attached_state(port, false);
 	port->try_src_count = 0;
 	port->try_snk_count = 0;
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index 073197f0d2bb..bc76389ee257 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -103,17 +103,23 @@ enum tcpc_usb_switch {
 };
 
 /* Mux state attributes */
-#define TCPC_MUX_USB_ENABLED		BIT(0)	/* USB enabled */
-#define TCPC_MUX_DP_ENABLED		BIT(1)	/* DP enabled */
-#define TCPC_MUX_POLARITY_INVERTED	BIT(2)	/* Polarity inverted */
+#define TCPC_MUX_USB_DEVICE_ENABLED		BIT(0)	/* USB device enabled */
+#define TCPC_MUX_USB_HOST_ENABLED		BIT(1)	/* USB host enabled */
+#define TCPC_MUX_DP_SRC_ENABLED			BIT(2)	/* DP enabled */
+#define TCPC_MUX_POLARITY_INVERTED		BIT(3)	/* Polarity inverted */
 
 /* Mux modes, decoded to attributes */
 enum tcpc_mux_mode {
-	TYPEC_MUX_NONE	= 0,				/* Open switch */
-	TYPEC_MUX_USB	= TCPC_MUX_USB_ENABLED,		/* USB only */
-	TYPEC_MUX_DP	= TCPC_MUX_DP_ENABLED,		/* DP only */
-	TYPEC_MUX_DOCK	= TCPC_MUX_USB_ENABLED |	/* Both USB and DP */
-			  TCPC_MUX_DP_ENABLED,
+	/* Open switch */
+	TYPEC_MUX_NONE = 0,
+	/* USB device only */
+	TYPEC_MUX_USB_DEVICE = TCPC_MUX_USB_DEVICE_ENABLED,
+	/* USB host only */
+	TYPEC_MUX_USB_HOST = TCPC_MUX_USB_HOST_ENABLED,
+	/* DP source only */
+	TYPEC_MUX_DP = TCPC_MUX_DP_SRC_ENABLED,
+	/* Both USB host and DP source */
+	TYPEC_MUX_DOCK = TCPC_MUX_USB_HOST_ENABLED | TCPC_MUX_DP_SRC_ENABLED,
 };
 
 struct tcpc_mux_dev {
-- 
2.14.1
