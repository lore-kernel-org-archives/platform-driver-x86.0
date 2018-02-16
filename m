From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 06/12] usb: typec: tcpm: Use new Type-C switch/mux and usb-role-switch functions
Date: Fri, 16 Feb 2018 11:47:45 +0100
Message-ID: <20180216104751.8371-7-hdegoede@redhat.com>
References: <20180216104751.8371-1-hdegoede@redhat.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180216104751.8371-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Remove the unused (not implemented anywhere) tcpc_mux_dev abstraction
and replace it with calling the new typec_set_orientation,
usb_role_switch_set and typec_set_mode functions.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/typec/Kconfig           |  1 +
 drivers/usb/typec/fusb302/fusb302.c |  1 -
 drivers/usb/typec/tcpm.c            | 46 ++++++++++++++++++++++++++++---------
 include/linux/usb/tcpm.h            | 10 --------
 4 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index bcb2744c5977..a2a0684e7c82 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -48,6 +48,7 @@ if TYPEC
 config TYPEC_TCPM
 	tristate "USB Type-C Port Controller Manager"
 	depends on USB
+	select USB_ROLE_SWITCH
 	help
 	  The Type-C Port Controller Manager provides a USB PD and USB Type-C
 	  state machine for use with Type-C Port Controllers.
diff --git a/drivers/usb/typec/fusb302/fusb302.c b/drivers/usb/typec/fusb302/fusb302.c
index 9ce4756adad6..b267b907bf24 100644
--- a/drivers/usb/typec/fusb302/fusb302.c
+++ b/drivers/usb/typec/fusb302/fusb302.c
@@ -1249,7 +1249,6 @@ static void init_tcpc_dev(struct tcpc_dev *fusb302_tcpc_dev)
 	fusb302_tcpc_dev->set_roles = tcpm_set_roles;
 	fusb302_tcpc_dev->start_drp_toggling = tcpm_start_drp_toggling;
 	fusb302_tcpc_dev->pd_transmit = tcpm_pd_transmit;
