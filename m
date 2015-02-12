From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] thinkpad_acpi: support new BIOS version string pattern
Date: Wed, 11 Feb 2015 20:32:29 -0800
Message-ID: <20150212043229.GA30527@fury.dvhart.com>
References: <1423040419-25113-1-git-send-email-adam.lee@canonical.com>
 <1423633390-7886-1-git-send-email-adam.lee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:34629 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754750AbbBLEcb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Feb 2015 23:32:31 -0500
Content-Disposition: inline
In-Reply-To: <1423633390-7886-1-git-send-email-adam.lee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Adam Lee <adam.lee@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>

On Wed, Feb 11, 2015 at 01:43:10PM +0800, Adam Lee wrote:
> Latest ThinkPad models use a new string pattern of BIOS version,
> thinkpad_acpi won't be loaded automatically without this fix.
> 
> Signed-off-by: Adam Lee <adam.lee@canonical.com>
> ---

When sending updated versions of a patch or series, please include a changelog
after the ---, see Documentation/SubmittingPatches.

>  drivers/platform/x86/thinkpad_acpi.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index c3d11fa..18b7594 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8883,17 +8883,31 @@ static bool __pure __init tpacpi_is_fw_digit(const char c)
>  	return (c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z');
>  }
>  
> -/* Most models: xxyTkkWW (#.##c); Ancient 570/600 and -SL lacks (#.##c) */
>  static bool __pure __init tpacpi_is_valid_fw_id(const char * const s,
>  						const char t)
>  {
> -	return s && strlen(s) >= 8 &&
> +	/*
> +	 * Most models: xxyTkkWW (#.##c)
> +	 * Ancient 570/600 and -SL lacks (#.##c)
> +	 */
> +	if (s && strlen(s) >= 8 &&
> +			tpacpi_is_fw_digit(s[0]) &&
> +			tpacpi_is_fw_digit(s[1]) &&
> +			s[2] == t &&
> +			(s[3] == 'T' || s[3] == 'N') &&
> +			tpacpi_is_fw_digit(s[4]) &&
> +			tpacpi_is_fw_digit(s[5]))

I'm not wild about these big boolean statements, but I also don't see something
that is obviously better. Typically we want to see indentation with tabs and
alignment with the initial line's arguments with spaces... but here that just
looks ugly as the too seemingly similar blocks end up with different
indentations due to the if and return... anyway, subjective and all that. So I'm
leaving it mostly alone, but I dropped one set of tabs from the above lines and
queued it.

Thanks Adam.

> +		return true;
> +
> +	/* New models: xxxyTkkW (#.##c); T550 and some others */
> +	return  s && strlen(s) >= 8 &&
>  		tpacpi_is_fw_digit(s[0]) &&
>  		tpacpi_is_fw_digit(s[1]) &&
> -		s[2] == t &&
> -		(s[3] == 'T' || s[3] == 'N') &&
> -		tpacpi_is_fw_digit(s[4]) &&
> -		tpacpi_is_fw_digit(s[5]);
> +		tpacpi_is_fw_digit(s[2]) &&
> +		s[3] == t &&
> +		(s[4] == 'T' || s[4] == 'N') &&
> +		tpacpi_is_fw_digit(s[5]) &&
> +		tpacpi_is_fw_digit(s[6]);



>  }
>  
>  /* returns 0 - probe ok, or < 0 - probe error.
> -- 
> 2.1.4
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
