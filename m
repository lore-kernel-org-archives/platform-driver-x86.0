From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Initialize local
 in_tablet_mode and type
Date: Thu, 15 Dec 2016 11:34:00 -0200
Message-ID: <20161215133400.GA24782@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:37708 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755291AbcLONl5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Dec 2016 08:41:57 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org

(fixed platform-driver-x86 ML address, trimmed CC list on repost since
it is just the Acked-by).

On Wed, 14 Dec 2016, Darren Hart wrote:
> linux-next reported in_tablet_mode and type may be used uninitialized
> after:
> 
> b31800283868 ("platform/x86: thinkpad_acpi: Move tablet detection into separate function")
> 
> This turns out to be a false positive as the pr_info call cannot be
> reached if tp_features.hotkey_tablet (global scope) is 0, and
> in_tablet_mode and type are assigned in both places
> tp_features.hotkey_tablet is assigned.
> 
> Regardless, to make it explicit and avoid further reports, initialize
> in_tablet_mode to 0 and type to "".
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: Lyude <lyude@redhat.com>
> Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

> ---
> Since v1: Initialize type also.
> 
>  drivers/platform/x86/thinkpad_acpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 69cb0da..c408390 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3143,8 +3143,8 @@ typedef tpacpi_keymap_entry_t tpacpi_keymap_t[TPACPI_HOTKEY_MAP_LEN];
>  
>  static int hotkey_init_tablet_mode(void)
>  {
> -	int in_tablet_mode, res;
> -	char *type;
> +	int in_tablet_mode = 0, res;
> +	char *type = "";
>  
>  	if (acpi_evalf(hkey_handle, &res, "MHKG", "qd")) {
>  		/* For X41t, X60t, X61t Tablets... */

-- 
  Henrique Holschuh
