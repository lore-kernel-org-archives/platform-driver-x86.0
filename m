From: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v3 4/7] x86/mm: Introduce _set_memory_prot()
Date: Mon, 2 Mar 2020 11:46:13 -0700
Message-ID: <1be997b0-e17a-5d48-efad-a01d84d5e496@deltatee.com>
References: <20200221182503.28317-1-logang@deltatee.com>
 <20200221182503.28317-5-logang@deltatee.com>
 <CAPcyv4j=bZ5KBPp6PbViERdDe+HZpV_W6qbSJupTNAzyfiK6xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <CAPcyv4j=bZ5KBPp6PbViERdDe+HZpV_W6qbSJupTNAzyfiK6xg@mail.gmail.com>
Content-Language: en-CA
Sender: linux-ia64-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-ia64@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-s390 <linux-s390@vger.kernel.org>, Linux-sh <linux-sh@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Linux MM <linux-mm@kvack.org>, Michal Hocko <mhocko@kernel.org>, David Hildenbrand <david@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Andy
List-Id: platform-driver-x86.vger.kernel.org



On 2020-02-29 3:33 p.m., Dan Williams wrote:
> On Fri, Feb 21, 2020 at 10:25 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>>
>> For use in the 32bit arch_add_memory() to set the pgprot type of the
>> memory to add.
>>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Borislav Petkov <bp@alien8.de>
>> Cc: "H. Peter Anvin" <hpa@zytor.com>
>> Cc: x86@kernel.org
>> Cc: Dave Hansen <dave.hansen@linux.intel.com>
>> Cc: Andy Lutomirski <luto@kernel.org>
>> Cc: Peter Zijlstra <peterz@infradead.org>
>> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
>> ---
>>  arch/x86/include/asm/set_memory.h | 1 +
>>  arch/x86/mm/pat/set_memory.c      | 7 +++++++
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
>> index 64c3dce374e5..0aca959cf9a4 100644
>> --- a/arch/x86/include/asm/set_memory.h
>> +++ b/arch/x86/include/asm/set_memory.h
>> @@ -34,6 +34,7 @@
>>   * The caller is required to take care of these.
>>   */
>>
>> +int _set_memory_prot(unsigned long addr, int numpages, pgprot_t prot);
> 
> I wonder if this should be separated from the naming convention of the
> other routines because this is only an internal helper for code paths
> where the prot was established by an upper layer. For example, I
> expect that the kernel does not want new usages to make the mistake of
> calling:
> 
>    _set_memory_prot(..., pgprot_writecombine(pgprot))
> 
> ...instead of
> 
>     _set_memory_wc()
> 
> I'm thinking just a double underscore rename (__set_memory_prot) and a
> kerneldoc comment for that  pointing people to use the direct
> _set_memory_<cachemode> helpers.

Thanks! Will do. Note, though, that even _set_memory_wc() is an internal
x86-specific function. But the extra comment and underscore still make
sense.

> With that you can add:
> 
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> 
