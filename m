Received: from n169-114.mail.139.com (n169-114.mail.139.com [120.232.169.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5746F233556;
	Tue, 14 Jan 2025 06:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736837856; cv=none; b=nZDjNgWKn3Pd10vS70o5ZzeEEsapyXP34IFt6750RHvBla3Jb2quzuuo/g9VA2bddBVlhNNehwmVdbGwEeJBuq6jShrSUnaimHj8uru+Lwt/w3SzJN0JK5yWdh4R62eMLuG+LjCAGi8gGx5lGMsDvmX+jUzfy6qgByyBBHcZgII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736837856; c=relaxed/simple;
	bh=nxGsrbaqTBTEaExFAMolRpWu3fJ6iRSI4e2jII8zFDM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=MlntcMSRpAeFaOCQ/Y41DtJp8cA3fUO39yqc7DYKbEDc8FMonOnVKFwZ0/WD+7ciwe68pDelhGRZOYYSP8MbqPAGXtXy0GyY4YPPDWMTaUtm0uu5DqL5aTPksmn9QBUSEhoM1KT4CZiJbvqNQiTDNbLqGEIiDFHSPXQYZZ/e5Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; arc=none smtp.client-ip=120.232.169.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from [IPV6:240e:404:1900:b194:b8ea:6de3:69f9:fa91] (unknown[240E:404:1900:B194:B8EA:6DE3:69F9:FA91])
	by rmsmtp-lg-appmail-43-12057 (RichMail) with SMTP id 2f1967860a08d92-23f91;
	Tue, 14 Jan 2025 14:54:05 +0800 (CST)
X-RM-TRANSID:2f1967860a08d92-23f91
Message-ID: <b02fbf19-280c-48b0-8853-40139a573d6a@139.com>
Date: Tue, 14 Jan 2025 14:54:01 +0800
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
To: Takashi Iwai <tiwai@suse.de>, Jackie EG1 Dong <dongeg1@lenovo.com>
Cc: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
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
Content-Language: en-US
In-Reply-To: <da1959f2-a30e-45b4-bf64-2d413254d7bc@139.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/6/25 20:49, Jackie Dong wrote:
> On 2025/1/3 23:17, Takashi Iwai wrote:
>> On Mon, 30 Dec 2024 01:33:01 +0100,
>> Jackie EG1 Dong wrote:
>>>
>>>> On Tue, 24 Dec 2024 09:33:16 +0100,
>>>   > Jackie Dong wrote:
>>>   >>
>>>   >> --- a/sound/pci/hda/patch_realtek.c
>>>   >> +++ b/sound/pci/hda/patch_realtek.c
>>>   >> @@ -6934,6 +6934,16 @@ static void 
>>> alc_fixup_thinkpad_acpi(struct hda_codec *codec,
>>>   >>       hda_fixup_thinkpad_acpi(codec, fix, action);
>>>   >>   }
>>>   >>
>>>   >> +/* for hda_fixup_ideapad_acpi() */
>>>   >> +#include "ideapad_hotkey_led_helper.c"
>>>   >> +
>>>   >> +static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
>>>   >> +                   const struct hda_fixup *fix, int action)
>>>   >> +{
>>>   >> +    alc_fixup_no_shutup(codec, fix, action); /* reduce click 
>>> noise */
>>>   >> +    hda_fixup_ideapad_acpi(codec, fix, action);
>>>   >> +}
>>>   >
>>>   > So this unconditionally call alc_fixup_no_shutup(), and this  > 
>>> introduces another behavior to the existing entry -- i.e. there is a  
>>> > chance of breakage.
>>>   >
>>>   > If we want to be very conservative, this call should be limited 
>>> to  > Ideapad.
>>>   > For alc_fixup_no_shutup(codec, fix, action),
>>>   I want to keep same behavior with alc_fixup_thinkpad_apci() and 
>>> alc_fixup_idea_acpi() for one sound card. So, I add 
>>> alc_fixup_no_shutup() in alc_fixup_ideapad_acpi().
>>> ----------Related source code of patch_reatek.c are FYR as below.
>>> static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
>>>                                       const struct hda_fixup *fix, int
>>> action)
>>> {
>>>           alc_fixup_no_shutup(codec, fix, action); /* reduce click 
>>> noise */
>>>           hda_fixup_thinkpad_acpi(codec, fix, action); }
>>>
>>> /* for hda_fixup_ideapad_acpi() */
>>> #include "ideapad_hotkey_led_helper.c"
>>>
>>> static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
>>>                                      const struct hda_fixup *fix, int 
>>> action) {
>>>           alc_fixup_no_shutup(codec, fix, action); /* reduce click 
>>> noise */
>>>           hda_fixup_ideapad_acpi(codec, fix, action);
>>> }
>>
>> Oh yeah, but then it can be bad in other way round; the chain call of
>> alc_fixup_thinkpad_acpi() contains alc_fixup_no_shutup() and the
>> alc_fixup_ideadpad_acpi() also contains alc_fixup_no_shutup().
>> That is, alc_fixup_no_shutup() will be called twice for Thinkpad.
>>
> Many thanks to Takashi for your detail comments  and sample code, I 
> understand it now.
> 
> I'll check the logic of the code and update the patch later.
> 
> Best Regards,
> 
> Jackie Dong

