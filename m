From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] dell-wmi: Stop storing pointers to DMI tables
Date: Mon, 18 Jan 2016 16:44:25 +0100
Message-ID: <20160118164425.1e94185b@endymion.delvare>
References: <119170b95d373bc943eb4f16818239bac9fa6c59.1451832667.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <119170b95d373bc943eb4f16818239bac9fa6c59.1451832667.git.luto@kernel.org>
Sender: stable-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy,

On Sun,  3 Jan 2016 06:52:28 -0800, Andy Lutomirski wrote:
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
> Cc: stable@vger.kernel.org
> Signed-off-by: Andy Lutomirski <luto@kernel.org>

Overall I like the idea.

> ---
> 
> This seems to work on my laptop.  It applies to platform-drivers-x86/for-next.
> 
> drivers/platform/x86/dell-wmi.c | 69 +++++++++++++++++++++++++----------------
>  1 file changed, 42 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index 57402c4c394e..52db2721d7e3 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -116,7 +116,10 @@ struct dell_bios_hotkey_table {
>  
>  };
>  
> -static const struct dell_bios_hotkey_table *dell_bios_hotkey_table;
> +struct dell_dmi_results {
> +	int err;
> +	struct key_entry *keymap;
> +};
>  
>  /* Uninitialized entries here are KEY_RESERVED == 0. */
>  static const u16 bios_to_linux_keycode[256] __initconst = {
> @@ -316,20 +319,34 @@ static void dell_wmi_notify(u32 value, void *context)
>  	kfree(obj);
>  }
>  
> -static const struct key_entry * __init dell_wmi_prepare_new_keymap(void)
> +static void __init handle_dmi_table(const struct dmi_header *dm,

This is really handling one DMI structure, not the whole table.

> +				    void *opaque)
>  {
> -	int hotkey_num = (dell_bios_hotkey_table->header.length - 4) /
> -				sizeof(struct dell_bios_keymap_entry);
> +	struct dell_dmi_results *results = opaque;
> +	struct dell_bios_hotkey_table *table;
>  	struct key_entry *keymap;
> -	int i;
> +	int hotkey_num, i;
> +
> +	if (results->err || results->keymap)
> +		return;		/* We already found the hotkey table. */

Can this actually happen?

> +
> +	if (dm->type != 0xb2 || dm->length <= 6)
> +		return;
> +
> +	table = container_of(dm, struct dell_bios_hotkey_table, header);
> +
> +	hotkey_num = (table->header.length - 4) /
> +				sizeof(struct dell_bios_keymap_entry);

The problem is not introduced by your patch, but the length check is
inconsistent. sizeof(struct dell_bios_keymap_entry) is 4. If we need at
least one keymap entry then the minimum size would be 8, while the
check above would accept 7. If 7 is fine (empty keymap) then 4, 5 and 6
are equally fine and the length check can be dropped. If not, the
length check should be fixed.

If we only care about having at least one key, then checking for
hotkey_num >= is better. If we want to check for more consistency then
we should check that table->header.length - 4 is a strictly positive
multiple of sizeof(struct dell_bios_keymap_entry).

>  
>  	keymap = kcalloc(hotkey_num + 1, sizeof(struct key_entry), GFP_KERNEL);
> -	if (!keymap)
> -		return NULL;
> +	if (!keymap) {
> +		results->err = -ENOMEM;
> +		return;
> +	}
>  
>  	for (i = 0; i < hotkey_num; i++) {
>  		const struct dell_bios_keymap_entry *bios_entry =
> -					&dell_bios_hotkey_table->keymap[i];
> +					&table->keymap[i];
>  
>  		/* Uninitialized entries are 0 aka KEY_RESERVED. */
>  		u16 keycode = (bios_entry->keycode <
> @@ -358,11 +375,13 @@ static const struct key_entry * __init dell_wmi_prepare_new_keymap(void)
>  
>  	keymap[hotkey_num].type = KE_END;
>  
> -	return keymap;
> +	results->err = 0;

The check at the beginning of the function assumes that results->err
was already 0 originally.

> +	results->keymap = keymap;
>  }
>  
>  static int __init dell_wmi_input_setup(void)
>  {
> +	struct dell_dmi_results dmi_results = {};
>  	int err;
>  
>  	dell_wmi_input_dev = input_allocate_device();
> @@ -373,20 +392,26 @@ static int __init dell_wmi_input_setup(void)
>  	dell_wmi_input_dev->phys = "wmi/input0";
>  	dell_wmi_input_dev->id.bustype = BUS_HOST;
>  
> -	if (dell_new_hk_type) {
> -		const struct key_entry *keymap = dell_wmi_prepare_new_keymap();
> -		if (!keymap) {
> -			err = -ENOMEM;
> -			goto err_free_dev;
> -		}
> +	err = dmi_walk(handle_dmi_table, &dmi_results);
> +	if (err)
> +		goto err_free_dev;

dmi_walk() returns -1 on error, not some -E value (I take the blame for
that.) So you can't return it directly to the caller, otherwise it will
be incorrectly interpreted as "Operation not permitted" (-1 == -EPERM.)

So you must either hard-code your own -E value here, or first fix
dmi_walk() to return something sane.

>  
> -		err = sparse_keymap_setup(dell_wmi_input_dev, keymap, NULL);
> +	if (dmi_results.err) {
> +		err = dmi_results.err;
> +		goto err_free_dev;
> +	}

I think it would make sense to fix dmi_walk() so that it lets the
decoding function return error codes. This would avoid the convoluted
error code handling. Not sure why I didn't do that originally :(

> +
> +	if (dmi_results.keymap) {
> +		dell_new_hk_type = true;
> +
> +		err = sparse_keymap_setup(dell_wmi_input_dev,
> +					  dmi_results.keymap, NULL);
>  
>  		/*
>  		 * Sparse keymap library makes a copy of keymap so we
>  		 * don't need the original one that was allocated.
>  		 */
> -		kfree(keymap);
> +		kfree(dmi_results.keymap);
>  	} else {
>  		err = sparse_keymap_setup(dell_wmi_input_dev,
>  					  dell_wmi_legacy_keymap, NULL);
> @@ -413,15 +438,6 @@ static void dell_wmi_input_destroy(void)
>  	input_unregister_device(dell_wmi_input_dev);
>  }
>  
> -static void __init find_hk_type(const struct dmi_header *dm, void *dummy)
> -{
> -	if (dm->type == 0xb2 && dm->length > 6) {
> -		dell_new_hk_type = true;
> -		dell_bios_hotkey_table =
> -			container_of(dm, struct dell_bios_hotkey_table, header);
> -	}
> -}
> -
>  static int __init dell_wmi_init(void)
>  {
>  	int err;
> @@ -432,7 +448,6 @@ static int __init dell_wmi_init(void)
>  		return -ENODEV;
>  	}
>  
> -	dmi_walk(find_hk_type, NULL);
>  	acpi_video = acpi_video_get_backlight_type() != acpi_backlight_vendor;
>  
>  	err = dell_wmi_input_setup();

I can't test it but it looks good overall.

-- 
Jean Delvare
SUSE L3 Support
