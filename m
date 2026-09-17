Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA04A3921CE;
	Thu, 17 Sep 2026 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648302; cv=none; b=GTKpRKUwUOdgcar01uPibkCZzDfPDZR6gG+zyLAQxAsyh6sSc/+pFC2izb2YjETjEj9UZRFgUpyswZjaLZbrVo3DV6UvF8xzJoaEjGtKzy12ZQMLWbGM588D3Wyy0koSV6uKup5tXynWWWcqliaoC0OCHORwMvQo5NYQdT0u5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648302; c=relaxed/simple;
	bh=ej9da1CE5FWPagSE8f/cuLclZWz2eQSFfpoNcK1TfIo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nYTjPdvHiWxUeK1IaP6Mcu1FkpFltlI6aClCql2ax9MvUT07ujtBTCyEamkIURvfcDLYzivUbY+5r1Qv0yUbK9r2Gt0XN65mUc6tODiZNUCS9ILIc7iFQGcowuEdelgjtlr9HPI5kFIqswqFvbtGf1uXPqrqeUVJh92Yi+e69AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IcrNaz4j; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IcrNaz4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789648294; x=1821184294;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ej9da1CE5FWPagSE8f/cuLclZWz2eQSFfpoNcK1TfIo=;
  b=IcrNaz4jwWjsJfGSBB78xy+PMo8L464SlddFtRydO0SYJErf0+tC5zi9
   dAgpMVivBucx1mdbiyL/sUQoK7ZuXbWYquerAXnWPzTDWxiNs59/ru6xi
   B9kchZq8C5yj/D80qci62PNRM/fQweN/L0v/u82Pte+atmZk0nebI5ZC0
   6qLmK3wS8bKaTNB6MrpTnB5lqSVYTZ0GgVfu1hBQ7D5KlZU3CBfoGOwv0
   DFfs6dDOFjOckfJB4HvdSAcZx+8Ga562S2NFrw/SWITOdjtohROyqz6AK
   oNh34HGCvFWmsJQVLx/Bq8ZIdpJFfEkeZzMcxi53PIRAur7Cxxg4cF58S
   Q==;
X-CSE-ConnectionGUID: OteWGfv8QOaENNqF0WZYpA==
X-CSE-MsgGUID: VPpuPZk0ShK5e2DzhL4tJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107570768"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107570768"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:31:26 -0700
X-CSE-ConnectionGUID: qO9cgzIlRAOoAGe78dRXWQ==
X-CSE-MsgGUID: 4APwPwyLQQSDuTIm07YTOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270453428"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:31:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 15:31:13 +0300 (EEST)
To: Hilgad Montelo <hilgad.montelo@gmail.com>
cc: kenneth.t.chan@gmail.com, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] platform/x86: panasonic-laptop: Handle CF-33
 rotation-lock button
In-Reply-To: <20260813221744.25668-2-hilgad.montelo@gmail.com>
Message-ID: <d08ccf78-5d8f-f37a-c8df-2efa5623ec1d@linux.intel.com>
References: <20260813221744.25668-1-hilgad.montelo@gmail.com> <20260813221744.25668-2-hilgad.montelo@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1278692877-1789648273=:1179"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1278692877-1789648273=:1179
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 13 Aug 2026, Hilgad Montelo wrote:

