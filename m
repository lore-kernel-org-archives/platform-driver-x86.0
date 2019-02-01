From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] dell_rbu: stop abusing the DMA API
Date: Fri, 1 Feb 2019 15:15:59 -0800
Message-ID: <20190201231559.GC105752@fedora.eng.vmware.com>
References: <20190129073409.7247-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190129073409.7247-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: stuart.w.hayes@gmail.com, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Mario_Limonciello@Dell.com
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 29, 2019 at 08:34:09AM +0100, Christoph Hellwig wrote:
> For some odd reason dell_rbu actually seems to want the physical and
> not a bus address for the allocated buffer.  Lets assume that actually
> is correct given that it is BIOS-related and that is a good source
> of insanity.  In that case we should not use dma_alloc_coherent with
> a NULL device to allocate memory, but use GFP_DMA32 to stay under
> the 32-bit BIOS limit.

+ Mario re bios related physical address - is Christoph's assumption
correct?

Christoph, did you observe a failure? If so, we should probably also
tag for stable.

-- 
Darren Hart
VMware Open Source Technology Center
