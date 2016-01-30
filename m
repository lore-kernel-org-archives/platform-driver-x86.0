From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel-hid: fix incorrect entries in intel_hid_keymap
Date: Sat, 30 Jan 2016 09:10:05 -0800
Message-ID: <20160130171005.GC1749@malice.jf.intel.com>
References: <1453901700-20418-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48598 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932141AbcA3RMJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 30 Jan 2016 12:12:09 -0500
Content-Disposition: inline
In-Reply-To: <1453901700-20418-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, luto@amacapital.net, pbludov@gmail.com

On Wed, Jan 27, 2016 at 09:35:00PM +0800, Alex Hung wrote:
> intel_hid_keymap contains a duplicate entry for KEY_HOME and an
> incorrect HID index for KEY_PAGEDOWN
> 
> Reported-by: Pavel Bludov <pbludov@gmail.com>
> Signed-off-by: Alex Hung <alex.hung@canonical.com>

Thanks Alex, queued for 4.5 fixes.

> ---
>  drivers/platform/x86/intel-hid.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
> index 20f0ad9..e20f23e 100644
> --- a/drivers/platform/x86/intel-hid.c
> +++ b/drivers/platform/x86/intel-hid.c
> @@ -41,8 +41,7 @@ static const struct key_entry intel_hid_keymap[] = {
>  	{ KE_KEY, 4, { KEY_HOME } },
>  	{ KE_KEY, 5, { KEY_END } },
>  	{ KE_KEY, 6, { KEY_PAGEUP } },
> -	{ KE_KEY, 4, { KEY_PAGEDOWN } },
> -	{ KE_KEY, 4, { KEY_HOME } },
> +	{ KE_KEY, 7, { KEY_PAGEDOWN } },
>  	{ KE_KEY, 8, { KEY_RFKILL } },
>  	{ KE_KEY, 9, { KEY_POWER } },
>  	{ KE_KEY, 11, { KEY_SLEEP } },
> -- 
> 2.5.0
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
