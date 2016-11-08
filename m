From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: adding new hotkey ID for Lenovo thinkpad
Date: Tue, 8 Nov 2016 11:43:52 -0200
Message-ID: <20161108134352.GG8609@khazad-dum.debian.net>
References: <1478592803-17522-1-git-send-email-hui.wang@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40291 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751944AbcKHNn5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Nov 2016 08:43:57 -0500
Content-Disposition: inline
In-Reply-To: <1478592803-17522-1-git-send-email-hui.wang@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hui Wang <hui.wang@canonical.com>
Cc: dvhart@linux.intel.com, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net

On Tue, 08 Nov 2016, Hui Wang wrote:

> laptops are not released to market yet), the issue is that the
> thinkpad_acpi.ko can't be automatically loaded as before.
> 
> Through debugging, we found the HKEY_HID is LEN0268 instead of
> LEN0068 on those machines, and the MHKV is 0x200 instead of
> 0x100. So adding the new ID into the driver.

This usually means Lenovo expects to have different windows drivers.
Does thinkpad-acpi work properly on these new thinkpads?

If it does, you have my
Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index b65ce75..dbd2e27 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -128,6 +128,7 @@ enum {
>  /* ACPI HIDs */
>  #define TPACPI_ACPI_IBM_HKEY_HID	"IBM0068"
>  #define TPACPI_ACPI_LENOVO_HKEY_HID	"LEN0068"
> +#define TPACPI_ACPI_LENOVO_HKEY_V2_HID	"LEN0268"
>  #define TPACPI_ACPI_EC_HID		"PNP0C09"
>  
>  /* Input IDs */
> @@ -4143,6 +4144,7 @@ static int hotkey_write(char *buf)
>  static const struct acpi_device_id ibm_htk_device_ids[] = {
>  	{TPACPI_ACPI_IBM_HKEY_HID, 0},
>  	{TPACPI_ACPI_LENOVO_HKEY_HID, 0},
> +	{TPACPI_ACPI_LENOVO_HKEY_V2_HID, 0},
>  	{"", 0},
>  };

-- 
  Henrique Holschuh
