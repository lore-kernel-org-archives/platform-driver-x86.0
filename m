From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v8 2/3] platform/mellanox: mlxreg-hotplug: allow driver
 for ARM architecture
Date: Tue, 16 Jan 2018 17:50:44 -0800
Message-ID: <20180117015044.GA7890@fury>
References: <1515661123-76604-1-git-send-email-vadimp@mellanox.com>
 <1515661123-76604-3-git-send-email-vadimp@mellanox.com>
 <20180116034313.GC4590@fury>
 <AM4PR05MB3330579046971991B10D6C46A2EA0@AM4PR05MB3330.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM4PR05MB3330579046971991B10D6C46A2EA0@AM4PR05MB3330.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 16, 2018 at 08:06:33AM +0000, Vadim Pasternak wrote:
> 
> 
> > -----Original Message-----
> > From: Darren Hart [mailto:dvhart@infradead.org]
> > Sent: Tuesday, January 16, 2018 5:43 AM
> > To: Vadim Pasternak <vadimp@mellanox.com>
> > Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; linux-
> > kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnulli.us
> > Subject: Re: [patch v8 2/3] platform/mellanox: mlxreg-hotplug: allow driver for
> > ARM architecture
> > 
> > On Thu, Jan 11, 2018 at 08:58:42AM +0000, Vadim Pasternak wrote:
> > > It allows driver to run on x86 and ARM architecture based systems.
> > > Also some unnecessary includes are removed.
> > 
> > Hi Vadim,
> > 
> > These changes are not all readily mapped to this description, nor to the
> > changelog below.
> > 
> > Only the kconfig change is obviously linked to building on ARM and not just x86.
> > 
> > Things like the removal of the dev_err messages and the relocation of the create
> > and destroy methods seem entirely unrelated to building on ARM.
> > 
> > I'd like to get this merged sooner rather than later as it has been lingering for
> > quite some time now - can you provide some more detail about how the
> > changes included in this patch are needed to make this driver build on ARM?
> 
> Yes. Right.
> Should I split it to two separate patches, one only with Kconfig changes and the
> second with text like:
> Remove some unnecessary includes;
> Remove dev_err message;
> Change filed bus to nr for consistency with kernel definitions;

This would be a better split, yes. Note that we need to document *why* it is an
unnecessary dev_err message. When you respin, please pull the X86_64 Kconfig
change from 1/3 into the Kconfig changes for ARM support as well.

-- 
Darren Hart
VMware Open Source Technology Center
