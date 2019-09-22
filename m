From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH AUTOSEL 5.3 169/203] x86/platform/uv: Fix kmalloc() NULL
 check routine
Date: Sun, 22 Sep 2019 22:25:44 +0200
Message-ID: <20190922202544.GA2719513@kroah.com>
References: <20190922184350.30563-1-sashal@kernel.org>
 <20190922184350.30563-169-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190922184350.30563-169-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Austin Kim <austindh.kim@gmail.com>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, Hedi Berriche <hedi.berriche@hpe.com>, Linus Torvalds <torvalds@linux-foundation.org>, Mike Travis <mike.travis@hpe.com>, Peter Zijlstra <peterz@infradead.org>, Russ Anderson <russ.anderson@hpe.com>, Steve Wahl <steve.wahl@hpe.com>, Thomas Gleixner <tglx@linutronix.de>, allison@lohutok.net, andy@infradead.org, armijn@tjaldur.nl, bp@alien8.de, dvhart@infradead.org, hpa@zytor.com, kjlu@umn.edu, platform-driver-x86@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Sep 22, 2019 at 02:43:15PM -0400, Sasha Levin wrote:
> From: Austin Kim <austindh.kim@gmail.com>
> 
> [ Upstream commit 864b23f0169d5bff677e8443a7a90dfd6b090afc ]
> 
> The result of kmalloc() should have been checked ahead of below statement:
> 
> 	pqp = (struct bau_pq_entry *)vp;
> 
> Move BUG_ON(!vp) before above statement.
> 
> Signed-off-by: Austin Kim <austindh.kim@gmail.com>
> Cc: Dimitri Sivanich <dimitri.sivanich@hpe.com>
> Cc: Hedi Berriche <hedi.berriche@hpe.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Mike Travis <mike.travis@hpe.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Russ Anderson <russ.anderson@hpe.com>
> Cc: Steve Wahl <steve.wahl@hpe.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: allison@lohutok.net
> Cc: andy@infradead.org
> Cc: armijn@tjaldur.nl
> Cc: bp@alien8.de
> Cc: dvhart@infradead.org
> Cc: gregkh@linuxfoundation.org
> Cc: hpa@zytor.com
> Cc: kjlu@umn.edu
> Cc: platform-driver-x86@vger.kernel.org
> Link: https://lkml.kernel.org/r/20190905232951.GA28779@LGEARND20B15
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  arch/x86/platform/uv/tlb_uv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
> index 20c389a91b803..5f0a96bf27a1f 100644
> --- a/arch/x86/platform/uv/tlb_uv.c
> +++ b/arch/x86/platform/uv/tlb_uv.c
> @@ -1804,9 +1804,9 @@ static void pq_init(int node, int pnode)
>  
>  	plsize = (DEST_Q_SIZE + 1) * sizeof(struct bau_pq_entry);
>  	vp = kmalloc_node(plsize, GFP_KERNEL, node);
> -	pqp = (struct bau_pq_entry *)vp;
> -	BUG_ON(!pqp);
> +	BUG_ON(!vp);
>  
> +	pqp = (struct bau_pq_entry *)vp;
>  	cp = (char *)pqp + 31;
>  	pqp = (struct bau_pq_entry *)(((unsigned long)cp >> 5) << 5);
>  

How did this even get merged in the first place?  I thought a number of
us complained about it.

This isn't any change in code, and the original is just fine, the author
didn't realize how C works :(

Please drop this.

thanks,

greg k-h
