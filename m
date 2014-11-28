From: Ondrej Zary <linux@rainbow-software.org>
Subject: Re: [PATCH] [RESEND 2] toshiba_acpi: Add missing ID (TOS6207)
Date: Fri, 28 Nov 2014 19:44:10 +0100
Message-ID: <201411281944.11309.linux@rainbow-software.org>
References: <1417165432-21691-1-git-send-email-linux@rainbow-software.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-1.atlantis.sk ([80.94.52.57]:43001 "EHLO
	mail-1.atlantis.sk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751057AbaK1Sov (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 Nov 2014 13:44:51 -0500
In-Reply-To: <1417165432-21691-1-git-send-email-linux@rainbow-software.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>, Seth Forshee <seth.forshee@canonical.com>, Kernel development list <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>

cc: Darren Hart

On Friday 28 November 2014 10:03:52 Ondrej Zary wrote:
> toshiba_acpi was always missing TOS6207 ID so it did not load automatically
> on some laptops (such as Portege R100). But it worked fine if loaded
> manually. Commit 135740de7764 ("toshiba_acpi: Convert to use acpi_driver")
> broke that and the driver does not work even when loaded manually since
> then.
>
> Add TOS6207 ID to fix it.
>
> Tested on Toshiba Portege R100.
>
> Signed-off-by: Ondrej Zary <linux@rainbow-software.org>
> ---
>  drivers/platform/x86/toshiba_acpi.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/toshiba_acpi.c
> b/drivers/platform/x86/toshiba_acpi.c index ab6151f..0ce2129 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -186,6 +186,7 @@ static struct toshiba_acpi_dev *toshiba_acpi;
>
>  static const struct acpi_device_id toshiba_device_ids[] = {
>  	{"TOS6200", 0},
> +	{"TOS6207", 0},
>  	{"TOS6208", 0},
>  	{"TOS1900", 0},
>  	{"", 0},


-- 
Ondrej Zary
