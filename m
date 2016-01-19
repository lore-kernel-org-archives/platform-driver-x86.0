From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v2 2/3] dell-wmi: Fix hotkey table size check
Date: Tue, 19 Jan 2016 09:31:46 +0100
Message-ID: <20160119093146.28aa10e1@endymion.delvare>
References: <cover.1453150613.git.luto@kernel.org>
	<0282cf1f0c15ae9006b119dd92bfb4bad2e924a7.1453150613.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0282cf1f0c15ae9006b119dd92bfb4bad2e924a7.1453150613.git.luto@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy,

On Mon, 18 Jan 2016 12:59:39 -0800, Andy Lutomirski wrote:
> The minimum size of the table is 4, not 6.  Replace the hard-coded
> number with a sizeof expression.  While we're at it, repace the
> hard-coded 4 below as well.
> 
> Reported-by: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
>  drivers/platform/x86/dell-wmi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index 5c0d037fcd40..48838942d593 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -111,7 +111,6 @@ struct dell_bios_keymap_entry {
>  struct dell_bios_hotkey_table {
>  	struct dmi_header header;
>  	struct dell_bios_keymap_entry keymap[];
> -
>  };
>  
>  struct dell_dmi_results {

Nice cleanup but in general we recommend to not mix style cleanups with
functional changes. If you want to clean up dell-wmi you could do it in
a separate patch and maybe include the fixes suggested by checkpatch.pl
-f.

> @@ -329,12 +328,14 @@ static void __init handle_dmi_entry(const struct dmi_header *dm,
>  	if (results->err || results->keymap)
>  		return;		/* We already found the hotkey table. */
>  
> -	if (dm->type != 0xb2 || dm->length <= 6)
> +	if (dm->type != 0xb2 ||
> +	    dm->length <= sizeof(struct dell_bios_hotkey_table))
>  		return;

I'm confused. sizeof(struct dell_bios_hotkey_table) is 4. Given that
dm->length is guaranteed to be at least 4 per the SMBIOS specification,
you are really only testing that dm->length != 4. Which means you are
still accepting 5, 6 and 7, even though they would lead to hotkey_num =
0 below.

If the purpose of this check is only to guarantee that the container_of
below is valid then you should check for dm->length < sizeof(struct
dell_bios_hotkey_table) (not <=.) This is still useless in practice but
I can understand and accept it because it is conceptually correct.

OTOH if the purpose of the check is to ensure that there is at least
one hotkey, you should check for dm->length < sizeof(struct
dell_bios_hotkey_table) + sizeof(struct dell_bios_keymap_entry)
instead. hotkey_num could also be checked separately below but it is
more efficient to have a single test.

>  
>  	table = container_of(dm, struct dell_bios_hotkey_table, header);
>  
> -	hotkey_num = (table->header.length - 4) /
> +	hotkey_num = (table->header.length -
> +		      sizeof(struct dell_bios_hotkey_table)) /
>  				sizeof(struct dell_bios_keymap_entry);
>  
>  	keymap = kcalloc(hotkey_num + 1, sizeof(struct key_entry), GFP_KERNEL);

-- 
Jean Delvare
SUSE L3 Support
