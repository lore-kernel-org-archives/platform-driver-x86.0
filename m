From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] dell_rbu: stop abusing the DMA API
Date: Sat, 2 Feb 2019 18:16:59 +0100
Message-ID: <20190202171659.GA3324@lst.de>
References: <20190129073409.7247-1-hch@lst.de> <20190201231559.GC105752@fedora.eng.vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190201231559.GC105752@fedora.eng.vmware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, stuart.w.hayes@gmail.com, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Mario_Limonciello@Dell.com
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 01, 2019 at 03:15:59PM -0800, Darren Hart wrote:
> On Tue, Jan 29, 2019 at 08:34:09AM +0100, Christoph Hellwig wrote:
> > For some odd reason dell_rbu actually seems to want the physical and
> > not a bus address for the allocated buffer.  Lets assume that actually
> > is correct given that it is BIOS-related and that is a good source
> > of insanity.  In that case we should not use dma_alloc_coherent with
> > a NULL device to allocate memory, but use GFP_DMA32 to stay under
> > the 32-bit BIOS limit.
> 
> + Mario re bios related physical address - is Christoph's assumption
> correct?
> 
> Christoph, did you observe a failure? If so, we should probably also
> tag for stable.

No, I've been auditing for DMA API (ab-)users that don't pass a
struct device.  Generally the fix was to just pass a struct device
that is easily available.  But dell_rbu doesn't actually seem to
be a "device" in the traditional sense, and the way it uses the
DMA API is really, really odd - it first does a virt_to_phys on
memory allocated from the page allocator (so works with physical
addresses in that case) and the retries with a dma_alloc_coherent
with a NULL argument, which in no way is guaranteed to you give
you something else, although for the current x86 implementation
will give you the equivalent of a GFP_DMA32 page allocator allocation
plus virt_to_phys.
