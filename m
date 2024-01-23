Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD9A82D82
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jan 2024 19:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706039899; cv=none; b=hLtswwLzXz9yJUt0sbJ3Z5XoHY2+hHj9btofMyItADwg7QoE331Nx2ES0Ex8oBPyrfQubcPa1/ekWqVeGj6gwL/ZreXdrzjKfzVjDtmgGF0rigm/VW5MJlSzoeEBXTu0qrVjTxuuCqXumhFvsOlh2l1cmMAIeAlZd4nAIF14O40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706039899; c=relaxed/simple;
	bh=83eO4YdNEd8lCw5C2Ie4w55Az/wOzxqpXh5MSTL0TTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7sUorwM908a1XA6xMmVAvgy88IN+a4AeYF9vqjgAI814sRcQp8fxsWgnCqcoWRXIZRysk2tesTQDGMXlvumz5CkRI5xB/nUT2NL9OsUJZxRO0/PX7SzGcVwYxA/mEaAtCkqssdUIl3AtheDfF2VTb8yZzvKmtSmB2GDFU6RAIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ZcYHKmqj; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ZcYHKmqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1706039889; x=1706644689; i=w_armin@gmx.de;
	bh=83eO4YdNEd8lCw5C2Ie4w55Az/wOzxqpXh5MSTL0TTU=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=ZcYHKmqjcZGQGfKSbC7bo7B4PBg6P1dTczOahwaF53bxZN1Fe8CZyGIoNT2vXqKT
	 0awnwc9coIdkD9giLEx+cr8Vap92zyF5yDf88MQro/r/sXK+rpm25Jzmh08ej3Ufv
	 4tARtvRcS5uTWWP1i8LGqVK4zLwfXHMJgIMwX1J78AKPYMB0sV4oYv7P3KKP/p97M
	 alO35CXtayndjqnsvcLkDJ7l1+UygoLC1W9yUvJbOE2hyYJFaBp3zPo30n6aRiQFs
	 ZU2p5XkbjgKGsNjXuoCcqDZPWa3HjDx3cxniN47NJKJr/fobV/QZpRkewN5/yZbpp
	 i41/YRYuVf6E7Jcu/w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.35] ([91.137.126.34]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwwZd-1r9Zfe0NQp-00yRDB; Tue, 23
 Jan 2024 20:58:09 +0100
Message-ID: <57df06ee-3aa1-4501-9dc6-a7bc57d770be@gmx.de>
Date: Tue, 23 Jan 2024 20:58:07 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hp-wmi: info hotkey has no keycode or scancode
To: Hans de Goede <hdegoede@redhat.com>,
 Dennis Nezic <dennisn@dennisn.mooo.com>
Cc: platform-driver-x86@vger.kernel.org
References: <ZawX2mquuTCv0tuF@panther>
 <a8fa0308-0998-48e4-a104-c2b57ee9bd8e@gmx.de> <Zaw9mnfEL65B5r4O@panther>
 <e97ae805-d006-4f0c-96c0-976385772bb7@gmx.de> <Za4T0RwClHOoCPCy@panther>
 <cd86386a-653e-401c-9b70-0860d2e1906a@gmx.de> <Za8xL39m1X22f2Bb@panther>
 <Za9DQdLg2d_CnrZG@panther> <3e574768-8d5b-465b-9860-567d0845d3fb@gmx.de>
 <3e517aa3-4020-4b29-b7b3-85271503d03d@gmx.de> <Za_Xss52DlydJOOO@panther>
 <e53a660b-f766-479c-8507-ffe25ca0e26e@redhat.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <e53a660b-f766-479c-8507-ffe25ca0e26e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:FzN3efDjNRuuGGIlNgomrWGUsVAcIqYsBPbJ6xjBNt3/XqUtTBX
 dTh11VYcEVNGvtfojzHdOfkGovSis2X8+fBaClaIJk+GRFom6qLzphf6Avxwv3I4XZ0mlYb
 NwpK6Dw+LXMuLBerl1fKXNz7vWRRUR0uC+32tCHvgwmlaggnYjVtToAvnLgxh1xUsO3QM4i
 qJ+X0MuMcimqTrTTGZ/XQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0zH4wZcIvDM=;xUNHsv2GyVVO5qeZ989i19bi0cG
 yUJH1j52bapi/0Rzf17tw2aDfUH9+DDN/4yvZUwwR5FXK54FZgW3/v6fobiavSRykVzby+7vK
 iOyyc59IBslvp8mb2PZQbDoYVPB9GFjKt0DT2e11peUuPobqh8bRZ2AsPN1UmN0GYTUyTvFM8
 ciGLSHvHNd9SKMC2joXUSbDUq9FADyfuLq6EYZL569iF9UGFeDn0RHs6ZgWI2N70w0NMZR/0F
 5+5xlKX6VtHnAML3zRLisJsSvv9VmV9TtOw8wlQpo/opKlPeW+uuCtiMO8Et1oWbV0L9Rjdft
 IwlWVmShtLIPoIopaJHTpHJcYrEl/or80bS/HRuA2EKT6zvsySn6OQ6iRCPpAXmL6FuirX4nh
 z3UXXx11b7wtm6h+W91Ry79qV//9MNR71bdxbwFQFdP/mwUnEEldenx8ww5SGjYpVXhuLDXnD
 REA2tQIS3N6SBlgGlD2KSOuZ1F6/aypSV9wQEOHBSnK5LxE0knW8Wjm/7ADH8vah9RgudRT/8
 v92vWsASzRTJ+jCBZD4EXtSAjkqyMFzhkL05jGQpKKhzhTGyFVBOMBpkMyRUcKT6EzRZ48VVh
 nEoulbZFQlI8jEjMXDXcJ//0V/3cMEumtGx999au6kqQ/tRzDKdai/L9ms208tU9+uBkYcrFa
 OvoaQXfFZx05xqa7uLGdoZoHtaWKcsFVzcZniwnRsZL/vceg556DCsYa9y4e044gdf50ZwAEi
 Ww5chr9U+QpdFNrg4Tv88N4wXl4SqCZwwwZZEc6PQilGXYt30y2qcUMn/PU7i004K122Jz0pZ
 LPy6e0D8SjqBWrkJuQhvbptuzLHHJ2sAiAWdIp2WaBX9czYI9c8dcTUXc4uc19JeHk6tb8SBf
 FykBZ25fB7+f+bDefLddCCKmCxrempvPBSOzrLugQ8qtOGw2C0LYIf3G95hme9gkL61R8z3al
 tinBzEIiyVV9i5ICKV2ilF4emtRchQfXyri8GdvV6FZR2EG99YuJtM9Wei7g/FYTqMdPZQ==

Am 23.01.24 um 16:34 schrieb Hans de Goede:

> Hi,
>
> On 1/23/24 16:13, Dennis Nezic wrote:
>> On 23 Jan 15:22, Armin Wolf wrote:
>>> Am 23.01.24 um 09:58 schrieb Armin Wolf:
>>>
>>>> Am 23.01.24 um 05:40 schrieb Dennis Nezic:
>>>>
>>>>> On 22 Jan 22:23, Dennis Nezic wrote:
>>>>>> On 22 Jan 11:44, Armin Wolf wrote:
>>>>>>> Am 22.01.24 um 08:05 schrieb Dennis Nezic:
>>>>>>>
>>>>>>>> On 21 Jan 16:16, Armin Wolf wrote:
>>>>>>>>> Am 20.01.24 um 22:39 schrieb Dennis Nezic:
>>>>>>>>>
>>>>>>>>>> On 20 Jan 21:52, Armin Wolf wrote:
>>>>>>>>>>> Am 20.01.24 um 19:58 schrieb Dennis Nezic:
>>>>>>>>>>>
>>>>>>>>>>>> Guys, the "info" illuminated touch-key (hotkey?) on my laptop
>>>>>>>>>>>> "doesn't
>>>>>>>>>>>> work", showkey doesn't report any keycode or scancode. I don't
>>>>>>>>>>>> see any
>>>>>>>>>>>> wmi related error messages from dmesg. All the other illuminated
>>>>>>>>>>>> "hotkeys" work fine, although confusingly evtest and "libinput
>>>>>>>>>>>> debug-events" report that they're coming through the event
>>>>>>>>>>>> interface
>>>>>>>>>>>> associated with "AT Translated Set 2 keyboard" instead of "HP WMI
>>>>>>>>>>>> hotkeys", but hey, as long as I receive them I'm okay :p.
>>>>>>>>>>>>
>>>>>>>>>>>> hp-wmi.c does seem to reference it:
>>>>>>>>>>>>
>>>>>>>>>>>> How can I go about troubleshooting this? (I'm using kernel 6.6.8)
>>>>>>>>>>> it can be possible that your machine does not use hp-wmi to
>>>>>>>>>>> deliver keycodes
>>>>>>>>>>> to the operating system, but instead emulates a standard
>>>>>>>>>>> keyboard controller.
>>>>>>>>>>>
>>>>>>>>>>> Can you check with "kacpimon" that events concerning a PNP0C14
>>>>>>>>>>> device are being
>>>>>>>>>>> received?
>>>>>>>>>> Very possible indeed. "kacpimon" doesn't show anything when I
>>>>>>>>>> press that
>>>>>>>>>> touchkey, but it does when I press all the other touchkeys. (I
>>>>>>>>>> do get
>>>>>>>>>> lots of accelerometer noise.)
>>>>>>>>>>
>>>>>>>>> Interesting, can you please share the output of:
>>>>>>>>> - "kacpimon" while you where pressing the buttons
>>>>>>>>> - "acpidump"
>>>>>>>> ...
>>>>>>> Those events are touchscreen events, maybe your mouse is
>>>>>>> responsible for them.
>>>>>> Right, of course, woops, these must have been the touchpad press
>>>>>> events,
>>>>>> as I was moving the mouse around :P
>>>>>>
>>>>>>> Instead they look like this:
>>>>>>>
>>>>>> I'm definitely not seeing anything like that, just "^Input Layer:
>>>>>> Type"'s
>>>>>>
>>>>>>> Can you try to use kacpimon again but without root privileges? This
>>>>>>> way only netlink events show up.
>>>>>>> You might also stop acpid while you are using kacpimon.
>>>>>> 0 output from/with netlink, even though kacpimon said:
>>>>>>
>>>>>> Netlink ACPI Family ID: 24
>>>>>> Netlink ACPI Multicast Group ID: 5
>>>>>> netlink opened successfully
>>>>>>
>>>>>> Remember all my other fancy hotkeys "work", but they appear as regular
>>>>>> keypress events from an "AT Translated Set 2 keyboard".
>>>>>>
>>>>>>> If you still cannot receive any netlink events, then i might need
>>>>>>> to take a look at your ACPI tables
>>>>>>> via acpidump.
>>>>>> https://dennisn.mooo.com/stuff/dump.txt
>>>>>>
>>>>>>> Thanks,
>>>>>>> Armin Wolf
>>>>>> Thank you again sir!
>>>>> A1799AC3-9429-4529-927E-DFE13736EEBA has zero instances
>>>>> 8232DE3D-663D-4327-A8F4-E293ADB9BF05 has zero instances
>>>>> 8F1F6436-9F42-42C8-BADC-0E9424F20C9A has zero instances
>>>>> 8F1F6435-9F42-42C8-BADC-0E9424F20C9A has zero instances
>>>>>
>>>>> (Btw that "info" key does get illuminated when I touch/press it, even
>>>>> though no codes are seen.)
>>>> These warnings in dmesg are harmless, they are informing you that some
>>>> WMI devices are unavailable.
>>>>
>>>> I took a look at your ACPI tables and it seems that the WMI device
>>>> used by hp-wmi is indeed unused.
>>>> What is the model name of your HP notebook?
>> HP Compaq 8710p
>>
>>> Also i just noted that your notebook might contain a PNP0C32 quickstart button device.
>>> Can you tell me the output of "cat /sys/bus/acpi/devices/PNP0C32\:00/status"?
>> 15
> Interesting.
>
> There have been several attempts to add support for this
> in the past. The last one being:
>
> https://lore.kernel.org/platform-driver-x86/20220922182424.934340-1-lkml@vorpal.se/
>
> Note that in this case this also required some vender
> specific poking in toshiba_acpi to get things to work.
>
> I see that the HP Compaq 8710p is about the same vintage
> as the Toshiba Z830 on which the last attempt to do
> something about the quick start buttons was done.
>
> So this might very well explain the missing button issue.
>
> Regards,
>
> Hans
>
I can try to upstream the necessary changes. But i cannot test the changes concerning the toshiba_acpi driver.
Would it be ok if i omit those changes?

Dennis, can you check that your device runs the latest BIOS? And if this is not the case, could you do a BIOS
update and send me an updated acpidump?

The reason for this is that currently, the button device receives only system wake events, but no button press
events during runtime. Maybe this is a BIOS bug, although this could also be intentional (fancy power button).

Armin Wolf

