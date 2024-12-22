Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650871922ED;
	Sun, 22 Dec 2024 22:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734906941; cv=none; b=scmMdxPCZrJl/QberQaFwhqg3iQuQaGMOxVET8ItpmwKcuc0T0wNRVKel9TTJr0WiM8T+OXgG026C+MQ2A7g7i/+uwL2hOqkp6oDB6sRYveoCXVIxxyycOEuNw5sG0wfFMohIqZSaKveTDtp+4cXEtM2a12AqY2HaUthnMpwILc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734906941; c=relaxed/simple;
	bh=eagWC3RoHU9ia2XV6PuQ+QHje8o6Xall5J/AUF3gX2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bKY+IC6C988kwTicnw2nBNqATParBTky7+bXXvj1cG76Oh0kDvQDp+VhNGnBARH1OlQJe4gQvm9TXwTMukPJo4tSsmmoQhplvm+h8nkYX2djqsdU8dHnWgwmqbq5e07jPlXBNZ1QXOXBaEdD2RDz4uwZ8N3AaVwdzbRWYbwtE3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=YHasrUHp; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="YHasrUHp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734906869; x=1735511669; i=w_armin@gmx.de;
	bh=rUCxv3inST8RG+K231P3G9nvJ4J3K52DRagX9KLfGr8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YHasrUHpcKvbE/EFgoZ/ZRW78gdTzZMnYzkJY6ov76WgC8GbqvDOFStUfIe+aeja
	 rJd5Gyy6VuD2NUEgKeurqNcO5VV7myyM/eVX3LXvo5ZpeF15Km50csRAXe5NpctWq
	 xBNRVfUWuaI1nmd5OZEk7FmjLBAShqTpGXKC2T+91kUUUYjLwRGOxb9zKdi4Xw2ss
	 pORZviozokiTIwh3PZc1WU8lGCvPe10rsfvdoSV536V9I5JYz3hIpixQNfFGPs8Ma
	 UuShkNc+Evf6c7ykHClFgef730yp9q8JQkdwelltox6PhCl5C9gFre8mXb5pWpy9l
	 INkThLB03H4myaNwIw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRCKC-1tDRom40xg-00P2Gx; Sun, 22
 Dec 2024 23:34:29 +0100
Message-ID: <7a7071ed-0a9a-4def-bfda-9fea60b09115@gmx.de>
Date: Sun, 22 Dec 2024 23:34:21 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: ideapad-laptop: Support for mic and
 audio leds.
To: Jackie Dong <xy-jackie@139.com>, ike.pan@canonical.com,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, perex@perex.cz,
 tiwai@suse.com, bo.liu@senarytech.com, kovalev@altlinux.org, me@oldherl.one,
 jaroslaw.janik@gmail.com, cs@tuxedo.de, songxiebing@kylinos.cn,
 kailang@realtek.com, sbinding@opensource.cirrus.com,
 simont@opensource.cirrus.com, josh@joshuagrisham.com,
 rf@opensource.cirrus.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-sound@vger.kernel.org, mpearson-lenovo@squebb.ca,
 waterflowdeg@gmail.com, Jackie Dong <dongeg1@lenovo.com>
