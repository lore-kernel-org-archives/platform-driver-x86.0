From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 03/11] mux: consumer.h: Add MUX_USB_* state constant
 defines
Date: Sat, 2 Sep 2017 12:06:29 -0700
Message-ID: <20170902190629.GA30251@roeck-us.net>
References: <20170901214845.7153-1-hdegoede@redhat.com>
 <20170901214845.7153-4-hdegoede@redhat.com>
 <8a05c405-3649-ac99-d4ca-3e519e1c63a8@roeck-us.net>
 <3e777501-aa94-70ae-3dc5-f64a15fd9704@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3e777501-aa94-70ae-3dc5-f64a15fd9704-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Sep 02, 2017 at 05:59:14PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 02-09-17 16:59, Guenter Roeck wrote:
> >On 09/01/2017 02:48 PM, Hans de Goede wrote:
> >>Add MUX_USB_* state constant defines, which can be used by USB
> >>device/host and Type-C polarity/role/altmode mux drivers and consumers
> >>to ensure that they agree on the meaning of the mux_control_select()
> >>state argument.
> >>
> >>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>---
> >>  include/linux/mux/consumer.h | 16 ++++++++++++++++
> >>  1 file changed, 16 insertions(+)
> >>
> >>diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
> >>index 912dd48a3a5d..e3ec9b4db962 100644
> >>--- a/include/linux/mux/consumer.h
> >>+++ b/include/linux/mux/consumer.h
> >>@@ -15,6 +15,22 @@
> >>  #include <linux/compiler.h>
> >>+/*
> >>+ * Mux state values for USB muxes, used for both USB device/host role muxes
> >>+ * as well as for Type-C polarity/role/altmode muxes.
> >>+ *
> >>+ * MUX_USB_POLARITY_INV may be or-ed together with any other mux-state as
> >>+ * inverted-polarity (Type-C plugged in upside down) can happen with any
> >>+ * other mux-state.
> >>+ */
> >>+#define MUX_USB_POLARITY_INV    BIT(0)   /* Polarity inverted bit */
> >>+#define MUX_USB_NONE        (1 << 1) /* Mux open / not connected */
> >
> >
> >Why BIT(0) but (1 << 1) and so on ?
> 
> Because the polarity can be or-ed together with any of the other options.
> Each option can be selected normal and inverted polarity (connector
> inserted upside down).
> 
Ah yes, it is (2 << 1), not (1 << 2). But then why don't the options start
with (0 << 1) ?

I'll have to look into the series more closely; so far the polarity was
a separate parameter to tcpm_mux_set() and the low level API.

Guenter

> Regards,
> 
> Hans
> 
> >>+#define MUX_USB_DEVICE        (2 << 1) /* USB device mode */
> >>+#define MUX_USB_HOST        (3 << 1) /* USB host mode */
> >>+#define MUX_USB_HOST_AND_DP_SRC    (4 << 1) /* USB host + 2 lanes Display Port */
> >>+#define MUX_USB_DP_SRC        (5 << 1) /* 4 lanes Display Port source */
> >>+#define MUX_USB_STATES        (6 << 1)
> >>+
> >>  struct device;
> >>  struct mux_control;
> >>
> >
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
