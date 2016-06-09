From: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@intel.com>
Subject: Re: [PATCH] intel_menlow: prevent NULL pointer dereference
Date: Thu, 9 Jun 2016 19:24:52 +0200
Message-ID: <20160609172452.GA32327@jazz.nc.intel.com>
References: <1464186011-732-1-git-send-email-vincent.stehle@intel.com>
 <20160608203846.GG28348@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160608203846.GG28348@f23x64.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Sujith Thomas <sujith.thomas@intel.com>, Zhang Rui <rui.zhang@intel.com>, Len Brown <len.brown@intel.com>, Rafael Wysocki <rjw@rjwysocki.net>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 08, 2016 at 01:38:46PM -0700, Darren Hart wrote:
> Under what circumstances can the .remove op be called with a NULL struct
> acpi_device * as a parameter? From what I can see, most acpi_* calls accpeting
> an acpi_device rely on it not being null, and they are regularly called from
> driver remove functions.
> Did you observe an explicit failure or can you describe a call path where this
> can occur?

Hi Darren,

Thank you for reviewing.

I am not sure about when the .remove() functions are called with a NULL
pointer, or if that can ever happen. I just noticed that dereferencing the
pointer and checking for NULL after did not seem to be the right thing to
do. So I wanted to replicate instead the same construct as e.g.
xen_acpi_processor_remove().

Your remark encouraged me to do some more digging into the sources and it
appears that 13 .remove() functions do indeed check their input device
pointer for NULL, while 26 do not (the remaining do not use their input
pointer at all). Now I am puzzled about the necessity to check the pointer
for NULL or not, and there does not seem to be a definitive answer in the
docs either...

Best regards,

Vincent.
