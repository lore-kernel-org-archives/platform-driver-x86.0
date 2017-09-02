From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 05/11] mux: Add Intel Cherrytrail USB mux driver
Date: Sat, 2 Sep 2017 13:37:24 +0300
Message-ID: <20170902103724.mx7dpggrbbwx57ls@mwanda>
References: <20170901214845.7153-1-hdegoede@redhat.com>
 <20170901214845.7153-6-hdegoede@redhat.com>
 <CAHp75VfEmHMTh_p==2_O6R4dqzUTDr9-qpQ2n9NQ77=teAkqRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VfEmHMTh_p==2_O6R4dqzUTDr9-qpQ2n9NQ77=teAkqRg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, USB <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Darren Hart <dvhart@infradead.org>, Peter Rosin <peda@axentia.se>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Sep 02, 2017 at 01:19:05PM +0300, Andy Shevchenko wrote:
> > +static void intel_cht_usb_mux_vbus_work(struct work_struct *work)
> > +{
> > +       struct intel_cht_usb_mux *mux =
> > +               container_of(work, struct intel_cht_usb_mux, vbus_work);
> > +       bool vbus_present = false;
> > +       int i;
> 
> unsigned int i; ?
> 

int i is fine.  Static checkers which complain about stuff like that
should be uninstalled.

> > +
> > +       for (i = 0; i < ARRAY_SIZE(vbus_cable_ids); i++) {

regards,
dan carpenter
