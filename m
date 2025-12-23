Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B242AE90;
	Tue, 23 Dec 2025 15:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766502518; cv=none; b=soT9oTkWhos+S7cXLeTohCz9nBrISh6JXrHbNCkxKUq1RuGUN/O3S7BotXAUAUq7pHvyg2bJgfqqCWKeiFCX9VCrXC+1wlD+VpZa5r1v/SbTbpAuXqnVI5kZXo4d5jGi0oJJK8IBFlhFtOLBW3fLK3NuIbG0tcqlZHnaOhtg7cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766502518; c=relaxed/simple;
	bh=MAfcwTd8hOO9wZX+I47OZtxwlLQhHc0lxB02Bc2qDns=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JZCy61VCmFLYT6mzchVmXPed86olQeMXrMGpmZVqEO4IudcKjzFNmysCHwj25X81ScvQivrsMwA4qPOGZhmju0R3P7YfwVdqksEA2PgR1DC9M3d25RH88BdMbug/nrCtZNzN/ZlS0Lm/8amspKuiqTQ/iUWW5iMIXAZA/BL98EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=MBpg79xS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cnDJ5UAZ; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="MBpg79xS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cnDJ5UAZ"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 99F8EEC00EF;
	Tue, 23 Dec 2025 10:08:35 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 23 Dec 2025 10:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1766502515;
	 x=1766588915; bh=T0SGmikv7Gm6Gz5I4EbC5ycjPLfup7H4kau2DcEbjNs=; b=
	MBpg79xSxnh0xyxizQWkw1VwvG8UKZj/rwv0dJeO3koNXo+aCepSqQl/4ROglLdy
	dg2Se7uO1QJnPNY0TEpacgGzEkL+rec5vGmi4SHFcQId95175iZx0Uhp7WGV68kD
	Yx6N1ZxOEtLBdg5GuoUMmnomvxsOdbihRb+xkJsiE1U1HUxZXTeSkp85DJT9W7tM
	bUiQv/tyWxyIUM/OAFgIU2Da+ekijDKsKft2fawBoi5okQVNvAX7JTS9VjuIADyo
	40vhX3AyAn3ANn6tT3FpxV3yToujqnYX+wYcmCljWNv7oxwpKcI2COsHPv70w2Jc
	UEngWQ4N3TAfGBk6KB+vng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766502515; x=
	1766588915; bh=T0SGmikv7Gm6Gz5I4EbC5ycjPLfup7H4kau2DcEbjNs=; b=c
	nDJ5UAZJ86Y962dINv4KVUiEQeuLo6AWs6W3MhRt+GW4ij1KHHOVo0NOluVIEOB0
	efAB6q5UjGmuogX5+EK6m/9YqEnQTXcmCM4err9g6HTVo6CRjMA6mURSWsj0xVTO
	FObxiAB4ukNvvhIDbRPIVOIbQKUJOh0TZ/xBbQwj08Z8au5Kyb9g+ICmTewTvA2d
	0D88N/7HdDAycRtK6fuKYrz61Wld4YLTNb4abpw2cjES9pPxVIu5SSwGrmtLDPpW
	pTRaVDUc+SVZ54lh/kcBUI2xcfCI4nR7npGg//zGG/+aNYo+N4Dr4KLSDwSQmcja
	Gir3eCEg0HMQL2oKFvQZw==
