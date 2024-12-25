Received: from n169-110.mail.139.com (n169-110.mail.139.com [120.232.169.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DD1F9DD;
	Wed, 25 Dec 2024 05:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735103031; cv=none; b=GTo30tjk4IG3VgnBujhQHD0PJnMmb8/ddxq9ZdTWBsVioqzNV9akADVHdQmDp3xYUlkGvugBHCwxxWTFfCSH8fQfgJ5W+N3rnIkQXkuFJiXb+HFg8aUYMkSMudF4rKnAlbxixb6ltE2owLSK8Qnn9GRIzFlyBvClTpSEEGD7900=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735103031; c=relaxed/simple;
	bh=1gbkknNUT0DYHh67nv6XNFyVUQafdyDiVouiF/3r2kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eoyqt/k/ogmo3jXOTWDQyyJ7TDst2nydyQVyT+ECINPjJVES+Kpp/wI+AvKY5QeX+jPAZoaMKNQam8SEa8Oae6Ucg43p7JRyeanC5eBrbyBTXchX6bIjkofYuG9Yv7KfHOSAPaPoDkUay0bAUXuCoecVSQRi/JHZILPGnkJ/9SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; arc=none smtp.client-ip=120.232.169.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from [10.103.147.81] (unknown[123.114.236.251])
	by rmsmtp-lg-appmail-06-12084 (RichMail) with SMTP id 2f34676b9223165-7e9b9;
	Wed, 25 Dec 2024 13:03:37 +0800 (CST)
X-RM-TRANSID:2f34676b9223165-7e9b9
Message-ID: <241a9d1e-b62c-4442-9e9e-c289a3590f1d@139.com>
Date: Wed, 25 Dec 2024 13:03:33 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH 1/2] platform/x86: ideapad-laptop:
 Supportfor mic and audio leds.
To: Armin Wolf <W_Armin@gmx.de>, Jackie EG1 Dong <dongeg1@lenovo.com>,
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
 <6f62f3af-f697-4737-881b-38f60f373fab@gmx.de>
Content-Language: en-US
From: Jackie Dong <xy-jackie@139.com>
In-Reply-To: <6f62f3af-f697-4737-881b-38f60f373fab@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024/12/24 21:09, Armin Wolf wrote:
> Am 24.12.24 um 10:29 schrieb Jackie EG1 Dong:
> 
>> Dear Armin,
>>     CE6C0974-0407-4F50-88BA-4FC3B6559AD8 is a WMI interface method.
>>     From Lenovo keyboard WMI specification, I found it applicable to 
>> LNB products, i.e. YOGA/XiaoXin/Gaming/ThinkBook etc and performs the 
>> Lenovo customized hotkeys function for Consumer and SMB notebooks.
>>     I implemented the audio mute LED and mic mute LED function of 
>> IdeaPad notebook in ideapad_laptop driver, because I found the mute 
>> LED function of Thinkpad notebook is implemented by thinkpad_acpi. And 
>> ideapad_laptop driver has the similar function as thinkpad_acpi.
>>
>>     Thanks,
>> Jackie Dong
> 
> Please do not top-post, see https://subspace.kernel.org/etiquette.html 
> for details.
Thanks Armin for your link, I have read and follow it in future.
> 
> If the CE6C0974-0407-4F50-88BA-4FC3B6559AD8 is a WMI method device, when 
> setting it up as a WMI event device is invalid. I will see if i can 
> modify the WMI driver core to prevent
> this from happening in the future.
> 
> Regarding the ideapad_laptop and thinkpad_acpi drivers: those drivers 
> are using the legacy GUID-based WMI API, so they tend to handle multiple 
> WMI GUIDs at the same time.
> This style of writing WMI drivers is deprecated, as it is prone to 
> lifetime issues.
> 
> I suggest you write a separate WMI driver for the 
> CE6C0974-0407-4F50-88BA-4FC3B6559AD8 WMI device which just takes care of 
> the LED devices. The documentation for writing WMI drivers
> also specifies a example driver which might be useful as a starting point.
> 
> Looking forward for the second revision of the patch series :).I'll write a separate WMI driver for this function if I don't get any 
other maintainers comment. Maybe it spend more time to finish it.
Many thanks,
Jackie Dong
> 
> Thanks,
> Armin Wolf
> 
>> -----Original Message-----
>> From: Armin Wolf <W_Armin@gmx.de>
>> Sent: Monday, December 23, 2024 6:34 AM
>> To: Jackie Dong <xy-jackie@139.com>; ike.pan@canonical.com; 
>> hdegoede@redhat.com; ilpo.jarvinen@linux.intel.com; perex@perex.cz; 
>> tiwai@suse.com; bo.liu@senarytech.com; kovalev@altlinux.org; 
>> me@oldherl.one; jaroslaw.janik@gmail.com; cs@tuxedo.de; 
>> songxiebing@kylinos.cn; kailang@realtek.com; 
>> sbinding@opensource.cirrus.com; simont@opensource.cirrus.com; 
>> josh@joshuagrisham.com; rf@opensource.cirrus.com
>> Cc: linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; 
>> linux-sound@vger.kernel.org; mpearson-lenovo@squebb.ca; 
>> waterflowdeg@gmail.com; Jackie EG1 Dong <dongeg1@lenovo.com>
>> Subject: [External] Re: [PATCH 1/2] platform/x86: ideapad-laptop: 
>> Support for mic and audio leds.
>>
>> Am 19.12.24 um 11:15 schrieb Jackie Dong:
>>
>>> Implement Lenovo utility data WMI calls needed to make LEDs work on
>>> Ideapads that support this GUID.
>>> This enables the mic and audio LEDs to be updated correctly.
>>>
>>> Tested on below samples.
>>> ThinkBook 13X Gen4 IMH
>>> ThinkBook 14 G6 ABP
>>> ThinkBook 16p Gen4-21J8
>>> ThinkBook 16p Gen8-IRL
>>> ThinkBook 16p G7+ ASP
>> Hi,
>>
>> i am a bit confused regarding the role of the 
>> CE6C0974-0407-4F50-88BA-4FC3B6559AD8 WMI device:
>>
>> - is it a event or a method block?
>>
>> - is it in some way connected with the remaining WMI devices supported 
>> by the ideapad-laptop driver?
>>
>> Looking at the code it seems to me that the 
>> CE6C0974-0407-4F50-88BA-4FC3B6559AD8 WMI device is not a event device 
>> and is not directly connected with the remaining WMI devices (please 
>> correct me if i am wrong).
>>
>> Can you please write a separate driver for this WMI device? Getting 
>> the ideapad-laptop driver involved in this seems to be unreasonable 
>> since the audio led functionality does not interact with the remaining 
>> driver.
>>
>> This might be helpful: 
>> https://docs.kernel.org/wmi/driver-development-guide.html.
>>
>>> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>> Signed-off-by: Jackie Dong <xy-jackie@139.com>
>>> Signed-off-by: Jackie Dong <dongeg1@lenovo.com>
>> Please keep only the Signed-of tag with the email address used for 
>> sending this patch.
>>
>> Besides that its always nice to see vendors getting involved with 
>> upstream :).
>>
>> Thanks,
>> Armin Wolf
>>
>>> ---
>>>    drivers/platform/x86/ideapad-laptop.c | 157 
>>> +++++++++++++++++++++++++-
>>>    1 file changed, 156 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/ideapad-laptop.c
>>> b/drivers/platform/x86/ideapad-laptop.c
>>> index c64dfc56651d..acea4aa8eac3 100644
>>> --- a/drivers/platform/x86/ideapad-laptop.c
>>> +++ b/drivers/platform/x86/ideapad-laptop.c
>>> @@ -32,6 +32,7 @@
>>>    #include <linux/sysfs.h>
>>>    #include <linux/types.h>
>>>    #include <linux/wmi.h>
>>> +#include <sound/control.h>
>>>    #include "ideapad-laptop.h"
>>>
>>>    #include <acpi/video.h>
>>> @@ -1298,6 +1299,15 @@ static const struct key_entry ideapad_keymap[] 
>>> = {
>>>        { KE_END },
>>>    };
>>>
>>> +/*
>>> + * Input parameters to mute/unmute audio LED and Mic LED  */ struct
>>> +wmi_led_args {
>>> +     u8 ID;
>>> +     u8 SubID;
>>> +     u16 Value;
>>> +};
>>> +
>>>    static int ideapad_input_init(struct ideapad_private *priv)
>>>    {
>>>        struct input_dev *inputdev;
>>> @@ -2023,15 +2033,145 @@ static void ideapad_check_features(struct 
>>> ideapad_private *priv)
>>>    /*
>>>     * WMI driver
>>>     */
>>> +#define IDEAPAD_ACPI_LED_MAX  (((SNDRV_CTL_ELEM_ACCESS_MIC_LED -\
>>> +             SNDRV_CTL_ELEM_ACCESS_SPK_LED) >> 
>>> SNDRV_CTL_ELEM_ACCESS_LED_SHIFT)
>>> ++ 1)
>>> +
>>>    enum ideapad_wmi_event_type {
>>>        IDEAPAD_WMI_EVENT_ESC,
>>>        IDEAPAD_WMI_EVENT_FN_KEYS,
>>> +     IDEAPAD_WMI_EVENT_LUD_KEYS,
>>>    };
>>>
>>> +#define WMI_LUD_GET_SUPPORT 1
>>> +#define WMI_LUD_SET_FEATURE 2
>>> +
>>> +#define WMI_LUD_GET_MICMUTE_LED_VER   20
>>> +#define WMI_LUD_GET_AUDIOMUTE_LED_VER 26
>>> +
>>> +#define WMI_LUD_SUPPORT_MICMUTE_LED_VER   25
>>> +#define WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER 27
>>> +
>>>    struct ideapad_wmi_private {
>>>        enum ideapad_wmi_event_type event;
>>> +     struct led_classdev cdev[IDEAPAD_ACPI_LED_MAX];
>>>    };
>>>
>>> +static struct wmi_device *led_wdev;
>>> +
>>> +enum mute_led_type {
>>> +     MIC_MUTE,
>>> +     AUDIO_MUTE,
>>> +};
>>> +
>>> +static int ideapad_wmi_mute_led_set(enum mute_led_type led_type, 
>>> struct led_classdev *led_cdev,
>>> +                                 enum led_brightness brightness)
>>> +
>>> +{
>>> +     struct wmi_led_args led_arg = {0, 0, 0};
>>> +     struct acpi_buffer input;
>>> +     acpi_status status;
>>> +
>>> +     if (led_type == MIC_MUTE)
>>> +             led_arg.ID = brightness == LED_ON ? 1 : 2;
>>> +     else if (led_type == AUDIO_MUTE)
>>> +             led_arg.ID = brightness == LED_ON ? 4 : 5;
>>> +     else
>>> +             return -EINVAL;
>>> +
>>> +     input.length = sizeof(struct wmi_led_args);
>>> +     input.pointer = &led_arg;
>>> +     status = wmidev_evaluate_method(led_wdev, 0, WMI_LUD_SET_FEATURE,
>>> +&input, NULL);
>>> +
>>> +     if (ACPI_FAILURE(status))
>>> +             return -EIO;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int ideapad_wmi_audiomute_led_set(struct led_classdev *led_cdev,
>>> +                                      enum led_brightness brightness)
>>> +
>>> +{
>>> +     return ideapad_wmi_mute_led_set(AUDIO_MUTE, led_cdev, 
>>> brightness); }
>>> +
>>> +static int ideapad_wmi_micmute_led_set(struct led_classdev *led_cdev,
>>> +                                    enum led_brightness brightness) {
>>> +     return ideapad_wmi_mute_led_set(MIC_MUTE, led_cdev, brightness); }
>>> +
>>> +static int ideapad_wmi_leds_init(enum mute_led_type led_type, struct
>>> +device *dev) {
>>> +     struct ideapad_wmi_private *wpriv = dev_get_drvdata(dev);
>>> +     struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>>> +     struct acpi_buffer input;
>>> +     union acpi_object *obj;
>>> +     int led_version, err = 0;
>>> +     unsigned int wmiarg;
>>> +     acpi_status status;
>>> +
>>> +     if (led_type == MIC_MUTE)
>>> +             wmiarg = WMI_LUD_GET_MICMUTE_LED_VER;
>>> +     else if (led_type == AUDIO_MUTE)
>>> +             wmiarg = WMI_LUD_GET_AUDIOMUTE_LED_VER;
>>> +     else
>>> +             return -EINVAL;
>>> +
>>> +     input.length = sizeof(wmiarg);
>>> +     input.pointer = &wmiarg;
>>> +     status = wmidev_evaluate_method(led_wdev, 0, 
>>> WMI_LUD_GET_SUPPORT, &input, &output);
>>> +     if (ACPI_FAILURE(status)) {
>>> +             kfree(output.pointer);
>>> +             return -EIO;
>>> +     }
>>> +     obj = output.pointer;
>>> +     led_version = obj->integer.value;
>>> +
>>> +     wpriv->cdev[led_type].max_brightness = LED_ON;
>>> +     wpriv->cdev[led_type].dev = dev;
>>> +     wpriv->cdev[led_type].flags = LED_CORE_SUSPENDRESUME;
>>> +
>>> +     if (led_type == MIC_MUTE) {
>>> +             if (led_version != WMI_LUD_SUPPORT_MICMUTE_LED_VER) {
>>> +                     dev_info(dev, "This product doesn't support mic 
>>> mute LED.\n");
>>> +                     return -EIO;
>>> +             }
>>> +             wpriv->cdev[led_type].name = "platform::micmute";
>>> +             wpriv->cdev[led_type].brightness_set_blocking = 
>>> &ideapad_wmi_micmute_led_set;
>>> +             wpriv->cdev[led_type].default_trigger = "audio-micmute";
>>> +
>>> +             err = devm_led_classdev_register(dev, 
>>> &wpriv->cdev[led_type]);
>>> +             if (err < 0) {
>>> +                     dev_err(dev, "Could not register mic mute LED : 
>>> %d\n", err);
>>> +                     led_classdev_unregister(&wpriv->cdev[led_type]);
>>> +             }
>>> +     } else {
>>> +             if (led_version != WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER) {
>>> +                     dev_info(dev, "This product doesn't support 
>>> audio mute LED.\n");
>>> +                     return -EIO;
>>> +             }
>>> +             wpriv->cdev[led_type].name = "platform::mute";
>>> +             wpriv->cdev[led_type].brightness_set_blocking = 
>>> &ideapad_wmi_audiomute_led_set;
>>> +             wpriv->cdev[led_type].default_trigger = "audio-mute";
>>> +
>>> +             err = devm_led_classdev_register(dev, 
>>> &wpriv->cdev[led_type]);
>>> +             if (err < 0) {
>>> +                     dev_err(dev, "Could not register audio mute 
>>> LED: %d\n", err);
>>> +                     led_classdev_unregister(&wpriv->cdev[led_type]);
>>> +             }
>>> +     }
>>> +
>>> +     kfree(obj);
>>> +     return err;
>>> +}
>>> +
>>> +static void ideapad_wmi_leds_setup(struct device *dev) {
>>> +     ideapad_wmi_leds_init(MIC_MUTE, dev);
>>> +     ideapad_wmi_leds_init(AUDIO_MUTE, dev); }
>>> +
>>>    static int ideapad_wmi_probe(struct wmi_device *wdev, const void 
>>> *context)
>>>    {
>>>        struct ideapad_wmi_private *wpriv;
>>> @@ -2043,6 +2183,12 @@ static int ideapad_wmi_probe(struct wmi_device 
>>> *wdev, const void *context)
>>>        *wpriv = *(const struct ideapad_wmi_private *)context;
>>>
>>>        dev_set_drvdata(&wdev->dev, wpriv);
>>> +
>>> +     if (wpriv->event == IDEAPAD_WMI_EVENT_LUD_KEYS) {
>>> +             led_wdev = wdev;
>>> +             ideapad_wmi_leds_setup(&wdev->dev);
>>> +     }
>>> +
>>>        return 0;
>>>    }
>>>
>>> @@ -2088,6 +2234,9 @@ static void ideapad_wmi_notify(struct 
>>> wmi_device *wdev, union acpi_object *data)
>>>                                     data->integer.value | 
>>> IDEAPAD_WMI_KEY);
>>>
>>>                break;
>>> +     case IDEAPAD_WMI_EVENT_LUD_KEYS:
>>> +             break;
>>> +
>>>        }
>>>    }
>>>
>>> @@ -2099,10 +2248,16 @@ static const struct ideapad_wmi_private 
>>> ideapad_wmi_context_fn_keys = {
>>>        .event = IDEAPAD_WMI_EVENT_FN_KEYS
>>>    };
>>>
>>> +static const struct ideapad_wmi_private ideapad_wmi_context_LUD_keys 
>>> = {
>>> +     .event = IDEAPAD_WMI_EVENT_LUD_KEYS
>>> +};
>>> +
>>>    static const struct wmi_device_id ideapad_wmi_ids[] = {
>>>        { "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", 
>>> &ideapad_wmi_context_esc }, /* Yoga 3 */
>>>        { "56322276-8493-4CE8-A783-98C991274F5E", 
>>> &ideapad_wmi_context_esc }, /* Yoga 700 */
>>> -     { "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", 
>>> &ideapad_wmi_context_fn_keys }, /* Legion 5 */
>>> +     { "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", 
>>> &ideapad_wmi_context_fn_keys }, /* FN keys */
>>> +     { "CE6C0974-0407-4F50-88BA-4FC3B6559AD8",
>>> +&ideapad_wmi_context_LUD_keys }, /* Util data */
>>> +
>>>        {},
>>>    };
>>>    MODULE_DEVICE_TABLE(wmi, ideapad_wmi_ids);


