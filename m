From: Alexey Budankov <alexey.budankov@linux.intel.com>
Subject: Re: [PATCH V3 3/3] platform/x86: Intel PMT Telemetry capability
 driver
Date: Thu, 16 Jul 2020 08:57:24 +0300
Message-ID: <8a580318-9bd4-1146-f2e9-6cb851828762@linux.intel.com>
References: <20200508021844.6911-1-david.e.box@linux.intel.com>
 <20200714062323.19990-4-david.e.box@linux.intel.com>
 <727a75a0-3fb5-769a-cf1f-70a2a0bab0c8@linux.intel.com>
 <245ecc65a839bd69413045ae5ee307ba03ca0869.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <245ecc65a839bd69413045ae5ee307ba03ca0869.camel@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: david.e.box@linux.intel.com, lee.jones@linaro.org, dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com, alexander.h.duyck@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, Alexey Budankov <alexey.budankov@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org


On 16.07.2020 2:59, David E. Box wrote:
> On Wed, 2020-07-15 at 10:39 +0300, Alexey Budankov wrote:
>> Hi David,
>>
>> On 14.07.2020 9:23, David E. Box wrote:
> 
> ...
> 
>>>
>>> +static int pmt_telem_open(struct inode *inode, struct file *filp)
>>> +{
>>> +	struct pmt_telem_priv *priv;
>>> +	struct pmt_telem_entry *entry;
>>> +	struct pci_driver *pci_drv;
>>> +	struct pci_dev *pci_dev;
>>> +
>>> +	if (!capable(CAP_SYS_ADMIN))
>>
>> Thanks for supplying these patches.
>> Are there any reasons not to expose this feature to CAP_PERFMON
>> privileged
>> processes too that currently have access to performance monitoring
>> features
>> of the kernel without root/CAP_SYS_ADMIN credentials? This could be
>> done by
>> pefmon_capable() function call starting from v5.8+.
> 
> The new capability is well suited for this feature. I'll make the
> change. Thanks.

I appreciate your cooperation. Thanks!

Alexei