X-ME-Sender: <xms:c7BKaa6Ye1KDjFCl2OEJGW5ipOoxUO-CGtJSOCWyEQxsvXSdx1wV1A>
    <xme:c7BKaespw6n189DTgjHsvbGYsb8WFrGB5YVJnjaGQq80qnHmZLhVCQpKKGZSsWR2_
    RG5jvU7jbY-jyZeP0RIZjVQNwT3HxfRznmjU5hS9xmRdiaJ9onLTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhephfeuvdehteeghedthedtveehuddvjeejgffgieejvdeg
    kefhfeelheekhedvffehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgs
    pghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsggvnhhjrg
    hmihhnrdhphhhilhhiphegleehsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvrhgv
    khhjohhhnhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehikhgvphgrnh
    hhtgesghhmrghilhdrtghomhdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:c7BKaf-6aUxWSgD931Ss1cSGDIEnUVmLYvHRuEQeZBXkrJnMd87ChA>
    <xmx:c7BKaayzgpow7XuOPmSFoD_gtOoDPBOutfBwxPIvhg8CjCDFQeEQ1g>
    <xmx:c7BKaTPGL5Um3SPOrmce4cIvenlfkIcjxQFZTLgqdVIVYDZK70wl1A>
    <xmx:c7BKaX9TVtcICoasBH504nHfwKOKkaH13uJ4NwaJngDv8k3OSDcoxw>
    <xmx:c7BKafsfwb_W2Pfm83QoJQ76I2wkFVXdusoVdSD4VnhrPg3fNeuTncVg>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6201A2CE0072; Tue, 23 Dec 2025 10:08:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AosJPcsONopF
Date: Tue, 23 Dec 2025 10:08:14 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Benjamin Philip" <benjamin.philip495@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Ike Panhc" <ikepanhc@gmail.com>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Message-Id: <7028f20c-ca30-40f0-8b88-54e34e9d9554@app.fastmail.com>
In-Reply-To: 
 <CAMEXYWdoXFJM96gE=JLVtrP7YeAdWwO+NmDFqfsy_pk49PreYg@mail.gmail.com>
