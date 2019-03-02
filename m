From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] x86: uv: Fix potential NULL pointer dereference of
 kmalloc_node
Date: Sat, 02 Mar 2019 13:12:49 -0800
Message-ID: <cb87945edeeda2529b75e2169ff6f723daa732b2.camel@perches.com>
References: <20190302210905.13032-1-pakki001@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190302210905.13032-1-pakki001@umn.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Aditya Pakki <pakki001@umn.edu>
Cc: kjlu@umn.edu, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Nicolai Stange <nstange@suse.de>, Kees Cook <keescook@chromium.org>, Andrew Banman <abanman@hpe.com>, Mike Travis <mike.travis@hpe.com>, Colin Ian King <colin.king@canonical.com>, Varsha Rao <rvarsha016@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, 2019-03-02 at 15:09 -0600, Aditya Pakki wrote:
> kmalloc_node might fail to allocate memory for thp field. This fix
> attempts to avoid a potential NULL pointer dereference.

right

> diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
[]
> @@ -2011,6 +2011,9 @@ static void make_per_cpu_thp(struct bau_control *smaster)
>  	size_t hpsz = sizeof(struct hub_and_pnode) * num_possible_cpus();
>  
>  	smaster->thp = kmalloc_node(hpsz, GFP_KERNEL, smaster->osnode);
> +	if (!smaster->thp)
> +		return;
> +
>  	memset(smaster->thp, 0, hpsz);

Could use kzalloc_node as well
