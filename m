From: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v3 0/7] Allow setting caching mode in arch_add_memory()
 for P2PDMA
Date: Thu, 27 Feb 2020 10:21:50 -0700
Message-ID: <e8781f85-3fc7-b9ce-c751-606803cbdc77@deltatee.com>
References: <20200221182503.28317-1-logang@deltatee.com>
 <20200227171704.GK31668@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20200227171704.GK31668@ziepe.ca>
Content-Language: en-US
Sender: linux-ia64-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>, David Hildenbrand <david@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org



On 2020-02-27 10:17 a.m., Jason Gunthorpe wrote:
>> Instead of this, this series proposes a change to arch_add_memory()
>> to take the pgprot required by the mapping which allows us to
>> explicitly set pagetable entries for P2PDMA memory to WC.
> 
> Is there a particular reason why WC was selected here? I thought for
> the p2pdma cases there was no kernel user that touched the memory?

Yes, that's correct. I choose WC here because the existing users are
registering memory blocks without side effects which fit the WC
semantics well.

> I definitely forsee devices where we want UC instead.

Yes. My expectation is that once we have a kernel user that needs this,
we'd wire the option through struct dev_pagemap so the caller can choose
the mapping that makes sense.

Logan
