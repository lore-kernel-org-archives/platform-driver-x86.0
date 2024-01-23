Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233675F867
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jan 2024 14:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706019751; cv=none; b=YWuDB4GwpJ3eZc0RX/UHNE7enOanadUUsdJRgMPLi6aFEGs5jGSzwQuEi8vPa3s56S1VvggdmDW8JY7tmK+vcfn04ovsIq+0Je3AHsfGEKtLVvVFYOoNhAwHq7D5Z3OabrruFprYT8aqb1aGCnBBu+vCrUAzc0AXuXxNUryOZOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706019751; c=relaxed/simple;
	bh=uSokptJl5tS3jwtfYFQD8Rq0udhFm6/aFuMrm3bBRUo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ktY0M1mPcKmuOeELx4DswpBQC7F01RiMbo9zMUY6YdG1GNADRvSvVrMUYBoHGKVpkjlm2C+n0D8snFCeHf7Att2DFoJ9odFbKKnzxij5AF2fm4c+puJrJoFRFQmTDa/UIjf8Ym1ZYf/dvR0z9mM5YgJ9NhwCOK8rIyUI7zoCEVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=emgZWZfG; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="emgZWZfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1706019741; x=1706624541; i=w_armin@gmx.de;
	bh=uSokptJl5tS3jwtfYFQD8Rq0udhFm6/aFuMrm3bBRUo=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:
	 In-Reply-To;
	b=emgZWZfG4W3KGulB5S5ifz5xXPfS/Rc/8X2flK71QdioUD/PsteJXlvXQptK1Lj8
	 Nmb/0e3J9cpo+/uBylU9B/WVydf1M0IKXB4P4hj4UrVN/a4w1Gv1HzapbxtmRVnmS
	 HrLMItiy6X9Kf9WYrqS47LuB6GsJT71Iw4viRXLpeo+mTvw8mznn9wrPrPheuP1i1
	 xULc5GxcckYs45gPduWt3Qitg7qAmsDyXQDHHJPfwzFNiGoSX/VBOS+y1aUcRQHyM
	 NkFIRFupD5lZPV/c7gkmQivIZqh95N6qEwJZqBY4V7AJ5LduPazVTPzQsncUmOVn3
	 Pv6QqMRcPXIKOH2L4w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.63.142] ([141.76.179.248]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzhnH-1rEcSi0iLB-00vdtb; Tue, 23
 Jan 2024 15:22:21 +0100
Message-ID: <3e517aa3-4020-4b29-b7b3-85271503d03d@gmx.de>
Date: Tue, 23 Jan 2024 15:22:18 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hp-wmi: info hotkey has no keycode or scancode
From: Armin Wolf <W_Armin@gmx.de>
To: Dennis Nezic <dennisn@dennisn.mooo.com>
Cc: platform-driver-x86@vger.kernel.org
References: <ZawX2mquuTCv0tuF@panther>
 <a8fa0308-0998-48e4-a104-c2b57ee9bd8e@gmx.de> <Zaw9mnfEL65B5r4O@panther>
 <e97ae805-d006-4f0c-96c0-976385772bb7@gmx.de> <Za4T0RwClHOoCPCy@panther>
 <cd86386a-653e-401c-9b70-0860d2e1906a@gmx.de> <Za8xL39m1X22f2Bb@panther>
 <Za9DQdLg2d_CnrZG@panther> <3e574768-8d5b-465b-9860-567d0845d3fb@gmx.de>
Content-Language: en-US
In-Reply-To: <3e574768-8d5b-465b-9860-567d0845d3fb@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Tq1H8rYYrTjOGSNaBvsSKqfPF6u6tfm/70H2A32GPgrIWUvAIHy
 UQ1GSKlBan/eAi7JKtKX5txmUUUyxDX7BozOCcplATbwRDBOvPefqzOa1N5mAC7+5Vohahm
 VI5Y2EMWBoFJEdM96oIpyXHU1nsPKbhQUyxatuKW3WzedoYlaOr6P3euQT4tJ+PocWkl5SQ
 XwTrNLGxcB4tjq4Y4lo4A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dAiFpe8PBDE=;VXkApG2EMocZCisvmyTvXN20Xc5
 UBNvZo3p0rR7gmeJQIW21HWRUsjga7826AENO9eJU3N4DcqRSo6fTop2IBADzEmF1bamzx0Y9
 7z3RgE1HgQmkbdEx4e2IWsA2lpZ7/NyEgHuZT0IU2MjkU+DlOu3mjHN1zTidqvwE2836qr3Uu
 x3i98+uuHqthrt1SolKUmXfoJ4RbJ8fQ/J99VJkysoNeBFTwrHTqA5cHQEjF9MZzZcZH7Ahrv
 DmJfvJVe+E+x0LqN+aBCvU8LWm7RJ3cPelnhhgMxKNoZTdKmTQ/qM32lwNx/gZ+Ehb/9ubzQ9
 ylRxeB5vYqjxFvfa/hI4+gCicsO0nwhIN+rGVhxrPzKa6+jjZS1lMBHcP8i1MefYaepLwDho6
 ObsaGfVz3VP9z+UKhZfy1tr3unYLtwtr8vg8h4M/j1+xet1r0MPFtf7jFluVFWgvF0e3As7wx
 xd2m63Q1wPu13vo5rNZSCPw/DtWddaa4K9/xDLSQspGWScg80x3l9QtoD5quuZtOB/OXYOSx2
 k4V0Jw1dONRK1Oz9SpvOpF/z3ADMQFFaT8tjl1F9qJgYbhYYh1B1qCjv4b+UPkeb0pqacbej/
 ag0bEQ8MHSsn/4dpqx9EeQHbXtzHBicbIbJmlVUkleigHwf4bp1ZKCye1FA3LMHz7xkHuUg2v
 gdUYDGdiEdKz0OyJ9NFh1Zvv19aFhqbEVYQ7CLLquOk56fltsoS5w1Kjsw8raSxFaq5WJEaOF
 N5IfyAeQvWH0wqa/09JvOX1O44ql3FAToRrSg3drasrOWspcBDrZxxMYKlexRMzxjWn6Eik11
 CvzhE7u/3vIVolSMLD8x+3mHpL2VyNUhgeWuONy4NkxM+mj1irDEvBgM4iCSLws1owBc1lP5H
 3E6pFp7v7op2BAvqLJthREB42FhP0InH3+wQ4OHyyiKBQGfY3EIwFN7QyyAnLUnVcwl3urQ0u
 KX6C3oKLQFhXGUWUggfSuRDjb9o2alrqkZUNx+Jeu5/CB1txclXNkxJmEChvZG18ZjKrKA==

Am 23.01.24 um 09:58 schrieb Armin Wolf:

> Am 23.01.24 um 05:40 schrieb Dennis Nezic:
>
>> On 22 Jan 22:23, Dennis Nezic wrote:
>>> On 22 Jan 11:44, Armin Wolf wrote:
>>>> Am 22.01.24 um 08:05 schrieb Dennis Nezic:
>>>>
>>>>> On 21 Jan 16:16, Armin Wolf wrote:
>>>>>> Am 20.01.24 um 22:39 schrieb Dennis Nezic:
>>>>>>
>>>>>>> On 20 Jan 21:52, Armin Wolf wrote:
>>>>>>>> Am 20.01.24 um 19:58 schrieb Dennis Nezic:
>>>>>>>>
>>>>>>>>> Guys, the "info" illuminated touch-key (hotkey?) on my laptop
>>>>>>>>> "doesn't
>>>>>>>>> work", showkey doesn't report any keycode or scancode. I don't
>>>>>>>>> see any
>>>>>>>>> wmi related error messages from dmesg. All the other illuminated
>>>>>>>>> "hotkeys" work fine, although confusingly evtest and "libinput
>>>>>>>>> debug-events" report that they're coming through the event
>>>>>>>>> interface
>>>>>>>>> associated with "AT Translated Set 2 keyboard" instead of "HP WM=
I
>>>>>>>>> hotkeys", but hey, as long as I receive them I'm okay :p.
>>>>>>>>>
>>>>>>>>> hp-wmi.c does seem to reference it:
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY, 0x213b,=C2=A0 { KEY_INF=
O } },
>>>>>>>>>
>>>>>>>>> How can I go about troubleshooting this? (I'm using kernel 6.6.8=
)
>>>>>>>> it can be possible that your machine does not use hp-wmi to
>>>>>>>> deliver keycodes
>>>>>>>> to the operating system, but instead emulates a standard
>>>>>>>> keyboard controller.
>>>>>>>>
>>>>>>>> Can you check with "kacpimon" that events concerning a PNP0C14
>>>>>>>> device are being
>>>>>>>> received?
>>>>>>> Very possible indeed. "kacpimon" doesn't show anything when I
>>>>>>> press that
>>>>>>> touchkey, but it does when I press all the other touchkeys. (I
>>>>>>> do get
>>>>>>> lots of accelerometer noise.)
>>>>>>>
>>>>>> Interesting, can you please share the output of:
>>>>>> - "kacpimon" while you where pressing the buttons
>>>>>> - "acpidump"
>>>>> ...
>>>>> Input Layer:=C2=A0 Type: 1=C2=A0 Code: 325=C2=A0 Value: 1
>>>>> Input Layer:=C2=A0 Type: 1=C2=A0 Code: 330=C2=A0 Value: 1
>>>>> Input Layer:=C2=A0 Type: 1=C2=A0 Code: 330=C2=A0 Value: 0
>>>>> Input Layer:=C2=A0 Type: 1=C2=A0 Code: 325=C2=A0 Value: 0
>>>> Those events are touchscreen events, maybe your mouse is
>>>> responsible for them.
>>> Right, of course, woops, these must have been the touchpad press
>>> events,
>>> as I was moving the mouse around :P
>>>
>>>> Instead they look like this:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0netlink:=C2=A0 9DBB5994-A997- 000000d0 000000=
00
>>> I'm definitely not seeing anything like that, just "^Input Layer:
>>> Type"'s
>>>
>>>> Can you try to use kacpimon again but without root privileges? This
>>>> way only netlink events show up.
>>>> You might also stop acpid while you are using kacpimon.
>>> 0 output from/with netlink, even though kacpimon said:
>>>
>>> Netlink ACPI Family ID: 24
>>> Netlink ACPI Multicast Group ID: 5
>>> netlink opened successfully
>>>
>>> Remember all my other fancy hotkeys "work", but they appear as regular
>>> keypress events from an "AT Translated Set 2 keyboard".
>>>
>>>> If you still cannot receive any netlink events, then i might need
>>>> to take a look at your ACPI tables
>>>> via acpidump.
>>> https://dennisn.mooo.com/stuff/dump.txt
>>>
>>>> Thanks,
>>>> Armin Wolf
>>> Thank you again sir!
>> I'm not sure if this is helpful,=C2=A0 "dmesg | grep -i wmi" ...
>>
>> [=C2=A0=C2=A0=C2=A0 0.352634] wmi_bus wmi_bus-PNP0C14:00: [Firmware Inf=
o]:
>> A1799AC3-9429-4529-927E-DFE13736EEBA has zero instances
>> [=C2=A0=C2=A0=C2=A0 0.352634] wmi_bus wmi_bus-PNP0C14:00: [Firmware Inf=
o]: A1799AC5-9429-4529-927E-DFE13736EEBA has zero instances
>> [=C2=A0=C2=A0=C2=A0 0.352634] wmi_bus wmi_bus-PNP0C14:00: [Firmware Inf=
o]: A1799ACA-9429-4529-927E-DFE13736EEBA has zero instances
>> [=C2=A0=C2=A0=C2=A0 0.352634] wmi_bus wmi_bus-PNP0C14:01: [Firmware Inf=
o]:
>> 8232DE3D-663D-4327-A8F4-E293ADB9BF05 has zero instances
>> [=C2=A0=C2=A0=C2=A0 0.352634] wmi_bus wmi_bus-PNP0C14:01: [Firmware Inf=
o]:
>> 8F1F6436-9F42-42C8-BADC-0E9424F20C9A has zero instances
>> [=C2=A0=C2=A0=C2=A0 0.352634] wmi_bus wmi_bus-PNP0C14:01: [Firmware Inf=
o]:
>> 8F1F6435-9F42-42C8-BADC-0E9424F20C9A has zero instances
>> [=C2=A0=C2=A0=C2=A0 2.573231] input: HP WMI hotkeys as /devices/virtual=
/input/input14
>>
>> (Btw that "info" key does get illuminated when I touch/press it, even
>> though no codes are seen.)
>
> These warnings in dmesg are harmless, they are informing you that some
> WMI devices are unavailable.
>
> I took a look at your ACPI tables and it seems that the WMI device
> used by hp-wmi is indeed unused.
> What is the model name of your HP notebook?
>
> Armin Wolf
>
>
Also i just noted that you notebook might contain a PNP0C32 quickstart but=
ton device.
Can you tell me the output of "cat /sys/bus/acpi/devices/PNP0C32\:00/statu=
s"?

Armin Wolf

