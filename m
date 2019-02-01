From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] dell_rbu: stop abusing the DMA API
Date: Fri, 1 Feb 2019 15:17:02 -0800
Message-ID: <20190201231702.GD105752@fedora.eng.vmware.com>
References: <20190129073409.7247-1-hch@lst.de>
 <4fce2a6c-2e57-bc29-0dca-8ed3bef95333@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4fce2a6c-2e57-bc29-0dca-8ed3bef95333@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 01, 2019 at 12:28:46PM -0600, Stuart Hayes wrote:
> 
> On 1/29/2019 1:34 AM, Christoph Hellwig wrote:
> > For some odd reason dell_rbu actually seems to want the physical and
> > not a bus address for the allocated buffer.  Lets assume that actually
> > is correct given that it is BIOS-related and that is a good source
> > of insanity.  In that case we should not use dma_alloc_coherent with
> > a NULL device to allocate memory, but use GFP_DMA32 to stay under
> > the 32-bit BIOS limit.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---

...

> 
> Acked-by: Stuart Hayes <stuart.w.hayes@gmail.com>
> 

Ah, prematurely pulled in Mario - thanks Stuart.

-- 
Darren Hart
VMware Open Source Technology Center
