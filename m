From: "Peter Feuerer" <peter@piie.net>
Subject: Re: [PATCH 0841/1285] Replace numeric parameter like 0444 with
 macro
Date: Thu, 11 Aug 2016 21:21:48 +0000
Message-ID: <95991cb563633df910245c1fa8d83169@mail.piie.net>
References: <20160802115136.6059-1-baolex.ni@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from piie.net ([80.82.223.85]:58173 "EHLO piie.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751359AbcHKVcH convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 11 Aug 2016 17:32:07 -0400
In-Reply-To: <20160802115136.6059-1-baolex.ni@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Baole Ni <baolex.ni@intel.com>, dvhart@infradead.org, david.vrabel@citrix.com, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com

2. August 2016 14:29 Uhr, "Baole Ni" <baolex.ni@intel.com> schrieb:
> I find that the developers often just specified the numeric value
> when calling a macro which is defined with a parameter for access permission.
> As we know, these numeric value for access permission have had the corresponding macro,
> and that using macro can improve the robustness and readability of the code,
> thus, I suggest replacing the numeric parameter with the macro.
> 
> Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
> Signed-off-by: Baole Ni <baolex.ni@intel.com>

Acked-by: Peter Feuerer <peter@piie.net>

> ---
> drivers/platform/x86/acerhdf.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
> index 460fa67..a4706dd 100644
> --- a/drivers/platform/x86/acerhdf.c
> +++ b/drivers/platform/x86/acerhdf.c
> @@ -96,13 +96,13 @@ static struct platform_device *acerhdf_dev;
> 
> module_param(kernelmode, uint, 0);
> MODULE_PARM_DESC(kernelmode, "Kernel mode fan control on / off");
> -module_param(interval, uint, 0600);
> +module_param(interval, uint, S_IRUSR | S_IWUSR);
> MODULE_PARM_DESC(interval, "Polling interval of temperature check");
> -module_param(fanon, uint, 0600);
> +module_param(fanon, uint, S_IRUSR | S_IWUSR);
> MODULE_PARM_DESC(fanon, "Turn the fan on above this temperature");
> -module_param(fanoff, uint, 0600);
> +module_param(fanoff, uint, S_IRUSR | S_IWUSR);
> MODULE_PARM_DESC(fanoff, "Turn the fan off below this temperature");
> -module_param(verbose, uint, 0600);
> +module_param(verbose, uint, S_IRUSR | S_IWUSR);
> MODULE_PARM_DESC(verbose, "Enable verbose dmesg output");
> module_param_string(force_bios, force_bios, 16, 0);
> MODULE_PARM_DESC(force_bios, "Force BIOS version and omit BIOS check");
> -- 
> 2.9.2

-- 
thanks,
--peter;
