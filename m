From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] x86/uv/time: Replace one-element array and save heap
 space
Date: Wed, 20 May 2020 10:19:07 -0700
Message-ID: <202005201017.72D1B3A@keescook>
References: <20200518190114.GA7757@embeddedor>
 <b03d196cdbbbc6e9e8456910c6c6673ab67f76cb.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b03d196cdbbbc6e9e8456910c6c6673ab67f76cb.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "x86@kernel.org H. Peter Anvin" <hpa@zytor.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, May 18, 2020 at 12:09:16PM -0700, Joe Perches wrote:
> On Mon, 2020-05-18 at 14:01 -0500, Gustavo A. R. Silva wrote:
> > The current codebase makes use of one-element arrays in the following
> > form:
> > 
> > struct something {
> >     int length;
> >     u8 data[1];
> > };
> []
> > This issue has been out there since 2009.
> > This issue was found with the help of Coccinelle and fixed _manually_.
> []
> > diff --git a/arch/x86/platform/uv/uv_time.c b/arch/x86/platform/uv/uv_time.c
> > index 7af31b245636..993a8ae6fdfb 100644
> > --- a/arch/x86/platform/uv/uv_time.c
> > +++ b/arch/x86/platform/uv/uv_time.c
> > @@ -52,7 +52,7 @@ struct uv_rtc_timer_head {
> >  	struct {
> >  		int	lcpu;		/* systemwide logical cpu number */
> >  		u64	expires;	/* next timer expiration for this cpu */
> > -	} cpu[1];
> > +	} cpu[];
> >  };
> >  
> >  /*
> > @@ -156,9 +156,8 @@ static __init int uv_rtc_allocate_timers(void)
> >  		struct uv_rtc_timer_head *head = blade_info[bid];
> >  
> >  		if (!head) {
> > -			head = kmalloc_node(sizeof(struct uv_rtc_timer_head) +
> > -				(uv_blade_nr_possible_cpus(bid) *
> > -					2 * sizeof(u64)),
> > +			head = kmalloc_node(struct_size(head, cpu,
> > +				uv_blade_nr_possible_cpus(bid)),
> 
> It's probably safer to use kzalloc_node here as well.

Hm, I think it's not actually needed here. All three members are
immediately initialized and it doesn't look to ever be copied to
userspace.

> 
> >  				GFP_KERNEL, nid);
> >  			if (!head) {
> >  				uv_rtc_deallocate_timers();
> 

FWIW, I think this change is good as-is. Always nice to get back a
little memory. ;)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
