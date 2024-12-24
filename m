Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF99F1DDA3E;
	Tue, 24 Dec 2024 13:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735045815; cv=none; b=pYYseFbXvyTdO67ZbDhMiTkV3Z1Ps3Q5CPs1Mb5zwkEpPIaSYQDFbyK9MHT4QjDY6NuVWAqhoj/UxDftdK6ojKNLq+WU29AT84KMEcmi+dAC7VXPg9r8GUpNO8/BVMuQiJxnMp3ckKCFcPTUjhv7AySUr+G9tVfl0K37oQBA1fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735045815; c=relaxed/simple;
	bh=81YeE7ybNTizMbq16aoErw0eOAeA/E5lwJL7C1DOQc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdNA9WVcyI9dKeCIVCCtx7XZowZyHVZFeYHeSrff8xPNdWOBb+cuYjF8GVpm97sLDtavos6LvalueliVImRGJbpSCqf7bJErV6RW34Mehx8zqLzsvfLW9prjDtCWNlwBg3edoVdy4vntB4WebgO6UP1EZCnn9zZART3HJ10bZJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=mvm6w3hc; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="mvm6w3hc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735045776; x=1735650576; i=w_armin@gmx.de;
	bh=8VJKVuHSygIfBYVhRicxSa4YJAqRzS6YPizTGnCRx0o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mvm6w3hcYRARgdsgZjIc+l2zxbnYGedJHQDDDjEy0WAb8kwE6ubK7okkUReRG8CD
	 1LGznpf+O7sBoqLG413sjBrB2TKzDT+1Q8aKp7FCM7I5R2CXPesLk0aqSzKknvsu7
	 GYjDBgSmmQi1Xmza/5MdhzzdE7ja5jOuXcyJKmORZgoQq6iwzDZJbBW7zMCoOZXUF
	 cYxxUqVcD3T0KbWFn17FbXJRqPkPFEi7C3Dn2DHgSui/9hDD1NGM2NO2/KA05H+eD
	 leD9LybY1yk9yU13jqDUqq0ydO850Dp0uJc+iEzIebntkWZFv/j9swbdvesyFoGc8
	 +qFR7zPMk/QnWhzOeg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7sHo-1tTu9C1now-008urR; Tue, 24
 Dec 2024 14:09:36 +0100
Message-ID: <6f62f3af-f697-4737-881b-38f60f373fab@gmx.de>
Date: Tue, 24 Dec 2024 14:09:29 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH 1/2] platform/x86: ideapad-laptop: Support
 for mic and audio leds.
To: Jackie EG1 Dong <dongeg1@lenovo.com>, Jackie Dong <xy-jackie@139.com>,
 "ike.pan@canonical.com" <ike.pan@canonical.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "bo.liu@senarytech.com" <bo.liu@senarytech.com>,
 "kovalev@altlinux.org" <kovalev@altlinux.org>,
 "me@oldherl.one" <me@oldherl.one>,
 "jaroslaw.janik@gmail.com" <jaroslaw.janik@gmail.com>,
 "cs@tuxedo.de" <cs@tuxedo.de>,
 "songxiebing@kylinos.cn" <songxiebing@kylinos.cn>,
 "kailang@realtek.com" <kailang@realtek.com>,
 "sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
 "simont@opensource.cirrus.com" <simont@opensource.cirrus.com>,
 "josh@joshuagrisham.com" <josh@joshuagrisham.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>,
 "waterflowdeg@gmail.com" <waterflowdeg@gmail.com>
