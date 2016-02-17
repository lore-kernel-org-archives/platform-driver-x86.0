From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 1/5] dell-wmi: Stop storing pointers to DMI tables
Date: Tue, 16 Feb 2016 22:37:09 -0800
Message-ID: <20160217063709.GA20116@dvhart-mobl5.amr.corp.intel.com>
References: <cover.1455553470.git.luto@kernel.org>
 <384e9535556e09169a16c4d6e28e419322ecf26f.1455553470.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:59406 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756312AbcBQGhW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 01:37:22 -0500
Content-Disposition: inline
In-Reply-To: <384e9535556e09169a16c4d6e28e419322ecf26f.1455553470.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>, Mario Limonciello <mario_limonciello@dell.com>

On Mon, Feb 15, 2016 at 08:32:33AM -0800, Andy Lutomirski wrote:
> The dmi_walk function maps the DMI table, walks it, and unmaps it.
> This means that the dell_bios_hotkey_table that find_hk_type stores
> points to unmapped memory by the time it gets read.
> 
> I've been able to trigger crashes caused by the stale pointer a
> couple of times, but never on a stock kernel.
> 
> Fix it by generating the keymap in the dmi_walk callback instead of
> storing a pointer.
> 
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
> 
> Changes from v3: None

Did you have any Acked-by's thus far?

> 
> Changes from v2:
>  - dmi_walk failure is no longer fatal (Jean)
> 
> Changes from v1:
>  - Rename handle_dmi_table to handle_dmi_entry (Jean)
>  - Remove useless assignment to results->err (Jean)
> 
>  drivers/platform/x86/dell-wmi.c | 74 +++++++++++++++++++++++++----------------
>  1 file changed, 46 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index 368e193c2741..d6ae69e0a787 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c

...

> @@ -379,11 +396,12 @@ static const struct key_entry * __init dell_wmi_prepare_new_keymap(void)
>  
>  	keymap[hotkey_num].type = KE_END;
>  
> -	return keymap;
> +	results->keymap = keymap;

This appears to  change this function not to return anything, while the
declaration appears to still expect a "const struct key_entry *". Is my visual
diff parser broken?


-- 
Darren Hart
Intel Open Source Technology Center
