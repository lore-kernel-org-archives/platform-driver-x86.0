Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD776374189
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Jan 2026 07:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768374621; cv=none; b=khcLrisqYzr2/ooUU/CS9AT7arxWAv5RDUQ8nWmMbqdfdujIkfumMgwO61cReU3r7vQkYPwUfYerextisqJViGI2LA2cZWp4AQ744Nh2yvj0PUUocDMmfIdQt1TwqCdPwbj0FQKfrbEvWXVBL6zPJGWdEztaAyEKNjTgeVe+0PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768374621; c=relaxed/simple;
	bh=ctUYPBC6+nJZEmDVZF5qucDUeCidCa4GEKiDIyw7EQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ad3tNKPz1fY8/mJUaCS9YJLRLRCkSSolAMEXFFCuZeQwLsAA+XdSY2GjvE/2/K7qI6NZSEiFpOJnIxMqy5vD321QvRP5vpcgeqKPIkVksr0YHS2uWdgdaBkkPiAoMMCAjWf+WIrgLGYB8Y9vxkmzp4NKvOfIWANvNjQdtoEzgBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpQ28Lk/; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpQ28Lk/"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b86f69bbe60so463852566b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jan 2026 23:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768374614; x=1768979414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZLt7c6ghw+MbNmmeD8W7gMeP5vlZ3ZHsqysaqmiypg=;
        b=WpQ28Lk/WHjVbX+cTbjTsQnRXCAd9/PdZFVO9zYdCm/K29OlgDWeYM4rAMmJSHPSNi
         bwrZgKHa7txnbF+bcs+pUrgynVT7zysRkJ7aJuRijW+HCq0LB/TsWS1Pf53HDu1zvTWs
         rbYcmQDFk31zkIHf+Yl8cnL9HLLMyVKdK1CfNqmmlWlVRZ2lWaqkv4JvyTc2Gsr4j/Ns
         bbxYzBaSwWwYDrfeDDifKpvYmdhQhTdZauQLVAn8TWds0IdeFGidygoWvMYfQL0rGKeL
         Dqz9yUV/oDZZwvK6HjF7PsHI0u1uIb/pEri4L4fsf401HeaalTKaCwvJYE520un4ocl/
         /ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768374614; x=1768979414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VZLt7c6ghw+MbNmmeD8W7gMeP5vlZ3ZHsqysaqmiypg=;
        b=dTZ+86hclNh6IsAYtRLcfYzmd4ZHdMT8gv4wwyLhkrLm+JLsCp22j7WheUGDjH5K/N
         vKTmdzlPsqNQ5nfTNG1ss9o5B6bG26T2WDknMDnbKgCW35q3DPTjHKlJK2BAZ5rViBKM
         +jkR7AS+/dJerBbWK48bibDEUYL6Z3QMH5aghXaYFVl/helHejIxTEjMOJFZe6OnWCzM
         EvOEVSuhGckBiWK8csfAJFA9O2NNtAI9rjK1m4+nVmPrI44z5J52Q/u8AWiB4gSlQqY/
         PBZx8o+H6Ndps7WnEiAfOZTfle2vkKPol3OYhCofR/VPPbt9XCgP31JPyGUCksTzpsW3
         zeSg==
X-Gm-Message-State: AOJu0YzM+xkbwaNi1c9HUKTeDR/ZPP41acz8fqVavmeNngo0Bpt7c7gB
	1ezpgHaf3EJQ+PYx11VpFBUUf0naf1XONPARMMhZp2GzRNfnu5+d2Tby33Ncwp8Nd6b4U4xK79g
	RvJwnzKB9pvy+dRzTPgTWWr/vFhJHR8k=
X-Gm-Gg: AY/fxX569aO/87A8gIkX1REz6AVkfmHbw/l8NhoftkNus4Pi9Egxe2ywLdjdJw66WG7
	30bANKyOnz1JvPmDtiejj7SPSRer4cOJ3y88N4QOkowP/hA9mobFV0jasG513pbTzOnXTRwuchN
	oMNXEH9AUikTgsdvUBkZvNMmXYmM4ByKlEPa9KQ3tneLwKuYEbPMdlI2Pcqh1IwmK6wnpeMly+l
	PoMEZEAJj3knRzJf9n6qhn6Vgox5gcaKwn//OElunKQlTr6f5Nsgyx+gdOkgrDxqQyJOw==
