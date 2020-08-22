From: Rajmohan Mani <rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 3/3] usb: typec: intel_pmc_mux: Support for device role (UFP)
Date: Fri, 21 Aug 2020 21:05:08 -0700
Message-ID: <20200822040508.23510-4-rajmohan.mani@intel.com>
References: <20200822040508.23510-1-rajmohan.mani@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200822040508.23510-1-rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ayman Bagabas <ayman.bagabas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jithu Joseph <jithu.joseph-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Bla=C5=BE=20Hrastnik?= <blaz-piQ53kQ5nys@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: pmalani-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Rajmohan Mani <rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

This adds support for device data role, and data role
swapping. The driver no longer relies on the cached role, as
it may not be valid (for example after bootup). Instead, the
role is always checked by readding the port status from IOM.

Note. After this, the orientation is always only cached, so
the driver does not support scenario where the role is set
before orientation. It means the typec drivers must always
set the orientation first before role.

Signed-off-by: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Signed-off-by: Rajmohan Mani <rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 67 ++++++++++++++-------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index c758d6113c41..d4ee7132227b 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -191,9 +191,6 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
 		return pmc_usb_mux_dp_hpd(port, state->data);
 	}
 
-	if (data->status & DP_STATUS_IRQ_HPD)
-		return pmc_usb_mux_dp_hpd(port, state->data);
-
 	req.usage = PMC_USB_ALT_MODE;
 	req.usage |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
 	req.mode_type = PMC_USB_MODE_TYPE_DP << PMC_USB_MODE_TYPE_SHIFT;
@@ -312,39 +309,52 @@ static int pmc_usb_mux_safe_state(struct pmc_usb_port *port)
 	return pmc_usb_command(port, &msg, sizeof(msg));
 }
 
-static int pmc_usb_connect(struct pmc_usb_port *port)
+static int pmc_usb_disconnect(struct pmc_usb_port *port)
 {
+	struct typec_displayport_data data = { };
 	u8 msg[2];
 
-	if (port->iom_status & IOM_PORT_STATUS_CONNECTED)
+	if (!(port->iom_status & IOM_PORT_STATUS_CONNECTED))
 		return 0;
 
-	msg[0] = PMC_USB_CONNECT;
+	/* Clear DisplayPort HPD if it's still asserted. */
+	if (IOM_PORT_HPD_ASSERTED(port->iom_status))
+		pmc_usb_mux_dp_hpd(port, &data);
+
+	msg[0] = PMC_USB_DISCONNECT;
 	msg[0] |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
 
 	msg[1] = port->usb2_port << PMC_USB_MSG_USB2_PORT_SHIFT;
-	msg[1] |= hsl_orientation(port) << PMC_USB_MSG_ORI_HSL_SHIFT;
-	msg[1] |= sbu_orientation(port) << PMC_USB_MSG_ORI_AUX_SHIFT;
 
 	return pmc_usb_command(port, msg, sizeof(msg));
 }
 
-static int pmc_usb_disconnect(struct pmc_usb_port *port)
+static int pmc_usb_connect(struct pmc_usb_port *port, enum usb_role role)
 {
-	struct typec_displayport_data data = { };
+	u8 ufp = role == USB_ROLE_DEVICE ? 1 : 0;
 	u8 msg[2];
+	int ret;
 
-	if (!(port->iom_status & IOM_PORT_STATUS_CONNECTED))
-		return 0;
+	if (port->orientation == TYPEC_ORIENTATION_NONE)
+		return -EINVAL;
 
-	/* Clear DisplayPort HPD if it's still asserted. */
-	if (IOM_PORT_HPD_ASSERTED(port->iom_status))
-		pmc_usb_mux_dp_hpd(port, &data);
+	if (port->iom_status & IOM_PORT_STATUS_CONNECTED) {
+		if (port->role == role || port->role == USB_ROLE_NONE)
+			return 0;
 
-	msg[0] = PMC_USB_DISCONNECT;
+		/* Role swap */
+		ret = pmc_usb_disconnect(port);
+		if (ret)
+			return ret;
+	}
+
+	msg[0] = PMC_USB_CONNECT;
 	msg[0] |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
 
 	msg[1] = port->usb2_port << PMC_USB_MSG_USB2_PORT_SHIFT;
+	msg[1] |= ufp << PMC_USB_MSG_UFP_SHIFT;
+	msg[1] |= hsl_orientation(port) << PMC_USB_MSG_ORI_HSL_SHIFT;
+	msg[1] |= sbu_orientation(port) << PMC_USB_MSG_ORI_AUX_SHIFT;
 
 	return pmc_usb_command(port, msg, sizeof(msg));
 }
@@ -365,7 +375,7 @@ pmc_usb_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
 	if (state->mode == TYPEC_STATE_SAFE)
 		return pmc_usb_mux_safe_state(port);
 	if (state->mode == TYPEC_STATE_USB)
-		return pmc_usb_connect(port);
+		return pmc_usb_connect(port, port->role);
 
 	if (state->alt) {
 		switch (state->alt->svid) {
@@ -380,7 +390,7 @@ pmc_usb_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
 			/* REVISIT: Try with usb3_port set to 0? */
 			break;
 		case TYPEC_MODE_USB3:
-			return pmc_usb_connect(port);
+			return pmc_usb_connect(port, port->role);
 		case TYPEC_MODE_USB4:
 			return pmc_usb_mux_usb4(port, state);
 		}
@@ -401,13 +411,6 @@ static int pmc_usb_set_orientation(struct typec_switch *sw,
 
 	port->orientation = orientation;
 
-	if (port->role) {
-		if (orientation == TYPEC_ORIENTATION_NONE)
-			return pmc_usb_disconnect(port);
-		else
-			return pmc_usb_connect(port);
-	}
-
 	return 0;
 }
 
@@ -420,16 +423,14 @@ static int pmc_usb_set_role(struct usb_role_switch *sw, enum usb_role role)
 	if (ret)
 		return ret;
 
-	port->role = role;
+	if (role == USB_ROLE_NONE)
+		ret = pmc_usb_disconnect(port);
+	else
+		ret = pmc_usb_connect(port, role);
 
-	if (port->orientation) {
-		if (role == USB_ROLE_NONE)
-			return pmc_usb_disconnect(port);
-		else
-			return pmc_usb_connect(port);
-	}
+	port->role = role;
 
-	return 0;
+	return ret;
 }
 
 static int pmc_usb_register_port(struct pmc_usb *pmc, int index,
-- 
2.20.1
