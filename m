Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3591358D3C
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Jan 2026 18:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767725625; cv=none; b=Dyp1tKVgyAlBfwoRrGCUtY2Pl2jJLg/Mr3sYpHO6047JbldQi8CdYJ0HtM1lX+Gmgb7HTMLF7SIVnj076/Uf3kWBfLpEnZ67uT1Ngg8hB1/6X6nVFSTpNleMJOPUlGEIRgGnEnEp8tx1JUAi5yKsQLxXbwEb3cWvgFfYdrYzLO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767725625; c=relaxed/simple;
	bh=IzR0wVChjJEjfERF/73hAtb/zlGRdM7sq82OPCoDBkE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQjbwpyJkR1ThXNiM2X+QTDYS2hF5y0iJ+zuq9UKWHyefOoGyx6ibc/FJifWHVpMoppHZermkZL4/unheow4uGDNgEMiy1L493fDbsjEtMNkcrxfqVhgHpP1iwRRLRQlx0H6oXrRv7njqY1n9YivboMYJj0R7XpqdHqyMo9Zd1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuxVbppW; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuxVbppW"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37cef3ccb82so10694591fa.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jan 2026 10:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767725622; x=1768330422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qrrZ65j3ooT7VZ/NCgZt+8rVxUGKrSy4Du3040UifI=;
        b=GuxVbppW5qN04+dYrBVb5jJmkXEtZ6soV0WIa5OVVac6A3wpViD8s6VzsVHnTSRcKT
         KoTSgXl4WJx7vaZ69sakG4tmrKtzwH5gjeYFRFCwfwWl3hifuqEvPPIRAp7At4alleIY
         j20OZCCBFJY6fBRXQ5AIexeP9Py3fJxS9O1djUwPsXxTt2ubL8qMQVKzGFg36ynvz84f
         Ho+XQdsHK+YrvSSUVY+uiSpO3sD5Abr0TsTFZn8LXTGGhHXuA1NONauy0/i0zYsRd/hb
         4Je8q/uzWwTWApx1DuJ4Oxz0QPnzWRiX0Eh3Jmtp/Au6cKJsMTYdDwo7PMKdfTpbCJ0V
         babA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767725622; x=1768330422;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3qrrZ65j3ooT7VZ/NCgZt+8rVxUGKrSy4Du3040UifI=;
        b=FJittVDrjQDwjGPSjhV3kCDdRHqIgpptbzV6g3gjCpsmvzFsqEaJ3zO6nB41s1M0L0
         tJcOT8GcmVsj/AszUBRhEcWtOaNl/dbfk9HkF2DyHI9RAeWrCjRwRaUCdoa7hhGvM1vv
         72KbNDGXRmtBhjdQ8OiyeBbuqU8aqsDnF/tlNAzriqnqEZkW/1XMCN/Le1GXiXQDOqx6
         pCwhHxP+zAUShrhmKvo9eqaVDsDLayvI04bPx7MpwK6CX/qAg9gwQDjHKtuLyUxKdc/E
         mMkviPSZcgVO0fdGO5JKBr8Qlvc83GkfKuIK2nolbbmQC7VP2OarsDOdW3N8LSMnDGxJ
         cLdA==
X-Gm-Message-State: AOJu0Yx+MfFjkyMKsFbvFXziFjD8zIrZShPIi8kAnXzby47pxPmrqwMV
	+hWfjYtvMMpM2T/sBjyucYhEU7gqdHt04XNDpiecFyabMwkhJfyfDoyrHjS/oNSVJBsOgXvb4/Y
	5dusFyL5uLVTEG9wsI1cNFaM5h5+30nODG2nW
X-Gm-Gg: AY/fxX6J8ZbLJh0U18Ih4J2F+8D6DNMNv2db76yNUXMPu7yGcZU1HzAPCrgkeMuzchZ
	be/4X8KQtRg1DpP8FxqyV2Dm9kTnIS2Y8TtBYLtd2SVulJwzcqSgYWhoQD7oEHL0CluH5DEDgfR
	yQXi/ND+ToE5bFt1c/z12z8h374bLrqUl2RYlW21Gi+au43sFW7kO26Rjgs/eRljoMFkSIdU/9z
	LtCCoEAlu0AfSKkA6d2TWCypHBo4HSP17kNMqWwjvSdF9zmV8NRNgajCG/BzLHlbcBloA==
