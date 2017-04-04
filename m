From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Add wapf=4 quirk for Asus
 X302UA
Date: Tue, 04 Apr 2017 14:44:13 +0300
Message-ID: <1491306253.708.116.camel@linux.intel.com>
References: <CAN88QNC4bv0JKRxzyCOjDh2pex9t1+7J9WXt2C1d6vOF6tT+eQ@mail.gmail.com>
         <20170403230540.GC17322@fury>
         <CAN88QNC1B6TyqJbNVmCD6J72zdWAJyFyjrCXrXOT=2p5FMGrEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:4858 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751505AbdDDLoR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2017 07:44:17 -0400
In-Reply-To: <CAN88QNC1B6TyqJbNVmCD6J72zdWAJyFyjrCXrXOT=2p5FMGrEQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jala - <herra.melkor@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: Santeri Toivonen <santeri.toivonen@vatsul.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Tue, 2017-04-04 at 13:14 +0300, Jala - wrote:
> The issue should be corrected in the following.
> 

You need to add your Signed-off-by line here with your Real Name.

Usually you may achieve this by passing -s when do git commit

Example:
% git commit -a -s

Before doing this you need to configure your credentials in global or
local configuration file:

% git config --global user.name "Real Name"
% git config --global user.email "real.name@domain.com"


> ---
>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c
> b/drivers/platform/x86/asus-nb-wmi.c
> index dea98ffb6f60..1ae58d906536 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -144,6 +144,15 @@ static const struct dmi_system_id asus_quirks[] =
> {
>   },
>   {
>   .callback = dmi_matched,
> + .ident = "ASUSTeK COMPUTER INC. X302UA",
> + .matches = {
> + DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> + DMI_MATCH(DMI_PRODUCT_NAME, "X302UA"),
> + },
> + .driver_data = &quirk_asus_wapf4,
> + },
> + {
> + .callback = dmi_matched,

Now here.
As Darren already said to you you need to properly indent strings like
	.matches = {
		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
and alike.

Looking closer to the mail I would suggest to check your mail client and
gateway that they do not mangle the message body.

And, if you are doing this manually, better to use special tool, i.e.
git-send-email instead.

>   .ident = "ASUSTeK COMPUTER INC. X401U",
>   .matches = {
>   DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
