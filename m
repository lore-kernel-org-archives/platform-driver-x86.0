From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 04/12] x86/kprobes: Explicitly include vmalloc.h for
 set_vm_flush_reset_perms()
Date: Thu, 21 Nov 2019 21:12:24 -0500
Message-ID: <20191121211224.15f006b4@oasis.local.home>
References: <20191119002121.4107-1-sean.j.christopherson@intel.com>
        <20191119002121.4107-5-sean.j.christopherson@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191119002121.4107-5-sean.j.christopherson@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Nadav Amit <namit@vmware.com>, "VMware, Inc." <pv-drivers@vmware.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 18 Nov 2019 16:21:13 -0800
Sean Christopherson <sean.j.christopherson@intel.com> wrote:

> The inclusion of linux/vmalloc.h, which is required for its definition
> of set_vm_flush_reset_perms(), is somehow dependent on asm/realmode.h
> being included by asm/acpi.h.  Explicitly include linux/vmalloc.h so
> that a future patch can drop the realmode.h include from asm/acpi.h
> without breaking the build.
> 
> Fixes: 241a1f2238064 ("x86/kprobes: Use vmalloc special flag")
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

> ---
>  arch/x86/kernel/kprobes/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
> index 4f13af7cbcdb..a0c223ab7264 100644
> --- a/arch/x86/kernel/kprobes/core.c
> +++ b/arch/x86/kernel/kprobes/core.c
> @@ -40,6 +40,7 @@
>  #include <linux/frame.h>
>  #include <linux/kasan.h>
>  #include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
>  
>  #include <asm/text-patching.h>
>  #include <asm/cacheflush.h>