References: <20241219101531.35896-1-xy-jackie@139.com>
 <7a7071ed-0a9a-4def-bfda-9fea60b09115@gmx.de>
 <SEYPR03MB806740FFA11B805DA08F6C1495032@SEYPR03MB8067.apcprd03.prod.outlook.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <SEYPR03MB806740FFA11B805DA08F6C1495032@SEYPR03MB8067.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:3menMocFsa5CcPNVbhfK+WeCceboY0iFbKtZZ3g4Ig24Q4OQYIl
 bGK0axFboEitRDlpIfqkh+ZfST6DZz6NiZcmComAtXbDfklm0TE6MeMdyHlrdysgMjUCWnP
 zPeuuko5lOETzEG7W77VeJyXy0K8D8l25iQd3LGrObM88bjKb7dxG0+H+whRcdh4hzvTwiq
 leYB06yBiHkkr63N2Lauw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:n7wQtcrsj3U=;g7YHpGAcjQ6E7H+bRhWbDVh66Wd
 s/4rZQ52p1BRI+ZuW6Xw8+yNKzmRTl/n48YeCbhGo5sxFxVYw3pO2jwyLsZY39QjtptgkLhZ4
 /mO9CaCOXD/wy2LZ+V0NKVBjnSAgc1RBIjZkgOpbabtSHjb7jOBx9BmqsE24LdpUDBCz6purX
 w6qi3jpn6nPR+Y24hAorQUzB3+xdssNUeAEav6keKxF09h/TkrLJRIv0zisR01NbJe3K7UtBa
 JZrK6UfkmpWEtbfZV8Qr37N8pVJMDdNsikqphAsMi9hB2U4JFeIH26k4U6JZd+EFd7GP8SIpJ
 EYKT1WaXrzqMqjah7uDAFB2KTXNSETQtlGZ+HHSyh4HaGm8kMt3G40gT/WXMMrZ8rzg09ajtP
 Dct8Y2V8uhvN0cCA2yliG2akiGR5++/wv38rkq3HfI/l4czc3wd6P1KTUWPNM4k43tFpLvP4s
 moyxT2kOzuDgXbRqKMZYgjSyW2h9EP1gVhm7hCN3ilJv8HIrTDz4qHi2dcYyWJdqAm0KSVzHl
 BeOU5SuXlc/FDhb2KBuYNdPXKF5YwfzlM4mlx2aT+Vn4+55xi4W3i/TYDTf2YTuOrg1omY5GZ
 qQLCmjBe9dxmdOUKKTDAD5MIgpnNpKhSUJE4xM3CRQbJNX//08Mq08XqAhoy0e4B8zeF+4ClZ
 5y01MDWZJuRR/slcZm/UMjtEdZkZpE1RfvixXe6VBZAvJp9b2o+dmJHarLOIT70KHUVugF7hU
 Wked79Llo/Zup+6Wl0rddAJtxIA/WOGBFUJt0yUuxVNLRNEO3tvqG7mack4zoDmhuOgPCiTvX
 qBV21KpeMbCPFYzWtpM9rtqUTUdZyDxqovlc07jrGxe44v8I4D+sg+oVBNw42lXOOIvUWvDCm
 hW8wyCd07Z9lyNYc/WuSA97laB0UdOBKUnIBw83/cHsxekWinbiQxtN99smb5adzdye+rJn3+
 E6UzN/Ges1Hv3RYZvLalsO86eevkcAbM0Lj4jtilKGr00IQ6X1sqNqcrIxQYyodv49p2MnoJ5
 L7K+gT+caMqCCtt/drgPBdqA9gwQOvVBIjLCpM9mraXA1RseYmEFMC44Lh66qCLFZSwk/IwcY
 w7iCBf0ginHaNQ1o+kHZQHJ18xe2KJ

Am 24.12.24 um 10:29 schrieb Jackie EG1 Dong:

> Dear Armin,
>     CE6C0974-0407-4F50-88BA-4FC3B6559AD8 is a WMI interface method.
>     From Lenovo keyboard WMI specification, I found it applicable to LNB products, i.e. YOGA/XiaoXin/Gaming/ThinkBook etc and performs the Lenovo customized hotkeys function for Consumer and SMB notebooks.
>     I implemented the audio mute LED and mic mute LED function of IdeaPad notebook in ideapad_laptop driver, because I found the mute LED function of Thinkpad notebook is implemented by thinkpad_acpi. And ideapad_laptop driver has the similar function as thinkpad_acpi.
>
>     Thanks,
> Jackie Dong

Please do not top-post, see https://subspace.kernel.org/etiquette.html for details.

If the CE6C0974-0407-4F50-88BA-4FC3B6559AD8 is a WMI method device, when setting it up as a WMI event device is invalid. I will see if i can modify the WMI driver core to prevent
this from happening in the future.

Regarding the ideapad_laptop and thinkpad_acpi drivers: those drivers are using the legacy GUID-based WMI API, so they tend to handle multiple WMI GUIDs at the same time.
This style of writing WMI drivers is deprecated, as it is prone to lifetime issues.

