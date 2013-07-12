From: Xiong Zhou <jencce.kernel@gmail.com>
Subject: Re: [PATCH] x86: ce4100: add head file for reboot type
Date: Fri, 12 Jul 2013 11:47:32 +0800
Message-ID: <CADJHv_tHGHa51TbmZRtnP_00K8ZO7WmKaW9vaF4Jm6vYVmkBpQ@mail.gmail.com>
References: <alpine.DEB.2.02.1307091053280.28371@M2420>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1307091053280.28371@M2420>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, matthew.garrett@nebula.com
Cc: platform-driver-x86@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, mingo@redhat.com, x86@kernel.org, rui.zhang@intel.com, alan@linux.intel.com, ffainelli@freebox.fr, mingo@kernel.org, mbizon@freebox.fr, Jiri Kosina <trivial@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

2013/7/9 Xiong Zhou <jencce.kernel@gmail.com>:
> From: Xiong Zhou <jencce.kernel@gmail.com>
>
> Add head file for reboot type stuff to fix this:
> error: =91reboot_type=92 undeclared (first use in this function)
> error: =91BOOT_KBD=92 undeclared (first use in this function)
>
> Signed-off-by: Xiong Zhou <jencce.kernel@gmail.com>
> ---
>  arch/x86/platform/ce4100/ce4100.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/x86/platform/ce4100/ce4100.c b/arch/x86/platform/ce=
4100/ce4100.c
> index baec704..643b8b5e 100644
> --- a/arch/x86/platform/ce4100/ce4100.c
> +++ b/arch/x86/platform/ce4100/ce4100.c
> @@ -14,6 +14,7 @@
>  #include <linux/module.h>
>  #include <linux/serial_reg.h>
>  #include <linux/serial_8250.h>
> +#include <linux/reboot.h>
>
>  #include <asm/ce4100.h>
>  #include <asm/prom.h>



cc Jiri Kosina <trivial@kernel.org>
