From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1 0/4] platform/x86: mlx-platform: Add bus differed and
 auto detection functionalities
Date: Fri, 23 Mar 2018 16:09:20 -0700
Message-ID: <20180323230920.GE17520@fury>
References: <1518559776-188942-1-git-send-email-vadimp@mellanox.com>
 <20180322235541.GD24138@fury>
 <HE1PR0502MB37532883C411EA1BA9871443A2A80@HE1PR0502MB3753.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <HE1PR0502MB37532883C411EA1BA9871443A2A80@HE1PR0502MB3753.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, Michael Shych <michaelsh@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 23, 2018 at 03:59:22PM +0000, Vadim Pasternak wrote:
> 
> 
> > -----Original Message-----
> > From: Darren Hart [mailto:dvhart@infradead.org]
> > Sent: Friday, March 23, 2018 1:56 AM
> > To: Vadim Pasternak <vadimp@mellanox.com>
> > Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; platform-
> > driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org; jiri@resnulli.us;
> > Michael Shych <michaelsh@mellanox.com>
> > Subject: Re: [PATCH v1 0/4] platform/x86: mlx-platform: Add bus differed and
> > auto detection functionalities
> > 
> > On Tue, Feb 13, 2018 at 10:09:32PM +0000, Vadim Pasternak wrote:
> > > This patchset:
> > > - Adds define for the channels number for mux device.
> > > - Adds differed bus functionality.
> > > - Changes input for device create routine in mlxreg-hotplug driver.
> > > - Adds physical bus number auto detection.
> > >
> > > Vadim Pasternak (4):
> > >   platform/x86: mlx-platform: Use define for the channel numbers
> > >   platform/x86: mlx-platform: Add differed bus functionality
> > >   platform/mellanox: mlxreg-hotplug: Change input for device create
> > >     routine
> > >   platform/x86: mlx-platform: Add physical bus number auto detection
> > 
> > Vadim,
> > 
> > I have rewritten most of the commit messages after parsing through them and
> > reviewing the code. I believe they are much more concise now, and make the
> > intent of the patches much clearer. I have not changed the patch content (code).
> > 
> > Please review the commit messages for the top 4 commits:
> > http://git.infradead.org/linux-platform-drivers-
> > x86.git/shortlog/refs/heads/review-dvhart-mellanox
> > 
> > Does this still match your intent?
> > 
> 
> Hi Darren,
> Thank you very much for review.
> 
> Looks good.

Thanks Vadim. I have queued these plus the Kconfig build dep fix for 4.17.

-- 
Darren Hart
VMware Open Source Technology Center
