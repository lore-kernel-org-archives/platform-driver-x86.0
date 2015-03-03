From: Darren Hart <dvhart@infradead.org>
Subject: Re: [RFT PATCH v3 1/2] compal-laptop: Fix leaking hwmon device
Date: Tue, 3 Mar 2015 08:42:15 -0800
Message-ID: <20150303164215.GA83894@vmdeb7>
References: <1424438015-3006-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1424438015-3006-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Matthew Garrett <matthew.garrett@nebula.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 20, 2015 at 02:13:34PM +0100, Krzysztof Kozlowski wrote:
> The commit c2be45f09bb0 ("compal-laptop: Use
> devm_hwmon_device_register_with_groups") wanted to change the
> registering of hwmon device to resource-managed version. It mostly did
> it except the main thing - it forgot to use devm-like function so the
> hwmon device leaked after device removal or probe failure.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Fixes: c2be45f09bb0 ("compal-laptop: Use devm_hwmon_device_register_with_groups")
> Cc: <stable@vger.kernel.org>

Acked-by: Darren Hart <dvhart@linux.intel.com>

(Assuming this is going through Sebastien's tree)

-- 
Darren Hart
Intel Open Source Technology Center
