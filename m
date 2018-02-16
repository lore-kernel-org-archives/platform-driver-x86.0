From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 04/12] usb: common: Small class for USB role switches
Date: Fri, 16 Feb 2018 16:22:09 +0200
Message-ID: <20180216142209.GS1480@kuha.fi.intel.com>
References: <20180216104751.8371-1-hdegoede@redhat.com>
 <20180216104751.8371-5-hdegoede@redhat.com>
 <CAHp75VcU1CUN5A9qFw4mDGjdeD+mtSWxx-YwtkaAXkUdcmcwpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:8323 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1034176AbeBPOWO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Feb 2018 09:22:14 -0500
Content-Disposition: inline
In-Reply-To: <CAHp75VcU1CUN5A9qFw4mDGjdeD+mtSWxx-YwtkaAXkUdcmcwpg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB <linux-usb@vger.kernel.org>

On Fri, Feb 16, 2018 at 04:07:59PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 16, 2018 at 12:47 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> 
> > USB role switch is a device that can be used to choose the
> > data role for USB connector. With dual-role capable USB
> > controllers, the controller itself will be the switch, but
> > on some platforms the USB host and device controllers are
> > separate IPs and there is a mux between them and the
> > connector. On those platforms the mux driver will need to
> > register the switch.
> >
> > With USB Type-C connectors, the host-to-device relationship
> > is negotiated over the Configuration Channel (CC). That
> > means the USB Type-C drivers need to be in control of the
> > role switch. The class provides a simple API for the USB
> > Type-C drivers for the control.
> >
> > For other types of USB connectors (mainly microAB) the class
> > provides user space control via sysfs attribute file that
> > can be used to request role swapping from the switch.
> 
> > +static int __switch_match(struct device *dev, const void *name)
> 
> bool?

No, this is callback for class_find_device(). It takes int so int it
is.

> > +{
> > +       return !strcmp((const char *)name, dev_name(dev));
> > +}
> 
> 
> > +static ssize_t role_store(struct device *dev, struct device_attribute *attr,
> > +                         const char *buf, size_t size)
> > +{
> > +       struct usb_role_switch *sw = to_role_switch(dev);
> > +       int ret;
> > +
> > +       ret = sysfs_match_string(usb_roles, buf);
> > +       if (ret < 0) {
> > +               bool res;
> > +
> > +               /* Extra check if the user wants to disable the switch */
> > +               ret = kstrtobool(buf, &res);
> > +               if (ret || res)
> > +                       return -EINVAL;
> > +       }
> > +
> 
> > +       ret = usb_role_switch_set_role(sw, ret);
> > +       if (!ret)
> > +               ret = size;
> > +
> > +       return ret;
> 
> Perhaps
> 
> ret = ...
> if (ret)
>  return ret;
> 
> return size;

Sure. Hans, can you clean-up this as well?

> > +}
> 
> > +struct usb_role_switch *
> > +usb_role_switch_register(struct device *parent,
> > +                        const struct usb_role_switch_desc *desc)
> > +{
> > +       struct usb_role_switch *sw;
> > +       int ret;
> > +
> > +       if (!desc || !desc->set)
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       sw = kzalloc(sizeof(*sw), GFP_KERNEL);
> > +       if (!sw)
> > +               return ERR_PTR(-ENOMEM);
> 
> > +       ret = device_register(&sw->dev);
> > +       if (ret) {
> > +               put_device(&sw->dev);
> 
> Memory leak?

No. Check usb_role_switch_release().


Thanks,

-- 
heikki
