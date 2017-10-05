From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v4 12/14] platform/x86: wmi: create character devices
 when requested by drivers
Date: Thu, 5 Oct 2017 21:09:48 +0200
Message-ID: <20171005190948.GA21238@kroah.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <528c9a1ca4fa2f29aedbb37d3ed13c480ef093fc.1507156392.git.mario.limonciello@dell.com>
 <20171005071619.GA25960@kroah.com>
 <aa10ae6ab119499c8bbdf613392a9605@ausx13mpc120.AMER.DELL.COM>
 <20171005154214.GB29347@kroah.com>
 <20171005155156.GZ10938@pali>
 <20171005162628.GA4993@kroah.com>
 <20171005173925.GD31452@fury>
 <20171005184728.GB9713@kroah.com>
 <750018cd00674782a55f2b50e8aef689@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <750018cd00674782a55f2b50e8aef689@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, pali.rohar@gmail.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 05, 2017 at 07:03:24PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Greg KH [mailto:greg@kroah.com]
> > Sent: Thursday, October 5, 2017 1:47 PM
> > To: Darren Hart <dvhart@infradead.org>
> > Cc: Pali Rohár <pali.rohar@gmail.com>; Limonciello, Mario
> > <Mario_Limonciello@Dell.com>; andy.shevchenko@gmail.com; linux-
> > kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; luto@kernel.org;
> > quasisec@google.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> > Subject: Re: [PATCH v4 12/14] platform/x86: wmi: create character devices when
> > requested by drivers
> > 
> > On Thu, Oct 05, 2017 at 10:39:25AM -0700, Darren Hart wrote:
> > > > It does, thanks.  And as we now understand it (I'm guessing it had to be
> > > > semi-understood in the older wmi drivers already), validating it
> > > > properly seems to be the key for creating an interface that we "know" to
> > > > be safe.
> > > >
> > >
> > > We don't use the MOF data in any of the existing wmi drivers, because
> > > they are all oddities which map to kernel managed subsystems (hotkeys,
> > > LED control, RF Kill switches) rather than what WMI (Windows
> > > Manageability Interface) was designed for. The intent of these patches
> > > to enable that management aspect of the platform.
> > >
> > > This is the biggest hurdle for WMI support.
> > >
> > > WMI was designed to bypass the OS, and is used in consumer devices
> > > intended to run Windows. This leads to an interface that is very vendor
> > > specific and not consistently broken up into nice functional blocks.
> > >
> > > Vendors would like to use this interface in Linux as it is being used in
> > > Windows. Specifically, they want to be able to have a generic system in
> > > the kernel which allows the WMI mechanism to be used by userspace,
> > > without the need to patch the kernel for every platform.
> > 
> > And how _exactly_ is this interface exposed in Windows?  Is it ad-hoc
> > with custom kernel drivers written by each vendor?  Or does the OS
> > provide a "sane" interface for it?
> 
> On Windows it's a driver-less solution.  Vendors don't do anything other
> than provide the MOF (which describes how the data passed to ASL looks).

How do they "provide it"?

> When Windows boots up, _WDG is parsed,

Who parses it, the Windows kernel?

> the binary MOF is loaded into the WMI repository.

Who does the loading?  Where does the "WMI repository" live?

> The MOF describes how named objects map to GUIDs which map to ASL.

So this all lives in kernelspace?

> From Powershell or from any application that uses WMI as admin you can 
> look up the root namespace and see all objects.

And what is the interface that powershell uses to get that information
from the kerenel?

> You can pass calls back
> and forth.  There's all sorts of examples of it here:
> https://msdn.microsoft.com/en-us/library/windows/hardware/dn614028(v=vs.85).aspx
> 
> Windows doesn't validate the data when it's passed to ASL and back.

How do you know?  Who does the "passing"?  The Windows kernel is just a
blind pipe?  If so, then what does the mappings?

> It just knows what it looks like, size of the buffer and relays the information.

relays from/to what?

> It's up to firmware to block the crazy stuff that you can put in a buffer.

So userspace can pass any blob it wants to the firmware through this
interface and the kernel does not parse anything?  How is that
"protected"?

> > Again, I like my TPM to work, and I don't want a random rootkit exploit
> > to be able to destroy it :)
> 
> I'd like to however point out you can't kill your TPM from this interface.

On _your_ platform, can you guarantee it on any other platform?  :)

And I strongly doubt your BIOS would stand up to a good fuzzer, almost
no firmware can.  Heck, the kernel even has issues, we've been fixing
them for years...

thanks,

greg k-h
