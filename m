From: Darren Hart <dvhart@infradead.org>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad_acpi: Add support for HKEY
 version 0x200
Date: Tue, 7 Jun 2016 14:43:00 -0700
Message-ID: <20160607214300.GA3829@f23x64.localdomain>
References: <1465318938.7166.23.camel@redhat.com>
 <1465333851.7166.46.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465333851.7166.46.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <cpaul@redhat.com>
Cc: "ibm-acpi-devel@lists.sourceforge.net" <ibm-acpi-devel@lists.sourceforge.net>, Dennis Wassenberg <dennis.wassenberg@secunet.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jun 07, 2016 at 05:10:51PM -0400, Lyude Paul wrote:
> Managed to find someone in the office with one of these laptops and it looks
> like the adaptive keyboard works perfectly with this patch, so I can give my t-
> b:
> 
> 	Tested-by: Lyude Paul <cpaul@redhat.com>
> 
> Cheers,
> 	Lyude
> 
> On Tue, 2016-06-07 at 13:02 -0400, Lyude Paul wrote:
> > Since nothing's really happened with this patch for a while I figured I'd take
> > over trying to get this upstream.
> > 
> > Regarding testing: This seems to work fine on the 60 series laptops, and works
> > fine on previous generations. The one thing I haven't been able to test is an
> > X1
> > carbon with an adaptive keyboard since I don't seem to have one readily
> > available here. I'm doing a search around the office to try to find someone
> > who
> > didn't throw theirs away yet so hopefully I should be able to get back to you
> > on
> > that soon.
> > 
> > To Dennis: I took the liberty of doing a review of your patch and some
> > testing.
> > There's a few things that need changing, I've outlined them below: (for the
> > future, it's recommended to send patches for the kernel inline in emails to
> > make
> > them easier to review).

If someone would please update the patch with any pending changes from review
and so it follows the rules in Documentation/SubmittingPatches, including the
complete list of recipients on Cc, we can move this forward.

Regards,

-- 
Darren Hart
Intel Open Source Technology Center
