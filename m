From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v1] drivers/platform/x86: select hwmon for Mellanox
 hotplug driver in Kconfig
Date: Mon, 24 Oct 2016 11:10:57 -0700
Message-ID: <20161024181057.GA14962@f23x64.localdomain>
References: <1477226727-160036-1-git-send-email-vadimp@mellanox.com>
 <a20039d5-6456-7450-f83c-572c5ce4fb8f@infradead.org>
 <AM5PR0501MB20976E48C946BD3DB3A79143A2A90@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <de3cb2b3-6c04-ab79-3fd6-0e0f9af9080f@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <de3cb2b3-6c04-ab79-3fd6-0e0f9af9080f@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Vadim Pasternak <vadimp@mellanox.com>, "fengguang.wu@intel.com" <fengguang.wu@intel.com>, "davem@davemloft.net" <davem@davemloft.net>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 24, 2016 at 10:11:27AM -0700, Randy Dunlap wrote:
> On 10/23/16 22:41, Vadim Pasternak wrote:
> > 
> > 
> >> -----Original Message-----
> >> From: Randy Dunlap [mailto:rdunlap@infradead.org]
> >> Sent: Sunday, October 23, 2016 7:57 PM
> >> To: Vadim Pasternak <vadimp@mellanox.com>; dvhart@infradead.org;
> >> fengguang.wu@intel.com
> >> Cc: davem@davemloft.net; geert@linux-m68k.org; akpm@linux-
> >> foundation.org; kvalo@codeaurora.org; gregkh@linuxfoundation.org;
> >> mchehab@kernel.org; linux@roeck-us.net; linux-kernel@vger.kernel.org;
> >> platform-driver-x86@vger.kernel.org; jiri@resnulli.us;
> >> andriy.shevchenko@linux.intel.com
> >> Subject: Re: [patch v1] drivers/platform/x86: select hwmon for Mellanox
> >> hotplug driver in Kconfig
> >>
> >> On 10/23/16 05:45, vadimp@mellanox.com wrote:
> >>> From: Vadim Pasternak <vadimp@mellanox.com>
> >>>
> >>> Add select HWMON for mlxcpld-hotplug driver config, since it requires
> >>> hwmon APIs.
> >>>
> >>> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> >>> ---
> >>>  drivers/platform/x86/Kconfig | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/platform/x86/Kconfig
> >>> b/drivers/platform/x86/Kconfig index 65d9b04..1853769 100644
> >>> --- a/drivers/platform/x86/Kconfig
> >>> +++ b/drivers/platform/x86/Kconfig
> >>> @@ -1032,6 +1032,7 @@ config MLX_CPLD_PLATFORM
> >>>  	tristate "Mellanox platform hotplug driver support"
> >>>  	default n
> >>>  	depends on MLX_PLATFORM
> >>> +	select HWMON
> >>>  	select I2C
> >>>  	---help---
> >>>  	  This driver handles hot-plug events for the power suppliers, power
> >>>
> >>
> >> Hi,
> >> did you test this?  I would expect it to cause a kconfig warning, something about
> >> HWMON having a dependency on HAS_IOMEM.
> > 
> > Hi Randy,
> > 
> > Yes, 
> > I built tree with this fix with the attached .config file.
> > Didn't see kconfig warnings.
> > I can have a look again.
> 
> No need. lib/Kconfig handles it:
> 
> config HAS_IOMEM
> 	bool
> 	depends on !NO_IOMEM
> 	select GENERIC_IO
> 	default y
> 
> 
> thanks.
> -- 
> ~Randy
> 

Thanks for the review all. I've merged this with the original commit, now in
next.

-- 
Darren Hart
Intel Open Source Technology Center
