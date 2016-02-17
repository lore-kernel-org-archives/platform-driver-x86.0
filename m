From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 3/5] dell-wmi: Clean up hotkey table size check
Date: Tue, 16 Feb 2016 22:46:51 -0800
Message-ID: <20160217064651.GC20116@dvhart-mobl5.amr.corp.intel.com>
References: <cover.1455553470.git.luto@kernel.org>
 <9aaaffdc9eb56061386c8ae443d130f20131c234.1455553470.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:60754 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756478AbcBQGqz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 01:46:55 -0500
Content-Disposition: inline
In-Reply-To: <9aaaffdc9eb56061386c8ae443d130f20131c234.1455553470.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>, Mario Limonciello <mario_limonciello@dell.com>

On Mon, Feb 15, 2016 at 08:32:35AM -0800, Andy Lutomirski wrote:
> Checking the table for a minimum size of 7 bytes makes no sense: any valid
> hotkey table has a size that's a multiple of 4.
> 
> Clean this up: replace the hardcoded header length with a sizeof and
> change the check to ignore an empty hotkey table.  The only behavior
> change is that a 7-byte table (which is nonsensical) will now be
> treated as absent instead of as valid but empty.
> 
> Reported-by: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
> 
> Changes from v3: None
> 
> Changes from v2:
>  - Total rewrite.
> 
> drivers/platform/x86/dell-wmi.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index d6ae69e0a787..32808a463325 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -351,13 +351,24 @@ static void __init handle_dmi_entry(const struct dmi_header *dm,
>  	if (results->err || results->keymap)
>  		return;		/* We already found the hotkey table. */
>  
> -	if (dm->type != 0xb2 || dm->length <= 6)
> +	if (dm->type != 0xb2)

I was wondering about this return in the previous patch, where you documented
the meaning of the return. Since we have a magic value here, adding a comment
explaning why we're returning would aid in readability and maintainability.

>  		return;
>  
>  	table = container_of(dm, struct dell_bios_hotkey_table, header);
>  
> -	hotkey_num = (table->header.length - 4) /
> +	hotkey_num = (table->header.length -
> +		      sizeof(struct dell_bios_hotkey_table)) /
>  				sizeof(struct dell_bios_keymap_entry);
> +	if (hotkey_num < 1) {
> +		/*
> +		 * Historically, dell-wmi would ignore a DMI entry of
> +		 * fewer than 7 bytes.  Sizes between 4 and 8 bytes are
> +		 * nonsensical (both the header and all entries are 4
> +		 * bytes), so we approximate the old behavior by
> +		 * ignoring tables with fewer than one entry.
> +		 */
> +		return;
> +	}
>  
>  	keymap = kcalloc(hotkey_num + 1, sizeof(struct key_entry), GFP_KERNEL);
>  	if (!keymap) {
> -- 
> 2.5.0
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
