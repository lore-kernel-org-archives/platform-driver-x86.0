From: sathyanarayanan kuppuswamy
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v2 1/4] platform/x86: intel_pmc_ipc: fix gcr offset
Date: Fri, 17 Mar 2017 10:06:27 -0700
Message-ID: <d5a5ba7d-4c29-8879-69cb-e1b68f7d15b2@linux.intel.com>
References: <20170316192003.GA19344@rajaneesh-OptiPlex-9010>
 <b89221c652d06c3c07fdf2ec32fd4fc8930c64df.1489710235.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <20170317111310.GC24582@rajaneesh-OptiPlex-9010>
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:64623 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751151AbdCQRKK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Mar 2017 13:10:10 -0400
In-Reply-To: <20170317111310.GC24582@rajaneesh-OptiPlex-9010>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: andy@infradead.org, qipeng.zha@intel.com, dvhart@infradead.org, david.e.box@linux.intel.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, shanth.murthy@intel.com



On 03/17/2017 04:13 AM, Rajneesh Bhardwaj wrote:
> On Thu, Mar 16, 2017 at 05:41:33PM -0700, Kuppuswamy Sathyanarayanan wrote:
>> According to the PMC spec, gcr offset from ipc mem
>> region is 0x1000(4K). But currently this driver uses
>> 0x1008 as gcr offset. This patch fixes this issue.
>>
> This one is fine and was one of the WIP patches. This now enables further
> cleanup and we should re-align GCR_TELEM_DEEP_S0IX_OFFSET from gcr_base.
Since S0IX_OFFSET currently does not use GCR_OFFSET as base, I think 
that change is irrelevant to this fix.
I can submit another patch for S0IX_OFFSET cleanup.
>
> CC: Shanth Murthy <shanth.murthy@intel.com>
>   
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>> ---
>>   drivers/platform/x86/intel_pmc_ipc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
>> index 0651d47..0a33592 100644
>> --- a/drivers/platform/x86/intel_pmc_ipc.c
>> +++ b/drivers/platform/x86/intel_pmc_ipc.c
>> @@ -82,7 +82,7 @@
>>   /* exported resources from IFWI */
>>   #define PLAT_RESOURCE_IPC_INDEX		0
>>   #define PLAT_RESOURCE_IPC_SIZE		0x1000
>> -#define PLAT_RESOURCE_GCR_OFFSET	0x1008
>> +#define PLAT_RESOURCE_GCR_OFFSET	0x1000
>>   #define PLAT_RESOURCE_GCR_SIZE		0x1000
>>   #define PLAT_RESOURCE_BIOS_DATA_INDEX	1
>>   #define PLAT_RESOURCE_BIOS_IFACE_INDEX	2
>> -- 
>> 2.7.4
>>

-- 
Sathyanarayanan Kuppuswamy
Android kernel developer
