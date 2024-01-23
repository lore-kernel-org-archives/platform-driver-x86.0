Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24CE57868
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jan 2024 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706000339; cv=none; b=NrOvKa9aTv7ARM4yhFp70TJfQkj4OeGtECcEjAiQFTNhOiH2+WmE8bv6EDg2K9IsF+FEY6Kl5oYP6vasCoGUl/HG+a/OcYUrfoiQh9HimxuVBagIqo6soSAFJU8kMgS/m1cPLFu5R1dTCClNsPzVY8URd0e5UD5C7Nz/W9QrxR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706000339; c=relaxed/simple;
	bh=CEvd+PASJwFk9HoAQDXAXXVblU2si0v/ZcsX8keNNBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=WxvBp2YpeZozpghXgLQiOXhiEUh7E16jXbKRb7ERZGThRCsw8EAkk8qwAiDyeLpsUmAQbvWCzw3QVMH3BTw9Ra/LHhOBhcVwZr1RVWhHFxbBEHwcvCvAtVlpbiDnZat/JW3dWROmJ8z53s78tHWNqSZ3HBQsRFqaPhn4qh1LnoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Ue9A/1r3; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Ue9A/1r3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1706000330; x=1706605130; i=w_armin@gmx.de;
	bh=CEvd+PASJwFk9HoAQDXAXXVblU2si0v/ZcsX8keNNBI=;
	h=X-UI-Sender-Class:Date:Subject:To:References:Cc:From:
	 In-Reply-To;
	b=Ue9A/1r3Z1RQ32AifC/EiYUkdLGmWZFeWejLhOaKueSLNQyYkL8rWLfmZUs0zEQ+
	 91rwEmmuvyN4XcmXycfx0Em99cZCsErrA0ZGjUr2SnNMOvSNl8VhnMcPeifdTF7oq
	 GR7jF0gZSdvnwcPNfy7kyI5dTMTKHUUpY42XI2TPINsj4y0kcwW+DjbavNT/cTHRy
	 mis3A24buiM4JGruw+ROA0sx4KG7AZcUuqDpLZYiuul8cucD5ibUGKHvCQBvtPGtO
	 eD8lqwFicNbfSWnbnohTYQSx/DmLyYBXbFieJp6HA7hW5aGrz4CynwSu1gC926p6B
	 FmvfD3iRPw+nTkKlFA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.35] ([91.137.126.34]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mr9Bu-1qn2Bo2svW-00oHa5; Tue, 23
 Jan 2024 09:58:50 +0100
Message-ID: <3e574768-8d5b-465b-9860-567d0845d3fb@gmx.de>
Date: Tue, 23 Jan 2024 09:58:50 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hp-wmi: info hotkey has no keycode or scancode
To: Dennis Nezic <dennisn@dennisn.mooo.com>
References: <ZawX2mquuTCv0tuF@panther>
 <a8fa0308-0998-48e4-a104-c2b57ee9bd8e@gmx.de> <Zaw9mnfEL65B5r4O@panther>
 <e97ae805-d006-4f0c-96c0-976385772bb7@gmx.de> <Za4T0RwClHOoCPCy@panther>
 <cd86386a-653e-401c-9b70-0860d2e1906a@gmx.de> <Za8xL39m1X22f2Bb@panther>
 <Za9DQdLg2d_CnrZG@panther>
Content-Language: en-US
Cc: platform-driver-x86@vger.kernel.org
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <Za9DQdLg2d_CnrZG@panther>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:GmKdP8hQno8WSBm3uipYdjjT3p2pWAPOBjqKrMo0+zWAOFC8QlT
 B2ssI43Wt50scSfKi9cRCM59ir/g25en4X1FnmmKpYJNauysQoXi+qXJPN8U1N2W3Qz5VUm
 b7LLbKpUHNC2R1GYO8fiwBX6k+c/ajbclkd/HYdPm9YXUYesqTnQh5viordIhJByYJEoHgD
 yjVTQkwITP+eLo6VRiYIA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SCXY92HmNoU=;7zU6ShwCjjT3NKX7KfkxqNVJSjb
 QRUymRzT5QXpSlQE7LBes5VjpfbkTUuY64yORUBV0d+Zc2ScYbhwkEsAGe1iAwPilLHjaOXNg
 wv3mdsMPhipCNLtINOiQEW/T68X1ZnlNPRueWnUxnzTDCO8DibxL8W8l9yXRQVrkZgnfWCcIz
 Iwhk2t1139mTXy4IXCFGHduAWMrg308PUhsXUijEcKP1OK43J++sAwjJUsvGofJDvDyZln7Aj
 xOg29SAiqH9OqscKFPOlq4Zb0BCs3CTTY9EnV+yDhJtPs+kvnMlfQZnE8C00GzozRJ2uFaTWx
 HBhOjD4DPO5svrD78O7CrdJZiTfBseEYqg1v9++JOYDwgPt5t3V+78UJiiiMiLyS0B6w2ZZOv
 IPQAIbXawlb1XuMt9px+poxo350x+AA3Pex+ZgXu4lcgmZS/WCB7VkhjeK9goDKgYmqQj1p7s
 8R9nyQN5pXyi7liZCfgvX59VoZ/PZy3iJeHCPaaYWedRxMrgE3wcyIihFy03Xxo2/wsp5Bx0A
 g2VpIdJKd+DsNi2NimdJyKFxVLPeOrGpmo3UvJX63fuBYiN+ER6Up0k4nUs/J2mFJOgzNXmVf
 xYBilK92gHrNesKw2189fys4s9l9bxW/E7vZnRy6TSgcmrrBZyOlx/LVJGzItnktJKuQSI0Fo
 CGxygq5IattDScYJH80JnXnvCO20VFMYAtptT+d1r6VcchW+KvZ+ums91QDiHVAGNqaOB4FbA
 QcyUOvy80Yj0GueiA9fSHxl7TstVs+ckFulrHubyzj1Usf+RoVPnmn3sFt1I4SLFmgOPp2xyf
 Yf67koRwi6A9OmUOxfKWqOH6Zm3UwMF3hRBtlkg3A48SibDdZHnP/Sa99TS1MzEWx0HtqsmqI
 Kf/pVZdXI19nitPPhQ3S2q/OStYREeGquAV7qJHgh6hUl9E//HReYqWHZV1xNAHsX8ii2X23k
 jsH4BvyLZdMSufmIcH+SKMP5x5R2drr8f4+d6GC8Q9i3RaL1bnXRddTSpwcHmIhgJ1zUKA==

Am 23.01.24 um 05:40 schrieb Dennis Nezic:

> On 22 Jan 22:23, Dennis Nezic wrote:
>> On 22 Jan 11:44, Armin Wolf wrote:
>>> Am 22.01.24 um 08:05 schrieb Dennis Nezic:
>>>
>>>> On 21 Jan 16:16, Armin Wolf wrote:
>>>>> Am 20.01.24 um 22:39 schrieb Dennis Nezic:
>>>>>
>>>>>> On 20 Jan 21:52, Armin Wolf wrote:
>>>>>>> Am 20.01.24 um 19:58 schrieb Dennis Nezic:
>>>>>>>
>>>>>>>> Guys, the "info" illuminated touch-key (hotkey?) on my laptop "doesn't
>>>>>>>> work", showkey doesn't report any keycode or scancode. I don't see any
>>>>>>>> wmi related error messages from dmesg. All the other illuminated
>>>>>>>> "hotkeys" work fine, although confusingly evtest and "libinput
>>>>>>>> debug-events" report that they're coming through the event interface
>>>>>>>> associated with "AT Translated Set 2 keyboard" instead of "HP WMI
>>>>>>>> hotkeys", but hey, as long as I receive them I'm okay :p.
>>>>>>>>
>>>>>>>> hp-wmi.c does seem to reference it:
>>>>>>>>       { KE_KEY, 0x213b,  { KEY_INFO } },
>>>>>>>>
>>>>>>>> How can I go about troubleshooting this? (I'm using kernel 6.6.8)
>>>>>>> it can be possible that your machine does not use hp-wmi to deliver keycodes
>>>>>>> to the operating system, but instead emulates a standard keyboard controller.
>>>>>>>
>>>>>>> Can you check with "kacpimon" that events concerning a PNP0C14 device are being
>>>>>>> received?
>>>>>> Very possible indeed. "kacpimon" doesn't show anything when I press that
>>>>>> touchkey, but it does when I press all the other touchkeys. (I do get
>>>>>> lots of accelerometer noise.)
>>>>>>
>>>>> Interesting, can you please share the output of:
>>>>> - "kacpimon" while you where pressing the buttons
>>>>> - "acpidump"
>>>> ...
>>>> Input Layer:  Type: 1  Code: 325  Value: 1
>>>> Input Layer:  Type: 1  Code: 330  Value: 1
>>>> Input Layer:  Type: 1  Code: 330  Value: 0
>>>> Input Layer:  Type: 1  Code: 325  Value: 0
>>> Those events are touchscreen events, maybe your mouse is responsible for them.
>> Right, of course, woops, these must have been the touchpad press events,
>> as I was moving the mouse around :P
>>
>>> Instead they look like this:
>>>
>>> 	netlink:  9DBB5994-A997- 000000d0 00000000
>> I'm definitely not seeing anything like that, just "^Input Layer: Type"'s
>>
>>> Can you try to use kacpimon again but without root privileges? This way only netlink events show up.
>>> You might also stop acpid while you are using kacpimon.
>> 0 output from/with netlink, even though kacpimon said:
>>
>> Netlink ACPI Family ID: 24
>> Netlink ACPI Multicast Group ID: 5
>> netlink opened successfully
>>
>> Remember all my other fancy hotkeys "work", but they appear as regular
>> keypress events from an "AT Translated Set 2 keyboard".
>>
>>> If you still cannot receive any netlink events, then i might need to take a look at your ACPI tables
>>> via acpidump.
>> https://dennisn.mooo.com/stuff/dump.txt
>>
>>> Thanks,
>>> Armin Wolf
>> Thank you again sir!
> I'm not sure if this is helpful,  "dmesg | grep -i wmi" ...
>
> [    0.352634] wmi_bus wmi_bus-PNP0C14:00: [Firmware Info]: A1799AC3-9429-4529-927E-DFE13736EEBA has zero instances
> [    0.352634] wmi_bus wmi_bus-PNP0C14:00: [Firmware Info]: A1799AC5-9429-4529-927E-DFE13736EEBA has zero instances
> [    0.352634] wmi_bus wmi_bus-PNP0C14:00: [Firmware Info]: A1799ACA-9429-4529-927E-DFE13736EEBA has zero instances
> [    0.352634] wmi_bus wmi_bus-PNP0C14:01: [Firmware Info]: 8232DE3D-663D-4327-A8F4-E293ADB9BF05 has zero instances
> [    0.352634] wmi_bus wmi_bus-PNP0C14:01: [Firmware Info]: 8F1F6436-9F42-42C8-BADC-0E9424F20C9A has zero instances
> [    0.352634] wmi_bus wmi_bus-PNP0C14:01: [Firmware Info]: 8F1F6435-9F42-42C8-BADC-0E9424F20C9A has zero instances
> [    2.573231] input: HP WMI hotkeys as /devices/virtual/input/input14
>
> (Btw that "info" key does get illuminated when I touch/press it, even though no codes are seen.)

These warnings in dmesg are harmless, they are informing you that some WMI devices are unavailable.

I took a look at your ACPI tables and it seems that the WMI device used by hp-wmi is indeed unused.
What is the model name of your HP notebook?

Armin Wolf