-	fusb302_tcpc_dev->mux = NULL;
 }
 
 static const char * const cc_polarity_name[] = {
diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index 00ca2822432f..bfcaf6618a1f 100644
--- a/drivers/usb/typec/tcpm.c
+++ b/drivers/usb/typec/tcpm.c
@@ -20,6 +20,7 @@
 #include <linux/usb/pd.h>
 #include <linux/usb/pd_bdo.h>
 #include <linux/usb/pd_vdo.h>
+#include <linux/usb/role.h>
 #include <linux/usb/tcpm.h>
 #include <linux/usb/typec.h>
 #include <linux/workqueue.h>
@@ -176,6 +177,7 @@ struct tcpm_port {
 	struct typec_port *typec_port;
 
 	struct tcpc_dev	*tcpc;
+	struct usb_role_switch *role_sw;
 
 	enum typec_role vconn_role;
 	enum typec_role pwr_role;
@@ -618,18 +620,25 @@ void tcpm_pd_transmit_complete(struct tcpm_port *port,
 EXPORT_SYMBOL_GPL(tcpm_pd_transmit_complete);
 
 static int tcpm_mux_set(struct tcpm_port *port, enum tcpc_mux_mode mode,
-			enum usb_role usb_role)
+			enum usb_role usb_role,
+			enum typec_orientation orientation)
 {
-	int ret = 0;
+	int ret;
 
-	tcpm_log(port, "Requesting mux mode %d, usb-role %d, polarity %d",
-		 mode, usb_role, port->polarity);
+	tcpm_log(port, "Requesting mux mode %d, usb-role %d, orientation %d",
+		 mode, usb_role, orientation);
 
-	if (port->tcpc->mux)
-		ret = port->tcpc->mux->set(port->tcpc->mux, mode, usb_role,
-					   port->polarity);
+	ret = typec_set_orientation(port->typec_port, orientation);
+	if (ret)
+		return ret;
 
-	return ret;
+	if (port->role_sw) {
+		ret = usb_role_switch_set_role(port->role_sw, usb_role);
+		if (ret)
+			return ret;
+	}
+
+	return typec_set_mode(port->typec_port, mode);
 }
 
 static int tcpm_set_polarity(struct tcpm_port *port,
@@ -742,15 +751,21 @@ static int tcpm_set_attached_state(struct tcpm_port *port, bool attached)
 static int tcpm_set_roles(struct tcpm_port *port, bool attached,
 			  enum typec_role role, enum typec_data_role data)
 {
+	enum typec_orientation orientation;
 	enum usb_role usb_role;
 	int ret;
 
+	if (port->polarity == TYPEC_POLARITY_CC1)
+		orientation = TYPEC_ORIENTATION_NORMAL;
+	else
+		orientation = TYPEC_ORIENTATION_REVERSE;
+
 	if (data == TYPEC_HOST)
 		usb_role = USB_ROLE_HOST;
 	else
 		usb_role = USB_ROLE_DEVICE;
 
-	ret = tcpm_mux_set(port, TYPEC_MUX_USB, usb_role);
+	ret = tcpm_mux_set(port, TYPEC_MUX_USB, usb_role, orientation);
 	if (ret < 0)
 		return ret;
 
@@ -2097,7 +2112,8 @@ static int tcpm_src_attach(struct tcpm_port *port)
 out_disable_pd:
 	port->tcpc->set_pd_rx(port->tcpc, false);
 out_disable_mux:
-	tcpm_mux_set(port, TYPEC_MUX_NONE, USB_ROLE_NONE);
+	tcpm_mux_set(port, TYPEC_MUX_NONE, USB_ROLE_NONE,
+		     TYPEC_ORIENTATION_NONE);
 	return ret;
 }
 
@@ -2141,7 +2157,8 @@ static void tcpm_reset_port(struct tcpm_port *port)
 	tcpm_init_vconn(port);
 	tcpm_set_current_limit(port, 0, 0);
 	tcpm_set_polarity(port, TYPEC_POLARITY_CC1);
-	tcpm_mux_set(port, TYPEC_MUX_NONE, USB_ROLE_NONE);
+	tcpm_mux_set(port, TYPEC_MUX_NONE, USB_ROLE_NONE,
+		     TYPEC_ORIENTATION_NONE);
 	tcpm_set_attached_state(port, false);
 	port->try_src_count = 0;
 	port->try_snk_count = 0;
@@ -3742,6 +3759,12 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	port->partner_desc.identity = &port->partner_ident;
 	port->port_type = tcpc->config->type;
 
+	port->role_sw = usb_role_switch_get(port->dev);
+	if (IS_ERR(port->role_sw)) {
+		err = PTR_ERR(port->role_sw);
+		goto out_destroy_wq;
+	}
+
 	port->typec_port = typec_register_port(port->dev, &port->typec_caps);
 	if (IS_ERR(port->typec_port)) {
 		err = PTR_ERR(port->typec_port);
@@ -3777,6 +3800,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	return port;
 
 out_destroy_wq:
+	usb_role_switch_put(port->role_sw);
 	destroy_workqueue(port->wq);
 	return ERR_PTR(err);
 }
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index 268721bff2c1..fe3508e6e1df 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -16,7 +16,6 @@
 #define __LINUX_USB_TCPM_H
 
 #include <linux/bitops.h>
-#include <linux/usb/role.h>
 #include <linux/usb/typec.h>
 #include "pd.h"
 
@@ -112,14 +111,6 @@ enum tcpc_mux_mode {
 			  TCPC_MUX_DP_ENABLED,
 };
 
-struct tcpc_mux_dev {
-	int (*set)(struct tcpc_mux_dev *dev, enum tcpc_mux_mode mux_mode,
-		   enum usb_role usb_role,
-		   enum typec_cc_polarity polarity);
-	bool dfp_only;
-	void *priv_data;
-};
