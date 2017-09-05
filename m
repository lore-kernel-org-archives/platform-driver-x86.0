From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 08/11] staging: typec: tcpm: Set mux to device mode when
 configured as such
Date: Tue,  5 Sep 2017 18:42:18 +0200
Message-ID: <20170905164221.11266-9-hdegoede@redhat.com>
References: <20170905164221.11266-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170905164221.11266-1-hdegoede@redhat.com>
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

Setting the mux to TYPEC_MUX_NONE, TCPC_USB_SWITCH_DISCONNECT when the
data-role is device is not correct. Plenty of devices support operating
as USB device through a (separate) USB device controller.

So this commit instead splits out TYPEC_MUX_USB into TYPEC_MUX_USB_HOST
and TYPEC_MUX_USB_DEVICE and makes tcpm_set_roles() set the mux
accordingly.

Likewise TCPC_MUX_DP gets renamed to TCPC_MUX_DP_SRC to make clear that
this is for configuring the Type-C port as a Display Port source, not a
sink.

Last this commit makes tcpm_reset_port() to set the mux to
TYPEC_MUX_NONE, TCPC_USB_SWITCH_DISCONNECT so that it does not and up
staying in host (and with this commit also device) mode after a detach.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/typec/tcpm.c |  7 ++++---
 drivers/staging/typec/tcpm.h | 22 ++++++++++++++--------
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/typec/tcpm.c b/drivers/staging/typec/tcpm.c
index 8af62e74d54c..ffe7e26d4ed3 100644
--- a/drivers/staging/typec/tcpm.c
+++ b/drivers/staging/typec/tcpm.c
@@ -752,11 +752,11 @@ static int tcpm_set_roles(struct tcpm_port *port, bool attached,
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
 
@@ -2025,6 +2025,7 @@ static void tcpm_reset_port(struct tcpm_port *port)
 	tcpm_init_vconn(port);
 	tcpm_set_current_limit(port, 0, 0);
 	tcpm_set_polarity(port, TYPEC_POLARITY_CC1);
+	tcpm_mux_set(port, TYPEC_MUX_NONE, TCPC_USB_SWITCH_DISCONNECT);
 	tcpm_set_attached_state(port, false);
 	port->try_src_count = 0;
 	port->try_snk_count = 0;
diff --git a/drivers/staging/typec/tcpm.h b/drivers/staging/typec/tcpm.h
index 7e9a6b7b5cd6..f662eed48c86 100644
--- a/drivers/staging/typec/tcpm.h
+++ b/drivers/staging/typec/tcpm.h
@@ -83,17 +83,23 @@ enum tcpc_usb_switch {
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
2.13.5
