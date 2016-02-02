From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 5/5] Add support for two new systems: ASM200 and
 ASM201.
Date: Tue, 2 Feb 2016 09:38:42 -0800
Message-ID: <20160202173842.GD1779@malice.jf.intel.com>
References: <1454380131-24662-1-git-send-email-mario_limonciello@dell.com>
 <1454380131-24662-6-git-send-email-mario_limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56925 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755750AbcBBRio (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Feb 2016 12:38:44 -0500
Content-Disposition: inline
In-Reply-To: <1454380131-24662-6-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Mon, Feb 01, 2016 at 08:28:51PM -0600, Mario Limonciello wrote:
> Both of these systems support:
> * 2 lighting control zones
> * HDMI mux control
> * deep sleep control (to enable wakup from controller)
> 
> The ASM201 also supports the external graphics amplifier.

Nit on the subject:

[file|platform]: subject

e.g.

alienware-wmi: Add support for two new systems: ASM200 and ASM201

This keeps the log consistent and aligns with Linus' merge comments.

> 
> Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
> ---
>  drivers/platform/x86/alienware-wmi.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
> index f5ebcae..577fefa 100644
> --- a/drivers/platform/x86/alienware-wmi.c
> +++ b/drivers/platform/x86/alienware-wmi.c
> @@ -97,6 +97,20 @@ static struct quirk_entry quirk_asm100 = {
>  	.deepslp = 0,
>  };
>  
> +static struct quirk_entry quirk_asm200 = {
> +	.num_zones = 2,
> +	.hdmi_mux = 1,
> +	.amplifier = 0,
> +	.deepslp = 1,
> +};
> +
> +static struct quirk_entry quirk_asm201 = {
> +	.num_zones = 2,
> +	.hdmi_mux = 1,
> +	.amplifier = 1,
> +	.deepslp = 1,
> +};
> +
>  static int __init dmi_matched(const struct dmi_system_id *dmi)
>  {
>  	quirks = dmi->driver_data;
> @@ -140,6 +154,24 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
>  		     },
>  	 .driver_data = &quirk_asm100,
>  	 },
> +	{
> +	 .callback = dmi_matched,
> +	 .ident = "Alienware ASM200",
> +	 .matches = {
> +		     DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +		     DMI_MATCH(DMI_PRODUCT_NAME, "ASM200"),
> +		     },
> +	 .driver_data = &quirk_asm200,
> +	 },
> +	{
> +	 .callback = dmi_matched,
> +	 .ident = "Alienware ASM201",
> +	 .matches = {
> +		     DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +		     DMI_MATCH(DMI_PRODUCT_NAME, "ASM201"),
> +		     },
> +	 .driver_data = &quirk_asm201,
> +	 },
>  	{}
>  };
>  
> -- 
> 1.9.1
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
