From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 06/11] intel_sgx: driver for Intel Software Guard
 Extensions
Date: Wed, 29 Nov 2017 20:02:32 +0200
Message-ID: <20171129180232.h3f2fbqocfj32tg7@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-7-jarkko.sakkinen@linux.intel.com>
 <20171126173356.ik7dhvvcojgermof@linux.intel.com>
 <20171126184627.hegr3qzgous5ivpe@linux.intel.com>
 <20171126190109.qfvjoq2sbz5x3ve7@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171126190109.qfvjoq2sbz5x3ve7@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Nov 26, 2017 at 09:01:09PM +0200, Jarkko Sakkinen wrote:
> On Sun, Nov 26, 2017 at 08:46:27PM +0200, Jarkko Sakkinen wrote:
> > On Sun, Nov 26, 2017 at 07:33:56PM +0200, Jarkko Sakkinen wrote:
> > > > +struct sgx_encl_page {
> > > > +	unsigned long addr;
> > > > +	unsigned int flags;
> > > > +	void *epc_page;
> > > > +	struct sgx_va_page *va_page;
> > > > +	unsigned int va_offset;
> > > > +	struct list_head list;
> > > > +};
> > > 
> > > This can be without major streches hoops packed way more. There are 12
> > > bits free for use in the addr field. I can use low three bits for flags
> > > and upper nine bits for va_offset.
> > > 
> > > I think I can also quite easily union epc_page and va_page fields.
> > > 
> > > With these changes the struct would shrink to:
> > > 
> > > struct sgx_encl_page {
> > > 	unsigned long addr;
> > > 	union {
> > > 		void *epc_page;
> > > 		struct sgx_va_page *va_page;
> > > 	};
> > > 	struct list_head list;
> > > };
> > 
> > Once I started to thinking more about this I realized that this can be
> > shrunk even further. I can drop the list field and use a tag for loaded
> > pages in the radix tree where these are stored. The end result would be
> > 
> > struct sgx_encl_page {
> > 	unsigned long addr;
> >  	union {
> >  		void *epc_page;
> >  		struct sgx_va_page *va_page;
> >  	};
> > };
> 
> With this last size optimization there is an issue that it would be nice
> to select the pages to be swapped out in FIFO order. That kind of means
> that tag would not work quite well.
> 
> I could try an approach where I have a pointer array to present a queue
> inside struct sgx_encl for loaded pages and in that way get rid of the
> 'list' field.

I did other optimizations except taking the list field away so it's now
a 32 byte structure. I guess sufficient for the first mainline version.

/Jarkko
