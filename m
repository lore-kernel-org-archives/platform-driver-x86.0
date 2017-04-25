From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] dell-laptop: Adds support for keyboard backlight timeout
 AC settings
Date: Tue, 25 Apr 2017 15:36:56 +0300
Message-ID: <CAHp75VfCiqeddWu9xfMud4sEWAvk+CDXTkgO5zbb++QhiTL=Bw@mail.gmail.com>
References: <1492976447-10339-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:35409 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1176525AbdDYMg6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2017 08:36:58 -0400
In-Reply-To: <1492976447-10339-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Arcadiy Ivanov <arcadiy@ivanov.biz>, Mario Limonciello <mario.limonciello@dell.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Apr 23, 2017 at 10:40 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wr=
ote:
> When changing keyboard backlight state on new Dell laptops, firmware
> expects a new timeout AC value filled in Set New State SMBIOS call.
>
> Without it any change of keyboard backlight state on new Dell laptops
> fails. And user can see following error message in dmesg:
>
>   dell_laptop: Setting old previous keyboard state failed
>   leds dell::kbd_backlight: Setting an LED's brightness failed (-6)
>
> This patch adds support for retrieving current timeout AC values and also
> updating them. Current timeout value in sysfs is displayed based on curre=
nt
> AC status, like current display brightness value.
>
> Detection if Dell laptop supports or not new timeout AC settings is done =
by
> checking existence of Keyboard Backlight with AC SMBIOS token (0x0451).
>
> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

What base did you use for that?
This patch misses few others that were applied to our testing / for-next.

I have applied it to testing with corrected conflict (easy to fix),
though check if everything still as supposed to be.

