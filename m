From: sathyanarayanan kuppuswamy
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v1 1/4] platform/x86: intel_pmc_ipc: Use BIT() macro
Date: Wed, 10 Apr 2019 10:55:37 -0700
Message-ID: <f78c610a-7ae7-0a5c-c58c-ec2b597b7e6c@linux.intel.com>
References: <20190409112515.84725-1-andriy.shevchenko@linux.intel.com>
 <7bb60283-f99f-679d-4efa-45962ccd68f3@linux.intel.com>
 <20190409173939.GY9224@smile.fi.intel.com>
 <20190410135913.GK9224@smile.fi.intel.com>
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190410135913.GK9224@smile.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Zha Qipeng <qipeng.zha@intel.com>, junxiao.chang@intel.com, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


On 4/10/19 6:59 AM, Andy Shevchenko wrote:
> On Tue, Apr 09, 2019 at 08:39:39PM +0300, Andy Shevchenko wrote:
>> On Tue, Apr 09, 2019 at 10:07:35AM -0700, sathyanarayanan kuppuswamy wrote:
>>> On 4/9/19 4:25 AM, Andy Shevchenko wrote:
>>>> Use BIT() and BIT_MASK() macros for definitions.
>>> Looks good to me.
>> Thanks!
> If you have no further comments, can you provide your tag here?
Reviewed-by: Kuppuswamy Sathyanarayanan 
<sathyanarayanan.kuppuswamy@linux.intel.com>
>
>>>>    /* PMC register bit definitions */
>>>>    /* PMC_CFG_REG bit masks */
>>>> -#define PMC_CFG_NO_REBOOT_MASK		(1 << 4)
>>>> +#define PMC_CFG_NO_REBOOT_MASK		BIT_MASK(4)
>>>>    #define PMC_CFG_NO_REBOOT_EN		(1 << 4)
>>>>    #define PMC_CFG_NO_REBOOT_DIS		(0 << 4)
>>> Do we need 0 << 4 ?
>> Yes, to explicitly show that this is a value for NO_REBOOT masked bit(s)
>> (single bit in this case).
>>
>> -- 
>> With Best Regards,
>> Andy Shevchenko
>>
>>
-- 
Sathyanarayanan Kuppuswamy
Linux kernel developer
