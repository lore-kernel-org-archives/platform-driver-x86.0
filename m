From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 12/14] platform/x86: wmi: create character devices
 when requested by drivers
Date: Thu, 5 Oct 2017 13:51:33 -0700
Message-ID: <20171005205133.GA12321@fury>
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
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <750018cd00674782a55f2b50e8aef689@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: greg@kroah.com, pali.rohar@gmail.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 05, 2017 at 07:03:24PM +0000, Mario.Limonciello@dell.com wrote:
> > 
> > And how _exactly_ is this interface exposed in Windows?  Is it ad-hoc
> > with custom kernel drivers written by each vendor?  Or does the OS
> > provide a "sane" interface for it?
> 
> On Windows it's a driver-less solution.  Vendors don't do anything other
> than provide the MOF (which describes how the data passed to ASL looks).
> 
> When Windows boots up, _WDG is parsed, the binary MOF is loaded into
> the WMI repository.  The MOF describes how named objects map to GUIDs
> which map to ASL.
> 
> >From Powershell or from any application that uses WMI as admin you can 
> look up the root namespace and see all objects.  You can pass calls back
> and forth.  There's all sorts of examples of it here:
> https://msdn.microsoft.com/en-us/library/windows/hardware/dn614028(v=vs.85).aspx
> 

A couple snippets from this link which I believe I've shared previously
that clarify the design intent of the WMI mechanism:

"
ACPI-to-WMI Mapper Goals for Windows Instrumentation:

...

* Allow OEMs to include OEM-specific data blocks, user-mode-callable
  ACPI control methods, and events without requiring any changes to the
  ACPI-to-WMI mapper.

* Allow general-purpose data consumer applications--those written
  without any special knowledge of the data blocks exposed by a
  particular machine--to be able to access and understand the data
  blocks, user-mode-callable ACPI control methods, and events being
  mapped--including those that are OEM specific.

...

The following are not goals for the ACPI-to-WMI mapper:

* To have specific knowledge about any data block that passes through
  the mapper.

* To provide interfaces specifically for SMBIOS data and functions. The
  mapper is an open architecture that is not restricted to SMBIOS data
  and functionality.
"

This model is not consistent with Linux design principles, and Mario's
changes attempt to allow for more kernel oversight by:

* Requiring a driver to be written to bind to any GUID which will expose
  WMI methods to userspace. The goal here is to provide an effective
  whitelist, and to promote vendor participation (they need to send the
  patch, have it reviewed, respond to challenges on the security
  implications, etc.)

* In the future, provide for the MOF parsing within the kernel so Linux
  will have more ability to audit messaging.

-- 
Darren Hart
VMware Open Source Technology Center
