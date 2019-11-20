From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH 10/12] x86/ACPI/sleep: Remove an unnecessary include of asm/realmode.h
Date: Wed, 20 Nov 2019 11:59:27 +0100
Message-ID: <3809579.i0RzbxhyKc@kreacher>
References: <20191119002121.4107-1-sean.j.christopherson@intel.com> <20191119002121.4107-11-sean.j.christopherson@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191119002121.4107-11-sean.j.christopherson@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Nadav Amit <namit@vmware.com>, "VMware, Inc." <pv-drivers@vmware.com>, Arnd
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday, November 19, 2019 1:21:19 AM CET Sean Christopherson wrote:
> None of the declarations in x86's acpi/sleep.h are in any way dependent
> on the real mode boot code.  Remove sleep.h's include of asm/realmode.h
> to limit the dependencies on realmode.h to code that actually interacts
> with the boot code.
> 
> Fixes: c9b77ccb52a5c ("x86, realmode: Move ACPI wakeup to unified realmode code")
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  arch/x86/kernel/acpi/sleep.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/acpi/sleep.h b/arch/x86/kernel/acpi/sleep.h
> index fbb60ca4255c..d06c2079b6c1 100644
> --- a/arch/x86/kernel/acpi/sleep.h
> +++ b/arch/x86/kernel/acpi/sleep.h
> @@ -3,7 +3,7 @@
>   *	Variables and functions used by the code in sleep.c
>   */
>  
> -#include <asm/realmode.h>
> +#include <linux/linkage.h>
>  
>  extern unsigned long saved_video_mode;
>  extern long saved_magic;
> 
