From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 05/14] platform/x86: dell-wmi-descriptor: split WMI
 descriptor into it's own driver
Date: Thu, 5 Oct 2017 10:22:10 -0700
Message-ID: <20171005172210.GC31452@fury>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <ff211830e3953c70aa8e0d43614619f1fb423668.1507156392.git.mario.limonciello@dell.com>
 <20171005010909.GC25018@fury>
 <CAHp75Vc0umEt0cGn5-NWva6j1T0yry1Ag7Egnn4iSvz=cs_kTg@mail.gmail.com>
 <20171005071153.GA31452@fury>
 <CAHp75VdYj8A3DDNfXcXPMa7oAxfWhaAyAB-Kf_LB+oyzONyaYQ@mail.gmail.com>
 <3be9670de8404523be04e2e319f1c1b3@ausx13mpc120.AMER.DELL.COM>
 <20171005141448.GB31452@fury>
 <5a114243f6844133a89d060347d5d390@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5a114243f6844133a89d060347d5d390@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 05, 2017 at 02:47:15PM +0000, Mario.Limonciello@dell.com wrote:
> > >
> > > So I believe it should be a mandatory runtime dependency due to needing
> > > the symbol dell_wmi_get_interface_version.  Depmod should be handling
> > > this then no?
> > 
> > This was nagging me all night, and I was thinking the last time I had to
> > use this it was indeed a runtime dependency. Sorry for the noise on
> > this.
> > 
> > The kconfig needs to be setup such that dell-wmi-descriptor cannot be a
> > module if the dependent drivers are modules.
> > 
> > --
> > Darren Hart
> > VMware Open Source Technology Center
> 
> Even if the others are modules shouldn't module ordering from depmod still DTRT?
> You still won't be able to load dell-wmi.ko until dell-wmi-descriptor.ko was loaded.
> 

I worded that wrong *facepalm*, let me try again...

The kconfig needs to be setup such that dell-wmi-descriptor cannot be a
module if the dependent drivers are built-in.

-- 
Darren Hart
VMware Open Source Technology Center
