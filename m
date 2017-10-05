From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4 12/14] platform/x86: wmi: create character devices
 when requested by drivers
Date: Thu, 5 Oct 2017 21:32:42 +0200
Message-ID: <20171005193242.GD10938@pali>
References: <528c9a1ca4fa2f29aedbb37d3ed13c480ef093fc.1507156392.git.mario.limonciello@dell.com>
 <20171005071619.GA25960@kroah.com>
 <aa10ae6ab119499c8bbdf613392a9605@ausx13mpc120.AMER.DELL.COM>
 <20171005154214.GB29347@kroah.com>
 <20171005155156.GZ10938@pali>
 <20171005162628.GA4993@kroah.com>
 <20171005173925.GD31452@fury>
 <20171005184728.GB9713@kroah.com>
 <750018cd00674782a55f2b50e8aef689@ausx13mpc120.AMER.DELL.COM>
 <20171005190948.GA21238@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:55968 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751784AbdJETcp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 15:32:45 -0400
Content-Disposition: inline
In-Reply-To: <20171005190948.GA21238@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Mario.Limonciello@dell.com, dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

Hi Greg! I would answer some of your question...

On Thursday 05 October 2017 21:09:48 Greg KH wrote:
> On Thu, Oct 05, 2017 at 07:03:24PM +0000, Mario.Limonciello@dell.com wrote:
> > On Windows it's a driver-less solution.  Vendors don't do anything other
> > than provide the MOF (which describes how the data passed to ASL looks).
> 
> How do they "provide it"?

I described it in my email. Binary MOF is in ACPI buffer returned by
well known ACPI function.

Vendor fills into DSDT ACPI table (part of BIOS firmware) at correct
place binary MOF buffer and ACPI interpreter which is part of kernel can
access it.

> > When Windows boots up, _WDG is parsed,
> 
> Who parses it, the Windows kernel?

Yes, some Windows kernel driver parses ACPI's _WDG and also binary MOF
buffer from ACPI.

> > the binary MOF is loaded into the WMI repository.
> 
> Who does the loading?  Where does the "WMI repository" live?

IIRC it can be loaded by both userspace and kernel. No idea about
permissions, but ACPI/WMI kernel driver loads that binary MOF from ACPI
table.

Via some tools user can loads also its own MOF buffer into "WMI
repository".

> > It's up to firmware to block the crazy stuff that you can put in a buffer.
> 
> So userspace can pass any blob it wants to the firmware through this
> interface and the kernel does not parse anything?  How is that
> "protected"?

In that binary MOF is described C++ style object system and mapping from
those class/objects into ACPI methods. With information how are mapped
object method parameters (e.g. integer, strings, structures...) into
ACPI buffer. And in Windows you can IIRC call those class/objects
defined in MOF and something (I bet Windows kernel driver) translate
class method parameters (integers, strings, ...) into kernel ACPI
buffers and call correct ACPI method. So there is just protection that
method is called with correct "signature".

But IIRC Dell describe in its MOF object system, that there is one class
with just one method which has parameter "String" at specified size --
which maps 1:1 to ACPI buffer.

-- 
Pali Rohár
pali.rohar@gmail.com