References: <20241219101531.35896-1-xy-jackie@139.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241219101531.35896-1-xy-jackie@139.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ma6g7qeS2XSHDDvnbK7a7O2J+U/HjLsn4xyMpRXjVWd5U5p8ZXO
 zh5lHkyw//eaopY4J3Tzqji/7saTFn72Fitv61OZcwRiqdU2IBrxZDOATQSZY+zd7E2KRx6
 WgLQJt1xfPSHbOLGbj5ZzBUwpLJMV6i94qjKPWfVdEbSguwqVDRxmHE6SS5t9IoiQwtpZUq
 VrrTrKFszX+a8zA6MuFLg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:n8yI9K2ZbBY=;NSR9oo5G8Z8XOBiRS+iGWJKGQb9
 OZ4YTr5aGzEa7npZDJ3SAAEkXXcb0dgOdTrgOIk06i8Mu4DMAqvujgA7Lgl4p4VurL6B+LlX9
 alQBNezKBfxwXeZLCMP5peW5V5A9tK31+MPD6imVu8bxle7leXyunxRi1o/qSqK3c+SDiDwWL
 HmmWvQhdCRAME73Yoslb/TO2dHXST+zQ7p2CiKiRCNFokfzGDqQiH0kKJt1cWlR9NGq5I1VPP
 fXQ8vthGRGDsmmxWL6uDATK3cjGouTsO9nPJrk4WtOESDS+NGpsWOUra0rY0lGQ67vYrUb7CH
 ltv7oeZQZVv4JIiBJHne1rvLbK93ncQZNjdEPUG+hIeiopF+BzQoCJr7J2tyfxalt5XR1ZTYA
 VtKcIfTP7rJBJp0UTXrUMHiysbVE0mf8xZxx0wmVqs3xs3fyQWY0q9zmq2VoEA7UQNIYSoSwi
 r8WfQshbPPd+Ht9VbX5hw+Inj3ZtJoY7jaokJQJdmWrLZYIQ+xBSFKsaoU/R/hfexEXOTzK3O
 RmZ8BfNkoifKh5MlOBgMeni01uq6h7D6a+18KBQMC/ESWyGalEoa/HU1jsF4mAx72SChQdLVG
 zODy/EfRJIGF00iE4EQxIuujOKUPYO1nI1aEvd5c0C/Tz7mdrXcfCFoQyW1vp/skILJ9N5AAH
 EmDbIRz4WuLBXs1fKnl+mjVc9fVrPwtlibADJpsQtV6F8lqcVas50Qz5L+Ct3h5FxEbMGCH8D
 TxaUeqYEdlIBkkq816A0QfyRI02pbPx36ByoK52SVrK/ZOvLlX/M/azu/TICnu/1ua7cPQ5AH
 wkvfT02DvwwuDe7t6p0l1Cq8dzo6SxR1eCQLljhUOHgZ/XOdEvyhyrmtSERWFFboX88kkNB5V
 pYi1KjJdqU6khEpJsNzd8ckzfURK8kY5cuGXiYjsl/DHsSpafbJH6pKI3OErrRMnuH2okNSmh
 XvNSguFH70FN7fPp9dvW3xQ9ZZHe1eoPvQwoZiPSQHXSCsIxT4yI9ce4vD1TSO3JSMFYmo00K
 os2gmv+VIqeZvbovNCS/lj3CcJwlpUrR7Sna9HsdjXybo9FT4db+HKrr9KxYSLcGFm/Oiq90N
 5PX/GDSnP3U5/VHOXrzfHNCsw/Tv2Z

Am 19.12.24 um 11:15 schrieb Jackie Dong:

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

Hi,

i am a bit confused regarding the role of the CE6C0974-0407-4F50-88BA-4FC3=
B6559AD8 WMI device:

- is it a event or a method block?

- is it in some way connected with the remaining WMI devices supported by =
the ideapad-laptop driver?

Looking at the code it seems to me that the CE6C0974-0407-4F50-88BA-4FC3B6=
559AD8 WMI device is
not a event device and is not directly connected with the remaining WMI de=
vices (please correct
me if i am wrong).

Can you please write a separate driver for this WMI device? Getting the id=
eapad-laptop driver
involved in this seems to be unreasonable since the audio led functionalit=
y does not interact
with the remaining driver.

This might be helpful: https://docs.kernel.org/wmi/driver-development-guid=
e.html.

>
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Jackie Dong <xy-jackie@139.com>
> Signed-off-by: Jackie Dong <dongeg1@lenovo.com>

Please keep only the Signed-of tag with the email address used for sending=
 this patch.

Besides that its always nice to see vendors getting involved with upstream=
 :).

Thanks,
Armin Wolf