X-Received: by 2002:a17:906:9fca:b0:b3b:5fe6:577a with SMTP id
 a640c23a62f3a-b8760fce1b8mr136030466b.8.1768374613670; Tue, 13 Jan 2026
 23:10:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106184830.34426-1-benjamin.philip495@gmail.com>
In-Reply-To: <20260106184830.34426-1-benjamin.philip495@gmail.com>
From: Ike Panhc <ikepanhc@gmail.com>
Date: Wed, 14 Jan 2026 15:10:02 +0800
X-Gm-Features: AZwV_QjVLe5HKorFIVaObQOYrGhLDW-d7e1BubPh_jrIHmyxdynaM8dOR463nyI
Message-ID: <CADwxbCU1O4nGb9yKdVqNfYZ3Su9epERv86eEOD3ggvTjGvm22g@mail.gmail.com>
Subject: Re: [PATCH RESEND] platform/x86: ideadpad-laptop: Clean up style
 warnings and checks
To: Benjamin Philip <benjamin.philip495@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 2:49=E2=80=AFAM Benjamin Philip
<benjamin.philip495@gmail.com> wrote:
>
> This commit makes some style changes to clean up the following
> checkpatch warnings and checks at various places in ideapad.c:
>
> - WARNING: quoted string split across lines
> - WARNING: space prohibited between function name and open parenthesis '(=
'
> - WARNING: braces {} are not necessary for any arm of this statement
> - CHECK: Alignment should match open parenthesis
>
> We exceed the 80 column limit to fix the quoted string warning since
> strings in question are user visible. See coding style, part 2 for
> details.
>
> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
> ---
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 39 ++++++++------------
>  1 file changed, 16 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platf=
orm/x86/lenovo/ideapad-laptop.c
> index 5171a077f62c..3d8a8b4f3e86 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -219,38 +219,32 @@ MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for bluet=
ooth.");
>  static bool allow_v4_dytc;
>  module_param(allow_v4_dytc, bool, 0444);
>  MODULE_PARM_DESC(allow_v4_dytc,
> -       "Enable DYTC version 4 platform-profile support. "
> -       "If you need this please report this to: platform-driver-x86@vger=
.kernel.org");
> +                "Enable DYTC version 4 platform-profile support. If you =
need this please report this to: platform-driver-x86@vger.kernel.org");
>
>  static bool hw_rfkill_switch;
>  module_param(hw_rfkill_switch, bool, 0444);
>  MODULE_PARM_DESC(hw_rfkill_switch,
> -       "Enable rfkill support for laptops with a hw on/off wifi switch/s=
lider. "
> -       "If you need this please report this to: platform-driver-x86@vger=
.kernel.org");
> +                "Enable rfkill support for laptops with a hw on/off wifi=
 switch/slider. If you need this please report this to: platform-driver-x86=
@vger.kernel.org");
>
>  static bool set_fn_lock_led;
>  module_param(set_fn_lock_led, bool, 0444);
>  MODULE_PARM_DESC(set_fn_lock_led,
> -       "Enable driver based updates of the fn-lock LED on fn-lock change=
s. "
> -       "If you need this please report this to: platform-driver-x86@vger=
.kernel.org");
> +                "Enable driver based updates of the fn-lock LED on fn-lo=
ck changes. If you need this please report this to: platform-driver-x86@vge=
r.kernel.org");
>
>  static bool ctrl_ps2_aux_port;
>  module_param(ctrl_ps2_aux_port, bool, 0444);
>  MODULE_PARM_DESC(ctrl_ps2_aux_port,
> -       "Enable driver based PS/2 aux port en-/dis-abling on touchpad on/=
off toggle. "
> -       "If you need this please report this to: platform-driver-x86@vger=
.kernel.org");
> +                "Enable driver based PS/2 aux port en-/dis-abling on tou=
chpad on/off toggle. If you need this please report this to: platform-drive=
r-x86@vger.kernel.org");
>
>  static bool touchpad_ctrl_via_ec;
>  module_param(touchpad_ctrl_via_ec, bool, 0444);
>  MODULE_PARM_DESC(touchpad_ctrl_via_ec,
> -       "Enable registering a 'touchpad' sysfs-attribute which can be use=
d to manually "
> -       "tell the EC to enable/disable the touchpad. This may not work on=
 all models.");
> +                "Enable registering a 'touchpad' sysfs-attribute which c=
an be used to manually tell the EC to enable/disable the touchpad. This may=
 not work on all models.");
>
>  static bool ymc_ec_trigger __read_mostly;
>  module_param(ymc_ec_trigger, bool, 0444);
>  MODULE_PARM_DESC(ymc_ec_trigger,
> -       "Enable EC triggering work-around to force emitting tablet mode e=
vents. "
> -       "If you need this please report this to: platform-driver-x86@vger=
.kernel.org");
> +                "Enable EC triggering work-around to force emitting tabl=
et mode events. If you need this please report this to: platform-driver-x86=
@vger.kernel.org");
>
>  /*
>   * shared data
> @@ -1446,7 +1440,7 @@ static void ideapad_check_special_buttons(struct id=
eapad_private *priv)
>                 if (read_ec_data(priv->adev->handle, VPCCMD_R_SPECIAL_BUT=
TONS, &value))
>                         return;
>
> -       for_each_set_bit (bit, &value, 16) {
> +       for_each_set_bit(bit, &value, 16) {
>                 switch (bit) {
>                 case 6: /* Z570 */
>                 case 0: /* Z580 */
> @@ -1706,11 +1700,10 @@ static int ideapad_kbd_bl_init(struct ideapad_pri=
vate *priv)
>         if (WARN_ON(priv->kbd_bl.initialized))
>                 return -EEXIST;
>
> -       if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type)) {
> +       if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type))
>                 priv->kbd_bl.led.max_brightness =3D 2;
> -       } else {
> +       else
>                 priv->kbd_bl.led.max_brightness =3D 1;
> -       }
>
>         brightness =3D ideapad_kbd_bl_brightness_get(priv);
>         if (brightness < 0)
> @@ -1752,7 +1745,7 @@ static enum led_brightness ideapad_fn_lock_led_cdev=
_get(struct led_classdev *led
>  }
>
>  static int ideapad_fn_lock_led_cdev_set(struct led_classdev *led_cdev,
> -       enum led_brightness brightness)
> +                                       enum led_brightness brightness)
>  {
>         struct ideapad_private *priv =3D container_of(led_cdev, struct id=
eapad_private, fn_lock.led);
>
> @@ -1928,7 +1921,7 @@ static void ideapad_acpi_notify(acpi_handle handle,=
 u32 event, void *data)
>
>         vpc1 =3D (vpc2 << 8) | vpc1;
>
> -       for_each_set_bit (bit, &vpc1, 16) {
> +       for_each_set_bit(bit, &vpc1, 16) {
>                 switch (bit) {
>                 case 13:
>                 case 11:
> @@ -2142,14 +2135,14 @@ static const enum power_supply_property ideapad_p=
ower_supply_props[] =3D {
>         }
>
>  DEFINE_IDEAPAD_POWER_SUPPLY_EXTENSION(ideapad_battery_ext_v1,
> -       (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> -        BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
> +                                     (BIT(POWER_SUPPLY_CHARGE_TYPE_STAND=
ARD) |
> +                                      BIT(POWER_SUPPLY_CHARGE_TYPE_LONGL=
IFE))
>  );
>
>  DEFINE_IDEAPAD_POWER_SUPPLY_EXTENSION(ideapad_battery_ext_v2,
> -       (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> -        BIT(POWER_SUPPLY_CHARGE_TYPE_FAST) |
> -        BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
> +                                     (BIT(POWER_SUPPLY_CHARGE_TYPE_STAND=
ARD) |
> +                                      BIT(POWER_SUPPLY_CHARGE_TYPE_FAST)=
 |
> +                                      BIT(POWER_SUPPLY_CHARGE_TYPE_LONGL=
IFE))
>  );
>
>  static int ideapad_battery_add(struct power_supply *battery, struct acpi=
_battery_hook *hook)
> --
> 2.52.0
>

Looks good to me. Thanks for fixing these.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
