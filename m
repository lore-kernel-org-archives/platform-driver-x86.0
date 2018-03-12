From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v6 01/12] drivers: base: Unified device connection lookup
Date: Mon, 12 Mar 2018 10:13:45 +0200
Message-ID: <20180312081345.GH21904@kuha.fi.intel.com>
References: <20180302102057.8917-1-hdegoede@redhat.com>
 <20180302102057.8917-2-hdegoede@redhat.com>
 <20180309175347.GA12150@kroah.com>
 <bddcf7ea-e58c-637a-e546-9978fd2cb540@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bddcf7ea-e58c-637a-e546-9978fd2cb540@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Mar 11, 2018 at 07:24:18PM +0100, Hans de Goede wrote:
> Hi all,
> 
> On 09-03-18 18:53, Greg Kroah-Hartman wrote:
> > On Fri, Mar 02, 2018 at 11:20:46AM +0100, Hans de Goede wrote:
> > > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > 
> > > Several frameworks - clk, gpio, phy, pmw, etc. - maintain
> > > lookup tables for describing connections and provide custom
> > > API for handling them. This introduces a single generic
> > > lookup table and API for the connections.
> > > 
> > > The motivation for this commit is centralizing the
> > > connection lookup, but the goal is to ultimately extract the
> > > connection descriptions also from firmware by using the
> > > fwnode_graph_* functions and other mechanisms that are
> > > available.
> > > 
> > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > 
> > Sorry for the delay, just now reviewing this patch...
> > 
> > The content is fine (if not scary for the obvious reason of passing
> > around 'struct device' of different bus types, but ok...), but the api
> > naming is "rough":
> 
> Heikki, I think it is best if you answer Greg's remarks. FWIW I'm
> fine with the changes Greg proposes.

Me too.

> I currently have significantly less bandwidth for this due to
> personal circumstances, so if a new version of this patch-set
> is necessary it would be great if you (Heikki) can do a v7.

Sure thing. I'll prepare the v7.


Thanks,

-- 
heikki