> On the Panasonic Toughbook CF-33 the bezel "Rotation Lock" button does
> not signal via ACPI notify like the other hotkeys. Instead the
> embedded controller injects raw i8042/PS2 scancodes that alias the
> real Left-GUI/Meta key:
>=20
>     press:   e0 5b   65
>     release: e5      e0 db
>=20
> e0 5b / e0 db are the standard AT scancode for the physical Left-GUI
> key. The bare 65 / e5 bytes interleaved with them are not valid codes
> for any real key and only ever appear as part of this vendor signal
> (confirmed by tracing raw bytes crossing the i8042 port on the actual
> hardware). Left unfiltered, this shows up as a spurious KEY_LEFTMETA +
> KEY_F14 combo, which does nothing useful and can trigger desktop
> environment Meta-key bindings on every press.
>=20
> This driver already installs an i8042 filter (panasonic_i8042_filter)
> to de-duplicate volume key events. Extend it with a small state
> machine that recognizes and swallows the exact e0 5b 65 ... e5 e0 db
> sequence, and emits a single debounced KEY_ROTATE_LOCK_TOGGLE event
> instead. The 600ms debounce is needed because the EC repeats the
> make/break unit every ~280-400ms for as long as the button is
> physically held, which would otherwise fire multiple toggles for one
> tap. If a byte sequence starts the same way but doesn't complete the
> pattern, the buffered e0 5b bytes are replayed unfiltered, so a
> genuine Left-GUI keypress is unaffected.
>=20
> Verified on a CF-33 Mk1: each button press now produces exactly one
> KEY_ROTATE_LOCK_TOGGLE pair, the plain keyboard device stays silent
> during presses (no more stray LEFTMETA/F14), and GNOME's auto-rotate
> lock correctly engages/disengages. Brightness and volume hotkeys are
> unaffected.
>=20
> Signed-off-by: Hilgad Montelo <hilgad.montelo@gmail.com>
> ---
>  drivers/platform/x86/panasonic-laptop.c | 85 ++++++++++++++++++++++++-
>  1 file changed, 84 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x=
86/panasonic-laptop.c
> index 719add7..0c0e4a6 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
> @@ -127,6 +127,7 @@
>  #include <linux/init.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
> +#include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -256,15 +257,81 @@ struct pcc_acpi {
>  /*
>   * On some Panasonic models the volume up / down / mute keys send duplic=
ate
>   * keypress events over the PS/2 kbd interface, filter these out.
> + *
> + * On the CF-33 the bezel "Rotation Lock" button also signals over this =
same
> + * interface, instead of via an ACPI notify like the other hotkeys. It d=
oes
> + * so by injecting scancodes that alias the real Left-GUI/Meta key
> + * (e0 5b make / e0 db break), interleaved with a bare byte (0x65 / 0xe5=
)
> + * that no physical key on this keyboard uses. Left unfiltered this show=
s up
> + * as a bogus LEFTMETA+F14 combo. We recognize and swallow the whole
> + * sequence and emit a single debounced KEY_ROTATE_LOCK_TOGGLE instead; =
any
> + * byte that breaks the expected pattern is treated as a genuine key and
> + * replayed unfiltered.
>   */
> +enum rot_lock_state {
> +=09ROT_IDLE,
> +=09ROT_WAIT_65,
> +=09ROT_WAIT_E5,
> +=09ROT_WAIT_E0B,
> +=09ROT_WAIT_DB,
> +};
> +
>  static bool panasonic_i8042_filter(unsigned char data, unsigned char str=
,
>  =09=09=09=09   struct serio *port, void *context)
>  {
> +=09struct pcc_acpi *pcc =3D context;
>  =09static bool extended;
> +=09static enum rot_lock_state rstate =3D ROT_IDLE;
> +=09static unsigned long last_toggle;
> +=09const unsigned long debounce =3D msecs_to_jiffies(600);

Please try to sort the 4 variables into reverse-xmas tree order (the=20
context assignment feels boilerplate noise so it can be left as the=20
first entry but that's up to you).

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

> =20
>  =09if (str & I8042_STR_AUXDATA)
>  =09=09return false;
> =20
> +=09switch (rstate) {
> +=09case ROT_WAIT_65:
> +=09=09if (data =3D=3D 0x65) {
> +=09=09=09rstate =3D ROT_WAIT_E5;
> +=09=09=09if (pcc && pcc->input_dev &&
> +=09=09=09    time_after(jiffies, last_toggle + debounce)) {
> +=09=09=09=09input_report_key(pcc->input_dev,
> +=09=09=09=09=09=09  KEY_ROTATE_LOCK_TOGGLE, 1);
> +=09=09=09=09input_sync(pcc->input_dev);
> +=09=09=09=09input_report_key(pcc->input_dev,
> +=09=09=09=09=09=09  KEY_ROTATE_LOCK_TOGGLE, 0);
> +=09=09=09=09input_sync(pcc->input_dev);
> +=09=09=09=09last_toggle =3D jiffies;
> +=09=09=09}
> +=09=09=09return true;
> +=09=09}
> +=09=09/* Not our sequence: replay the buffered genuine Left-GUI make. */
> +=09=09rstate =3D ROT_IDLE;
> +=09=09serio_interrupt(port, 0xe0, 0);
> +=09=09serio_interrupt(port, 0x5b, 0);
> +=09=09break;
> +=09case ROT_WAIT_E5:
> +=09=09if (data =3D=3D 0xe5) {
> +=09=09=09rstate =3D ROT_WAIT_E0B;
> +=09=09=09return true;
> +=09=09}
> +=09=09rstate =3D ROT_IDLE;
> +=09=09break;
> +=09case ROT_WAIT_E0B:
> +=09=09if (data =3D=3D 0xe0) {
> +=09=09=09rstate =3D ROT_WAIT_DB;
> +=09=09=09return true;
> +=09=09}
> +=09=09rstate =3D ROT_IDLE;
> +=09=09break;
> +=09case ROT_WAIT_DB:
> +=09=09rstate =3D ROT_IDLE;
> +=09=09if (data =3D=3D 0xdb)
> +=09=09=09return true;
> +=09=09break;
> +=09case ROT_IDLE:
> +=09=09break;
> +=09}
> +
>  =09if (data =3D=3D 0xe0) {
>  =09=09extended =3D true;
>  =09=09return true;
> @@ -276,6 +343,19 @@ static bool panasonic_i8042_filter(unsigned char dat=
a, unsigned char str,
>  =09=09case 0x2e: /* e0 2e / e0 ae, Volume Down press / release */
>  =09=09case 0x30: /* e0 30 / e0 b0, Volume Up press / release */
>  =09=09=09return true;
> +=09=09case 0x5b: /* e0 5b, possible start of rotate-lock sequence */
> +=09=09=09if (data =3D=3D 0x5b) {
> +=09=09=09=09rstate =3D ROT_WAIT_65;
> +=09=09=09=09return true;
> +=09=09=09}
> +=09=09=09/*
> +=09=09=09 * data =3D=3D 0xdb: genuine Left-GUI/Meta break code.
> +=09=09=09 * The rotate-lock sequence only ever begins with
> +=09=09=09 * the make code, so this is a real key release,
> +=09=09=09 * not our sequence; the code below replays it
> +=09=09=09 * untouched.
> +=09=09=09 */
> +=09=09=09fallthrough;
>  =09=09default:
>  =09=09=09/*
>  =09=09=09 * Report the previously filtered e0 before continuing
> @@ -944,6 +1024,9 @@ static int acpi_pcc_init_input(struct pcc_acpi *pcc)
>  =09=09goto err_free_dev;
>  =09}
> =20
> +=09/* Synthesized by panasonic_i8042_filter(), not part of the ACPI keym=
ap. */
> +=09input_set_capability(input_dev, EV_KEY, KEY_ROTATE_LOCK_TOGGLE);
> +
>  =09error =3D input_register_device(input_dev);
>  =09if (error) {
>  =09=09pr_err("Unable to register input device\n");
> @@ -1090,7 +1173,7 @@ static int acpi_pcc_hotkey_probe(struct platform_de=
vice *pdev)
>  =09=09pcc->platform =3D NULL;
>  =09}
> =20
> -=09i8042_install_filter(panasonic_i8042_filter, NULL);
> +=09i8042_install_filter(panasonic_i8042_filter, pcc);
>  =09return 0;
> =20
>  out_platform:
>=20



--=20
 i.

--8323328-1278692877-1789648273=:1179--
