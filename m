Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E7522371F;
	Thu, 19 Dec 2024 11:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734608471; cv=none; b=tKdgjbejUZp1U2PpxUd2t9ypKBw/Ly0uKG4SgtKw6IYLuYPCaK8sHngDnhxYI19XUjqmu7vGapSwZIF3+uB6nPscKDerpMeAg2CJVM+sXn69nbDif2kVEsgCB/CPeoz8q7bUxqaY+zdGmAXCr6O5D54gdHGl5FRWwipvRiqoo4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734608471; c=relaxed/simple;
	bh=4EQKjKQpUY7lOa25SkttIVR4BJjuUCQm/CDIAjhtxGA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=C7mAMRWezXsovj0IOX7JWDePqUlHReTPQ+tNRr6yCm6SezqKzPhMlhDVXN7k6becqWXhqXHwsOhMINLrokyPK4Enmv3hC+rB79qXFTOXIBUViaL4Kj5ehKrmQ9GK2FJw4CwpcTBj51VmSG+7qvWFYuib+M7VrQU9fzzmieCHh+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G094h8jJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G094h8jJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734608467; x=1766144467;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4EQKjKQpUY7lOa25SkttIVR4BJjuUCQm/CDIAjhtxGA=;
  b=G094h8jJGcUyD46qrecLi2BF4xIVMxRahRIyYJBC3PwsiYqvWpi5S15a
   tgvS5SaSymYEMb5L3Q9w9BsX2AAfURxSU1kt1V7TRG8fNj7+rwauF0FBt
   ICN2oeYfwhrMJshixLOmkA7X9OWKfp/EqPPyoLbm6IrutoKzLImNJ172L
   yRDcDroDXC32WG+mFrqXGIkqLiq8sQGItf9CsKP2XwTQIOhMi2kSmisa0
   9DVA53FKoA0Ym7U3YigAzNjymdfevKOsQRnuj6rAnJhauNjIoBtqGyDO3
   ngJVgUV8LPV02DMvn/jqh2I760e5Re0Q27ZtH3EZkl5J+DnDbNUOkDpiZ
   Q==;
X-CSE-ConnectionGUID: 9jt8JlalRES37C57+3y5og==
X-CSE-MsgGUID: qoQsXkDDQwaJtsOBM5XaSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46533409"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="46533409"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 03:41:05 -0800
X-CSE-ConnectionGUID: L7zNVtpKTOG1K7xJ/wacXA==
X-CSE-MsgGUID: IPHd22k1QUKAS1i+qDjE/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="103245377"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 03:40:59 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 19 Dec 2024 13:40:56 +0200 (EET)
To: Jackie Dong <xy-jackie@139.com>
cc: ike.pan@canonical.com, Hans de Goede <hdegoede@redhat.com>, perex@perex.cz, 
    tiwai@suse.com, bo.liu@senarytech.com, kovalev@altlinux.org, 
    me@oldherl.one, jaroslaw.janik@gmail.com, cs@tuxedo.de, 
    songxiebing@kylinos.cn, kailang@realtek.com, 
    sbinding@opensource.cirrus.com, simont@opensource.cirrus.com, 
    josh@joshuagrisham.com, rf@opensource.cirrus.com, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    linux-sound@vger.kernel.org, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    waterflowdeg@gmail.com, Jackie Dong <dongeg1@lenovo.com>
Subject: Re: [PATCH 1/2] platform/x86: ideapad-laptop: Support for mic and
 audio leds.
In-Reply-To: <20241219101531.35896-1-xy-jackie@139.com>
Message-ID: <c3ec76f3-e612-07d4-d876-d1d65dc2897f@linux.intel.com>
References: <20241219101531.35896-1-xy-jackie@139.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Dec 2024, Jackie Dong wrote:

> Implement Lenovo utility data WMI calls needed to make LEDs
> work on Ideapads that support this GUID.
> This enables the mic and audio LEDs to be updated correctly.
> 
> Tested on below samples.
> ThinkBook 13X Gen4 IMH
> ThinkBook 14 G6 ABP
> ThinkBook 16p Gen4-21J8
> ThinkBook 16p Gen8-IRL
> ThinkBook 16p G7+ ASP
> 
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Jackie Dong <xy-jackie@139.com>
> Signed-off-by: Jackie Dong <dongeg1@lenovo.com>

One signed off is enough from you. :-) Please use the one matching to 
From: address.

If you want mails automatically to some other address too, you can always 
add a Cc: tag so the git send-email and various other tools will included 
that email address too.

