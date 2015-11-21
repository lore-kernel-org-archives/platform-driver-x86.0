From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 3/3] dell_wmi: Improve unknown hotkey handling
Date: Fri, 20 Nov 2015 16:14:10 -0800
Message-ID: <20151121001410.GI7413@malice.jf.intel.com>
References: <cover.1447479930.git.luto@kernel.org>
 <b7fd494ac6d51c13a66fec20ec336080479b0f5f.1447479930.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:51708 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752380AbbKUAOM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Nov 2015 19:14:12 -0500
Content-Disposition: inline
In-Reply-To: <b7fd494ac6d51c13a66fec20ec336080479b0f5f.1447479930.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Fri, Nov 13, 2015 at 09:49:32PM -0800, Andy Lutomirski wrote:
> If DMI lists a hotkey that we don't recognize, log and ignore it
> instead of trying to map it to keycode 0.  I haven't seen this happen,
> but it will help maintain the key map in the future and it will help
> avoid sending bogus events.
> 
> This also improves the message that we log when we get an unknown key
> event.
> 
> Signed-off-by: Andy Lutomirski <luto@kernel.org>

Matthew? Pali? Any concerns?

> ---
>  drivers/platform/x86/dell-wmi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index 92b0149fa4a7..e43228a35f6b 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -180,7 +180,7 @@ static void dell_wmi_process_key(int reported_key)
>  	key = sparse_keymap_entry_from_scancode(dell_wmi_input_dev,
>  						reported_key);
>  	if (!key) {
> -		pr_info("Unknown key %x pressed\n", reported_key);
> +		pr_info("Unknown key with scancode 0x%x pressed\n", reported_key);
>  		return;
>  	}
>  
> @@ -343,6 +343,11 @@ static const struct key_entry * __init dell_wmi_prepare_new_keymap(void)
>  				    bios_to_linux_keycode[bios_entry->keycode] :
>  				    KEY_RESERVED;
>  
> +		if (keycode == 0) {
> +			pr_info("firmware scancode %d maps to unrecognized keycode %d\n", bios_entry->keycode, bios_entry->scancode);

We don't split up strings for line length, but these arguments can certainly go
on the next line. I've taken care of this, no need to resend.

Queued for testing.

-- 
Darren Hart
Intel Open Source Technology Center
