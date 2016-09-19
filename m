From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] platform/x86: Use ACPI_FAILURE at appropriate places
Date: Mon, 19 Sep 2016 14:25:15 -0300
Message-ID: <20160919172515.GA26891@khazad-dum.debian.net>
References: <1474248831-29832-1-git-send-email-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:49403 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932565AbcISRZW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2016 13:25:22 -0400
Content-Disposition: inline
In-Reply-To: <1474248831-29832-1-git-send-email-axel.lin@ingics.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Darren Hart <dvhart@infradead.org>, Alex Hung <alex.hung@canonical.com>, AceLan Kao <acelan.kao@canonical.com>, Harald Welte <laforge@gnumonks.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net

On Mon, 19 Sep 2016, Axel Lin wrote:
> Use ACPI_FAILURE() to replace !ACPI_SUCCESS(), this avoid !! operations.

Surely no compiler is _that_ idiotic for it to make any difference to
generated code?

Anyway, it is arguably more readable, so I certainly have nothing
against the change on that grounds.


for the thinkpad-acpi bits:

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index b65ce75..31fb979 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9018,7 +9018,7 @@ static int mute_led_on_off(struct tp_led_table *t, bool state)
>  	acpi_handle temp;
>  	int output;
>  
> -	if (!ACPI_SUCCESS(acpi_get_handle(hkey_handle, t->name, &temp))) {
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, t->name, &temp))) {
>  		pr_warn("Thinkpad ACPI has no %s interface.\n", t->name);
>  		return -EIO;
>  	}

-- 
  Henrique Holschuh
