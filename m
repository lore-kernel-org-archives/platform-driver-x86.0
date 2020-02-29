From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v3 7/7] mm/memremap: Set caching mode for PCI P2PDMA
 memory to WC
Date: Sat, 29 Feb 2020 14:47:47 -0800
Message-ID: <CAPcyv4gNi3sesGnujShStoF8bi8kYg+MQkqhQRCT_1+wex5wbw@mail.gmail.com>
References: <20200221182503.28317-1-logang@deltatee.com> <20200221182503.28317-8-logang@deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20200221182503.28317-8-logang@deltatee.com>
Sender: linux-ia64-owner@vger.kernel.org
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-ia64@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-s390 <linux-s390@vger.kernel.org>, Linux-sh <linux-sh@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Linux MM <linux-mm@kvack.org>, Michal Hocko <mhocko@kernel.org>, David Hildenbrand <david@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Andy
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 21, 2020 at 10:25 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
> PCI BAR IO memory should never be mapped as WB, however prior to this
> the PAT bits were set WB and it was typically overridden by MTRR
> registers set by the firmware.
>
> Set PCI P2PDMA memory to be WC (writecombining) as the only current
> user (the NVMe CMB) was originally mapped WC before the P2PDMA code
> replaced the mapping with devm_memremap_pages().

Will the change to UC regress this existing use case?

>
> Future use-cases may need to generalize this by adding flags to
> select the caching type, as some P2PDMA cases will not want WC.
> However, those use-cases are not upstream yet and this can be changed
> when they arrive.
>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---
>  mm/memremap.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 06742372a203..8d141c3e3364 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -190,7 +190,10 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>                 }
>                 break;
>         case MEMORY_DEVICE_DEVDAX:
> +               need_devmap_managed = false;
> +               break;
>         case MEMORY_DEVICE_PCI_P2PDMA:
> +               params.pgprot = pgprot_writecombine(params.pgprot);

Approach looks good to me, modulo Jason's comment that this should be
UC. Upcoming DAX changes will want to pass this via pgmap, but as you
say this can wait for this changes to arrive.

After change to UC:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
