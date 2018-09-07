From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v3 02/10] usb: roles: Handle driver reference counting
Date: Fri, 7 Sep 2018 12:48:07 +0300
Message-ID: <20180907094807.GH25121@kuha.fi.intel.com>
References: <20180904112219.89287-1-heikki.krogerus@linux.intel.com>
 <20180904112219.89287-3-heikki.krogerus@linux.intel.com>
 <881eb4df-3e77-3475-1ec7-02b060b7ad83@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <881eb4df-3e77-3475-1ec7-02b060b7ad83@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Sep 06, 2018 at 10:59:34PM +0200, Hans de Goede wrote:
> HI,
> 
> On 04-09-18 13:22, Heikki Krogerus wrote:
> > This fixes potential "BUG: unable to handle kernel paging
> > request at ..." from happening.
> > 
> > Fixes: fde0aa6c175a ("usb: common: Small class for USB role switches")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >   drivers/usb/common/roles.c | 15 ++++++++++++---
> >   1 file changed, 12 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/usb/common/roles.c b/drivers/usb/common/roles.c
> > index 15cc76e22123..3d8a776e55ee 100644
> > --- a/drivers/usb/common/roles.c
> > +++ b/drivers/usb/common/roles.c
> > @@ -109,8 +109,15 @@ static void *usb_role_switch_match(struct device_connection *con, int ep,
> >    */
> >   struct usb_role_switch *usb_role_switch_get(struct device *dev)
> >   {
> > -	return device_connection_find_match(dev, "usb-role-switch", NULL,
> > -					    usb_role_switch_match);
> > +	struct usb_role_switch *sw;
> > +
> > +	sw = device_connection_find_match(dev, "usb-role-switch", NULL,
> > +					  usb_role_switch_match);
> > +
> > +	if (!IS_ERR(sw))
> > +		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> 
> While testing I found a bug, so sorry but this is going to need a v4,
> device_connection_find_match() may return NULL here, so this needs
> to be if (!IS_ERR_OR_NULL(sw)) to avoid an oops.
> 
> Note I'm also seeing some other issues which I need to debug I will
> do so tomorrow morning so you may want to wait a bit with v4.

Np. Take your time. And thanks for testing these.


Cheers,

-- 
heikki
