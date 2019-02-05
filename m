From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Subject: Re: [PATCH 06/10] x86/cpu: Add Icelake to Intel family
Date: Tue, 5 Feb 2019 09:21:13 +0530
Message-ID: <15d691de-609a-b74c-5cf4-0e78a88bdc60@linux.intel.com>
References: <20190201073234.13280-1-rajneesh.bhardwaj@linux.intel.com>
 <20190201073234.13280-7-rajneesh.bhardwaj@linux.intel.com>
 <alpine.DEB.2.21.1902041731500.3006@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1902041731500.3006@nanos.tec.linutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: platform-driver-x86@vger.kernel.org, dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "David E. Box" <david.e.box@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org


On 04-Feb-19 11:04 PM, Thomas Gleixner wrote:
> On Fri, 1 Feb 2019, Rajneesh Bhardwaj wrote:
>
>> Add CPUID of Icelake (ICL) mobile processors to Intel family list. The
>> Information related to ICL CPUID is referenced from below Coreboot
>> project link.
>>
>> https://github.com/coreboot/coreboot/blob/5ebcea3aaaa3cd358bc5bccaa156b13a6ef25df6/src/soc/intel/common/block/include/intelblocks/mp_init.h
> Coreboot files are hardly authoritive information about CPUIDs.

It may take a while for it to be published in the SDMs.

>
>> diff --git a/arch/x86/include/asm/intel-family.h b/arch/x86/include/asm/intel-family.h
>> index 0dd6b0f4000e..12b65bdb3d80 100644
>> --- a/arch/x86/include/asm/intel-family.h
>> +++ b/arch/x86/include/asm/intel-family.h
>> @@ -52,6 +52,8 @@
>>   
>>   #define INTEL_FAM6_CANNONLAKE_MOBILE	0x66
>>   
>> +#define INTEL_FAM6_ICELAKE_MOBILE       0x7E
> Please use TABs instead of a random number of spaces.

Sure, I will fix this.

>
> Thanks,
>
> 	tglx
