From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: intel_cht_int33fe: Provide fwnode for
 the USB connector
Date: Thu, 21 Feb 2019 15:23:05 +0200
Message-ID: <CAHp75Vd5uxVEyv3Wx-Xcv58UHXaS8um6dPDELPz5AdG1nbpFHg@mail.gmail.com>
References: <20190219115959.55553-1-heikki.krogerus@linux.intel.com>
 <20190219115959.55553-2-heikki.krogerus@linux.intel.com> <CAHp75VcoqwP5VrOW60XtQHLAO1KOmc_Kyn-KQsZC-tsiwpQq3A@mail.gmail.com>
 <20190221093508.GF5054@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221093508.GF5054@kuha.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andy@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Feb 21, 2019 at 11:35 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Wed, Feb 20, 2019 at 05:55:21PM +0200, Andy Shevchenko wrote:
> > On Tue, Feb 19, 2019 at 2:00 PM Heikki Krogerus
> > <heikki.krogerus@linux.intel.com> wrote:
> > >
> > > In ACPI, and now also in DT, the USB connectors usually have
> > > their own device nodes. In case of USB Type-C, those
> > > connector (port) nodes are child nodes of the controller or
> > > PHY device, in our case the fusb302. The software fwnodes
> > > allow us to create a similar child node for fusb302 that
> > > represents the connector also on Intel CHT.
> > >
> > > This makes it possible replace the fusb302 specific device
> > > properties which were deprecated with the common USB
> > > connector properties that tcpm.c is able to use directly.
> >
> > > +       /* Node for the FUSB302 controller */
> > > +       data->fusb302_node = fwnode_create_software_node(fusb302_props, NULL);
> > > +       if (IS_ERR(data->fusb302_node))
> > > +               return PTR_ERR(data->fusb302_node);
> > > +
> > > +       /* Node for the connector (FUSB302 is the parent) */
> > > +       data->port_node = fwnode_create_software_node(usb_connector_props,
> > > +                                                     data->fusb302_node);
> > > +       if (IS_ERR(data->port_node)) {
> >
> > > +               fwnode_remove_software_node(data->fusb302_node);
> >
> > Sounds like a candidate for
> > devm_fwnode_create_software_node()
>
> If you don't mind, let's think about that later.

Sure.

>
> I'm not comfortable at all with the idea of introducing
> devm_fwnode_create_software_node(). I would like to talk about that
> separately. It's not going to be a problem to change this driver later
> even if we decide to add the function.

-- 
With Best Regards,
Andy Shevchenko
