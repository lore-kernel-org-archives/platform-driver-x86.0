Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650504;
	b=2DH8WKoireW64HnCZweL36asyaeQYs3+mFJYaTBAqhF2Y+aHi0Eh42WchGbfCV1KXBv8
	 fEoTmu466lHHUZrtlmIl9+PfuXwPN3WA/xdtkqjZZDKYg+d0O+OC3qKJk/6tjRWtFRVPM
	 vrIURFuLBWwSpJlGjkJ1eBWYXvEDW2CX+u0dqxaJimj5GTf4IFZytvkMYxBYqLnUStZMM
	 qlPIa2SeyOLxhoccmPP5+78NdETfOnFU0dKjdHALMRTlcGcZI/t+Q+e7nZ7Ivurypn5X3
	 rUjw2PYh+XC46zgutkX7tyzXKuaZf16KksZW6YAbuSKDP4J2OGUOPYyEx1yudfz70Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650504;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=X/BeevJhjolof3a2O3a4HVWlBUmiKVEngpJHAkO5PNs=;
	b=dPh09pIFttASAjp7+wkDaISVtNNwbZowxSQGyOM0Xzq/XxcSSlSmrFVx8lw9py8wmEp2
	 qp8qojmugJANUk0XpUmlk1C9qSedpDlQTjlneD4hrRs5XwvbkeDJzd0zlg7ASsO82QTzz
	 qXc4ewQvWbu2uyz9XZdiLczETTvwh3qJ80b5LlA+p53taaS+V+FV2AIU9vOdnFDaF54Wb
	 E7zhg4rLSe+fp/zY7HI8KTBnKhUzP5wOt5BP365lywzg3ZWub20fEKcjvLiKp8SkNV4Hf
	 ls5r8gj4wLhKWqKHDr72YY1XaeX5pK9n9Y2oPaObwQJxFp/uKWRBLyuOFyyZ+oT9hiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MXdEIpMz;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F72606A323;
	Wed, 25 Nov 2026 23:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F72606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MXdEIpMz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795650503; x=1827186503;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ewYgoTbraLOz5GRovRSL4dgSfrZpvTywlMkiihDBUiA=;
  b=MXdEIpMzzn1DNBVbCP0683/pJZxfYQ+H1kF5VyZmnGF4HiNe7N13Hky+
   vj2L0XXwjsFzqoQA5qkCB/sNF/nN//pNVWjJCAZPS9ydUzJHTlFpDeVrr
   ySxuqnLurgQWC+OkqBfDqkDDR2YYwzUNQkdWF268KZw5QDUf9sFpqE+j8
   C9H6/kHcC/T4L+hxLZR9Rg4glBAS4fEoU9UxDr1OrFHoFIBlDzNwLm5Je
   LhLnfp6eZRsUvsMP5sPlyiG+0E+M1QawOv2sLu9GbDpMkqvPLAE8ARPSn
   +aCMCtclP9EBZSXNp8rHH8QAV9YAD7rJAjt8KpKmqNCzVlbGRn+Xo0JTh
   g==;
X-CSE-ConnectionGUID: 7zU7hr2KSpCpH5z+xlcFxQ==
X-CSE-MsgGUID: v+DXCffJTX6JlMrvPa/Sfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4559605"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4559605"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:48:22 -0800
X-CSE-ConnectionGUID: XkRN+zofTQS2kW5tR/MTyQ==
X-CSE-MsgGUID: 0vc++PyTQuSrPcMduahGqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12292274"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.96])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:48:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 26 Nov 2026 01:48:15 +0200 (EET)
To: Sercan GOKMEN <gokmensercan@gmail.com>
cc: Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
    Hans de Goede <hansg@kernel.org>, Moad Tarrih <tarrihmoad@proton.me>, 
    Burak Goncu <burakgon12@gmail.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] platform/asus: asus-wmi: Skip keyboard backlight
 read-back on B9406CAA
In-Reply-To: <20261123-b4-asus-wmi-b9406caa-kbd-readback-v3-1-1e6875af3703@gmail.com>
Message-ID: <f5b550c4-e20a-c1e8-5f9a-0fabe0e2803f@linux.intel.com>
References: <20261123-b4-asus-wmi-b9406caa-kbd-readback-v3-1-1e6875af3703@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Nov 2026, Sercan GOKMEN wrote:

> On the ASUS ExpertBook Ultra B9406CAA (BIOS 312), DSTS(0x00050021)
> always returns 0x550000: the presence bit is set and the level is 0,
> whatever level the EC is driving. The DSDT builds this reply from
> constants and never reads the EC. Writes work.
> 
> kbd_led_get() stores every read in asus->kbd_led_wk, so each sysfs read
> resets the cached level to 0. sysfs, UPower and brightnessctl then
> report 0, systemd-backlight restores a dark keyboard at boot, and the
> next Fn backlight key press always gives level 1.
> 
> Add a kbd_led_no_readback quirk that makes kbd_led_get() return the
> cached level, as the !kbd_led_avail path already does, and set it for
> this board. Every path that changes the level keeps kbd_led_wk current.
> Until the first write after probe, the driver still reports the 0 it
> read at probe time.
> 
> Signed-off-by: Sercan GOKMEN <gokmensercan@gmail.com>
> ---
> Tested on the B9406CAA (BIOS 312) on Linux 7.2.3: brightness reads back
> the level written to it, UPower reports the same value, and the Fn
> backlight key steps 2 -> 3 -> 0 -> 1 from level 2. On 7.3.0 and 7.3.5,
> with the same change built as a DKMS module, writes of 3/1/0/2 read back
> unchanged.
> Build-tested on review-ilpo-next (2268d837dea1) with W=1 (clang).
> 
> This conflicts trivially with Moad Tarrih's G814FP patch, which adds a
> quirk_entry field and a DMI entry at the same places:
> https://lore.kernel.org/r/20261116-asus-wmi-kbd-readback-v5-1-f2f170836bf4@proton.me
> Applied after it, only asus-nb-wmi.c needs the two entries merged.

