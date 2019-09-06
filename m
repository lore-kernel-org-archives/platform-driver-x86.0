From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] x86/platform/uv: move kmalloc() NULL check routine
Date: Fri, 6 Sep 2019 12:53:52 +0200
Message-ID: <20190906105352.GA8656@kroah.com>
References: <20190905232951.GA28779@LGEARND20B15>
 <20190906093252.GB16843@kroah.com>
 <20190906104341.GW2349@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190906104341.GW2349@hirez.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Austin Kim <austindh.kim@gmail.com>, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org, dvhart@infradead.org, andy@infradead.org, hpa@zytor.com, allison@lohutok.net, armijn@tjaldur.nl, kjlu@umn.edu, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Sep 06, 2019 at 12:43:41PM +0200, Peter Zijlstra wrote:
> On Fri, Sep 06, 2019 at 11:32:52AM +0200, Greg KH wrote:
> > On Fri, Sep 06, 2019 at 08:29:51AM +0900, Austin Kim wrote:
> > > The result of kmalloc should have been checked ahead of below statement:
> > > 	pqp = (struct bau_pq_entry *)vp;
> > > 
> > > Move BUG_ON(!vp) before above statement.
> > > 
> > > Signed-off-by: Austin Kim <austindh.kim@gmail.com>
> > > ---
> > >  arch/x86/platform/uv/tlb_uv.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
> > > index 20c389a..5f0a96bf 100644
> > > --- a/arch/x86/platform/uv/tlb_uv.c
> > > +++ b/arch/x86/platform/uv/tlb_uv.c
> > > @@ -1804,9 +1804,9 @@ static void pq_init(int node, int pnode)
> > >  
> > >  	plsize = (DEST_Q_SIZE + 1) * sizeof(struct bau_pq_entry);
> > >  	vp = kmalloc_node(plsize, GFP_KERNEL, node);
> > > -	pqp = (struct bau_pq_entry *)vp;
> > > -	BUG_ON(!pqp);
> > > +	BUG_ON(!vp);
> > 
> > Ick!  Don't crash the whole machine if you are out of memory, that's a
> > totally lazy and broken driver.  Fix this up properly please.
> 
> This is boot time init; if memory allocation fails, we're in trouble, no
> way forward no way back.
> 
> It is not uncommon to have BUG_ON() for alloc failing during boot.

Hey, how come you get to get away with this here, and in the tty layer I
had to do all sorts of foolish things just for the same "impossible"
thing because syzbot found a way to emulate such lunacy?

Just you wait until the fuzzers get ahold of this code...  :)

greg k-h
