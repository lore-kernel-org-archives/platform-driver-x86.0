From: Prashant Malani <pmalani-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/3] platform/x86: Add Intel Input Output Manager
 (IOM) driver
Date: Mon, 24 Aug 2020 15:47:26 -0700
Message-ID: <20200824224726.GA48297@google.com>
References: <20200822040508.23510-1-rajmohan.mani@intel.com>
 <20200822040508.23510-2-rajmohan.mani@intel.com>
 <20200822095631.GB2553024@google.com>
 <DM6PR11MB3963121C820F570F845BBAEEF6560@DM6PR11MB3963.namprd11.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <DM6PR11MB3963121C820F570F845BBAEEF6560-10zMTfzfexfnaCbnFtwEg5PPoyLQLiKMvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Mani, Rajmohan" <rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ayman Bagabas <ayman.bagabas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Joseph, Jithu" <jithu.joseph-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, =?utf-8?B?Qmxhxb4=?= Hrastnik <blaz-piQ53kQ5nys@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <bleung@chromium>
List-Id: platform-driver-x86.vger.kernel.org

Hi Rajmohan,

On Mon, Aug 24, 2020 at 10:19:27PM +0000, Mani, Rajmohan wrote:
> Hi Prashant,
> 
> Thanks for the quick review.
> 
> > > +
> > > +	if (!iom || !iom->dev || !iom->regbar)
> > 
> > Do we need to check for !iom->dev and !iom->regbar?
> 
> It's a good practice to have sanity checks on pointer members dereferenced.
> 
> So I can lose the check on iom->dev, but prefer to keep the check on regbar.
> Let me know if you feel strongly about losing the check for regbar as well.

Sounds good.
> 
> > Is there a valid situation
> > where iom != NULL but iom->dev and/or iom->regbar == NULL?
> > Sounds like it shouldn't, but I may be missing something.
> > 
> 
> I think I am being conservative here.
> 
> > > +		return -ENODEV;
> > > +
> > > +	if (!status || (port > IOM_MAX_PORTS - 1))
> > 
> > I think parentheses around "port > IOM_MAX_PORT - 1" aren't required.
> 
> Ack
> 
> > > +		return -EINVAL;
> > > +
> > > +	reg = iom->regbar + IOM_PORT_STATUS_OFFSET + IOM_REG_LEN *
> > port;
> > > +
> > > +	*status = ioread32(reg);
> > 
> > Perhaps just inline reg within the parentheses?
> 
> Kept this way to increase readability. Let me know if you feel strongly towards
> inline reg.

I'd rather this be inlined, you save a couple lines from the variable
declaration, and IMO we're not gaining much in terms of readability by
declaring this separately.

> 
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(intel_iom_port_status);
> > > +
> > > +static int intel_iom_probe(struct platform_device *pdev) {
> > > +	void __iomem *addr;
> > > +
> > > +	/* only one IOM device is supported */
> > 
> > Minor nit: s/only/Only
> 
> And then I may need to end the comment with a period.
> Let me know if you feel strongly.
Yes, let's capitalize and add the period. Let's try to use the right
punctuation where possible.

Best regards,

-Prashant