> ---
>   drivers/platform/x86/ideapad-laptop.c | 157 +++++++++++++++++++++++++-
>   1 file changed, 156 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x8=
6/ideapad-laptop.c
> index c64dfc56651d..acea4aa8eac3 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -32,6 +32,7 @@
>   #include <linux/sysfs.h>
>   #include <linux/types.h>
>   #include <linux/wmi.h>
> +#include <sound/control.h>
>   #include "ideapad-laptop.h"
>
>   #include <acpi/video.h>
> @@ -1298,6 +1299,15 @@ static const struct key_entry ideapad_keymap[] =
=3D {
>   	{ KE_END },
>   };
>
> +/*
> + * Input parameters to mute/unmute audio LED and Mic LED
> + */
> +struct wmi_led_args {
> +	u8 ID;
> +	u8 SubID;
> +	u16 Value;
> +};
> +
>   static int ideapad_input_init(struct ideapad_private *priv)
>   {
>   	struct input_dev *inputdev;
> @@ -2023,15 +2033,145 @@ static void ideapad_check_features(struct ideap=
ad_private *priv)
>   /*
>    * WMI driver
>    */
> +#define IDEAPAD_ACPI_LED_MAX  (((SNDRV_CTL_ELEM_ACCESS_MIC_LED -\
> +		SNDRV_CTL_ELEM_ACCESS_SPK_LED) >> SNDRV_CTL_ELEM_ACCESS_LED_SHIFT) + =
1)
> +
>   enum ideapad_wmi_event_type {
>   	IDEAPAD_WMI_EVENT_ESC,
>   	IDEAPAD_WMI_EVENT_FN_KEYS,
> +	IDEAPAD_WMI_EVENT_LUD_KEYS,
>   };
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
>   struct ideapad_wmi_private {
>   	enum ideapad_wmi_event_type event;
> +	struct led_classdev cdev[IDEAPAD_ACPI_LED_MAX];
>   };
>
> +static struct wmi_device *led_wdev;
> +
> +enum mute_led_type {
> +	MIC_MUTE,
> +	AUDIO_MUTE,
> +};
> +
> +static int ideapad_wmi_mute_led_set(enum mute_led_type led_type, struct=
 led_classdev *led_cdev,
> +				    enum led_brightness brightness)
> +
> +{
> +	struct wmi_led_args led_arg =3D {0, 0, 0};
> +	struct acpi_buffer input;
> +	acpi_status status;
> +
> +	if (led_type =3D=3D MIC_MUTE)
> +		led_arg.ID =3D brightness =3D=3D LED_ON ? 1 : 2;
> +	else if (led_type =3D=3D AUDIO_MUTE)
> +		led_arg.ID =3D brightness =3D=3D LED_ON ? 4 : 5;
> +	else
> +		return -EINVAL;
> +
> +	input.length =3D sizeof(struct wmi_led_args);
> +	input.pointer =3D &led_arg;
> +	status =3D wmidev_evaluate_method(led_wdev, 0, WMI_LUD_SET_FEATURE, &i=
nput, NULL);
> +
> +	if (ACPI_FAILURE(status))
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
> +static int ideapad_wmi_leds_init(enum mute_led_type led_type, struct de=
vice *dev)
> +{
> +	struct ideapad_wmi_private *wpriv =3D dev_get_drvdata(dev);
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer input;
> +	union acpi_object *obj;
> +	int led_version, err =3D 0;
> +	unsigned int wmiarg;
> +	acpi_status status;
> +
> +	if (led_type =3D=3D MIC_MUTE)
> +		wmiarg =3D WMI_LUD_GET_MICMUTE_LED_VER;
> +	else if (led_type =3D=3D AUDIO_MUTE)
> +		wmiarg =3D WMI_LUD_GET_AUDIOMUTE_LED_VER;
> +	else
> +		return -EINVAL;
> +
> +	input.length =3D sizeof(wmiarg);
> +	input.pointer =3D &wmiarg;
> +	status =3D wmidev_evaluate_method(led_wdev, 0, WMI_LUD_GET_SUPPORT, &i=
nput, &output);
> +	if (ACPI_FAILURE(status)) {
> +		kfree(output.pointer);
> +		return -EIO;
> +	}
> +	obj =3D output.pointer;
> +	led_version =3D obj->integer.value;
> +
> +	wpriv->cdev[led_type].max_brightness =3D LED_ON;
> +	wpriv->cdev[led_type].dev =3D dev;
> +	wpriv->cdev[led_type].flags =3D LED_CORE_SUSPENDRESUME;
> +
> +	if (led_type =3D=3D MIC_MUTE) {
> +		if (led_version !=3D WMI_LUD_SUPPORT_MICMUTE_LED_VER) {
> +			dev_info(dev, "This product doesn't support mic mute LED.\n");
> +			return -EIO;
> +		}
> +		wpriv->cdev[led_type].name =3D "platform::micmute";
> +		wpriv->cdev[led_type].brightness_set_blocking =3D	&ideapad_wmi_micmut=
e_led_set;
> +		wpriv->cdev[led_type].default_trigger =3D "audio-micmute";
> +
> +		err =3D devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
> +		if (err < 0) {
> +			dev_err(dev, "Could not register mic mute LED : %d\n", err);
> +			led_classdev_unregister(&wpriv->cdev[led_type]);
> +		}
> +	} else {
> +		if (led_version !=3D WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER) {
> +			dev_info(dev, "This product doesn't support audio mute LED.\n");
> +			return -EIO;
> +		}
> +		wpriv->cdev[led_type].name =3D "platform::mute";
> +		wpriv->cdev[led_type].brightness_set_blocking =3D	&ideapad_wmi_audiom=
ute_led_set;
> +		wpriv->cdev[led_type].default_trigger =3D "audio-mute";
> +
> +		err =3D devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
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
>   static int ideapad_wmi_probe(struct wmi_device *wdev, const void *cont=
ext)
>   {
>   	struct ideapad_wmi_private *wpriv;
> @@ -2043,6 +2183,12 @@ static int ideapad_wmi_probe(struct wmi_device *w=
dev, const void *context)
>   	*wpriv =3D *(const struct ideapad_wmi_private *)context;
>
>   	dev_set_drvdata(&wdev->dev, wpriv);
> +
> +	if (wpriv->event =3D=3D IDEAPAD_WMI_EVENT_LUD_KEYS) {
> +		led_wdev =3D wdev;
> +		ideapad_wmi_leds_setup(&wdev->dev);
> +	}
> +
>   	return 0;
>   }
>
> @@ -2088,6 +2234,9 @@ static void ideapad_wmi_notify(struct wmi_device *=
wdev, union acpi_object *data)
>   				     data->integer.value | IDEAPAD_WMI_KEY);
>
>   		break;
> +	case IDEAPAD_WMI_EVENT_LUD_KEYS:
> +		break;
> +
>   	}
>   }
>
> @@ -2099,10 +2248,16 @@ static const struct ideapad_wmi_private ideapad_=
wmi_context_fn_keys =3D {
>   	.event =3D IDEAPAD_WMI_EVENT_FN_KEYS
>   };
>
> +static const struct ideapad_wmi_private ideapad_wmi_context_LUD_keys =
=3D {
> +	.event =3D IDEAPAD_WMI_EVENT_LUD_KEYS
> +};
> +
>   static const struct wmi_device_id ideapad_wmi_ids[] =3D {
>   	{ "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", &ideapad_wmi_context_esc },=
 /* Yoga 3 */
>   	{ "56322276-8493-4CE8-A783-98C991274F5E", &ideapad_wmi_context_esc },=
 /* Yoga 700 */
> -	{ "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_keys=
 }, /* Legion 5 */
> +	{ "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_keys=
 }, /* FN keys */
> +	{ "CE6C0974-0407-4F50-88BA-4FC3B6559AD8", &ideapad_wmi_context_LUD_key=
s }, /* Util data */
> +
>   	{},
>   };
>   MODULE_DEVICE_TABLE(wmi, ideapad_wmi_ids);
