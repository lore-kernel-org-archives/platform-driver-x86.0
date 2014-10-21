From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/2] samsung-laptop: Add broken-acpi-video quirk for
 NC210/NC110
Date: Tue, 21 Oct 2014 13:38:38 -0700
Message-ID: <20141021203838.GA20951@vmdeb7>
References: <1413462991-1463-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:52714 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933065AbaJUUiX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Oct 2014 16:38:23 -0400
Content-Disposition: inline
In-Reply-To: <1413462991-1463-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Lee Chun-Yi <jlee@suse.com>, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org

On Thu, Oct 16, 2014 at 02:36:30PM +0200, Hans de Goede wrote:

Hi Hans,

Apoligies for the late response, travel and illness are taking their toll.

> Reported (and tested) here:
> https://bugzilla.redhat.com/show_bug.cgi?id=861573

The patch header is required to be sufficient to describe the problem and the
solution without depending on an external bugzilla or other reference.

Please include a complete git commit message.

> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/samsung-laptop.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
> index 5a59665..ff765d8 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -1561,6 +1561,16 @@ static struct dmi_system_id __initdata samsung_dmi_table[] = {
>  	},
>  	{
>  	 .callback = samsung_dmi_matched,
> +	 .ident = "NC210",
> +	 .matches = {
> +		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
> +		DMI_MATCH(DMI_PRODUCT_NAME, "NC210/NC110"),
> +		DMI_MATCH(DMI_BOARD_NAME, "NC210/NC110"),
> +		},
> +	 .driver_data = &samsung_broken_acpi_video,
> +	},
> +	{
> +	 .callback = samsung_dmi_matched,
>  	 .ident = "730U3E/740U3E",
>  	 .matches = {
>  		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
> -- 
> 2.1.0
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
