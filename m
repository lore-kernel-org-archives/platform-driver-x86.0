From: Darren Hart <dvhart@infradead.org>
Subject: Re: [RFT PATCH v3 2/2] compal-laptop: Check return value of
 power_supply_register
Date: Tue, 3 Mar 2015 08:43:14 -0800
Message-ID: <20150303164314.GB83894@vmdeb7>
References: <1424438015-3006-1-git-send-email-k.kozlowski@samsung.com>
 <1424438015-3006-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1424438015-3006-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Matthew Garrett <matthew.garrett@nebula.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 20, 2015 at 02:13:35PM +0100, Krzysztof Kozlowski wrote:
> The return value of power_supply_register() call was not checked and
> even on error probe() function returned 0. If registering failed then
> during unbind the driver tried to unregister power supply which was not
> actually registered.
> 
> This could lead to memory corruption because power_supply_unregister()
> unconditionally cleans up given power supply.
> 
> Fix this by checking return status of power_supply_register() call. In
> case of failure, clean up sysfs entries and fail the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Fixes: 9be0fcb5ed46 ("compal-laptop: add JHL90, battery & hwmon interface")
> Cc: <stable@vger.kernel.org>

Acked-by: Darren Hart <dvhart@linux.intel.com>

-- 
Darren Hart
Intel Open Source Technology Center
