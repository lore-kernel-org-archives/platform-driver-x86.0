From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] thinkpad_acpi: support new BIOS version string pattern
Date: Mon, 9 Feb 2015 20:35:22 -0800
Message-ID: <20150210043522.GE37927@fury.dvhart.com>
References: <1423040419-25113-1-git-send-email-adam.lee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42759 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752176AbbBJEfe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Feb 2015 23:35:34 -0500
Content-Disposition: inline
In-Reply-To: <1423040419-25113-1-git-send-email-adam.lee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Adam Lee <adam.lee@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>

On Wed, Feb 04, 2015 at 05:00:19PM +0800, Adam Lee wrote:
> Latest ThinkPad models use a new string pattern of BIOS version,
> thinkpad_acpi won't be loaded automatically without this fix.
> 

Hi Adam,

> Signed-off-by: Adam Lee <adam.lee@canonical.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index c3d11fa..39a1017 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8883,17 +8883,38 @@ static bool __pure __init tpacpi_is_fw_digit(const char c)
>  	return (c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z');
>  }
>  
> -/* Most models: xxyTkkWW (#.##c); Ancient 570/600 and -SL lacks (#.##c) */
>  static bool __pure __init tpacpi_is_valid_fw_id(const char * const s,
>  						const char t)
>  {
> -	return s && strlen(s) >= 8 &&
> +	bool is_most = 0;
> +	bool is_new = 0;

The new variables aren't really necessary, you certainly do not need two of
them.

> +
> +	/*
> +	 * Most models: xxyTkkWW (#.##c)
> +	 * Ancient 570/600 and -SL lacks (#.##c)
> +	 */
> +	is_most = s && strlen(s) >= 8 &&

Try:

if (s && strlen(s) >=8 &&
	...
	)
	return true;


>  		tpacpi_is_fw_digit(s[0]) &&
>  		tpacpi_is_fw_digit(s[1]) &&
>  		s[2] == t &&
>  		(s[3] == 'T' || s[3] == 'N') &&
>  		tpacpi_is_fw_digit(s[4]) &&
>  		tpacpi_is_fw_digit(s[5]);
> +
> +	if (is_most)
> +		return is_most;
> +
> +	/* New models: xxxyTkkW (#.##c); T550 and some others */

Is the second W intentionally left off in xxxyTkkW ? We don't test for it, so I
wasn't sure.

> +	is_new = s && strlen(s) >= 8 &&
> +		tpacpi_is_fw_digit(s[0]) &&
> +		tpacpi_is_fw_digit(s[1]) &&
> +		tpacpi_is_fw_digit(s[2]) &&

As far as I can tell, the only significant difference here (compared to above)
is an additional leading digit and the subsequent string indices?

Seems to me this could be done fairly easily in the same block with only a minor
adjustment at the beginning and the use of an incrementing index. Should be
cleaner than duplicating 90% of the block?

> +		s[3] == t &&
> +		(s[4] == 'T' || s[4] == 'N') &&
> +		tpacpi_is_fw_digit(s[5]) &&
> +		tpacpi_is_fw_digit(s[6]);
> +
> +	return is_new;
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
