From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Add wapf=4 quirk for Asus
 X302UA
Date: Mon, 3 Apr 2017 16:05:40 -0700
Message-ID: <20170403230540.GC17322@fury>
References: <CAN88QNC4bv0JKRxzyCOjDh2pex9t1+7J9WXt2C1d6vOF6tT+eQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:47174 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751535AbdDCXFm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Apr 2017 19:05:42 -0400
Content-Disposition: inline
In-Reply-To: <CAN88QNC4bv0JKRxzyCOjDh2pex9t1+7J9WXt2C1d6vOF6tT+eQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Santeri Toivonen <santeri.toivonen@vatsul.com>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Thu, Mar 30, 2017 at 09:02:41PM +0300, Santeri Toivonen wrote:
> Asus laptop X302UA starts up with wifi hard-blocked without any meaningful
> way to enable it.
> Setting wapf=4 fixes the problem.

Please always Cc LKML and all listed maintainers and lists when submitting
patches to the Linux kernel (according to get_maintainer.pl).

(Didn't add LKML since the original has HTML)
+Andy

> 
> Signed-off-by: Santeri Toivonen <santeri.toivonen@vatsul.com>
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

The change looks good in general, with the exception of the whitespace
corruption. Indentation should match the surrounding similar dmi match blocks,
using tabs.

This message contains multiple content types, including one in HTML, which LKML
will drop.

Please see: Documentation/process/submitting-patches.rst
       and: Documentation/process/email-clients.rst

If you need assistance getting the patch submitted correctly, I'll be happy to
help. This appears to be a mail client induced whitespace corruption issue and
embedded HTML problem. See the email-clients.rst document for ways to resolve
this.

Thanks,

-- 
Darren Hart
VMware Open Source Technology Center