> ---
> I have not tested this patch yet as I do not have affected machine. I wou=
ld
> appreciate some testing of this patch on more new Dell laptops. Without
> this patch changing keyboard backlight is not possible on affected machin=
es.
> ---
>  drivers/platform/x86/dell-laptop.c |   59 ++++++++++++++++++++++++++++++=
++----
>  1 file changed, 53 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/de=
ll-laptop.c
> index f57dd28..cddf3c2 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -42,6 +42,7 @@
>  #define KBD_LED_AUTO_50_TOKEN 0x02EB
>  #define KBD_LED_AUTO_75_TOKEN 0x02EC
>  #define KBD_LED_AUTO_100_TOKEN 0x02F6
> +#define KBD_LED_AC_TOKEN 0x0451
>
>  struct quirk_entry {
>         u8 touchpad_led;
> @@ -1024,7 +1025,7 @@ static void touchpad_led_exit(void)
>   *     bit 2     Pointing stick
>   *     bit 3     Any mouse
>   *     bits 4-7  Reserved for future use
> - *  cbRES2, byte3  Current Timeout
> + *  cbRES2, byte3  Current Timeout on battery
>   *     bits 7:6  Timeout units indicator:
>   *     00b       Seconds
>   *     01b       Minutes
> @@ -1036,6 +1037,15 @@ static void touchpad_led_exit(void)
>   *  cbRES3, byte0  Current setting of ALS value that turns the light on =
or off.
>   *  cbRES3, byte1  Current ALS reading
>   *  cbRES3, byte2  Current keyboard light level.
> + *  cbRES3, byte3  Current timeout on AC Power
> + *     bits 7:6  Timeout units indicator:
> + *     00b       Seconds
> + *     01b       Minutes
> + *     10b       Hours
> + *     11b       Days
> + *     Bits 5:0  Timeout value (0-63) in sec/min/hr/day
> + *     NOTE: A value of 0 means always on (no timeout) if any bits of RE=
S3 byte2
> + *     are set upon return from the upon return from the [Get Feature in=
formation] call.
>   *
>   * cbArg1 0x2 =3D Set New State
>   *  cbRES1         Standard return codes (0, -1, -2)
> @@ -1058,7 +1068,7 @@ static void touchpad_led_exit(void)
>   *     bit 2     Pointing stick
>   *     bit 3     Any mouse
>   *     bits 4-7  Reserved for future use
> - *  cbArg2, byte3  Desired Timeout
> + *  cbArg2, byte3  Desired Timeout on battery
>   *     bits 7:6  Timeout units indicator:
>   *     00b       Seconds
>   *     01b       Minutes
> @@ -1067,6 +1077,13 @@ static void touchpad_led_exit(void)
>   *     bits 5:0  Timeout value (0-63) in sec/min/hr/day
>   *  cbArg3, byte0  Desired setting of ALS value that turns the light on =
or off.
>   *  cbArg3, byte2  Desired keyboard light level.
> + *  cbArg3, byte3  Desired Timeout on AC power
> + *     bits 7:6  Timeout units indicator:
> + *     00b       Seconds
> + *     01b       Minutes
> + *     10b       Hours
> + *     11b       Days
> + *     bits 5:0  Timeout value (0-63) in sec/min/hr/day
>   */
>
>
> @@ -1112,6 +1129,8 @@ struct kbd_state {
>         u8 triggers;
>         u8 timeout_value;
>         u8 timeout_unit;
> +       u8 timeout_value_ac;
> +       u8 timeout_unit_ac;
>         u8 als_setting;
>         u8 als_value;
>         u8 level;
> @@ -1131,6 +1150,7 @@ struct kbd_state {
>  static struct kbd_info kbd_info;
>  static bool kbd_als_supported;
>  static bool kbd_triggers_supported;
> +static bool kbd_timeout_ac_supported;
>
>  static u8 kbd_mode_levels[16];
>  static int kbd_mode_levels_count;
> @@ -1269,6 +1289,8 @@ static int kbd_get_state(struct kbd_state *state)
>         state->als_setting =3D buffer->output[2] & 0xFF;
>         state->als_value =3D (buffer->output[2] >> 8) & 0xFF;
>         state->level =3D (buffer->output[2] >> 16) & 0xFF;
> +       state->timeout_value_ac =3D (buffer->output[2] >> 24) & 0x3F;
> +       state->timeout_unit_ac =3D (buffer->output[2] >> 30) & 0x3;
>
>   out:
>         dell_smbios_release_buffer();
> @@ -1288,6 +1310,8 @@ static int kbd_set_state(struct kbd_state *state)
>         buffer->input[1] |=3D (state->timeout_unit & 0x3) << 30;
>         buffer->input[2] =3D state->als_setting & 0xFF;
>         buffer->input[2] |=3D (state->level & 0xFF) << 16;
> +       buffer->input[2] |=3D (state->timeout_value_ac & 0x3F) << 24;
> +       buffer->input[2] |=3D (state->timeout_unit_ac & 0x3) << 30;
>         dell_smbios_send_request(4, 11);
>         ret =3D buffer->output[0];
>         dell_smbios_release_buffer();
> @@ -1394,6 +1418,13 @@ static inline int kbd_init_info(void)
>         if (ret)
>                 return ret;
>
> +       /* NOTE: Old models without KBD_LED_AC_TOKEN token supports only =
one
> +        *       timeout value which is shared for both battery and AC po=
wer
> +        *       settings. So do not try to set AC values on old models.
> +        */
> +       if (dell_smbios_find_token(KBD_LED_AC_TOKEN))
> +               kbd_timeout_ac_supported =3D true;
> +
>         kbd_get_state(&state);
>
>         /* NOTE: timeout value is stored in 6 bits so max value is 63 */
> @@ -1573,8 +1604,14 @@ static ssize_t kbd_led_timeout_store(struct device=
 *dev,
>                 return ret;
>
>         new_state =3D state;
> -       new_state.timeout_value =3D value;
> -       new_state.timeout_unit =3D unit;
> +
> +       if (kbd_timeout_ac_supported && power_supply_is_system_supplied()=
 > 0) {
> +               new_state.timeout_value_ac =3D value;
> +               new_state.timeout_unit_ac =3D unit;
> +       } else {
> +               new_state.timeout_value =3D value;
> +               new_state.timeout_unit =3D unit;
> +       }
>
>         ret =3D kbd_set_state_safe(&new_state, &state);
>         if (ret)
> @@ -1587,16 +1624,26 @@ static ssize_t kbd_led_timeout_show(struct device=
 *dev,
>                                     struct device_attribute *attr, char *=
buf)
>  {
>         struct kbd_state state;
> +       int value;
>         int ret;
>         int len;
> +       u8 unit;
>
>         ret =3D kbd_get_state(&state);
>         if (ret)
>                 return ret;
>
> -       len =3D sprintf(buf, "%d", state.timeout_value);
> +       if (kbd_timeout_ac_supported && power_supply_is_system_supplied()=
 > 0) {
> +               value =3D state.timeout_value_ac;
> +               unit =3D state.timeout_unit_ac;
> +       } else {
> +               value =3D state.timeout_value;
> +               unit =3D state.timeout_unit;
> +       }
> +
> +       len =3D sprintf(buf, "%d", value);
>
> -       switch (state.timeout_unit) {
> +       switch (unit) {
>         case KBD_TIMEOUT_SECONDS:
>                 return len + sprintf(buf+len, "s\n");
>         case KBD_TIMEOUT_MINUTES:
> --
> 1.7.9.5
>



--=20
With Best Regards,
Andy Shevchenko