Hi,

I applied to other patch to the review-ilpo-next branch (will eventually 
propagate into for-next once LKP's build test given green light).

The naming seems different, so can you please do v4 on top of the 
review-ilpo-next branch.

--
 i.

> The patch was prepared with the help of an AI coding assistant (Claude
> Code). I reviewed it and tested it on the hardware.
> ---
> Changes in v3:
> - Rebase onto review-ilpo-next, after the move to drivers/platform/asus/,
>   and use the platform/asus prefix.
> - Trim the commit message.
> - Drop the comment on the quirk_entry field and shorten the one on the
>   quirk.
> - Link to v2: https://patch.msgid.link/20261030-b4-asus-wmi-b9406caa-kbd-readback-v2-1-ca93bb9039f6@gmail.com
> 
> Changes in v2:
> - Shorten the subject (Burak Goncu).
> - Say that kbd_led_wk keeps the 0 read at probe until the first write
>   (Burak Goncu).
> - Move the test details below the cut (Burak Goncu).
> - Rebase on current for-next.
> - Link to v1: https://patch.msgid.link/20261022-b4-asus-wmi-b9406caa-kbd-readback-v1-1-fb33ed98dd16@gmail.com
> ---
>  drivers/platform/asus/asus-nb-wmi.c | 15 +++++++++++++++
>  drivers/platform/asus/asus-wmi.c    |  3 ++-
>  drivers/platform/asus/asus-wmi.h    |  1 +
>  3 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/asus/asus-nb-wmi.c b/drivers/platform/asus/asus-nb-wmi.c
> index 3b0f3346dc..420fdced34 100644
> --- a/drivers/platform/asus/asus-nb-wmi.c
> +++ b/drivers/platform/asus/asus-nb-wmi.c
> @@ -93,6 +93,12 @@ static struct quirk_entry quirk_asus_unknown = {
>  	.wmi_backlight_set_devstate = true,
>  };
>  
> +/* B9406CAA: DSTS(0x00050021) always reports level 0 */
> +static struct quirk_entry quirk_asus_b9406caa = {
> +	.wmi_backlight_set_devstate = true,
> +	.kbd_led_no_readback = true,
> +};
> +
>  static struct quirk_entry quirk_asus_q500a = {
>  	.filter_i8042_e1_extended_codes = true,
>  	.wmi_backlight_set_devstate = true,
> @@ -167,6 +173,15 @@ static int dmi_matched(const struct dmi_system_id *dmi)
>  }
>  
>  static const struct dmi_system_id asus_quirks[] = {
> +	{
> +		.callback = dmi_matched,
> +		.ident = "ASUS ExpertBook Ultra B9406CAA",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
> +			DMI_MATCH(DMI_BOARD_NAME, "B9406CAA"),
> +		},
> +		.driver_data = &quirk_asus_b9406caa,
> +	},
>  	{
>  		.callback = dmi_matched,
>  		.ident = "ASUSTeK COMPUTER INC. Q500A",
> diff --git a/drivers/platform/asus/asus-wmi.c b/drivers/platform/asus/asus-wmi.c
> index b33ebdb21a..725f827a17 100644
> --- a/drivers/platform/asus/asus-wmi.c
> +++ b/drivers/platform/asus/asus-wmi.c
> @@ -1975,7 +1975,8 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
>  	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
>  
>  	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> -		if (!asus->kbd_led_avail)
> +		if (!asus->kbd_led_avail ||
> +		    asus->driver->quirks->kbd_led_no_readback)
>  			return asus->kbd_led_wk;
>  	}
>  
> diff --git a/drivers/platform/asus/asus-wmi.h b/drivers/platform/asus/asus-wmi.h
> index b45f81b38a..72a43586ff 100644
> --- a/drivers/platform/asus/asus-wmi.h
> +++ b/drivers/platform/asus/asus-wmi.h
> @@ -52,6 +52,7 @@ struct quirk_entry {
>  	 */
>  	int no_display_toggle;
>  	u32 xusb2pr;
> +	bool kbd_led_no_readback;
>  };
>  
>  struct asus_wmi_driver {
> 
> ---
> base-commit: 2268d837dea13a78639fa3dad60472bb67478709
> change-id: 20261022-b4-asus-wmi-b9406caa-kbd-readback-aed82953d839
> 
> Best regards,
> --  
> Sercan GOKMEN <gokmensercan@gmail.com>
> 

