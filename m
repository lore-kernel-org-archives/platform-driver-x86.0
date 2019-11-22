From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 03/12] x86/ftrace: Explicitly include vmalloc.h for
 set_vm_flush_reset_perms()
Date: Thu, 21 Nov 2019 21:11:34 -0500
Message-ID: <20191121211134.5938b2d9@oasis.local.home>
References: <20191119002121.4107-1-sean.j.christopherson@intel.com>
        <20191119002121.4107-4-sean.j.christopherson@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191119002121.4107-4-sean.j.christopherson@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Nadav Amit <namit@vmware.com>, "VMware, Inc." <pv-drivers@vmware.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 18 Nov 2019 16:21:12 -0800
Sean Christopherson <sean.j.christopherson@intel.com> wrote:

> The inclusion of linux/vmalloc.h, which is required for its definition
> of set_vm_flush_reset_perms(), is somehow dependent on asm/realmode.h
> being included by asm/acpi.h.  Explicitly include linux/vmalloc.h so
> that a future patch can drop the realmode.h include from asm/acpi.h
> without breaking the build.
> 
> Fixes: 7fdfe1e40b225 ("x86/ftrace: Use vmalloc special flag")
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

> ---
>  arch/x86/kernel/ftrace.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> index 2a179fb35cd1..681eae0fb64d 100644
> --- a/arch/x86/kernel/ftrace.c
> +++ b/arch/x86/kernel/ftrace.c
> @@ -23,6 +23,7 @@
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/memory.h>
> +#include <linux/vmalloc.h>
>  
>  #include <trace/syscall.h>
>  
