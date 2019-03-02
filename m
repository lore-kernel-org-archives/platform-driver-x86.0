From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] x86: uv: Fix potential NULL pointer dereference of
 kmalloc_node
Date: Sat, 2 Mar 2019 15:22:29 -0600
Message-ID: <8c14879c-891d-db56-2dca-cd3b68afce2d@embeddedor.com>
References: <20190302210905.13032-1-pakki001@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190302210905.13032-1-pakki001@umn.edu>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Aditya Pakki <pakki001@umn.edu>
Cc: kjlu@umn.edu, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Nicolai Stange <nstange@suse.de>, Kees Cook <keescook@chromium.org>, Andrew Banman <abanman@hpe.com>, Mike Travis <mike.travis@hpe.com>, Colin Ian King <colin.king@canonical.com>, Varsha Rao <rvarsha016@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Aditya,

On 3/2/19 3:09 PM, Aditya Pakki wrote:
> kmalloc_node might fail to allocate memory for thp field. This fix
> attempts to avoid a potential NULL pointer dereference.
>

If this was detected by any static analyzer, please mention the
tool in the commit log.

Also, notice that this code does not apply to linux-next.

Thanks
--
Gustavo

> Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> ---
>  arch/x86/platform/uv/tlb_uv.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
> index a4130b84d1ff..5a6d51e30a36 100644
> --- a/arch/x86/platform/uv/tlb_uv.c
> +++ b/arch/x86/platform/uv/tlb_uv.c
> @@ -2011,6 +2011,9 @@ static void make_per_cpu_thp(struct bau_control *smaster)
>  	size_t hpsz = sizeof(struct hub_and_pnode) * num_possible_cpus();
>  
>  	smaster->thp = kmalloc_node(hpsz, GFP_KERNEL, smaster->osnode);
> +	if (!smaster->thp)
> +		return;
> +
>  	memset(smaster->thp, 0, hpsz);
>  	for_each_present_cpu(cpu) {
>  		smaster->thp[cpu].pnode = uv_cpu_hub_info(cpu)->pnode;
> 
