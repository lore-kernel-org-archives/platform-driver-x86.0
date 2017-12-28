From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v1] x86/platform/intel-mid: Revert "Make 'bt_sfi_data'
 const"
Date: Thu, 28 Dec 2017 12:59:55 +0100
Message-ID: <20171228115955.3rkmzf4gi47hpt63@gmail.com>
References: <20171228100801.67744-1-andriy.shevchenko@linux.intel.com>
 <20171228102812.cm7yylrrq2omfw5y@gmail.com>
 <alpine.DEB.2.20.1712281133530.2220@hadrien>
 <20171228111216.6ebgmcdert4lgkof@gmail.com>
 <alpine.DEB.2.20.1712281221540.2220@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:43642 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751431AbdL1L76 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Dec 2017 06:59:58 -0500
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1712281221540.2220@hadrien>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>


* Julia Lawall <julia.lawall@lip6.fr> wrote:

> > So the type is the following, in include/linux/mod_devicetable.h:
> >
> > struct x86_cpu_id {
> >         __u16 vendor;
> >         __u16 family;
> >         __u16 model;
> >         __u16 feature;  /* bit index */
> >         kernel_ulong_t driver_data;
> > };
> >
> > Is there a syntactic method that would allow the conversion to kernel_ulong_t, but
> > would preserve any const-ness?
> >
> > Barring that, maybe we could convert driver_data to 'void *', fix up all users,
> > and not force the type - this would allow the preservation of the const attribute,
> > I think.
> >
> > BTW., a quick grep suggests similar type casting patterns here:
> >
> > arch/x86/platform/intel-mid/pwr.c:      { PCI_VDEVICE(INTEL, PCI_DEVICE_ID_PENWELL), (kernel_ulong_t)&pnw_info },
> > arch/x86/platform/intel-mid/pwr.c:      { PCI_VDEVICE(INTEL, PCI_DEVICE_ID_TANGIER), (kernel_ulong_t)&tng_info },
> 
> Would it be acceptable to move the cast out of the macro to the place
> where the variable is referenced?  It wouldn't help with the compiler, but
> it would be slightly easier for the human to check.

It would really be preferably to not stand in the way of the compiler here.

AFACS void * should solve the problem, and it's a kernel_ulong_t equivalent in 
terms of with, right?

So let's try and solve this for real. Forcing humans to discover such things is 
always a fragile concept.

Thanks,

	Ingo
