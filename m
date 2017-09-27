From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 06/12] platform/x86: dell-wmi-smbios: Add a sysfs
 interface for SMBIOS tokens
Date: Wed, 27 Sep 2017 09:50:51 -0700
Message-ID: <20170927165051.GE23572@fury>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <1342f21a4f2c9af86d3033a9af9d9a4d05d27106.1505999739.git.mario.limonciello@dell.com>
 <20170925162333.GL22190@pali>
 <CAHp75Vd-mwn5O696XM7_F5-HMc2iztxibqQA0D4vOrMQO+WQRg@mail.gmail.com>
 <bb85503730a1479c94810a12802e8027@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bb85503730a1479c94810a12802e8027@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: andy.shevchenko@gmail.com, pali.rohar@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, quasisec@google.com
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 25, 2017 at 05:31:05PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Andy Shevchenko [mailto:andy.shevchenko@gmail.com]
> > Sent: Monday, September 25, 2017 1:04 PM
> > To: Pali Rohár <pali.rohar@gmail.com>
> > Cc: Limonciello, Mario <Mario_Limonciello@Dell.com>; dvhart@infradead.org;
> > LKML <linux-kernel@vger.kernel.org>; Platform Driver <platform-driver-
> > x86@vger.kernel.org>; quasisec@google.com
> > Subject: Re: [PATCH 06/12] platform/x86: dell-wmi-smbios: Add a sysfs interface
> > for SMBIOS tokens
> > 
> > On Mon, Sep 25, 2017 at 7:23 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > > On Thursday 21 September 2017 08:57:11 Mario Limonciello wrote:
> > >> Currently userspace tools can access system tokens via the dcdbas
> > >> kernel module and a SMI call that will cause the platform to execute
> > >> SMM code.
> > >>
> > >> With a goal in mind of deprecating the dcdbas kernel module a different
> > >> method for accessing these tokens from userspace needs to be created.
> > >>
> > >> This is intentionally marked to only be readable as root as it can
> > >> contain sensitive information about the platform's configuration.
> > >
> > > Darren, Andy, any comments? I'm not quite sure if such API is suitable
> > > for long term in kernel.
> > 
> > I would try to avoid sysfs interfaces for some particular devices.
> > Besides we are creating a character device. Would it be suitable there?
> 
> If the character device having 2 different ioctls for different needs is
> acceptable I'm happy to adjust the series to do this instead.

One piece of feedback I had re the char device was to see if we could avoid the
need for the IOCTL altogether, I'd like to have that discussion before we add
another.

> 
> > 
> > > Basically tokens are list of tuples <id, location, value> with
> > > possibility to active them, right?
> > >
> 
> I didn't add a way to activate them through this, it was only for
> reading purpose.  Activating them should be possible through the
> SMBIOS calling interface though.
> 

These are read-only as I understood it, and only with the right privileges.
Sysfs seemed appropriate for this to me.


-- 
Darren Hart
VMware Open Source Technology Center
