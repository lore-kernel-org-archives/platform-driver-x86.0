From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Subject: Re: [PATCH] x86/cpu: Add Icelake-NNPI to Intel family
Date: Wed, 5 Jun 2019 00:54:12 +0530
Message-ID: <79e33a93-6180-5a58-0d8c-b34276e710f3@linux.intel.com>
References: <20190530123827.8218-1-rajneesh.bhardwaj@linux.intel.com>
 <20190604160914.GN9224@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604160914.GN9224@smile.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, bp@suse.de, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Kan Liang <kan.liang@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, platform-driver-x86@vger.kernel.org, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Linux PM <linux-pm@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy

On 04-Jun-19 9:39 PM, Andy Shevchenko wrote:
> On Thu, May 30, 2019 at 06:08:27PM +0530, Rajneesh Bhardwaj wrote:
>> Add the CPUID model number of Icelake Neural Network Processor for Deep
> I believe we spell "Ice Lake".

I referred to https://patchwork.kernel.org/patch/10812551/ , 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6e394376ee89233508fa21d006546357f8efee31 
and many others where it mentioned Icelake. I am fine to change it the 
way you are suggesting, please confirm if its still needed and i will 
send a v2.

Thank you.

>
>> Learning Inference (ICL-NNPI) to the Intel family list. Icelake NNPI uses
> Ditto.
>
>> model number 0x9D and this will be documented in a future version of Intel
>> Software Development Manual.
>>
>> Cc: Borislav Petkov <bp@alien8.de>
>> Cc: Dave Hansen <dave.hansen@linux.intel.com>
>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Cc: "H. Peter Anvin" <hpa@zytor.com>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Kan Liang <kan.liang@linux.intel.com>
>> Cc: Peter Zijlstra <peterz@infradead.org>
>> Cc: platform-driver-x86@vger.kernel.org
>> Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
>> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>> Cc: Len Brown <lenb@kernel.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: x86-ml <x86@kernel.org>
>> Cc: Linux PM <linux-pm@vger.kernel.org>
>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
>> ---
>>   arch/x86/include/asm/intel-family.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/x86/include/asm/intel-family.h b/arch/x86/include/asm/intel-family.h
>> index 9f15384c504a..087de5d3b93a 100644
>> --- a/arch/x86/include/asm/intel-family.h
>> +++ b/arch/x86/include/asm/intel-family.h
>> @@ -53,6 +53,7 @@
>>   #define INTEL_FAM6_CANNONLAKE_MOBILE	0x66
>>   
>>   #define INTEL_FAM6_ICELAKE_MOBILE	0x7E
>> +#define INTEL_FAM6_ICELAKE_NNPI		0x9D
>>   
>>   /* "Small Core" Processors (Atom) */
>>   
>> -- 
>> 2.17.1
>>
