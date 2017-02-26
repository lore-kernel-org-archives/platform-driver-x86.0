From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: Re: [PATCH 1/2] platform/x86: thinkpad_acpi: guard
 generic hotkey case
Date: Sun, 26 Feb 2017 15:44:11 -0300
Message-ID: <20170226184411.GA5747@khazad-dum.debian.net>
References: <20170225182030.19232-1-ckellner@redhat.com>
	<20170225182030.19232-2-ckellner@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170225182030.19232-2-ckellner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Christian Kellner <ckellner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, 25 Feb 2017, Christian Kellner wrote:
> @@ -1923,7 +1923,8 @@ enum {	/* hot key scan codes (derived from ACPI DSDT) */
>  	TP_ACPI_HOTKEYSCAN_UNK7,
>  	TP_ACPI_HOTKEYSCAN_UNK8,
>  
> -	TP_ACPI_HOTKEYSCAN_MUTE2,
> +	TP_ACPI_HOTKEYSCAN_ADAPTIVE_START = 32,
> +	TP_ACPI_HOTKEYSCAN_MUTE2 = 32,
>  	TP_ACPI_HOTKEYSCAN_BRIGHTNESS_ZERO,
>  	TP_ACPI_HOTKEYSCAN_CLIPPING_TOOL,
>  	TP_ACPI_HOTKEYSCAN_CLOUD,

This works, but...

enum {
	TP_ACPI_HOTKEYSCAN_ADAPTIVE_START,
	TP_ACPI_HOTKEYSCAN_MUTE2 = TP_ACPI_HOTKEYSCAN_ADAPTIVE_START,
	TP_ACPI_HOTKEYSCAN_BRIGHTNESS_ZERO,
...
} 

or something to that effect might be better.  Either that or an
compile-time assert that the block boundaries are where we expect them
to be.

Feel free to use formatting tricks with whitespace to make it create
visual blocks in the enum {}  definition, or use comments as spacers...
;-)

> @@ -3657,7 +3658,6 @@ static const int adaptive_keyboard_modes[] = {
>  #define DFR_CHANGE_ROW			0x101
>  #define DFR_SHOW_QUICKVIEW_ROW		0x102
>  #define FIRST_ADAPTIVE_KEY		0x103
> -#define ADAPTIVE_KEY_OFFSET		0x020
>  
>  /* press Fn key a while second, it will switch to Function Mode. Then
>   * release Fn key, previous mode be restored.
> @@ -3748,12 +3748,13 @@ static bool adaptive_keyboard_hotkey_notify_hotkey(unsigned int scancode)
>  	default:
>  		if (scancode < FIRST_ADAPTIVE_KEY ||
>  		    scancode >= FIRST_ADAPTIVE_KEY + TPACPI_HOTKEY_MAP_LEN -
> -				ADAPTIVE_KEY_OFFSET) {
> +				TP_ACPI_HOTKEYSCAN_ADAPTIVE_START) {
>  			pr_info("Unhandled adaptive keyboard key: 0x%x\n",
>  					scancode);
>  			return false;
>  		}
> -		keycode = hotkey_keycode_map[scancode - FIRST_ADAPTIVE_KEY + ADAPTIVE_KEY_OFFSET];
> +		keycode = hotkey_keycode_map[scancode - FIRST_ADAPTIVE_KEY +
> +					     TP_ACPI_HOTKEYSCAN_ADAPTIVE_START];
>  		if (keycode != KEY_RESERVED) {
>  			mutex_lock(&tpacpi_inputdev_send_mutex);
>  
> @@ -3779,7 +3780,7 @@ static bool hotkey_notify_hotkey(const u32 hkey,
>  	*ignore_acpi_ev = false;
>  
>  	/* HKEY event 0x1001 is scancode 0x00 */
> -	if (scancode > 0 && scancode <= TPACPI_HOTKEY_MAP_LEN) {
> +	if (scancode > 0 && scancode <= TP_ACPI_HOTKEYSCAN_ADAPTIVE_START) {
>  		scancode--;
>  		if (!(hotkey_source_mask & (1 << scancode))) {
>  			tpacpi_input_send_key_masked(scancode);

Other than that, I like the idea.

-- 
  Henrique Holschuh

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, SlashDot.org! http://sdm.link/slashdot
