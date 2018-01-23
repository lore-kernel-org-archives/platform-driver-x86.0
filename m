From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v9 0/4] drivers/platform: Replace module
 x86/mlxcpld-hotplug with mellanox/mlxreg-hotplug
Date: Tue, 23 Jan 2018 13:54:43 -0800
Message-ID: <20180123215443.GA16464@fury>
References: <1516213316-32278-1-git-send-email-vadimp@mellanox.com>
 <20180123041328.GF24956@fury>
 <AM4PR05MB33304E4A2C7CC588371EF0EAA2E30@AM4PR05MB3330.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM4PR05MB33304E4A2C7CC588371EF0EAA2E30@AM4PR05MB3330.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 23, 2018 at 06:04:37PM +0000, Vadim Pasternak wrote:
> 
> 
> > -----Original Message-----
> > From: Darren Hart [mailto:dvhart@infradead.org]
> > Sent: Tuesday, January 23, 2018 6:13 AM
> > To: Vadim Pasternak <vadimp@mellanox.com>
> > Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; linux-
> > kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnulli.us
> > Subject: Re: [patch v9 0/4] drivers/platform: Replace module x86/mlxcpld-
> > hotplug with mellanox/mlxreg-hotplug
> > 
> > On Wed, Jan 17, 2018 at 06:21:52PM +0000, Vadim Pasternak wrote:
> > > The patchset:
> > >  - replaces modules include/linux/platform_data/mlxcpld-hotplug.h and
> > >    drivers/platform/x86/mlxcpld-hotplug.c with the modules
> > >    include/linux/platform_data/mlxreg.h and
> > >    drivers/platform/mellanox/mlxreg-hotplug.c;
> > >    relevant Makefile and Kconfig are updated;
> > >  - modifies Mellanox hotplug driver for making it architecture
> > >    independent. Drivers has been tested for x86 and ARM based systems.
> > >  - includes code cleanup;
> > >  - introduces regmap interface for mlxreg-hotplug driver to allow hotplug
> > >    event functionality over programmable devices logic, when these devices
> > >    can be attached to different interfaces types, like I2C, LPC, SPI;
> > >    driver drivers/platform/x86/mlx-platform.c is updated according to new
> > >    interface.
> > 
> > This series is still not dividing up changes into small functional chunks. It "ping
> > pongs" (adding then later removing code), and makes it difficult to review
> > functional changes by surrounding them with non-functional transformations. As
> > I've attempted to break this apart myself, I've discovered a few issues with the
> > code - see the responses to the individual patches.
> > 
> > You can find my broken up version here:
> > http://git.infradead.org/linux-platform-drivers-
> > x86.git/shortlog/refs/heads/review-dvhart-mellanox-v10
> > 
> > In particular, please see:
> > http://git.infradead.org/linux-platform-drivers-
> > x86.git/commit/4f0057fc3da29c04e2cefca9dc5b17577b3e4988
> > 
> > Vadim, please respond to my questions re the individual patches, and I'll
> > increment the patches in the above branch before pushing this up to testing.
> > 
> 
> Hi Darren,
> 
> Thank you for your reviews.
> 
> I wanted to take update from your update git, to align the patches with series
> you pushed to review-dvhart-mellanox-v10.
> But I have some issue with 
> cda61cd592ebc9534b9786c337b124a86a6e303f hash:
> git remote update
> Fetching origin
> remote: error: inflate: data stream error (incorrect header check)
> remote: error: unable to unpack cda61cd592ebc9534b9786c337b124a86a6e303f header
> remote: fatal: loose object cda61cd592ebc9534b9786c337b124a86a6e303f (stored in ./objects/cd/a61cd592ebc9534b9786c337b124a86a6e303f) is corrupt
> remote: aborting due to possible repository corruption on the remote side.
> fatal: protocol error: bad pack header
> error: Could not fetch origin
> 
> Same in case I just clone git anew.

We're having some trouble with the repo on infradead. I have it temporarily
available on github:

https://github.com/dvhart/linux-pdx86/tree/review-dvhart-mellanox-v10

> 
> I am about to re-send the series started from the patch 2.
> I currently dropped the changes related to removing dev_err (from FIXME
> platform/mellanox: Remove redundant dev_err messa).
> I also added one extra patch between
> platform/mellanox: mlxreg-hotplug: Modify to use a 
> and
> platform/mellanox: mlxreg-hotplug: Enable building
> 
> And I'll not resend 
> platform/x86: mlx-platform: Allow compilation for 32
> since it has been moved from the series  as a separate patch.

I'll follow up there.

-- 
Darren Hart
VMware Open Source Technology Center