> ---
>  drivers/platform/x86/ideapad-laptop.c | 157 +++++++++++++++++++++++++-
>  1 file changed, 156 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index c64dfc56651d..acea4aa8eac3 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -32,6 +32,7 @@
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
>  #include <linux/wmi.h>
> +#include <sound/control.h>
>  #include "ideapad-laptop.h"
>  
>  #include <acpi/video.h>
> @@ -1298,6 +1299,15 @@ static const struct key_entry ideapad_keymap[] = {
>  	{ KE_END },
>  };
>  
> +/*
> + * Input parameters to mute/unmute audio LED and Mic LED
> + */

Fits to one line.

> +struct wmi_led_args {
> +	u8 ID;
> +	u8 SubID;
> +	u16 Value;

Use only lowercase in variable names.

> +};
> +
>  static int ideapad_input_init(struct ideapad_private *priv)
>  {
>  	struct input_dev *inputdev;
> @@ -2023,15 +2033,145 @@ static void ideapad_check_features(struct ideapad_private *priv)
>  /*
>   * WMI driver
>   */
> +#define IDEAPAD_ACPI_LED_MAX  (((SNDRV_CTL_ELEM_ACCESS_MIC_LED -\
> +		SNDRV_CTL_ELEM_ACCESS_SPK_LED) >> SNDRV_CTL_ELEM_ACCESS_LED_SHIFT) + 1)

Hmm, so you fix the math bug (2-1 is not 2 but 1) with that +1 in the end?

I think you would want something like this here (but I'm not entirely 
sure at this point of reading your change):

FIELD_GET(SNDRV_CTL_ELEM_ACCESS_MIC_LED, SNDRV_CTL_ELEM_ACCESS_MIC_LED)

(Remember to make sure you've include for FIELD_GET if that's the correct 
way to go here).

