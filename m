From: =?UTF-8?Q?Christian_K=c3=b6nig?= <deathsimple@vodafone.de>
Subject: Re: [PATCH 2/4] PCI: add functionality for resizing resources v3
Date: Tue, 2 May 2017 17:51:36 +0200
Message-ID: <6238d127-1c70-8235-e247-bb6cb3f4c040@vodafone.de>
References: <1493126394-1239-1-git-send-email-deathsimple@vodafone.de>
 <1493126394-1239-3-git-send-email-deathsimple@vodafone.de>
 <CAHp75VfSFBYgHRsX2JSH0zdSEW8VvXbNMVvBBsD9kKgzGr-v2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfSFBYgHRsX2JSH0zdSEW8VvXbNMVvBBsD9kKgzGr-v2w@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: helgaas@kernel.org, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, dri-devel@lists.freedesktop.org, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Am 26.04.2017 um 19:00 schrieb Andy Shevchenko:
> On Tue, Apr 25, 2017 at 4:19 PM, Christian König
> <deathsimple@vodafone.de> wrote:
>> From: Christian König <christian.koenig@amd.com>
>>
>> This allows device drivers to request resizing their BARs.
>>
>> The function only tries to reprogram the windows of the bridge directly above
>> the requesting device and only the BAR of the same type (usually mem, 64bit,
>> prefetchable). This is done to make sure not to disturb other drivers by
>> changing the BARs of their devices.
>>
>> If reprogramming the bridge BAR fails the old status is restored and -ENOSPC
>> returned to the calling device driver.
>> +int pci_reassign_bridge_resources(struct pci_dev *bridge, unsigned long type)
>> +{
>> +       const unsigned long type_mask = IORESOURCE_IO | IORESOURCE_MEM |
>> +               IORESOURCE_PREFETCH | IORESOURCE_MEM_64;
>> +
> Redundant.

Redundant, but also a reminder to myself that I wanted to ask something 
about that.

This type_mask is used already three times in this file, shouldn't we 
add a define for that?

> [SNIP]
>> +       list_for_each_entry(dev_res, &saved, list) {
>> +               /* Skip the bridge we just assigned resources for. */
>> +               if (bridge == dev_res->dev)
>> +                       continue;
>> +
>> +               bridge = dev_res->dev;
>> +               pci_setup_bridge(bridge->subordinate);
>> +       }
>> +
>> +       free_list(&saved);
>> +       free_list(&failed);
>> +       return ret;
> You might re-use two lines with below, but perhaps better to show
> which case returns 0 explicitly and drop assignment ret = 0 above.

Good point, but actually the free_list(&failed) is superfluous here 
since when the failed list isn't empty we end up in the cleanup path.

Going to fix all other comments in the next version.

Regards,
Christian.
