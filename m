Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CC31BBBE5;
	Tue,  6 Jan 2026 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767689747; cv=none; b=E5lX2IHDT/LZFfVjs1GCmsX2k97GzctlxKTO/PHQIRk+uqDpYneUjzYLy/MYiK8yX3RVa+FHi6R/EuEBaobd06Tcn9LoNiJ3c4n550fPzv3/n80G5fsSY911daHBKzYNAX9FaEcewXUohCfa7Z67hHJXyPnSszukkF6AuEq11dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767689747; c=relaxed/simple;
	bh=dZYBQxX1h0yvmkH6tQrG4Hb2eAEoskzZ/lW0f4iGBXo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DcpswqxaYclqWyIABnNaJT3jix2K7bOmMNJarz+uHvWws1vziZ/jM6bIa5d7HzPgc5SV29DHBapE4jL47t51/xVezl83I4odxxB6w7+PKIPAT2PVdy2Sv5kp9pAphMqDPAhRTNVIzZaFO0EuLfzkDSY3sYZBxmgggnJmxdARTp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btf0gggS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btf0gggS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767689745; x=1799225745;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=dZYBQxX1h0yvmkH6tQrG4Hb2eAEoskzZ/lW0f4iGBXo=;
  b=btf0gggSAMMUL+E4Bl7qUHAZ8Rp1C5wVDid9nRRERgmH0XlFTJDlyJC3
   mZAGvOKpAnzJ+yBA1iBQnwkvMZrQ7YJXtRWUCS7MJ5vTkiV35Xc32ouLB
   FjpPwaUfKwrwKLIsJgPkW3c5RMcS0CT2oXqlT8k2n8EQobyilvZwXwxIk
   Mr8EptCVMSvzB4WLn1K8S0Jw8Cw4BGVyRiCdulOHRwqwb7tTPY5VTKxfD
   xFaXdmb0WIwJaAfLvgJykFb8W9NM80T7YdimhLAItoGJ5RwMJNBqY4j0m
   Fs4oY4+NT8rRSN2NuHkMh4PVSjBK0ogCU1x6vfY5JI1jIyBlmreclDzz0
   Q==;
X-CSE-ConnectionGUID: vVyYS01aQiidoOPACWhM9w==
X-CSE-MsgGUID: 6TRmaAeXQeOOE4jTm+Weaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69214988"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="69214988"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 00:55:44 -0800
X-CSE-ConnectionGUID: zV/L/O9PSNqVGe6BvsvJug==
X-CSE-MsgGUID: cBBedc/+QdmtLu9Qoii/Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202380027"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.6])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 00:55:42 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 6 Jan 2026 10:55:38 +0200 (EET)
To: Benjamin Philip <benjamin.philip495@gmail.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH] platform/x86: ideadpad-laptop: Clean up style warnings
 and checks
In-Reply-To: <CAMEXYWdoXFJM96gE=JLVtrP7YeAdWwO+NmDFqfsy_pk49PreYg@mail.gmail.com>
Message-ID: <2aabfc42-22e8-b09d-4da9-c6af8adfd1cf@linux.intel.com>
References: <CAMEXYWdoXFJM96gE=JLVtrP7YeAdWwO+NmDFqfsy_pk49PreYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Dec 2025, Benjamin Philip wrote:

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

This patch has some formatting issue.

--
 i.

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
> 