Hi Takashi,
   For this function, I added three debug message in patch_realtek.c as 
below. I find alc_fixup_no_shutup() only run once, no matter it's in 
alc_fixup_thinkpad_acpi(), or it's in alc_fixup_ideadpad_acpi(). Some 
kernel log for your reference.
   So, I think the patch is ok for this concern.
   If you have any other concern for the patch, let me know.
   Thanks for your comment and guide in past.

----------------------------------------------------------------------
./sound/pci/hda/patch_realtek.c
......
  6122 static void alc_fixup_no_shutup(struct hda_codec *codec,
  6123                                 const struct hda_fixup *fix, int 
action)
  6124 {
  6125         if (action == HDA_FIXUP_ACT_PRE_PROBE) {
  6126                 struct alc_spec *spec = codec->spec;
  6127                 spec->no_shutup_pins = 1;
  6128         }
  6129         printk("This is from 
alc_fixup_no_shutup++444444444444444444444444444444+-.\n");//Deg
  6130 }
......
6929 #include "thinkpad_helper.c"
  6930
  6931 static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
  6932                                     const struct hda_fixup *fix, 
int action)
  6933 {
  6934         alc_fixup_no_shutup(codec, fix, action); /* reduce click 
noise */ //Deg
  6935         printk("This is from 
alc_fixup_no_shutup++TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT+-.\n");//Deg
  6936         hda_fixup_thinkpad_acpi(codec, fix, action);
  6937 }
  6938
  6939 /* for hda_fixup_ideapad_acpi() */
  6940 #include "ideapad_hotkey_led_helper.c"
  6941
  6942 static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
  6943                                    const struct hda_fixup *fix, 
int action)
  6944 {
  6945         alc_fixup_no_shutup(codec, fix, action); /* reduce click 
noise */ //Deg
  6946         printk("This is from 
alc_fixup_no_shutup++IIIIIIIIIIIIIIIIIIIIIIIIIIIIII+-.\n");//Deg
  6947         hda_fixup_ideapad_acpi(codec, fix, action);
  6948 }
......

----------------------------------------------------------------------
Some log from /var/log/kerlog of ThinkBook 16 G8 IRL.
......
2025-01-13T16:24:34.109926+08:00 test-ThinkBook-16-G8-IRL kernel: 
snd_hda_codec_realtek ehdaudio0D0: ALC257: picked fixup  for PCI SSID 
17aa:0000
2025-01-13T16:24:34.109927+08:00 test-ThinkBook-16-G8-IRL kernel: This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
2025-01-13T16:24:34.109927+08:00 test-ThinkBook-16-G8-IRL kernel: This 
is from alc_fixup_no_shutup++IIIIIIIIIIIIIIIIIIIIIIIIIIIIII+-.
2025-01-13T16:24:34.109928+08:00 test-ThinkBook-16-G8-IRL kernel: 
snd_hda_codec_realtek ehdaudio0D0: autoconfig for ALC257: line_outs=1 
(0x14/0x0/0x0/0x0/0x0) type:speaker
2025-01-13T16:24:34.109928+08:00 test-ThinkBook-16-G8-IRL kernel: 
snd_hda_codec_realtek ehdaudio0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
2025-01-13T16:24:34.109929+08:00 test-ThinkBook-16-G8-IRL kernel: 
snd_hda_codec_realtek ehdaudio0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
2025-01-13T16:24:34.109929+08:00 test-ThinkBook-16-G8-IRL kernel: 
snd_hda_codec_realtek ehdaudio0D0:    mono: mono_out=0x0
2025-01-13T16:24:34.109930+08:00 test-ThinkBook-16-G8-IRL kernel: 
snd_hda_codec_realtek ehdaudio0D0:    inputs:
2025-01-13T16:24:34.109930+08:00 test-ThinkBook-16-G8-IRL kernel: 
snd_hda_codec_realtek ehdaudio0D0:      Mic=0x19
2025-01-13T16:24:34.109931+08:00 test-ThinkBook-16-G8-IRL kernel: This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
2025-01-13T16:24:34.109931+08:00 test-ThinkBook-16-G8-IRL kernel: This 
is from alc_fixup_no_shutup++IIIIIIIIIIIIIIIIIIIIIIIIIIIIII+-.
2025-01-13T16:24:34.109932+08:00 test-ThinkBook-16-G8-IRL kernel: This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
2025-01-13T16:24:34.109932+08:00 test-ThinkBook-16-G8-IRL kernel: This 
is from alc_fixup_no_shutup++IIIIIIIIIIIIIIIIIIIIIIIIIIIIII+-.
2025-01-13T16:24:34.109933+08:00 test-ThinkBook-16-G8-IRL kernel: This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
2025-01-13T16:24:34.109933+08:00 test-ThinkBook-16-G8-IRL kernel: This 
is from alc_fixup_no_shutup++IIIIIIIIIIIIIIIIIIIIIIIIIIIIII+-.
2025-01-13T16:24:34.109934+08:00 test-ThinkBook-16-G8-IRL kernel: 
skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no 
PCM in topology for HDMI converter 3
2025-01-13T16:24:34.109934+08:00 test-ThinkBook-16-G8-IRL kernel: 
iwlwifi 0000:00:14.3: base HW address: a8:59:5f:e8:58:dc
2025-01-13T16:24:34.109935+08:00 test-ThinkBook-16-G8-IRL kernel: input: 
sof-hda-dsp Mic as 
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input19
2025-01-13T16:24:34.109935+08:00 test-ThinkBook-16-G8-IRL kernel: input: 
sof-hda-dsp Headphone as 
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input20
2025-01-13T16:24:34.109936+08:00 test-ThinkBook-16-G8-IRL kernel: input: 
sof-hda-dsp HDMI/DP,pcm=3 as 
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input21
2025-01-13T16:24:34.109936+08:00 test-ThinkBook-16-G8-IRL kernel: input: 
sof-hda-dsp HDMI/DP,pcm=4 as 
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input22
2025-01-13T16:24:34.109937+08:00 test-ThinkBook-16-G8-IRL kernel: input: 
sof-hda-dsp HDMI/DP,pcm=5 as 
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input23
2025-01-13T16:24:34.109937+08:00 test-ThinkBook-16-G8-IRL kernel: 
iwlwifi 0000:00:14.3 wlp0s20f3: renamed from wlan0
2025-01-13T16:24:34.109938+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: hci0: Waiting for firmware download to complete
2025-01-13T16:24:34.109938+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: hci0: Firmware loaded in 1480525 usecs
2025-01-13T16:24:34.109939+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: hci0: Waiting for device to boot
2025-01-13T16:24:34.109939+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: hci0: Device booted in 15688 usecs
2025-01-13T16:24:34.109940+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-0040-0041.ddc
2025-01-13T16:24:34.109940+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: hci0: Applying Intel DDC parameters completed
2025-01-13T16:24:34.109941+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: hci0: Firmware timestamp 2023.48 buildtype 1 build 75324
2025-01-13T16:24:34.109941+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: hci0: Firmware SHA1: 0x23bac558
2025-01-13T16:24:34.109942+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: hci0: Fseq status: Success (0x00)
2025-01-13T16:24:34.109942+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: hci0: Fseq executed: 00.00.02.41
2025-01-13T16:24:34.109942+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: hci0: Fseq BT Top: 00.00.02.41
2025-01-13T16:24:34.109943+08:00 test-ThinkBook-16-G8-IRL kernel: This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
2025-01-13T16:24:34.109943+08:00 test-ThinkBook-16-G8-IRL kernel: This 
is from alc_fixup_no_shutup++IIIIIIIIIIIIIIIIIIIIIIIIIIIIII+-.
2025-01-13T16:24:34.109944+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: BNEP (Ethernet Emulation) ver 1.3
2025-01-13T16:24:34.109944+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: BNEP filters: protocol multicast
2025-01-13T16:24:34.109945+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: BNEP socket layer initialized
2025-01-13T16:24:34.109945+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: MGMT ver 1.23
2025-01-13T16:24:34.109946+08:00 test-ThinkBook-16-G8-IRL kernel: NET: 
Registered PF_ALG protocol family
2025-01-13T16:24:34.109946+08:00 test-ThinkBook-16-G8-IRL kernel: nvme 
nvme0: using unchecked data buffer
2025-01-13T16:24:34.132755+08:00 test-ThinkBook-16-G8-IRL kernel: NET: 
Registered PF_QIPCRTR protocol family
2025-01-13T16:24:34.796796+08:00 test-ThinkBook-16-G8-IRL kernel: 
iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x20
2025-01-13T16:24:34.796810+08:00 test-ThinkBook-16-G8-IRL kernel: 
iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
2025-01-13T16:24:34.796811+08:00 test-ThinkBook-16-G8-IRL kernel: 
iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x90
2025-01-13T16:24:34.796811+08:00 test-ThinkBook-16-G8-IRL kernel: 
iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
2025-01-13T16:24:34.796812+08:00 test-ThinkBook-16-G8-IRL kernel: 
iwlwifi 0000:00:14.3: RFIm is deactivated, reason = 4
2025-01-13T16:24:34.900941+08:00 test-ThinkBook-16-G8-IRL kernel: 
iwlwifi 0000:00:14.3: Registered PHC clock: iwlwifi-PTP, with index: 1
2025-01-13T16:24:35.092715+08:00 test-ThinkBook-16-G8-IRL kernel: 
loop13: detected capacity change from 0 to 8
2025-01-13T16:24:35.360758+08:00 test-ThinkBook-16-G8-IRL kernel: This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
2025-01-13T16:24:35.360768+08:00 test-ThinkBook-16-G8-IRL kernel: This 
is from alc_fixup_no_shutup++IIIIIIIIIIIIIIIIIIIIIIIIIIIIII+-.
2025-01-13T16:24:35.476784+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: RFCOMM TTY layer initialized
2025-01-13T16:24:35.476792+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: RFCOMM socket layer initialized
2025-01-13T16:24:35.476793+08:00 test-ThinkBook-16-G8-IRL kernel: 
Bluetooth: RFCOMM ver 1.11
2025-01-13T16:24:36.000717+08:00 test-ThinkBook-16-G8-IRL kernel: 
rfkill: input handler disabled
2025-01-13T16:24:37.928735+08:00 test-ThinkBook-16-G8-IRL kernel: 
wlp0s20f3: authenticate with c2:95:70:cf:7f:31 (local 
address=a8:59:5f:e8:58:dc)
2025-01-13T16:24:37.928746+08:00 test-ThinkBook-16-G8-IRL kernel: 
wlp0s20f3: send auth to c2:95:70:cf:7f:31 (try 1/3)
2025-01-13T16:24:37.960811+08:00 test-ThinkBook-16-G8-IRL kernel: 
wlp0s20f3: authenticated
2025-01-13T16:24:37.960839+08:00 test-ThinkBook-16-G8-IRL kernel: 
wlp0s20f3: associate with c2:95:70:cf:7f:31 (try 1/3)
2025-01-13T16:24:37.964860+08:00 test-ThinkBook-16-G8-IRL kernel: 
wlp0s20f3: RX AssocResp from c2:95:70:cf:7f:31 (capab=0x531 status=0 aid=24)
2025-01-13T16:24:37.972839+08:00 test-ThinkBook-16-G8-IRL kernel: 
wlp0s20f3: associated
2025-01-13T16:25:20.616738+08:00 test-ThinkBook-16-G8-IRL kernel: 
kauditd_printk_skb: 156 callbacks suppressed
2025-01-13T16:25:20.616752+08:00 test-ThinkBook-16-G8-IRL kernel: audit: 
type=1400 audit(1736756720.611:168): apparmor="DENIED" 
operation="capable" class="cap" 
profile="/snap/snapd/23545/usr/lib/snapd/snap-confine" pid=2188 
comm="snap-confine" capability=12  capname="net_admin"
2025-01-13T16:25:20.616755+08:00 test-ThinkBook-16-G8-IRL kernel: audit: 
type=1400 audit(1736756720.611:169): apparmor="DENIED" 
operation="capable" class="cap" 
profile="/snap/snapd/23545/usr/lib/snapd/snap-confine" pid=2188 
comm="snap-confine" capability=38  capname="perfmon"
2025-01-13T16:25:20.860725+08:00 test-ThinkBook-16-G8-IRL kernel: 
rfkill: input handler enabled
2025-01-13T16:25:20.984744+08:00 test-ThinkBook-16-G8-IRL kernel: This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
2025-01-13T16:25:20.984754+08:00 test-ThinkBook-16-G8-IRL kernel: This 
is from alc_fixup_no_shutup++IIIIIIIIIIIIIIIIIIIIIIIIIIIIII+-.
2025-01-13T16:25:21.588723+08:00 test-ThinkBook-16-G8-IRL kernel: 
rfkill: input handler disabled
2025-01-13T16:25:23.560752+08:00 test-ThinkBook-16-G8-IRL kernel: audit: 
type=1400 audit(1736756723.553:170): apparmor="DENIED" 
operation="capable" class="cap" 
profile="/snap/snapd/23545/usr/lib/snapd/snap-confine" pid=3165 
comm="snap-confine" capability=12  capname="net_admin"
2025-01-13T16:25:23.560790+08:00 test-ThinkBook-16-G8-IRL kernel: audit: 
type=1400 audit(1736756723.553:171): apparmor="DENIED" 
operation="capable" class="cap" 
profile="/snap/snapd/23545/usr/lib/snapd/snap-confine" pid=3165 
comm="snap-confine" capability=38  capname="perfmon"
2025-01-13T16:25:55.972879+08:00 test-ThinkBook-16-G8-IRL kernel: This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
2025-01-13T16:25:55.972922+08:00 test-ThinkBook-16-G8-IRL kernel: This 
is from alc_fixup_no_shutup++IIIIIIIIIIIIIIIIIIIIIIIIIIIIII+-.
2025-01-13T16:25:58.090951+08:00 test-ThinkBook-16-G8-IRL kernel: atkbd 
serio0: Unknown key pressed (translated set 2, code 0xac on isa0060/serio0).
......

----------------------------------------------------------------------
Some log from /var/log/kerlog of ThinkPad X1 Nano Gen1.
......
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.727147] This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.727150] This 
is from alc_fixup_no_shutup++TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT+-.
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.727758] 
snd_hda_codec_realtek ehdaudio0D0: autoconfig for ALC287: line_outs=2 
(0x14/0x17/0x0/0x0/0x0) type:speaker
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.727764] 
snd_hda_codec_realtek ehdaudio0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.727777] 
snd_hda_codec_realtek ehdaudio0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.727779] 
snd_hda_codec_realtek ehdaudio0D0:    mono: mono_out=0x0
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.727781] 
snd_hda_codec_realtek ehdaudio0D0:    inputs:
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.727782] 
snd_hda_codec_realtek ehdaudio0D0:      Mic=0x19
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.732045] This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.732059] This 
is from alc_fixup_no_shutup++TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT+-.
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.775739] This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.775743] This 
is from alc_fixup_no_shutup++TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT+-.
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.776998] This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.777000] This 
is from alc_fixup_no_shutup++TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT+-.
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.777636] 
skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no 
PCM in topology for HDMI converter 3
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.812497] 
input: sof-hda-dsp Mic as 
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input23
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.812568] 
input: sof-hda-dsp Headphone as 
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input24
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.812826] 
input: sof-hda-dsp HDMI/DP,pcm=3 as 
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input25
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.812884] 
input: sof-hda-dsp HDMI/DP,pcm=4 as 
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input26
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.812930] 
input: sof-hda-dsp HDMI/DP,pcm=5 as 
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input27
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.841455] 
Bluetooth: BNEP (Ethernet Emulation) ver 1.3
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.841460] 
Bluetooth: BNEP filters: protocol multicast
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    5.841464] 
Bluetooth: BNEP socket layer initialized
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    6.142838] 
iwlwifi 0000:00:14.3: Registered PHC clock: iwlwifi-PTP, with index: 0
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    6.241587] This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
Jan 13 16:30:16 test-ThinkPad-X1-Nano-Gen-1 kernel: [    6.241590] This 
is from alc_fixup_no_shutup++TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT+-.
Jan 13 16:30:17 test-ThinkPad-X1-Nano-Gen-1 kernel: [    7.175456] 
loop14: detected capacity change from 0 to 8
Jan 13 16:30:17 test-ThinkPad-X1-Nano-Gen-1 kernel: [    7.234454] 
Bluetooth: hci0: Waiting for firmware download to complete
Jan 13 16:30:17 test-ThinkPad-X1-Nano-Gen-1 kernel: [    7.234793] 
Bluetooth: hci0: Firmware loaded in 1803474 usecs
Jan 13 16:30:17 test-ThinkPad-X1-Nano-Gen-1 kernel: [    7.234871] 
Bluetooth: hci0: Waiting for device to boot
Jan 13 16:30:17 test-ThinkPad-X1-Nano-Gen-1 kernel: [    7.249852] 
Bluetooth: hci0: Device booted in 14679 usecs
Jan 13 16:30:17 test-ThinkPad-X1-Nano-Gen-1 kernel: [    7.250205] 
Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-19-0-4.ddc
Jan 13 16:30:17 test-ThinkPad-X1-Nano-Gen-1 kernel: [    7.251900] 
Bluetooth: hci0: Applying Intel DDC parameters completed
Jan 13 16:30:17 test-ThinkPad-X1-Nano-Gen-1 kernel: [    7.252821] 
Bluetooth: hci0: Firmware revision 0.4 build 206 week 22 2023
Jan 13 16:30:17 test-ThinkPad-X1-Nano-Gen-1 kernel: [    7.254845] 
Bluetooth: hci0: HCI LE Coded PHY feature bit is set, but its usage is 
not supported.
Jan 13 16:30:17 test-ThinkPad-X1-Nano-Gen-1 kernel: [    7.319888] 
Bluetooth: MGMT ver 1.23
Jan 13 16:30:17 test-ThinkPad-X1-Nano-Gen-1 kernel: [    7.322558] NET: 
Registered PF_ALG protocol family
Jan 13 16:30:17 test-ThinkPad-X1-Nano-Gen-1 kernel: [    7.618988] 
rfkill: input handler disabled
Jan 13 16:30:19 test-ThinkPad-X1-Nano-Gen-1 kernel: [    9.150754] 
wlp0s20f3: authenticate with c2:95:70:cf:7f:31 (local 
address=dc:41:a9:86:dc:a1)
Jan 13 16:30:19 test-ThinkPad-X1-Nano-Gen-1 kernel: [    9.151962] 
wlp0s20f3: send auth to c2:95:70:cf:7f:31 (try 1/3)
Jan 13 16:30:19 test-ThinkPad-X1-Nano-Gen-1 kernel: [    9.180543] 
wlp0s20f3: authenticated
Jan 13 16:30:19 test-ThinkPad-X1-Nano-Gen-1 kernel: [    9.181813] 
wlp0s20f3: associate with c2:95:70:cf:7f:31 (try 1/3)
Jan 13 16:30:19 test-ThinkPad-X1-Nano-Gen-1 kernel: [    9.183387] 
wlp0s20f3: RX AssocResp from c2:95:70:cf:7f:31 (capab=0x531 status=0 aid=25)
Jan 13 16:30:19 test-ThinkPad-X1-Nano-Gen-1 kernel: [    9.196275] 
wlp0s20f3: associated
Jan 13 16:30:39 test-ThinkPad-X1-Nano-Gen-1 kernel: [   29.438595] 
kauditd_printk_skb: 52 callbacks suppressed
Jan 13 16:30:39 test-ThinkPad-X1-Nano-Gen-1 kernel: [   29.438598] 
audit: type=1400 audit(1736757039.724:64): apparmor="DENIED" 
operation="capable" class="cap" 
profile="/snap/snapd/23545/usr/lib/snapd/snap-confine" pid=1542 
comm="snap-confine" capability=12  capname="net_admin"
Jan 13 16:30:39 test-ThinkPad-X1-Nano-Gen-1 kernel: [   29.438608] 
audit: type=1400 audit(1736757039.724:65): apparmor="DENIED" 
operation="capable" class="cap" 
profile="/snap/snapd/23545/usr/lib/snapd/snap-confine" pid=1542 
comm="snap-confine" capability=38  capname="perfmon"
Jan 13 16:30:39 test-ThinkPad-X1-Nano-Gen-1 kernel: [   29.484757] 
Bluetooth: RFCOMM TTY layer initialized
Jan 13 16:30:39 test-ThinkPad-X1-Nano-Gen-1 kernel: [   29.484764] 
Bluetooth: RFCOMM socket layer initialized
Jan 13 16:30:39 test-ThinkPad-X1-Nano-Gen-1 kernel: [   29.484768] 
Bluetooth: RFCOMM ver 1.11
Jan 13 16:30:39 test-ThinkPad-X1-Nano-Gen-1 kernel: [   29.660767] 
rfkill: input handler enabled
Jan 13 16:30:40 test-ThinkPad-X1-Nano-Gen-1 kernel: [   29.861572] This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
Jan 13 16:30:40 test-ThinkPad-X1-Nano-Gen-1 kernel: [   29.861577] This 
is from alc_fixup_no_shutup++TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT+-.
Jan 13 16:30:41 test-ThinkPad-X1-Nano-Gen-1 kernel: [   30.808052] 
rfkill: input handler disabled
Jan 13 16:30:42 test-ThinkPad-X1-Nano-Gen-1 kernel: [   32.255105] 
audit: type=1400 audit(1736757042.540:66): apparmor="DENIED" 
operation="capable" class="cap" 
profile="/snap/snapd/23545/usr/lib/snapd/snap-confine" pid=2163 
comm="snap-confine" capability=12  capname="net_admin"
Jan 13 16:30:42 test-ThinkPad-X1-Nano-Gen-1 kernel: [   32.255113] 
audit: type=1400 audit(1736757042.540:67): apparmor="DENIED" 
operation="capable" class="cap" 
profile="/snap/snapd/23545/usr/lib/snapd/snap-confine" pid=2163 
comm="snap-confine" capability=38  capname="perfmon"
Jan 13 16:31:35 test-ThinkPad-X1-Nano-Gen-1 kernel: [   85.593309] This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
Jan 13 16:31:35 test-ThinkPad-X1-Nano-Gen-1 kernel: [   85.593316] This 
is from alc_fixup_no_shutup++TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT+-.
Jan 13 19:06:02 test-ThinkPad-X1-Nano-Gen-1 kernel: [ 9352.480329] 
loop14: detected capacity change from 0 to 562880
Jan 13 19:06:05 test-ThinkPad-X1-Nano-Gen-1 kernel: [ 9355.618422] 
audit: type=1400 audit(1736766365.698:68): apparmor="STATUS" 
operation="profile_replace" info="same as current profile, skipping" 
profile="unconfined" name="/snap/snapd/23545/usr/lib/snapd/snap-confine" 
pid=3116 comm="apparmor_parser"
Jan 13 19:06:05 test-ThinkPad-X1-Nano-Gen-1 kernel: [ 9355.618433] 
audit: type=1400 audit(1736766365.698:69): apparmor="STATUS" 
operation="profile_replace" info="same as current profile, skipping" 
profile="unconfined" 
name="/snap/snapd/23545/usr/lib/snapd/snap-confine//mount-namespace-capture-helper" 
pid=3116 comm="apparmor_parser"
Jan 13 19:06:05 test-ThinkPad-X1-Nano-Gen-1 kernel: [ 9355.730349] 
audit: type=1400 audit(1736766365.810:70): apparmor="STATUS" 
operation="profile_replace" profile="unconfined" 
name="snap.firefox.hook.configure" pid=3121 comm="apparmor_parser"
Jan 13 19:06:05 test-ThinkPad-X1-Nano-Gen-1 kernel: [ 9355.764308] 
audit: type=1400 audit(1736766365.846:71): apparmor="STATUS" 
operation="profile_replace" profile="unconfined" 
name="snap.firefox.hook.post-refresh" pid=3123 comm="apparmor_parser"
Jan 13 19:06:05 test-ThinkPad-X1-Nano-Gen-1 kernel: [ 9355.766762] 
audit: type=1400 audit(1736766365.846:72): apparmor="STATUS" 
operation="profile_replace" profile="unconfined" 
name="snap.firefox.hook.disconnect-plug-host-hunspell" pid=3122 
comm="apparmor_parser"
Jan 13 19:06:06 test-ThinkPad-X1-Nano-Gen-1 kernel: [ 9356.049245] 
audit: type=1400 audit(1736766366.130:73): apparmor="STATUS" 
operation="profile_replace" profile="unconfined" 
name="snap.firefox.firefox" pid=3119 comm="apparmor_parser"
Jan 13 19:06:06 test-ThinkPad-X1-Nano-Gen-1 kernel: [ 9356.088026] 
audit: type=1400 audit(1736766366.170:74): apparmor="STATUS" 
operation="profile_replace" profile="unconfined" 
name="snap.firefox.geckodriver" pid=3120 comm="apparmor_parser"
Jan 13 19:06:06 test-ThinkPad-X1-Nano-Gen-1 kernel: [ 9356.104996] 
audit: type=1400 audit(1736766366.186:75): apparmor="STATUS" 
operation="profile_replace" profile="unconfined" 
name="snap-update-ns.firefox" pid=3118 comm="apparmor_parser"
Jan 13 19:06:06 test-ThinkPad-X1-Nano-Gen-1 kernel: [ 9356.294691] 
audit: type=1400 audit(1736766366.374:76): apparmor="STATUS" 
operation="profile_replace" info="same as current profile, skipping" 
profile="unconfined" name="/snap/snapd/23545/usr/lib/snapd/snap-confine" 
pid=3204 comm="apparmor_parser"
Jan 13 19:06:06 test-ThinkPad-X1-Nano-Gen-1 kernel: [ 9356.294696] 
audit: type=1400 audit(1736766366.374:77): apparmor="STATUS" 
operation="profile_replace" info="same as current profile, skipping" 
profile="unconfined" 
name="/snap/snapd/23545/usr/lib/snapd/snap-confine//mount-namespace-capture-helper" 
pid=3204 comm="apparmor_parser"
Jan 14 00:00:02 test-ThinkPad-X1-Nano-Gen-1 kernel: [26992.726977] 
kauditd_printk_skb: 7 callbacks suppressed
Jan 14 00:00:02 test-ThinkPad-X1-Nano-Gen-1 kernel: [26992.726981] 
audit: type=1400 audit(1736784002.633:85): apparmor="DENIED" 
operation="capable" class="cap" profile="/usr/sbin/cupsd" pid=4432 
comm="cupsd" capability=12  capname="net_admin"
Jan 14 03:54:13 test-ThinkPad-X1-Nano-Gen-1 kernel: [41043.929183] nvme 
nvme0: using unchecked data buffer
Jan 14 14:13:19 test-ThinkPad-X1-Nano-Gen-1 kernel: [78189.824014] This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
Jan 14 14:13:19 test-ThinkPad-X1-Nano-Gen-1 kernel: [78189.824021] This 
is from alc_fixup_no_shutup++TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT+-.
Jan 14 14:37:32 test-ThinkPad-X1-Nano-Gen-1 kernel: [79643.222000] This 
is from alc_fixup_no_shutup++444444444444444444444444444444+-.
Jan 14 14:37:32 test-ThinkPad-X1-Nano-Gen-1 kernel: [79643.222006] This 
is from alc_fixup_no_shutup++TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT+-.
......

