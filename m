From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Subject: Re: [PATCH v2 06/10] x86/cpu: Add Icelake to Intel family
Date: Wed, 13 Feb 2019 21:13:01 +0530
Message-ID: <308aa852-b2c3-3336-707f-d54de6ad77b7@linux.intel.com>
References: <20190213150810.32750-1-rajneesh.bhardwaj@linux.intel.com>
 <20190213150810.32750-7-rajneesh.bhardwaj@linux.intel.com>
 <20190213152326.GA1883@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213152326.GA1883@zn.tnic>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: platform-driver-x86@vger.kernel.org, dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, "David E. Box" <david.e.box@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org


On 13-Feb-19 8:53 PM, Borislav Petkov wrote:
> On Wed, Feb 13, 2019 at 08:38:06PM +0530, Rajneesh Bhardwaj wrote:
>> Add CPUID of Icelake (ICL) mobile processors to Intel family list. The
>> information related to ICL CPUID is referenced from below Coreboot
>> project link.
>>
>> https://github.com/coreboot/coreboot/blob/5ebcea3aaaa3cd358bc5bccaa156b13a6ef25df6/src/soc/intel/common/block/include/intelblocks/mp_init.h
>>
> I believe tglx was suggesting you should drop this link. If you can't
> reference an official document, then you don't need any reference.

Icelake related information is  available here 
https://www.intel.in/content/www/in/en/design/products-and-solutions/processors-and-chipsets/ice-lake/overview.html 
but it may require a login either with Intel or a Partner ID.

The CPUID mentioned in this document is 0x706E0 which is same as per 
this coreboot link.


>
