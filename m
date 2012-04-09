From: Martin Nyhus <martin.nyhus@gmx.com>
Subject: Re: [PATCH] dell-laptop: Terminate quirks list properly
Date: Mon, 9 Apr 2012 21:49:43 +0200
Message-ID: <201204092149.43908.martin.nyhus@gmx.com>
References: <1331832348-7082-1-git-send-email-martin.nyhus@gmx.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout-eu.gmx.com ([213.165.64.42]:59140 "HELO
	mailout-eu.gmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755246Ab2DITt7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Apr 2012 15:49:59 -0400
In-Reply-To: <1331832348-7082-1-git-send-email-martin.nyhus@gmx.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

Matthew, did you see this?

On Thursday 15. March 2012 18:25:48 Martin Nyhus wrote:
> Add missing DMI_NONE entry to end of the quirks list so
> dmi_check_system() won't read past the end of the list.
> 
> Signed-off-by: Martin Nyhus <martin.nyhus@gmx.com>
> ---
>  drivers/platform/x86/dell-laptop.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-laptop.c
> b/drivers/platform/x86/dell-laptop.c index a05fc9c..e6c08ee 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -212,6 +212,7 @@ static struct dmi_system_id __devinitdata dell_quirks[]
> = { },
>  		.driver_data = &quirk_dell_vostro_v130,
>  	},
> +	{ }
>  };
> 
>  static struct calling_interface_buffer *buffer;
