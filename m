From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH] x86/platform/olpc: Fix the error handling of
 memblock_alloc failure
Date: Wed, 22 Jan 2020 08:42:15 +0100
Message-ID: <20200122074215.GA178804@furthur.local>
References: <20200121232818.28018-1-pakki001@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200121232818.28018-1-pakki001@umn.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Aditya Pakki <pakki001@umn.edu>
Cc: kjlu@umn.edu, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Juergen Gross <jgross@suse.com>, Andrew Morton <akpm@linux-foundation.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Mike Rapoport <rppt@linux.ibm.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, Allison Randal <allison@lohutok.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 21, 2020 at 05:28:16PM -0600, Aditya Pakki wrote:
> In case of an error in memblock_alloc, the code calls both panic and
> BUG_ON. Revert the error handling to BUG_ON.
> 
> Fixes: 8a7f97b902f4 (add checks for the return value of memblock_alloc*())
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>

Reviewed-by: Lubomir Rintel <lkundrak@v3.sk>

Thank you
Lubo

> ---
>  arch/x86/platform/olpc/olpc_dt.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olpc/olpc_dt.c
> index 26d1f6693789..92d5ce1232ab 100644
> --- a/arch/x86/platform/olpc/olpc_dt.c
> +++ b/arch/x86/platform/olpc/olpc_dt.c
> @@ -137,9 +137,6 @@ void * __init prom_early_alloc(unsigned long size)
>  		 * wasted bootmem) and hand off chunks of it to callers.
>  		 */
>  		res = memblock_alloc(chunk_size, SMP_CACHE_BYTES);
> -		if (!res)
> -			panic("%s: Failed to allocate %zu bytes\n", __func__,
> -			      chunk_size);
>  		BUG_ON(!res);
>  		prom_early_allocated += chunk_size;
>  		memset(res, 0, chunk_size);
> -- 
> 2.20.1
> 
