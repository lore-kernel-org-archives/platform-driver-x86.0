From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/1] platform/x86: intel_pmc_ipc: fix io mem mapping size
Date: Thu, 16 Mar 2017 18:05:39 +0200
Message-ID: <CAHp75VdTJLUG_SJYm7pk5Aoqs=gV0QG2yJGe4y9pP98yvHcKLw@mail.gmail.com>
References: <1ab8d18dd7f5428869e6e77026ac4206863eea08.1489634924.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <20170316145203.GA23198@rajaneesh-OptiPlex-9010>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170316145203.GA23198@rajaneesh-OptiPlex-9010>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Andy Shevchenko <andy@infradead.org>, Zha Qipeng <qipeng.zha@intel.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Mar 16, 2017 at 4:52 PM, Rajneesh Bhardwaj
<rajneesh.bhardwaj@intel.com> wrote:
> On Wed, Mar 15, 2017 at 08:32:53PM -0700, Kuppuswamy Sathyanarayanan wrote:
>> Mapping entire GCR mem region in this driver creates
>> mem region request conflict in sub devices that depend
>> on PMC. This creates driver probe failure in devices like
>> iTC0_wdt and telemetry device.

> iTCO_WDT driver needs to check the BIT4 (NO_REBOOT) of PMC_CFG register
> (Offset: 0x1008) and this falls in GCR space.

Are we talking about ACPI-enabled platform?

-- 
With Best Regards,
Andy Shevchenko
