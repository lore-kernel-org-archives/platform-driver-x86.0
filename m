From: sathyanarayanan kuppuswamy
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86: intel_pmc_ipc: fix io mem mapping
 size
Date: Thu, 16 Mar 2017 14:15:44 -0700
Message-ID: <470f3875-99f1-1bd2-da36-733f8c34d5fa@linux.intel.com>
References: <1ab8d18dd7f5428869e6e77026ac4206863eea08.1489634924.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <20170316145203.GA23198@rajaneesh-OptiPlex-9010>
 <CAHp75VdTJLUG_SJYm7pk5Aoqs=gV0QG2yJGe4y9pP98yvHcKLw@mail.gmail.com>
 <20170316181356.GA19029@rajaneesh-OptiPlex-9010>
 <CAHp75VcgXYpOjqqgGshfKb+gih+nQYq_AoMH1OVbPd4np6LZ8g@mail.gmail.com>
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:14365 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752657AbdCPVT0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2017 17:19:26 -0400
In-Reply-To: <CAHp75VcgXYpOjqqgGshfKb+gih+nQYq_AoMH1OVbPd4np6LZ8g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Andy Shevchenko <andy@infradead.org>, Zha Qipeng <qipeng.zha@intel.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Andy,


On 03/16/2017 01:12 PM, Andy Shevchenko wrote:
> On Thu, Mar 16, 2017 at 8:13 PM, Rajneesh Bhardwaj
> <rajneesh.bhardwaj@intel.com> wrote:
>> On Thu, Mar 16, 2017 at 06:05:39PM +0200, Andy Shevchenko wrote:
>>> On Thu, Mar 16, 2017 at 4:52 PM, Rajneesh Bhardwaj
>>> <rajneesh.bhardwaj@intel.com> wrote:
>>>> On Wed, Mar 15, 2017 at 08:32:53PM -0700, Kuppuswamy Sathyanarayanan wrote:
>>>>> Mapping entire GCR mem region in this driver creates
>>>>> mem region request conflict in sub devices that depend
>>>>> on PMC. This creates driver probe failure in devices like
>>>>> iTC0_wdt and telemetry device.
>>>> iTCO_WDT driver needs to check the BIT4 (NO_REBOOT) of PMC_CFG register
>>>> (Offset: 0x1008) and this falls in GCR space.
>>> Are we talking about ACPI-enabled platform?
>> IIUC, you are referring to WDT enumerated by ACPI tables (WDAT, WDRT etc) ?
>>
>> On APL/BXT i think we pass the resource mapping to iTCO_WDT driver since
>> acpi_has_watchdog provides the required protection. For non ACPI-enabled
>> platforms we have this issue since iTCO_WDT driver anyway tries resource
>> mapping when the iTCO_version >=2.
> And driver with necessary stuff should be already in upstream.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/tree/drivers/mfd/lpc_ich.c?h=watchdog-next#n552
>
> Or it's not enough?
Can this driver replace intel_pmc_ipc driver ? It seems to be missing 
IPC related APIs.

Regarding iTCO watchdog section, I think this driver also passes GCR 
region as memory resource to iTCO_WDT device.
>

-- 
Sathyanarayanan Kuppuswamy
Android kernel developer