> +
>  enum ideapad_wmi_event_type {
>  	IDEAPAD_WMI_EVENT_ESC,
>  	IDEAPAD_WMI_EVENT_FN_KEYS,
> +	IDEAPAD_WMI_EVENT_LUD_KEYS,
>  };
>  
> +#define WMI_LUD_GET_SUPPORT 1
> +#define WMI_LUD_SET_FEATURE 2
> +
> +#define WMI_LUD_GET_MICMUTE_LED_VER   20
> +#define WMI_LUD_GET_AUDIOMUTE_LED_VER 26
> +
> +#define WMI_LUD_SUPPORT_MICMUTE_LED_VER   25
> +#define WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER 27
> +
>  struct ideapad_wmi_private {
>  	enum ideapad_wmi_event_type event;
> +	struct led_classdev cdev[IDEAPAD_ACPI_LED_MAX];
>  };
>  
> +static struct wmi_device *led_wdev;
> +
> +enum mute_led_type {
> +	MIC_MUTE,
> +	AUDIO_MUTE,
> +};
> +
> +static int ideapad_wmi_mute_led_set(enum mute_led_type led_type, struct led_classdev *led_cdev,
> +				    enum led_brightness brightness)
> +
> +{
> +	struct wmi_led_args led_arg = {0, 0, 0};
> +	struct acpi_buffer input;
> +	acpi_status status;
> +
> +	if (led_type == MIC_MUTE)
> +		led_arg.ID = brightness == LED_ON ? 1 : 2;
> +	else if (led_type == AUDIO_MUTE)
> +		led_arg.ID = brightness == LED_ON ? 4 : 5;

Use named defines instead of literals.

> +	else
> +		return -EINVAL;
> +
> +	input.length = sizeof(struct wmi_led_args);
> +	input.pointer = &led_arg;
> +	status = wmidev_evaluate_method(led_wdev, 0, WMI_LUD_SET_FEATURE, &input, NULL);
> +
> +	if (ACPI_FAILURE(status))

Don't leave empty line between call and its error handling.

> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int ideapad_wmi_audiomute_led_set(struct led_classdev *led_cdev,
> +					 enum led_brightness brightness)
> +
> +{
> +	return ideapad_wmi_mute_led_set(AUDIO_MUTE, led_cdev, brightness);
> +}
> +
> +static int ideapad_wmi_micmute_led_set(struct led_classdev *led_cdev,
> +				       enum led_brightness brightness)
> +{
> +	return ideapad_wmi_mute_led_set(MIC_MUTE, led_cdev, brightness);
> +}
> +
> +static int ideapad_wmi_leds_init(enum mute_led_type led_type, struct device *dev)

This seems to init only a single LED at a time but the function name says 
"leds" which is plural.

> +{
> +	struct ideapad_wmi_private *wpriv = dev_get_drvdata(dev);
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer input;
> +	union acpi_object *obj;
> +	int led_version, err = 0;
> +	unsigned int wmiarg;
> +	acpi_status status;
> +
> +	if (led_type == MIC_MUTE)
> +		wmiarg = WMI_LUD_GET_MICMUTE_LED_VER;
> +	else if (led_type == AUDIO_MUTE)
> +		wmiarg = WMI_LUD_GET_AUDIOMUTE_LED_VER;
> +	else
> +		return -EINVAL;

Use switch/case/default

> +
> +	input.length = sizeof(wmiarg);
> +	input.pointer = &wmiarg;
> +	status = wmidev_evaluate_method(led_wdev, 0, WMI_LUD_GET_SUPPORT, &input, &output);
> +	if (ACPI_FAILURE(status)) {
> +		kfree(output.pointer);

Is this kfree() correct thing to do in case of error??

> +		return -EIO;
> +	}
> +	obj = output.pointer;
> +	led_version = obj->integer.value;
> +
> +	wpriv->cdev[led_type].max_brightness = LED_ON;
> +	wpriv->cdev[led_type].dev = dev;
> +	wpriv->cdev[led_type].flags = LED_CORE_SUSPENDRESUME;
> +
> +	if (led_type == MIC_MUTE) {

These blocks too should use switch.

> +		if (led_version != WMI_LUD_SUPPORT_MICMUTE_LED_VER) {
> +			dev_info(dev, "This product doesn't support mic mute LED.\n");

If this is expected to trigger on some HW, it seems nuisance noise in the 
log for such machine.

Do you have a memleak here?

> +			return -EIO;
> +		}
> +		wpriv->cdev[led_type].name = "platform::micmute";
> +		wpriv->cdev[led_type].brightness_set_blocking =	&ideapad_wmi_micmute_led_set;
> +		wpriv->cdev[led_type].default_trigger = "audio-micmute";
> +
> +		err = devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
> +		if (err < 0) {
> +			dev_err(dev, "Could not register mic mute LED : %d\n", err);
> +			led_classdev_unregister(&wpriv->cdev[led_type]);

This unregister could be put to a rollback path and you goto there. That 
way, both leds can share the unregister call.

> +		}
> +	} else {
> +		if (led_version != WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER) {
> +			dev_info(dev, "This product doesn't support audio mute LED.\n");

Same here.

> +			return -EIO;
> +		}
> +		wpriv->cdev[led_type].name = "platform::mute";
> +		wpriv->cdev[led_type].brightness_set_blocking =	&ideapad_wmi_audiomute_led_set;
> +		wpriv->cdev[led_type].default_trigger = "audio-mute";
> +
> +		err = devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
> +		if (err < 0) {
> +			dev_err(dev, "Could not register audio mute LED: %d\n", err);
> +			led_classdev_unregister(&wpriv->cdev[led_type]);
> +		}
> +	}
> +
> +	kfree(obj);
> +	return err;
> +}
> +
> +static void ideapad_wmi_leds_setup(struct device *dev)
> +{
> +	ideapad_wmi_leds_init(MIC_MUTE, dev);
> +	ideapad_wmi_leds_init(AUDIO_MUTE, dev);
> +}
> +
>  static int ideapad_wmi_probe(struct wmi_device *wdev, const void *context)
>  {
>  	struct ideapad_wmi_private *wpriv;
> @@ -2043,6 +2183,12 @@ static int ideapad_wmi_probe(struct wmi_device *wdev, const void *context)
>  	*wpriv = *(const struct ideapad_wmi_private *)context;
>  
>  	dev_set_drvdata(&wdev->dev, wpriv);
> +
> +	if (wpriv->event == IDEAPAD_WMI_EVENT_LUD_KEYS) {
> +		led_wdev = wdev;
> +		ideapad_wmi_leds_setup(&wdev->dev);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -2088,6 +2234,9 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
>  				     data->integer.value | IDEAPAD_WMI_KEY);
>  
>  		break;
> +	case IDEAPAD_WMI_EVENT_LUD_KEYS:
> +		break;
> +
>  	}
>  }
>  
> @@ -2099,10 +2248,16 @@ static const struct ideapad_wmi_private ideapad_wmi_context_fn_keys = {
>  	.event = IDEAPAD_WMI_EVENT_FN_KEYS
>  };
>  
> +static const struct ideapad_wmi_private ideapad_wmi_context_LUD_keys = {
> +	.event = IDEAPAD_WMI_EVENT_LUD_KEYS
> +};
> +
>  static const struct wmi_device_id ideapad_wmi_ids[] = {
>  	{ "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", &ideapad_wmi_context_esc }, /* Yoga 3 */
>  	{ "56322276-8493-4CE8-A783-98C991274F5E", &ideapad_wmi_context_esc }, /* Yoga 700 */
> -	{ "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_keys }, /* Legion 5 */
> +	{ "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_keys }, /* FN keys */

How is this change related to adding LEDs ?

You can always do a patch series if you want to change unrelated things.

> +	{ "CE6C0974-0407-4F50-88BA-4FC3B6559AD8", &ideapad_wmi_context_LUD_keys }, /* Util data */
> +
>  	{},
>  };
>  MODULE_DEVICE_TABLE(wmi, ideapad_wmi_ids);
> 

-- 
 i.

