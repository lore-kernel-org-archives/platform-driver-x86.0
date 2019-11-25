From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 11/12] ACPI/sleep: Convert acpi_wakeup_address into a
 function
Date: Mon, 25 Nov 2019 11:48:03 +0100
Message-ID: <20191125104803.v6goacte2vjakx64@ucw.cz>
References: <20191119002121.4107-1-sean.j.christopherson@intel.com>
 <20191119002121.4107-12-sean.j.christopherson@intel.com>
 <7338293.UcAxln0NAJ@kreacher>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7338293.UcAxln0NAJ@kreacher>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Sean Christopherson <sean.j.christopherson@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Len Brown <len.brown@intel.com>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Nadav Amit <namit@vmware.com>, "VMware, Inc." <pv-drive>
List-Id: platform-driver-x86.vger.kernel.org

> On Tuesday, November 19, 2019 1:21:20 AM CET Sean Christopherson wrote:
> > Convert acpi_wakeup_address from a raw variable into a function so that
> > x86 can wrap its dereference of the real mode boot header in a function
> > instead of broadcasting it to the world via a #define.  This sets the
> > stage for a future patch to move the definition of acpi_wakeup_address()
> > out of asm/acpi.h and thus break acpi.h's dependency on asm/realmode.h.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> > --- a/drivers/acpi/sleep.c
> > +++ b/drivers/acpi/sleep.c
> > @@ -63,9 +63,9 @@ static int acpi_sleep_prepare(u32 acpi_state)
> >  #ifdef CONFIG_ACPI_SLEEP
> >  	/* do we have a wakeup address for S2 and S3? */
> >  	if (acpi_state == ACPI_STATE_S3) {
> > -		if (!acpi_wakeup_address)
> > +		if (!acpi_wakeup_address())
> >  			return -EFAULT;
> > -		acpi_set_waking_vector(acpi_wakeup_address);
> > +		acpi_set_waking_vector(acpi_wakeup_address());
> >  

You might want to store result in a variable... especially since you are
turning inline function into real one in a next patch.

And maybe function should be called get_acip_wakeup_address or
something? This way it is easy to mistake actual wakeup address from
function that gets it...

Best regards,
									Pavel
> 
> 
