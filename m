From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 01/12] drivers: base: Unified device connection lookup
Date: Fri, 16 Feb 2018 13:28:23 +0200
Message-ID: <20180216112823.GI1480@kuha.fi.intel.com>
References: <20180216104751.8371-1-hdegoede@redhat.com>
 <20180216104751.8371-2-hdegoede@redhat.com>
 <CAHp75VcyrUvPzojY1J2cUheuYz6mRCP_VppSx740ELanNaQ+Hw@mail.gmail.com>
 <ee0d4723-ab1c-85d8-e6b7-a66e1a045b02@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ee0d4723-ab1c-85d8-e6b7-a66e1a045b02@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB <linux-usb@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 16, 2018 at 12:21:15PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 16-02-18 12:00, Andy Shevchenko wrote:
> > On Fri, Feb 16, 2018 at 12:47 PM, Hans de Goede <hdegoede@redhat.com> wrote:
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
> > 
> > > +void *__device_find_connection(struct device *dev, const char *con_id,
> > 
> > > +                              void *data,
> > > +                              void *(*match)(struct devcon *con, int ep,
> > > +                                             void *data))
> > 
> > Perhaps swap them, since data is dependent parameter to match.
> 
> The pattern of having the data before the callback function is not
> unheard of in the kernel. Changing this now feels like needless
> churn, but if there is a strong preference for this then we can
> fix this for v2.
> 
> Heikki, do you want me to take care of minor changes like this for v2?

Yes, please do if you don't mind. I would appreciate it.

I'll be on vacation next week.


Thanks,

-- 
heikki
