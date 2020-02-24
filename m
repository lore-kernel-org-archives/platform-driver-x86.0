From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 2/7] mm/memory_hotplug: Rename mhp_restrictions to
 mhp_params
Date: Mon, 24 Feb 2020 10:11:52 +0100
Message-ID: <e428521d-3509-5403-f8d8-c584a7d4d320@redhat.com>
References: <20200221182503.28317-1-logang@deltatee.com>
 <20200221182503.28317-3-logang@deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20200221182503.28317-3-logang@deltatee.com>
Content-Language: en-US
Sender: linux-ia64-owner@vger.kernel.org
To: Logan Gunthorpe <logang@deltatee.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Eric Badger <ebadger@gigaio.com>
List-Id: platform-driver-x86.vger.kernel.org

On 21.02.20 19:24, Logan Gunthorpe wrote:
> The mhp_restrictions struct really doesn't specify anything resembling
> a restriction anymore so rename it to be mhp_params as it is a list
> of extended parameters.
> 
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb
