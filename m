From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell: add new dell WMI format for the AIO machines
Date: Fri, 8 Mar 2013 07:50:10 +0000
Message-ID: <20130308075009.GA18734@srcf.ucam.org>
References: <1362728670-3136-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:59819 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753995Ab3CHHuO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 8 Mar 2013 02:50:14 -0500
Content-Disposition: inline
In-Reply-To: <1362728670-3136-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Colin Ian King <colin.king@canonical.com>

On Fri, Mar 08, 2013 at 03:44:30PM +0800, AceLan Kao wrote:
>  static const struct key_entry dell_wmi_aio_keymap[] = {
>  	{ KE_KEY, 0xc0, { KEY_VOLUMEUP } },
>  	{ KE_KEY, 0xc1, { KEY_VOLUMEDOWN } },
> +	{ KE_KEY, 0xe030, { KEY_VOLUMEUP } },
> +	{ KE_KEY, 0xe02e, { KEY_VOLUMEDOWN } },
> +	{ KE_KEY, 0xe020, { KEY_MUTE } },
> +	{ KE_KEY, 0xe027, { KEY_DISPLAYTOGGLE } },
> +	{ KE_KEY, 0xe006, { KEY_BRIGHTNESSUP } },
> +	{ KE_KEY, 0xe005, { KEY_BRIGHTNESSDOWN } },
> +	{ KE_KEY, 0xe00b, { KEY_SWITCHVIDEOMODE } },

This is starting to look awfully like the keymap in dell-wmi.c. There's 
probably an argument for merging them at the source level, even if it 
ends up duplicated in both drivers.

> +			if (dell_wmi_aio_event_check(obj->buffer.pointer,
> +						obj->buffer.length)) {

Are we guaranteed that the old events will never look like this?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