I suggest you write a separate WMI driver for the CE6C0974-0407-4F50-88BA-4FC3B6559AD8 WMI device which just takes care of the LED devices. The documentation for writing WMI drivers
also specifies a example driver which might be useful as a starting point.

Looking forward for the second revision of the patch series :).

Thanks,
Armin Wolf

> -----Original Message-----
> From: Armin Wolf <W_Armin@gmx.de>
> Sent: Monday, December 23, 2024 6:34 AM
> To: Jackie Dong <xy-jackie@139.com>; ike.pan@canonical.com; hdegoede@redhat.com; ilpo.jarvinen@linux.intel.com; perex@perex.cz; tiwai@suse.com; bo.liu@senarytech.com; kovalev@altlinux.org; me@oldherl.one; jaroslaw.janik@gmail.com; cs@tuxedo.de; songxiebing@kylinos.cn; kailang@realtek.com; sbinding@opensource.cirrus.com; simont@opensource.cirrus.com; josh@joshuagrisham.com; rf@opensource.cirrus.com
> Cc: linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; linux-sound@vger.kernel.org; mpearson-lenovo@squebb.ca; waterflowdeg@gmail.com; Jackie EG1 Dong <dongeg1@lenovo.com>
> Subject: [External] Re: [PATCH 1/2] platform/x86: ideapad-laptop: Support for mic and audio leds.
>
> Am 19.12.24 um 11:15 schrieb Jackie Dong:
>
>> Implement Lenovo utility data WMI calls needed to make LEDs work on
>> Ideapads that support this GUID.
>> This enables the mic and audio LEDs to be updated correctly.
>>
>> Tested on below samples.
>> ThinkBook 13X Gen4 IMH
>> ThinkBook 14 G6 ABP
>> ThinkBook 16p Gen4-21J8
>> ThinkBook 16p Gen8-IRL
>> ThinkBook 16p G7+ ASP
> Hi,
>
> i am a bit confused regarding the role of the CE6C0974-0407-4F50-88BA-4FC3B6559AD8 WMI device:
>
> - is it a event or a method block?
>
> - is it in some way connected with the remaining WMI devices supported by the ideapad-laptop driver?
>
> Looking at the code it seems to me that the CE6C0974-0407-4F50-88BA-4FC3B6559AD8 WMI device is not a event device and is not directly connected with the remaining WMI devices (please correct me if i am wrong).
>
> Can you please write a separate driver for this WMI device? Getting the ideapad-laptop driver involved in this seems to be unreasonable since the audio led functionality does not interact with the remaining driver.
>
> This might be helpful: https://docs.kernel.org/wmi/driver-development-guide.html.
>
>> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Jackie Dong <xy-jackie@139.com>
>> Signed-off-by: Jackie Dong <dongeg1@lenovo.com>
> Please keep only the Signed-of tag with the email address used for sending this patch.
>
> Besides that its always nice to see vendors getting involved with upstream :).
>
> Thanks,
> Armin Wolf
>
>> ---
>>    drivers/platform/x86/ideapad-laptop.c | 157 +++++++++++++++++++++++++-
>>    1 file changed, 156 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/ideapad-laptop.c
>> b/drivers/platform/x86/ideapad-laptop.c
>> index c64dfc56651d..acea4aa8eac3 100644
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -32,6 +32,7 @@
>>    #include <linux/sysfs.h>
>>    #include <linux/types.h>
>>    #include <linux/wmi.h>
>> +#include <sound/control.h>
>>    #include "ideapad-laptop.h"
>>
>>    #include <acpi/video.h>
>> @@ -1298,6 +1299,15 @@ static const struct key_entry ideapad_keymap[] = {
>>        { KE_END },
>>    };
>>
>> +/*
>> + * Input parameters to mute/unmute audio LED and Mic LED  */ struct
>> +wmi_led_args {
>> +     u8 ID;
>> +     u8 SubID;
>> +     u16 Value;
>> +};
>> +
>>    static int ideapad_input_init(struct ideapad_private *priv)
>>    {
>>        struct input_dev *inputdev;
>> @@ -2023,15 +2033,145 @@ static void ideapad_check_features(struct ideapad_private *priv)
>>    /*
>>     * WMI driver
>>     */
>> +#define IDEAPAD_ACPI_LED_MAX  (((SNDRV_CTL_ELEM_ACCESS_MIC_LED -\
>> +             SNDRV_CTL_ELEM_ACCESS_SPK_LED) >> SNDRV_CTL_ELEM_ACCESS_LED_SHIFT)
>> ++ 1)
>> +
>>    enum ideapad_wmi_event_type {
>>        IDEAPAD_WMI_EVENT_ESC,
>>        IDEAPAD_WMI_EVENT_FN_KEYS,
>> +     IDEAPAD_WMI_EVENT_LUD_KEYS,
>>    };
>>
>> +#define WMI_LUD_GET_SUPPORT 1
>> +#define WMI_LUD_SET_FEATURE 2
>> +
>> +#define WMI_LUD_GET_MICMUTE_LED_VER   20
>> +#define WMI_LUD_GET_AUDIOMUTE_LED_VER 26
>> +
>> +#define WMI_LUD_SUPPORT_MICMUTE_LED_VER   25
>> +#define WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER 27
>> +
>>    struct ideapad_wmi_private {
>>        enum ideapad_wmi_event_type event;
>> +     struct led_classdev cdev[IDEAPAD_ACPI_LED_MAX];
>>    };
>>
>> +static struct wmi_device *led_wdev;
>> +
>> +enum mute_led_type {
>> +     MIC_MUTE,
>> +     AUDIO_MUTE,
>> +};
>> +
>> +static int ideapad_wmi_mute_led_set(enum mute_led_type led_type, struct led_classdev *led_cdev,
>> +                                 enum led_brightness brightness)
>> +
>> +{
>> +     struct wmi_led_args led_arg = {0, 0, 0};
>> +     struct acpi_buffer input;
>> +     acpi_status status;
>> +
>> +     if (led_type == MIC_MUTE)
>> +             led_arg.ID = brightness == LED_ON ? 1 : 2;
>> +     else if (led_type == AUDIO_MUTE)
>> +             led_arg.ID = brightness == LED_ON ? 4 : 5;
>> +     else
>> +             return -EINVAL;
>> +
>> +     input.length = sizeof(struct wmi_led_args);
>> +     input.pointer = &led_arg;
>> +     status = wmidev_evaluate_method(led_wdev, 0, WMI_LUD_SET_FEATURE,
>> +&input, NULL);
>> +
>> +     if (ACPI_FAILURE(status))
>> +             return -EIO;
>> +
>> +     return 0;
>> +}
>> +
>> +static int ideapad_wmi_audiomute_led_set(struct led_classdev *led_cdev,
>> +                                      enum led_brightness brightness)
>> +
>> +{
>> +     return ideapad_wmi_mute_led_set(AUDIO_MUTE, led_cdev, brightness); }
>> +
>> +static int ideapad_wmi_micmute_led_set(struct led_classdev *led_cdev,
>> +                                    enum led_brightness brightness) {
>> +     return ideapad_wmi_mute_led_set(MIC_MUTE, led_cdev, brightness); }
>> +
>> +static int ideapad_wmi_leds_init(enum mute_led_type led_type, struct
>> +device *dev) {
>> +     struct ideapad_wmi_private *wpriv = dev_get_drvdata(dev);
>> +     struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>> +     struct acpi_buffer input;
>> +     union acpi_object *obj;
>> +     int led_version, err = 0;
>> +     unsigned int wmiarg;
>> +     acpi_status status;
>> +
>> +     if (led_type == MIC_MUTE)
>> +             wmiarg = WMI_LUD_GET_MICMUTE_LED_VER;
>> +     else if (led_type == AUDIO_MUTE)
>> +             wmiarg = WMI_LUD_GET_AUDIOMUTE_LED_VER;
>> +     else
>> +             return -EINVAL;
>> +
>> +     input.length = sizeof(wmiarg);
>> +     input.pointer = &wmiarg;
>> +     status = wmidev_evaluate_method(led_wdev, 0, WMI_LUD_GET_SUPPORT, &input, &output);
>> +     if (ACPI_FAILURE(status)) {
>> +             kfree(output.pointer);
>> +             return -EIO;
>> +     }
>> +     obj = output.pointer;
>> +     led_version = obj->integer.value;
>> +
>> +     wpriv->cdev[led_type].max_brightness = LED_ON;
>> +     wpriv->cdev[led_type].dev = dev;
>> +     wpriv->cdev[led_type].flags = LED_CORE_SUSPENDRESUME;
>> +
>> +     if (led_type == MIC_MUTE) {
>> +             if (led_version != WMI_LUD_SUPPORT_MICMUTE_LED_VER) {
>> +                     dev_info(dev, "This product doesn't support mic mute LED.\n");
>> +                     return -EIO;
>> +             }
>> +             wpriv->cdev[led_type].name = "platform::micmute";
>> +             wpriv->cdev[led_type].brightness_set_blocking = &ideapad_wmi_micmute_led_set;
>> +             wpriv->cdev[led_type].default_trigger = "audio-micmute";
>> +
>> +             err = devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
>> +             if (err < 0) {
>> +                     dev_err(dev, "Could not register mic mute LED : %d\n", err);
>> +                     led_classdev_unregister(&wpriv->cdev[led_type]);
>> +             }
>> +     } else {
>> +             if (led_version != WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER) {
>> +                     dev_info(dev, "This product doesn't support audio mute LED.\n");
>> +                     return -EIO;
>> +             }
>> +             wpriv->cdev[led_type].name = "platform::mute";
>> +             wpriv->cdev[led_type].brightness_set_blocking = &ideapad_wmi_audiomute_led_set;
>> +             wpriv->cdev[led_type].default_trigger = "audio-mute";
>> +
>> +             err = devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
>> +             if (err < 0) {
>> +                     dev_err(dev, "Could not register audio mute LED: %d\n", err);
>> +                     led_classdev_unregister(&wpriv->cdev[led_type]);
>> +             }
>> +     }
>> +
>> +     kfree(obj);
>> +     return err;
>> +}
>> +
>> +static void ideapad_wmi_leds_setup(struct device *dev) {
>> +     ideapad_wmi_leds_init(MIC_MUTE, dev);
>> +     ideapad_wmi_leds_init(AUDIO_MUTE, dev); }
>> +
>>    static int ideapad_wmi_probe(struct wmi_device *wdev, const void *context)
>>    {
>>        struct ideapad_wmi_private *wpriv;
>> @@ -2043,6 +2183,12 @@ static int ideapad_wmi_probe(struct wmi_device *wdev, const void *context)
>>        *wpriv = *(const struct ideapad_wmi_private *)context;
>>
>>        dev_set_drvdata(&wdev->dev, wpriv);
>> +
>> +     if (wpriv->event == IDEAPAD_WMI_EVENT_LUD_KEYS) {
>> +             led_wdev = wdev;
>> +             ideapad_wmi_leds_setup(&wdev->dev);
>> +     }
>> +
>>        return 0;
>>    }
>>
>> @@ -2088,6 +2234,9 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
>>                                     data->integer.value | IDEAPAD_WMI_KEY);
>>
>>                break;
>> +     case IDEAPAD_WMI_EVENT_LUD_KEYS:
>> +             break;
>> +
>>        }
>>    }
>>
>> @@ -2099,10 +2248,16 @@ static const struct ideapad_wmi_private ideapad_wmi_context_fn_keys = {
>>        .event = IDEAPAD_WMI_EVENT_FN_KEYS
>>    };
>>
>> +static const struct ideapad_wmi_private ideapad_wmi_context_LUD_keys = {
>> +     .event = IDEAPAD_WMI_EVENT_LUD_KEYS
>> +};
>> +
>>    static const struct wmi_device_id ideapad_wmi_ids[] = {
>>        { "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", &ideapad_wmi_context_esc }, /* Yoga 3 */
>>        { "56322276-8493-4CE8-A783-98C991274F5E", &ideapad_wmi_context_esc }, /* Yoga 700 */
>> -     { "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_keys }, /* Legion 5 */
>> +     { "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_keys }, /* FN keys */
>> +     { "CE6C0974-0407-4F50-88BA-4FC3B6559AD8",
>> +&ideapad_wmi_context_LUD_keys }, /* Util data */
>> +
>>        {},
>>    };
>>    MODULE_DEVICE_TABLE(wmi, ideapad_wmi_ids);
