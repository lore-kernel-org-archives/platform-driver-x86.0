From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Add wapf=4 quirk for Asus
 X302UA
Date: Tue, 4 Apr 2017 08:39:45 -0700
Message-ID: <20170404153945.GA5936@fury>
References: <CAN88QNC4bv0JKRxzyCOjDh2pex9t1+7J9WXt2C1d6vOF6tT+eQ@mail.gmail.com>
 <20170403230540.GC17322@fury>
 <CAN88QNC1B6TyqJbNVmCD6J72zdWAJyFyjrCXrXOT=2p5FMGrEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:54760 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751112AbdDDPjt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2017 11:39:49 -0400
Content-Disposition: inline
In-Reply-To: <CAN88QNC1B6TyqJbNVmCD6J72zdWAJyFyjrCXrXOT=2p5FMGrEQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jala - <herra.melkor@gmail.com>
Cc: Santeri Toivonen <santeri.toivonen@vatsul.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Tue, Apr 04, 2017 at 01:14:36PM +0300, Jala - wrote:
> The issue should be corrected in the following.

Unfortunately not. See the body of the message and note that there are no
leading tabs in the DMI_MATCH block.

I recommend sending the message to yourself and attempting to apply the patch.
Once that works, send it to the list.

If you aren't sure how to resolve the problem after reading the Documentation I
linked to, feel free to reach out to me privately for assistance.

Regards,

-- 
Darren Hart
VMware Open Source Technology Center

> 
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c
> b/drivers/platform/x86/asus-nb-wmi.c
> index dea98ffb6f60..1ae58d906536 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -144,6 +144,15 @@ static const struct dmi_system_id asus_quirks[] = {
>   },
>   {
>   .callback = dmi_matched,
> + .ident = "ASUSTeK COMPUTER INC. X302UA",
> + .matches = {
> + DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> + DMI_MATCH(DMI_PRODUCT_NAME, "X302UA"),
> + },
> + .driver_data = &quirk_asus_wapf4,
> + },
> + {
> + .callback = dmi_matched,
>   .ident = "ASUSTeK COMPUTER INC. X401U",
>   .matches = {
>   DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> -- 
> 2.11.0.windows.3
> 