X-Google-Smtp-Source: AGHT+IH24iOFBSjambKznHVZY2M+de/KMl1K5EhJ2KKMfp4p2cE+DHcFfkA2ssV65IE83UlSIgZbw+3+ulmy3NFZz34=
X-Received: by 2002:a2e:a547:0:b0:37b:b8c0:b5ea with SMTP id
 38308e7fff4ca-382ff6a5796mr81651fa.17.1767725621629; Tue, 06 Jan 2026
 10:53:41 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Jan 2026 13:53:41 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Jan 2026 13:53:41 -0500
From: Benjamin Philip <benjamin.philip495@gmail.com>
In-Reply-To: <2aabfc42-22e8-b09d-4da9-c6af8adfd1cf@linux.intel.com>
References: <CAMEXYWdoXFJM96gE=JLVtrP7YeAdWwO+NmDFqfsy_pk49PreYg@mail.gmail.com>
 <2aabfc42-22e8-b09d-4da9-c6af8adfd1cf@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 6 Jan 2026 13:53:41 -0500
X-Gm-Features: AQt7F2qbrZdJhSPQrqw_3YWdJdwCdFJJNIMz1CR9KjKmOo-Qu8bwlRxNQdrE9p8
Message-ID: <CAMEXYWeoxKDo2G3+kC=s_fBFmcEu-Timh8n1W+zapuEXFrxs1w@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: ideadpad-laptop: Clean up style warnings
 and checks
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> writes:

