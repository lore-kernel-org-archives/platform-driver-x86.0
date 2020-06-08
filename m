From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH 2/3] platform/x86: dell-wmi: add new keymap type 0x0012
Date: Mon, 8 Jun 2020 10:50:12 +0200
Message-ID: <20200608085012.ve2zefw26hisagso@pali>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <0dc191a3d16f0e114f6a8976433e248018e10c43.1591584631.git.y.linux@paritcher.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0dc191a3d16f0e114f6a8976433e248018e10c43.1591584631.git.y.linux@paritcher.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Y Paritcher <y.linux@paritcher.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>
List-Id: platform-driver-x86.vger.kernel.org

Hello!

On Monday 08 June 2020 00:22:25 Y Paritcher wrote:
> Ignore events with a type of 0x0012 and a code of 0xe035,
> this silences the following messages being logged when
> pressing the Fn-lock key on a Dell Inspiron 5593:

Could you please explain why to ignore these events instead of sending
them to userspace via input layer? I think that userspace can be
interested in knowing when Fn lock key was pressed and I can imagine
that some it can use it for some purposes.

> dell_wmi: Unknown WMI event type 0x12
> dell_wmi: Unknown key with type 0x0012 and code 0xe035 pressed

These messages are printed to inform about fact that some events were
not processed. And they should not be silenced without reason. If for
some reasons it is needed to completely ignore some kind of events then
this reason should be documented (e.g. in commit message) so other
developers would know why that code is there. Not all Linux developers
have all those Dell machines for testing so they do not know all
hardware details.

> Signed-off-by: Y Paritcher <y.linux@paritcher.com>
> ---
>  drivers/platform/x86/dell-wmi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index 0b4f72f923cd..f37e7e9093c2 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -334,6 +334,14 @@ static const struct key_entry dell_wmi_keymap_type_0011[] = {
>  	{ KE_IGNORE, KBD_LED_AUTO_100_TOKEN, { KEY_RESERVED } },
>  };
>  
> +/*
> + * Keymap for WMI events of type 0x0012
> + */
> +static const struct key_entry dell_wmi_keymap_type_0012[] = {
> +	/* Fn-lock button pressed */
> +	{ KE_IGNORE, 0xe035, { KEY_RESERVED } },
> +};
> +
>  static void dell_wmi_process_key(struct wmi_device *wdev, int type, int code)
>  {
>  	struct dell_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
> @@ -425,6 +433,7 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>  			break;
>  		case 0x0010: /* Sequence of keys pressed */
>  		case 0x0011: /* Sequence of events occurred */
> +		case 0x0012: /* Sequence of events occurred */

It is really sequence of events? Because you wrote that Fn-lock key was
pressed (and not generic event). Also it is really sequence? And not
just one event/key-press (with possibility of some additional details in
buffer)? It would be nice to put documentation for this type of events
to check and review that implementation is correct.

>  			for (i = 2; i < len; ++i)
>  				dell_wmi_process_key(wdev, buffer_entry[1],
>  						     buffer_entry[i]);
> @@ -556,6 +565,7 @@ static int dell_wmi_input_setup(struct wmi_device *wdev)
>  			 ARRAY_SIZE(dell_wmi_keymap_type_0000) +
>  			 ARRAY_SIZE(dell_wmi_keymap_type_0010) +
>  			 ARRAY_SIZE(dell_wmi_keymap_type_0011) +
> +			 ARRAY_SIZE(dell_wmi_keymap_type_0012) +
>  			 1,
>  			 sizeof(struct key_entry), GFP_KERNEL);
>  	if (!keymap) {
> @@ -600,6 +610,13 @@ static int dell_wmi_input_setup(struct wmi_device *wdev)
>  		pos++;
>  	}
>  
> +	/* Append table with events of type 0x0012 */
> +	for (i = 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0012); i++) {
> +		keymap[pos] = dell_wmi_keymap_type_0012[i];
> +		keymap[pos].code |= (0x0012 << 16);
> +		pos++;
> +	}
> +
>  	/*
>  	 * Now append also table with "legacy" events of type 0x0000. Some of
>  	 * them are reported also on laptops which have scancodes in DMI.
> -- 
> 2.27.0
> 
