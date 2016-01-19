From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v2 1/3] dell-wmi: Stop storing pointers to DMI tables
Date: Tue, 19 Jan 2016 09:41:45 +0100
Message-ID: <20160119094145.599d1b6c@endymion.delvare>
References: <cover.1453150613.git.luto@kernel.org>
	<eb210629e07df3a6295a2b3b370aff87625cfbef.1453150613.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:33921 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752206AbcASIls (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Jan 2016 03:41:48 -0500
In-Reply-To: <eb210629e07df3a6295a2b3b370aff87625cfbef.1453150613.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andy,

On Mon, 18 Jan 2016 12:59:38 -0800, Andy Lutomirski wrote:
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
> Notes:
>     Changes from v1:
>      - Rename handle_dmi_table to handle_dmi_entry (Jean)
>      - Remove useless assignment to results->err (Jean)
> 
>  drivers/platform/x86/dell-wmi.c | 68 +++++++++++++++++++++++++----------------
>  1 file changed, 41 insertions(+), 27 deletions(-)
> (...)
> @@ -431,7 +446,6 @@ static int __init dell_wmi_init(void)
>  		return -ENODEV;
>  	}
>  
> -	dmi_walk(find_hk_type, NULL);
>  

Please also delete the following blank line, to avoid two consecutive
blank lines.

>  	err = dell_wmi_input_setup();
>  	if (err)

Other than this, it looks good to me, so after fixing the above, you
can add:

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
