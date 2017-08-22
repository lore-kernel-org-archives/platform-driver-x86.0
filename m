From: sathya <sathyaosid@gmail.com>
Subject: Re: [RFC v1 1/6] platform/x86: intel_pmc_ipc: Fix error handling in
 ipc_pci_probe()
Date: Mon, 21 Aug 2017 22:01:06 -0700
Message-ID: <37f8b893-b93a-dbd5-dde7-6c96b3b9ab1a@gmail.com>
References: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <5d15388eeb82aed7839b6d842c26168a935c915a.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75VeEmafhdju6Ekq1syqb7ir2Ntov7Ypbby8bFDfKPQ8+pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:38162 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751043AbdHVFBJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2017 01:01:09 -0400
In-Reply-To: <CAHp75VeEmafhdju6Ekq1syqb7ir2Ntov7Ypbby8bFDfKPQ8+pw@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zha Qipeng <qipeng.zha@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

Hi Andy,


On 08/18/2017 05:22 AM, Andy Shevchenko wrote:
> On Tue, Aug 1, 2017 at 9:13 PM,
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>
>> This patch adds proper error handling for failure cases in
>> ipc_pci_probe() function.
>>
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>> ---
>>   drivers/platform/x86/intel_pmc_ipc.c | 23 ++++++++++++++++++-----
>>   1 file changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
>> index bb792a5..7b65237 100644
>> --- a/drivers/platform/x86/intel_pmc_ipc.c
>> +++ b/drivers/platform/x86/intel_pmc_ipc.c
>> @@ -489,33 +489,46 @@ static int ipc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>
>>          ret = pci_enable_device(pdev);
>>          if (ret)
>> -               return ret;
>> +               goto release_device;
> Instead of doing this way and ping-ponging code in the same series,
> better to switch to managed PCI functions in the first place.
ok. I will merge this patch and "Use devm_* calls in driver probe" patch 
into a single patch.

>

-
Sathya