>> Instead, you can change like:
>>
>> --- a/sound/pci/hda/patch_realtek.c
>> +++ b/sound/pci/hda/patch_realtek.c
>> @@ -6925,11 +6925,16 @@ static void alc285_fixup_hp_envy_x360(struct 
>> hda_codec *codec,
>>   /* for hda_fixup_thinkpad_acpi() */
>>   #include "thinkpad_helper.c"
>> -static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
>> -                    const struct hda_fixup *fix, int action)
>> +/* for hda_fixup_ideapad_acpi() */
>> +#include "ideapad_hotkey_led_helper.c"
>> +
>> +/* generic fixup for both Lenovo Thinkpad and Ideapad */
>> +static void alc_fixup_xpad_acpi(struct hda_codec *codec,
>> +                const struct hda_fixup *fix, int action)
>>   {
>>       alc_fixup_no_shutup(codec, fix, action); /* reduce click noise */
>>       hda_fixup_thinkpad_acpi(codec, fix, action);
>> +    hda_fixup_ideapad_acpi(codec, fix, action);
>>   }
>>   /* Fixup for Lenovo Legion 15IMHg05 speaker output on headset 
>> removal. */
>> @@ -8321,7 +8326,7 @@ static const struct hda_fixup alc269_fixups[] = {
>>       },
>>       [ALC269_FIXUP_THINKPAD_ACPI] = {
>>           .type = HDA_FIXUP_FUNC,
>> -        .v.func = alc_fixup_thinkpad_acpi,
>> +        .v.func = alc_fixup_xpad_acpi,
>>           .chained = true,
>>           .chain_id = ALC269_FIXUP_SKU_IGNORE,
>>       },
>>
>> Since hda_fixup_ideapad_acpi() is NOP except for Ideapad, this
>> shouldn't break other models, while it covers the Ideadpad now.
>>
>>
>> thanks,
>>
>> Takashi
> 