> On Tue, 23 Dec 2025, Benjamin Philip wrote:
>
>> This commit makes some style changes to clean up the following
>> checkpatch warnings and checks at various places in ideapad.c:
>>
>> - WARNING: quoted string split across lines
>> - WARNING: space prohibited between function name and open parenthesis '=
('
>> - WARNING: braces {} are not necessary for any arm of this statement
>> - CHECK: Alignment should match open parenthesis
>>
>> We exceed the 80 column limit to fix the quoted string warning since
>> strings in question are user visible. See coding style, part 2 for
>> details.
>>
>> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
>
> This patch has some formatting issue.
>
> --
>  i.
>

Sorry about that. Resent with formatting fixed.
Link: https://lore.kernel.org/platform-driver-x86/20260106184830.34426-1-be=
njamin.philip495@gmail.com/T/#u

-- bp

>> ---
>>  drivers/platform/x86/lenovo/ideapad-laptop.c | 39 ++++++++------------
>>  1 file changed, 16 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c
>> b/drivers/platform/x86/lenovo/ideapad-laptop.c
>> index 5171a077f62c..3d8a8b4f3e86 100644
>> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
>> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
>> @@ -219,38 +219,32 @@ MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for
>> bluetooth.");
>>  static bool allow_v4_dytc;
>>  module_param(allow_v4_dytc, bool, 0444);
>>  MODULE_PARM_DESC(allow_v4_dytc,
>> -	"Enable DYTC version 4 platform-profile support. "
>> -	"If you need this please report this to:
>> platform-driver-x86@vger.kernel.org");
>> +		 "Enable DYTC version 4 platform-profile support. If you need this
>> please report this to: platform-driver-x86@vger.kernel.org");
>>
>>  static bool hw_rfkill_switch;
>>  module_param(hw_rfkill_switch, bool, 0444);
>>  MODULE_PARM_DESC(hw_rfkill_switch,
>> -	"Enable rfkill support for laptops with a hw on/off wifi switch/slider=
. "
>> -	"If you need this please report this to:
>> platform-driver-x86@vger.kernel.org");
>> +		 "Enable rfkill support for laptops with a hw on/off wifi
>> switch/slider. If you need this please report this to:
>> platform-driver-x86@vger.kernel.org");
>>
>>  static bool set_fn_lock_led;
>>  module_param(set_fn_lock_led, bool, 0444);
>>  MODULE_PARM_DESC(set_fn_lock_led,
>> -	"Enable driver based updates of the fn-lock LED on fn-lock changes. "
>> -	"If you need this please report this to:
>> platform-driver-x86@vger.kernel.org");
>> +		 "Enable driver based updates of the fn-lock LED on fn-lock
>> changes. If you need this please report this to:
>> platform-driver-x86@vger.kernel.org");
>>
>>  static bool ctrl_ps2_aux_port;
>>  module_param(ctrl_ps2_aux_port, bool, 0444);
>>  MODULE_PARM_DESC(ctrl_ps2_aux_port,
>> -	"Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off t=
oggle. "
>> -	"If you need this please report this to:
>> platform-driver-x86@vger.kernel.org");
>> +		 "Enable driver based PS/2 aux port en-/dis-abling on touchpad
>> on/off toggle. If you need this please report this to:
>> platform-driver-x86@vger.kernel.org");
>>
>>  static bool touchpad_ctrl_via_ec;
>>  module_param(touchpad_ctrl_via_ec, bool, 0444);
>>  MODULE_PARM_DESC(touchpad_ctrl_via_ec,
>> -	"Enable registering a 'touchpad' sysfs-attribute which can be used
>> to manually "
>> -	"tell the EC to enable/disable the touchpad. This may not work on
>> all models.");
>> +		 "Enable registering a 'touchpad' sysfs-attribute which can be used
>> to manually tell the EC to enable/disable the touchpad. This may not
>> work on all models.");
>>
>>  static bool ymc_ec_trigger __read_mostly;
>>  module_param(ymc_ec_trigger, bool, 0444);
>>  MODULE_PARM_DESC(ymc_ec_trigger,
>> -	"Enable EC triggering work-around to force emitting tablet mode events=
. "
>> -	"If you need this please report this to:
>> platform-driver-x86@vger.kernel.org");
>> +		 "Enable EC triggering work-around to force emitting tablet mode
>> events. If you need this please report this to:
>> platform-driver-x86@vger.kernel.org");
>>
>>  /*
>>   * shared data
>> @@ -1446,7 +1440,7 @@ static void ideapad_check_special_buttons(struct
>> ideapad_private *priv)
>>  		if (read_ec_data(priv->adev->handle, VPCCMD_R_SPECIAL_BUTTONS, &value=
))
>>  			return;
>>
>> -	for_each_set_bit (bit, &value, 16) {
>> +	for_each_set_bit(bit, &value, 16) {
>>  		switch (bit) {
>>  		case 6:	/* Z570 */
>>  		case 0:	/* Z580 */
>> @@ -1706,11 +1700,10 @@ static int ideapad_kbd_bl_init(struct
>> ideapad_private *priv)
>>  	if (WARN_ON(priv->kbd_bl.initialized))
>>  		return -EEXIST;
>>
>> -	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type)) {
>> +	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type))
>>  		priv->kbd_bl.led.max_brightness =3D 2;
>> -	} else {
>> +	else
>>  		priv->kbd_bl.led.max_brightness =3D 1;
>> -	}
>>
>>  	brightness =3D ideapad_kbd_bl_brightness_get(priv);
>>  	if (brightness < 0)
>> @@ -1752,7 +1745,7 @@ static enum led_brightness
>> ideapad_fn_lock_led_cdev_get(struct led_classdev *led
>>  }
>>
>>  static int ideapad_fn_lock_led_cdev_set(struct led_classdev *led_cdev,
>> -	enum led_brightness brightness)
>> +					enum led_brightness brightness)
>>  {
>>  	struct ideapad_private *priv =3D container_of(led_cdev, struct
>> ideapad_private, fn_lock.led);
>>
>> @@ -1928,7 +1921,7 @@ static void ideapad_acpi_notify(acpi_handle
>> handle, u32 event, void *data)
>>
>>  	vpc1 =3D (vpc2 << 8) | vpc1;
>>
>> -	for_each_set_bit (bit, &vpc1, 16) {
>> +	for_each_set_bit(bit, &vpc1, 16) {
>>  		switch (bit) {
>>  		case 13:
>>  		case 11:
>> @@ -2142,14 +2135,14 @@ static const enum power_supply_property
>> ideapad_power_supply_props[] =3D {
>>  	}
>>
>>  DEFINE_IDEAPAD_POWER_SUPPLY_EXTENSION(ideapad_battery_ext_v1,
>> -	(BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
>> -	 BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
>> +				      (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
>> +				       BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
>>  );
>>
>>  DEFINE_IDEAPAD_POWER_SUPPLY_EXTENSION(ideapad_battery_ext_v2,
>> -	(BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
>> -	 BIT(POWER_SUPPLY_CHARGE_TYPE_FAST) |
>> -	 BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
>> +				      (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
>> +				       BIT(POWER_SUPPLY_CHARGE_TYPE_FAST) |
>> +				       BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
>>  );
>>
>>  static int ideapad_battery_add(struct power_supply *battery, struct
>> acpi_battery_hook *hook)
>>
