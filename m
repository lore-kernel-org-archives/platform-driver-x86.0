From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 04/12] usb: common: Small class for USB role switches
Date: Fri, 16 Feb 2018 16:07:59 +0200
Message-ID: <CAHp75VcU1CUN5A9qFw4mDGjdeD+mtSWxx-YwtkaAXkUdcmcwpg@mail.gmail.com>
References: <20180216104751.8371-1-hdegoede@redhat.com> <20180216104751.8371-5-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180216104751.8371-5-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 16, 2018 at 12:47 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> USB role switch is a device that can be used to choose the
> data role for USB connector. With dual-role capable USB
> controllers, the controller itself will be the switch, but
> on some platforms the USB host and device controllers are
> separate IPs and there is a mux between them and the
> connector. On those platforms the mux driver will need to
> register the switch.
>
> With USB Type-C connectors, the host-to-device relationship
> is negotiated over the Configuration Channel (CC). That
> means the USB Type-C drivers need to be in control of the
> role switch. The class provides a simple API for the USB
> Type-C drivers for the control.
>
> For other types of USB connectors (mainly microAB) the class
> provides user space control via sysfs attribute file that
> can be used to request role swapping from the switch.

> +static int __switch_match(struct device *dev, const void *name)

bool?

> +{
> +       return !strcmp((const char *)name, dev_name(dev));
> +}


> +static ssize_t role_store(struct device *dev, struct device_attribute *attr,
> +                         const char *buf, size_t size)
> +{
> +       struct usb_role_switch *sw = to_role_switch(dev);
> +       int ret;
> +
> +       ret = sysfs_match_string(usb_roles, buf);
> +       if (ret < 0) {
> +               bool res;
> +
> +               /* Extra check if the user wants to disable the switch */
> +               ret = kstrtobool(buf, &res);
> +               if (ret || res)
> +                       return -EINVAL;
> +       }
> +

> +       ret = usb_role_switch_set_role(sw, ret);
> +       if (!ret)
> +               ret = size;
> +
> +       return ret;

Perhaps

ret = ...
if (ret)
 return ret;

return size;

> +}

> +struct usb_role_switch *
> +usb_role_switch_register(struct device *parent,
> +                        const struct usb_role_switch_desc *desc)
> +{
> +       struct usb_role_switch *sw;
> +       int ret;
> +
> +       if (!desc || !desc->set)
> +               return ERR_PTR(-EINVAL);
> +
> +       sw = kzalloc(sizeof(*sw), GFP_KERNEL);
> +       if (!sw)
> +               return ERR_PTR(-ENOMEM);

> +       ret = device_register(&sw->dev);
> +       if (ret) {
> +               put_device(&sw->dev);

Memory leak?

> +               return ERR_PTR(ret);
> +       }
> +
> +       /* TODO: Symlinks for the host port and the device controller. */
> +
> +       return sw;
> +}

> +void usb_role_switch_unregister(struct usb_role_switch *sw)
> +{
> +       if (sw && !IS_ERR(sw))

!IS_ERR_OR_NULL() ?

> +               device_unregister(&sw->dev);
> +}

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
