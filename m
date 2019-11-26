From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH 11/12] ACPI/sleep: Convert acpi_wakeup_address into a
 function
Date: Tue, 26 Nov 2019 12:25:00 +0100
Message-ID: <20191126112500.GA36931@gmail.com>
References: <20191119002121.4107-1-sean.j.christopherson@intel.com>
 <20191119002121.4107-12-sean.j.christopherson@intel.com>
 <7338293.UcAxln0NAJ@kreacher>
 <20191125104803.v6goacte2vjakx64@ucw.cz>
 <20191125170034.GB12178@linux.intel.com>
 <20191126111618.GA28423@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191126111618.GA28423@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Len Brown <len.brown@intel.com>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Nadav Amit <namit@vmware.com>
List-Id: platform-driver-x86.vger.kernel.org


* Ingo Molnar <mingo@kernel.org> wrote:

> > Would you prefer a v2 of the entire series (with Acks and removal of 
> > Fixes), or a v2 that includes only the last two patches?
> 
> Yep, that would be handy. I have them committed to tip:core/headers, 
> but haven't sent it to Linus yet, and can redo that all with these 
> improvements.

Now these bits are back in tip:WIP.core/headers, waiting for the v2 
submission.

Thanks,

	Ingo
