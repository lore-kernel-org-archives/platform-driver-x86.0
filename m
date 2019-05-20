From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 2/2] platform/mellanox/mlxbf-bootctl: Add the ABI
 definitions
Date: Mon, 20 May 2019 17:53:25 +0200
Message-ID: <20190520155325.GA13939@kroah.com>
References: <0b74e9ad12360b56bc0a3c2ca972798c424f2610.1548790896.git.lsun@mellanox.com>
 <1558115345-32476-2-git-send-email-lsun@mellanox.com>
 <20190517175926.GA24535@kroah.com>
 <DB6PR05MB32235A6F891E438131471CE2A10B0@DB6PR05MB3223.eurprd05.prod.outlook.com>
 <20190518063501.GA26163@kroah.com>
 <DB6PR05MB322356D29192EAED104AA47EA1060@DB6PR05MB3223.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB6PR05MB322356D29192EAED104AA47EA1060@DB6PR05MB3223.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liming Sun <lsun@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, David Woods <dwoods@mellanox.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, May 20, 2019 at 03:20:02PM +0000, Liming Sun wrote:
> Please see response inline.
> 
> > -----Original Message-----
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Sent: Saturday, May 18, 2019 2:35 AM
> > To: Liming Sun <lsun@mellanox.com>
> > Cc: Andy Shevchenko <andy@infradead.org>; Darren Hart <dvhart@infradead.org>; Vadim Pasternak <vadimp@mellanox.com>; David
> > Woods <dwoods@mellanox.com>; platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org; David S. Miller
> > <davem@davemloft.net>; Mauro Carvalho Chehab <mchehab+samsung@kernel.org>; Jonathan Cameron
> > <Jonathan.Cameron@huawei.com>; Nicolas Ferre <nicolas.ferre@microchip.com>; Paul E. McKenney <paulmck@linux.ibm.com>
> > Subject: Re: [PATCH v5 2/2] platform/mellanox/mlxbf-bootctl: Add the ABI definitions
> > 
> > On Fri, May 17, 2019 at 08:36:53PM +0000, Liming Sun wrote:
> > > Thanks Greg for the comments!  Please see my response inline.
> > >
> > > Regards,
> > > - Liming
> > >
> > > > -----Original Message-----
> > > > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Sent: Friday, May 17, 2019 1:59 PM
> > > > To: Liming Sun <lsun@mellanox.com>
> > > > Cc: Andy Shevchenko <andy@infradead.org>; Darren Hart <dvhart@infradead.org>; Vadim Pasternak <vadimp@mellanox.com>;
> > David
> > > > Woods <dwoods@mellanox.com>; platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org; David S. Miller
> > > > <davem@davemloft.net>; Mauro Carvalho Chehab <mchehab+samsung@kernel.org>; Jonathan Cameron
> > > > <Jonathan.Cameron@huawei.com>; Nicolas Ferre <nicolas.ferre@microchip.com>; Paul E. McKenney <paulmck@linux.ibm.com>
> > > > Subject: Re: [PATCH v5 2/2] platform/mellanox/mlxbf-bootctl: Add the ABI definitions
> > > >
> > > > On Fri, May 17, 2019 at 01:49:05PM -0400, Liming Sun wrote:
> > > > > This commit adds the ABI definitions exposed to userspace for
> > > > > the platform/mellanox/mlxbf-bootctl driver.
> > > > >
> > > > > Reviewed-by: Vadim Pasternak <vadimp@mellanox.com>
> > > > > Signed-off-by: Liming Sun <lsun@mellanox.com>
> > > > > ---
> > > > >  .../ABI/testing/sysfs-platform-mellanox-bootctl    | 58 ++++++++++++++++++++++
> > > > >  MAINTAINERS                                        |  1 +
> > > > >  2 files changed, 59 insertions(+)
> > > > >  create mode 100644 Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
> > > > >
> > > > > diff --git a/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl b/Documentation/ABI/testing/sysfs-platform-mellanox-
> > > > bootctl
> > > > > new file mode 100644
> > > > > index 0000000..19a14db
> > > > > --- /dev/null
> > > > > +++ b/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
> > > > > @@ -0,0 +1,58 @@
> > > > > +What:		/sys/bus/platform/drivers/mlxbf-bootctl/lifecycle_state
> > > > > +Date:		May 2019
> > > > > +KernelVersion:	5.3
> > > > > +Contact:	"Liming Sun <lsun@mellanox.com>"
> > > > > +Description:
> > > > > +		The Life-cycle state of the SoC, which could be one of the
> > > > > +		following values.
> > > > > +		  Production - Production state and can be updated to secure
> > > > > +		  GA Secured - Secure chip and not able to change state
> > > > > +		  GA Non-Secured - Non-Secure chip and not able to change state
> > > > > +		  RMA - Return Merchandise Authorization
> > > >
> > > > A "driver" does not have a lifecycle state, a "device" does.
> > > >
> > > > You are putting all of these attributes in the wrong place.  Put them on
> > > > your device please, not the driver.  driver-specific attributes are
> > > > _VERY_ rare, and only for things that can modify/show for all devices
> > > > attached to that driver.
> > >
> > > This driver is running on the ARM processor of the SoC. The 'device' is
> > > the SoC itself. That's to say, there is only one device here attached to
> > > the driver and the driver state will also be the device state.
> > 
> > That might be true today, but maybe not tomorrow :)
> > 
> > Anyway, again, this is device state, not driver state.
> 
> Yes, I agree. I discussed with the team and will move these attributes
> under device (since they could be all considered as device state).

Great.

> > > This interface has been used by user-space applications for a couple of
> > > releases. It'll be great if it could stay in such way for compatibility. Please
> > > advise if this is strongly preferred to move them under devices.
> > 
> > So this is code that is already in the tree, and is just now being
> > documented?  What .c file(s) is this referring to?
> 
> This code is not in the kernel tree yet. It has been in Mellanox BlueField
> SW packages for a couple of releases and is trying to be up-streamed now.

Ok, then whatever happened in the past, before anyone in the community
reviewed your code, and merged it into the kernel tree, does not count :)

Where is the first patch in this series?  I'll be glad to review your
actual sysfs implementation if you point me at it.

> > As for "comptability", sysfs is made such that if a file is not present,
> > userspace should be able to survive, that is why it is
> > one-value-per-file.  What tool is using this, and where is the source
> > for it?
> 
> The latest 2.0 code can be found at link
> https://github.com/Mellanox/mlxbf-bootctl/tree/2.0
> 
> In file mlxbf-bootctl.c, currently it uses the 'drivers' path as sysfs path.
> #define SYS_PATH "/sys/bus/platform/drivers/mlx-bootctl". We could
> update it to support both paths.

Please do so.

thanks,

greg k-h
