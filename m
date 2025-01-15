Received: from n169-112.mail.139.com (n169-112.mail.139.com [120.232.169.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D488D137930;
	Wed, 15 Jan 2025 16:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736957221; cv=none; b=pocSDAqDn3dZnF3wwJWcT+kP6kPZMAiZUh1qgyU5llJy+uHEmbjsprSvW/Dy84UxBJ+ftnke0x4TXrU/w7L5SMdUOko/7zatHrjGiTdkY5JmwbIjY/eRQx70R17JPhtsQNoFtUOcVuhiB0uk+CHjwIb+YX9kYBcCTMNiCvVmrTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736957221; c=relaxed/simple;
	bh=CgRVGCUWOuKMYRRgOl07OKIrVOsv7AGzK7F2q9F/JTs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=klfCXY+TJQ39tclN3cquPGOMJl1vxeQIkdwwUDxojQbfA0woxH+uZlABSTBy0i88AVr0QDINR5ndtJQXHLU41UPoMr6Mva6Dxm2Dy9AhXCHamclKzbO69VtfNUGg14+eElPQAxoMhiX0EvmIYzJsBs6+S7fcHNH4NcCrxhYrFGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; arc=none smtp.client-ip=120.232.169.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from [IPV6:2409:8a00:7871:c6f0:5208:1445:325:b752] (unknown[2409:8A00:7871:C6F0:5208:1445:325:B752])
	by rmsmtp-lg-appmail-22-12025 (RichMail) with SMTP id 2ef96787dd11b2f-35e25;
	Thu, 16 Jan 2025 00:06:47 +0800 (CST)
X-RM-TRANSID:2ef96787dd11b2f-35e25
Message-ID: <001a740b-d025-4dcf-8b3b-5d9a28eac037@139.com>
Date: Thu, 16 Jan 2025 00:06:45 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH v2] ALSA: hda: Support for Ideapad
 hotkeymute LEDs
From: Jackie Dong <xy-jackie@139.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jackie EG1 Dong <dongeg1@lenovo.com>, "perex@perex.cz" <perex@perex.cz>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "bo.liu@senarytech.com" <bo.liu@senarytech.com>,
 "kovalev@altlinux.org" <kovalev@altlinux.org>,
 "me@oldherl.one" <me@oldherl.one>,
 "jaroslaw.janik@gmail.com" <jaroslaw.janik@gmail.com>,
 "songxiebing@kylinos.cn" <songxiebing@kylinos.cn>,
 "kailang@realtek.com" <kailang@realtek.com>,
 "sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
 "simont@opensource.cirrus.com" <simont@opensource.cirrus.com>,
 "josh@joshuagrisham.com" <josh@joshuagrisham.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>
References: <20241224083316.20222-1-xy-jackie@139.com>
 <87ikr2dfnc.wl-tiwai@suse.de>
 <SEYPR03MB8067D30F466738C51808461995092@SEYPR03MB8067.apcprd03.prod.outlook.com>
 <87o70oylir.wl-tiwai@suse.de> <da1959f2-a30e-45b4-bf64-2d413254d7bc@139.com>
 <b02fbf19-280c-48b0-8853-40139a573d6a@139.com> <87h661277u.wl-tiwai@suse.de>
 <877c6x23zp.wl-tiwai@suse.de> <bfec0774-6c74-46ad-a802-b9361638df17@139.com>
Content-Language: en-US
In-Reply-To: <bfec0774-6c74-46ad-a802-b9361638df17@139.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/14/25 23:47, Jackie Dong wrote:
> On 1/14/25 16:28, Takashi Iwai wrote:
>> On Tue, 14 Jan 2025 08:19:17 +0100,
>> Takashi Iwai wrote:
>>>
>>> On Tue, 14 Jan 2025 07:54:01 +0100,
>>> Jackie Dong wrote:
>>>>
>>>> On 1/6/25 20:49, Jackie Dong wrote:
>>>>> On 2025/1/3 23:17, Takashi Iwai wrote:
>>>>>> On Mon, 30 Dec 2024 01:33:01 +0100,
>>>>>> Jackie EG1 Dong wrote:
>>>>>>>
>>>>>>>> On Tue, 24 Dec 2024 09:33:16 +0100,
>>>>>>>    > Jackie Dong wrote:
>>>>>>>    >>
>>>>>>>    >> --- a/sound/pci/hda/patch_realtek.c
>>>>>>>    >> +++ b/sound/pci/hda/patch_realtek.c
>>>>>>>    >> @@ -6934,6 +6934,16 @@ static void
>>>>>>> alc_fixup_thinkpad_acpi(struct hda_codec *codec,
>>>>>>>    >>       hda_fixup_thinkpad_acpi(codec, fix, action);
>>>>>>>    >>   }
>>>>>>>    >>
>>>>>>>    >> +/* for hda_fixup_ideapad_acpi() */
>>>>>>>    >> +#include "ideapad_hotkey_led_helper.c"
>>>>>>>    >> +
>>>>>>>    >> +static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
>>>>>>>    >> +                   const struct hda_fixup *fix, int action)
>>>>>>>    >> +{
>>>>>>>    >> +    alc_fixup_no_shutup(codec, fix, action); /* reduce click
>>>>>>> noise */
>>>>>>>    >> +    hda_fixup_ideapad_acpi(codec, fix, action);
>>>>>>>    >> +}
>>>>>>>    >
>>>>>>>    > So this unconditionally call alc_fixup_no_shutup(), and this
>>>>>>>> introduces another behavior to the existing entry -- i.e. there
>>>>>>> is a  > chance of breakage.
>>>>>>>    >
>>>>>>>    > If we want to be very conservative, this call should be
>>>>>>> limited to  > Ideapad.
>>>>>>>    > For alc_fixup_no_shutup(codec, fix, action),
>>>>>>>    I want to keep same behavior with alc_fixup_thinkpad_apci() and
>>>>>>> alc_fixup_idea_acpi() for one sound card. So, I add
>>>>>>> alc_fixup_no_shutup() in alc_fixup_ideapad_acpi().
>>>>>>> ----------Related source code of patch_reatek.c are FYR as below.
>>>>>>> static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
>>>>>>>                                        const struct hda_fixup 
>>>>>>> *fix, int
>>>>>>> action)
>>>>>>> {
>>>>>>>            alc_fixup_no_shutup(codec, fix, action); /* reduce click
>>>>>>> noise */
>>>>>>>            hda_fixup_thinkpad_acpi(codec, fix, action); }
>>>>>>>
>>>>>>> /* for hda_fixup_ideapad_acpi() */
>>>>>>> #include "ideapad_hotkey_led_helper.c"
>>>>>>>
>>>>>>> static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
>>>>>>>                                       const struct hda_fixup *fix,
>>>>>>> int action) {
>>>>>>>            alc_fixup_no_shutup(codec, fix, action); /* reduce click
>>>>>>> noise */
>>>>>>>            hda_fixup_ideapad_acpi(codec, fix, action);
>>>>>>> }
>>>>>>
>>>>>> Oh yeah, but then it can be bad in other way round; the chain call of
>>>>>> alc_fixup_thinkpad_acpi() contains alc_fixup_no_shutup() and the
>>>>>> alc_fixup_ideadpad_acpi() also contains alc_fixup_no_shutup().
>>>>>> That is, alc_fixup_no_shutup() will be called twice for Thinkpad.
>>>>>>
>>>>> Many thanks to Takashi for your detail comments  and sample code, I
>>>>> understand it now.
>>>>>
>>>>> I'll check the logic of the code and update the patch later.
>>>>>
>>>>> Best Regards,
>>>>>
>>>>> Jackie Dong
>>>>
>>>> Hi Takashi,
>>>>    For this function, I added three debug message in patch_realtek.c as
>>>> below. I find alc_fixup_no_shutup() only run once, no matter it's in
>>>> alc_fixup_thinkpad_acpi(), or it's in alc_fixup_ideadpad_acpi(). Some
>>>> kernel log for your reference.
>>>>    So, I think the patch is ok for this concern.
>>>>    If you have any other concern for the patch, let me know.
>>>>    Thanks for your comment and guide in past.
>>>
>>> That's really weird.  Are you testing your v2 patch, right?
>>> (That is, the ALC269_FIXUP_LENOVO_XPAD_ACPI entry calls
>>> alc_fixup_ideadpad_acpi() and is chained with
>>> ALC269_FIXUP_THINKPAD_ACPI.  If this entry is really used, it *must*
>>> call the alc_fixup_thinkpad_acpi() as well.
>>>
>>> Please double-check.
> Hi Takashi,
>    You're right.
>    I commented two lines in [ALC269_FIXUP_LENOVO_XPAD_ACPI] and got the 
> result of previous mail. I try to look for which funcion call 
> alc_fixup_thinkpad_acpi() after add below patch. And I hope to impeleted 
> the function with minimum changes.
>    Many thanks,
> -----------------------------------------------------------------------
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -6126,6 +6126,7 @@ static void alc_fixup_no_shutup(struct hda_codec 
> *codec,
>                  struct alc_spec *spec = codec->spec;
>                  spec->no_shutup_pins = 1;
>          }
> +       printk("This is from alc_fixup_no_shutup+ 
> +444444444444444444444444444444+-.\n");//Deg
>   }
> 
>   static void alc_fixup_disable_aamix(struct hda_codec *codec,
> @@ -6930,10 +6931,22 @@ static void alc285_fixup_hp_envy_x360(struct 
> hda_codec *codec,
>   static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
>                                      const struct hda_fixup *fix, int 
> action)
>   {
> -       alc_fixup_no_shutup(codec, fix, action); /* reduce click noise */
> +       alc_fixup_no_shutup(codec, fix, action); /* reduce click noise 
> */ //Deg
> +       printk("This is from alc_fixup_no_shutup+ 
> +TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT+-.\n");//Deg
>          hda_fixup_thinkpad_acpi(codec, fix, action);
>   }
> 
> +/* for hda_fixup_ideapad_acpi() */
> +#include "ideapad_hotkey_led_helper.c"
> +
> +static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
> +                                  const struct hda_fixup *fix, int action)
> +{
> +       alc_fixup_no_shutup(codec, fix, action); /* reduce click noise 
> */ //Deg
> +       printk("This is from alc_fixup_no_shutup+ 
> +IIIIIIIIIIIIIIIIIIIIIIIIIIIIII+-.\n");//Deg
> +       hda_fixup_ideapad_acpi(codec, fix, action);
> +}
> +
>   /* Fixup for Lenovo Legion 15IMHg05 speaker output on headset removal. */
>   static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec 
> *codec,
>                                                    const struct 
> hda_fixup *fix,
> @@ -7556,6 +7569,7 @@ enum {
>          ALC290_FIXUP_SUBWOOFER,
>          ALC290_FIXUP_SUBWOOFER_HSJACK,
>          ALC269_FIXUP_THINKPAD_ACPI,
> +       ALC269_FIXUP_LENOVO_XPAD_ACPI,
>          ALC269_FIXUP_DMIC_THINKPAD_ACPI,
>          ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13,
>          ALC269VC_FIXUP_INFINIX_Y4_MAX,
> @@ -8327,6 +8341,12 @@ static const struct hda_fixup alc269_fixups[] = {
>                  .chained = true,
>                  .chain_id = ALC269_FIXUP_SKU_IGNORE,
>          },
> +       [ALC269_FIXUP_LENOVO_XPAD_ACPI] = {
> +               .type = HDA_FIXUP_FUNC,
> +               .v.func = alc_fixup_ideapad_acpi,
> +//             .chained = true,
> +//             .chain_id = ALC269_FIXUP_THINKPAD_ACPI,
> +       },
>          [ALC269_FIXUP_DMIC_THINKPAD_ACPI] = {
>                  .type = HDA_FIXUP_FUNC,
>                  .v.func = alc_fixup_inv_dmic,
> @@ -11065,7 +11085,7 @@ static const struct hda_quirk 
> alc269_fixup_vendor_tbl[] = {
>          SND_PCI_QUIRK_VENDOR(0x1025, "Acer Aspire", ALC271_FIXUP_DMIC),
>          SND_PCI_QUIRK_VENDOR(0x103c, "HP", ALC269_FIXUP_HP_MUTE_LED),
>          SND_PCI_QUIRK_VENDOR(0x104d, "Sony VAIO", ALC269_FIXUP_SONY_VAIO),
> -       SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad", 
> ALC269_FIXUP_THINKPAD_ACPI),
> +       SND_PCI_QUIRK_VENDOR(0x17aa, "Lenovo XPAD", 
> ALC269_FIXUP_LENOVO_XPAD_ACPI),
>          SND_PCI_QUIRK_VENDOR(0x19e5, "Huawei Matebook", 
> ALC255_FIXUP_MIC_MUTE_LED),
>          {}
>   };
> @@ -11130,6 +11150,7 @@ static const struct hda_model_fixup 
> alc269_fixup_models[] = {
>          {.id = ALC290_FIXUP_MONO_SPEAKERS_HSJACK, .name = "mono- 
> speakers"},
>          {.id = ALC290_FIXUP_SUBWOOFER_HSJACK, .name = "alc290-subwoofer"},
>          {.id = ALC269_FIXUP_THINKPAD_ACPI, .name = "thinkpad"},
> +       {.id = ALC269_FIXUP_LENOVO_XPAD_ACPI, .name = "lenovo xpad led"},
>          {.id = ALC269_FIXUP_DMIC_THINKPAD_ACPI, .name = "dmic-thinkpad"},
>          {.id = ALC255_FIXUP_ACER_MIC_NO_PRESENCE, .name = "alc255-acer"},
>          {.id = ALC255_FIXUP_ASUS_MIC_NO_PRESENCE, .name = "alc255-asus"},
Hi Takashi,
    I study for the logic of ALC269_FIXUP_THINKPAD_ACPI call and test 
many times. From my view, only removed alc_fixup_no_shutup() from 
alc_fixup_ideapad_acpi() is the best way which has no impact for other 
functions call ALC269_FIXUP_THINKPAD_ACPI.
    I have submitted the v3 patch which only removed 
alc_fixup_no_shutup() from alc_fixup_ideapad_acpi() to make
    sure alc_fixup_no_shutup() only be called once for Thinkpad and
    Ideapad.
    Pls review it again and give your comments.

  Best Regards,
Jackie Dong