References: 
 <CAMEXYWdoXFJM96gE=JLVtrP7YeAdWwO+NmDFqfsy_pk49PreYg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: ideadpad-laptop: Clean up style warnings and checks
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Dec 23, 2025, at 7:45 AM, Benjamin Philip wrote:
> This commit makes some style changes to clean up the following
> checkpatch warnings and checks at various places in ideapad.c:
>
> - WARNING: quoted string split across lines
> - WARNING: space prohibited between function name and open parenthesis '('
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
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c
> b/drivers/platform/x86/lenovo/ideapad-laptop.c
> index 5171a077f62c..3d8a8b4f3e86 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -219,38 +219,32 @@ MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for
> bluetooth.");
>  static bool allow_v4_dytc;
>  module_param(allow_v4_dytc, bool, 0444);
>  MODULE_PARM_DESC(allow_v4_dytc,
> -	"Enable DYTC version 4 platform-profile support. "
> -	"If you need this please report this to:
> platform-driver-x86@vger.kernel.org");
> +		 "Enable DYTC version 4 platform-profile support. If you need this
> please report this to: platform-driver-x86@vger.kernel.org");
>
>  static bool hw_rfkill_switch;
>  module_param(hw_rfkill_switch, bool, 0444);
>  MODULE_PARM_DESC(hw_rfkill_switch,
> -	"Enable rfkill support for laptops with a hw on/off wifi switch/slider. "
> -	"If you need this please report this to:
> platform-driver-x86@vger.kernel.org");
> +		 "Enable rfkill support for laptops with a hw on/off wifi
> switch/slider. If you need this please report this to:
> platform-driver-x86@vger.kernel.org");
>
>  static bool set_fn_lock_led;
>  module_param(set_fn_lock_led, bool, 0444);
>  MODULE_PARM_DESC(set_fn_lock_led,
> -	"Enable driver based updates of the fn-lock LED on fn-lock changes. "
> -	"If you need this please report this to:
> platform-driver-x86@vger.kernel.org");
> +		 "Enable driver based updates of the fn-lock LED on fn-lock
> changes. If you need this please report this to:
> platform-driver-x86@vger.kernel.org");
>
>  static bool ctrl_ps2_aux_port;
>  module_param(ctrl_ps2_aux_port, bool, 0444);
>  MODULE_PARM_DESC(ctrl_ps2_aux_port,
> -	"Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. "
> -	"If you need this please report this to:
> platform-driver-x86@vger.kernel.org");
> +		 "Enable driver based PS/2 aux port en-/dis-abling on touchpad
> on/off toggle. If you need this please report this to:
> platform-driver-x86@vger.kernel.org");
>
>  static bool touchpad_ctrl_via_ec;
>  module_param(touchpad_ctrl_via_ec, bool, 0444);
>  MODULE_PARM_DESC(touchpad_ctrl_via_ec,
> -	"Enable registering a 'touchpad' sysfs-attribute which can be used
> to manually "
> -	"tell the EC to enable/disable the touchpad. This may not work on
> all models.");
> +		 "Enable registering a 'touchpad' sysfs-attribute which can be used
> to manually tell the EC to enable/disable the touchpad. This may not
> work on all models.");
>
>  static bool ymc_ec_trigger __read_mostly;
>  module_param(ymc_ec_trigger, bool, 0444);
>  MODULE_PARM_DESC(ymc_ec_trigger,
> -	"Enable EC triggering work-around to force emitting tablet mode events. "
> -	"If you need this please report this to:
> platform-driver-x86@vger.kernel.org");
> +		 "Enable EC triggering work-around to force emitting tablet mode
> events. If you need this please report this to:
> platform-driver-x86@vger.kernel.org");
>
>  /*
>   * shared data
> @@ -1446,7 +1440,7 @@ static void ideapad_check_special_buttons(struct
> ideapad_private *priv)
>  		if (read_ec_data(priv->adev->handle, VPCCMD_R_SPECIAL_BUTTONS, &value))
>  			return;
>
> -	for_each_set_bit (bit, &value, 16) {
> +	for_each_set_bit(bit, &value, 16) {
>  		switch (bit) {
>  		case 6:	/* Z570 */
>  		case 0:	/* Z580 */
> @@ -1706,11 +1700,10 @@ static int ideapad_kbd_bl_init(struct
> ideapad_private *priv)
>  	if (WARN_ON(priv->kbd_bl.initialized))
>  		return -EEXIST;
>
> -	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type)) {
> +	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type))
>  		priv->kbd_bl.led.max_brightness = 2;
> -	} else {
> +	else
>  		priv->kbd_bl.led.max_brightness = 1;
> -	}
>
>  	brightness = ideapad_kbd_bl_brightness_get(priv);
>  	if (brightness < 0)
> @@ -1752,7 +1745,7 @@ static enum led_brightness
> ideapad_fn_lock_led_cdev_get(struct led_classdev *led
>  }
>
>  static int ideapad_fn_lock_led_cdev_set(struct led_classdev *led_cdev,
> -	enum led_brightness brightness)
> +					enum led_brightness brightness)
>  {
>  	struct ideapad_private *priv = container_of(led_cdev, struct
> ideapad_private, fn_lock.led);
>
> @@ -1928,7 +1921,7 @@ static void ideapad_acpi_notify(acpi_handle
> handle, u32 event, void *data)
>
>  	vpc1 = (vpc2 << 8) | vpc1;
>
> -	for_each_set_bit (bit, &vpc1, 16) {
> +	for_each_set_bit(bit, &vpc1, 16) {
>  		switch (bit) {
>  		case 13:
>  		case 11:
> @@ -2142,14 +2135,14 @@ static const enum power_supply_property
> ideapad_power_supply_props[] = {
>  	}
>
>  DEFINE_IDEAPAD_POWER_SUPPLY_EXTENSION(ideapad_battery_ext_v1,
> -	(BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> -	 BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
> +				      (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> +				       BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
>  );
>
>  DEFINE_IDEAPAD_POWER_SUPPLY_EXTENSION(ideapad_battery_ext_v2,
> -	(BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> -	 BIT(POWER_SUPPLY_CHARGE_TYPE_FAST) |
> -	 BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
> +				      (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> +				       BIT(POWER_SUPPLY_CHARGE_TYPE_FAST) |
> +				       BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
>  );
>
>  static int ideapad_battery_add(struct power_supply *battery, struct
> acpi_battery_hook *hook)
> -- 
> 2.52.0

Looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
