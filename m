From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad-acpi: recognize latest
 V-Series using DMI_BIOS_VENDOR
Date: Mon, 6 Aug 2012 18:33:20 -0300
Message-ID: <20120806213320.GB8824@khazad-dum.debian.net>
References: <1344288200-8502-1-git-send-email-manoj.iyer@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:53682 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753658Ab2HFVdY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 6 Aug 2012 17:33:24 -0400
Content-Disposition: inline
In-Reply-To: <1344288200-8502-1-git-send-email-manoj.iyer@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: manoj.iyer@canonical.com
Cc: linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, mjg@redhat.com, ibm-acpi@hmh.eng.br, platform-driver-x86@vger.kernel.org

On Mon, 06 Aug 2012, manoj.iyer@canonical.com wrote:
> In the latest V-series bios DMI_PRODUCT_VERSION does not contain
> the string Lenovo or Thinkpad, but is set to the model number, this
> causes the thinkpad_acpi module to fail to load. Recognize laptop
> as Lenovo using DMI_BIOS_VENDOR instead, which is set to Lenovo.
> 
> Signed-off-by: Manoj Iyer <manoj.iyer@canonical.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c |   13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index e7f7328..17692c8 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8658,11 +8658,16 @@ static int __must_check __init get_thinkpad_model_data(
>  	}
>  
>  	s = dmi_get_system_info(DMI_PRODUCT_VERSION);
> -	if (s && !(strnicmp(s, "ThinkPad", 8) && strnicmp(s, "Lenovo", 6))) {
> +	if (s && !(strnicmp(s, "ThinkPad", 8) && strnicmp(s, "Lenovo", 6)))
>  		tp->model_str = kstrdup(s, GFP_KERNEL);
> -		if (!tp->model_str)
> -			return -ENOMEM;
> -	}
> +	else {
> +		s = dmi_get_system_info(DMI_BIOS_VENDOR);
> +		if (s && !(strnicmp(s, "Lenovo", 6)))
> +			tp->model_str = kstrdup(s, GFP_KERNEL);
> +	} 
> +
> +	if (!tp->model_str)
> +		return -ENOMEM;

This last unguarded if() can cause problems, s is allowed to be NULL.  Just
leave it where it was, and add a second one to the new "else" branch.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
