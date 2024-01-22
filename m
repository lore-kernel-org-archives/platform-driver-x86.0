Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303DB3A1D6
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 10:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705920277; cv=none; b=Z9LXXQNsZ/U3ABjvHeHECLpUeVG93UOsHgj5He/ucjbH9tspX2m9tH3tGKt/18mOF4QGNGZdReelGta/icGlLxA+OOzJYp9kRM2jzqGo5ThiFHbMYTWSyXzVuYHegjhO7Cx3LKZ49tn8TbD9RpzetgsVtCGN6WjWYq3gUYgjo5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705920277; c=relaxed/simple;
	bh=1Hv1v1pB6O5VK3pA+8PodADdgo5ZXOfnstg5Gc8qLFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgTM4o+vgimMoozA2rQnzSwR7NqQxRLymaieGNIpF8780/Hl59DLB2oZAj3rT+oOWXWZbZu66DPeE8YK+1oT+Fd1xxzeaQfuCvPdFHjS/3QPPLTFTSd1Vs/2KTm3D5FIk4lFKAnsDd6brKJZptRL/20ArZ7gqucMovg88RYnk48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=LrdR1Fe4; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="LrdR1Fe4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1705920270; x=1706525070; i=w_armin@gmx.de;
	bh=1Hv1v1pB6O5VK3pA+8PodADdgo5ZXOfnstg5Gc8qLFQ=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=LrdR1Fe4IDE+5BJp5L/gIP2Wv/WslgaSEAqHyNqvflq0pdB0/IJhWHVTX3Vewj/L
	 WS6g9P2z02NfsM4N6EHYwu+K7FuhBjNev+ka4UmoV65nZhH7FBJzjx9nEgJ7s9J0p
	 TjVIpTCqbfPn8QMhPacSE1mlXr3+dVED6X9sLZ4PNn0GtcMePgwbeS+dzojAm5uch
	 JhIp+d/YumYB6zjBpWgbPalz8Byb95R/MdMC6Wm4D3MZr9LJQb3+uzSpyCJP1YMUj
	 TUvnv2LVKnlREJjNL0fNbEM1xprFSA6pmKJH6iC1gru+E3hBmcXLAoeS77frvJW+Y
	 FKJ5r/lOLS21NwS00A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.35] ([91.137.126.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMXUD-1ri0xm3xA7-00JZxx; Mon, 22
 Jan 2024 11:44:30 +0100
Message-ID: <cd86386a-653e-401c-9b70-0860d2e1906a@gmx.de>
Date: Mon, 22 Jan 2024 11:44:28 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hp-wmi: info hotkey has no keycode or scancode
To: Dennis Nezic <dennisn@dennisn.mooo.com>
Cc: platform-driver-x86@vger.kernel.org
References: <ZawX2mquuTCv0tuF@panther>
 <a8fa0308-0998-48e4-a104-c2b57ee9bd8e@gmx.de> <Zaw9mnfEL65B5r4O@panther>
 <e97ae805-d006-4f0c-96c0-976385772bb7@gmx.de> <Za4T0RwClHOoCPCy@panther>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <Za4T0RwClHOoCPCy@panther>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:G4yjIr89DPfhbF+SSHAivGD8uB/4zvWGn3yB2WeoOAaJmQOwCHt
 Dhb9DZzPdFjw3+Q7OurNHo5ZL2gyyu7EwLf1sD7EecV/3hYYYmUo5fygbppTlMIqN9Nvnha
 R0qGE6nYPrXKHMFOMRPU4ATs4VkmqI9+n5CVnT1akeBeB8N4Q2ygfAgkiLA4aETW9gOtW0M
 pql+W2XJcNOuqCqZ/r3Lg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9CgnBDIoskM=;gDmkZ6cZwo4BPvXt3S60NtEau1n
 7GHLar1ntPbQEiz6yacsJqZwFLJIjxGRofgJN4duD7JcKD+j2qKOOEi4ZGvfIjyliJlLgO+7k
 GwGjYeafWMJCsporBZZXA2GlueGlcOT1S6+loT+jmTZafJxV+/ooYNPiuDgGtRgbLoAlhYuip
 D5Ngngo2dP9SUWc60cnfmZNnJBpxtg+6sKNLuT/96bpe+bxqN2QPnot68KFKnC+Zr5jDRbc9g
 2LSlZvOLLdnyLj3Xqoy3T9Trph4uFfJ9YMFHQDT3G3N4+KPEtrBqDv4uS/g76LxHQ/t0W11FO
 /GwVaBcODrFsMHvFyM7O0PZMQc4yPvW8SNlfFy09fWiBHFfppdwMHcVruJGrtD9lHrGVieVq8
 lFaBmlNye/1XVih14s2RqeXe1C/kcnrfJVOf9haJxMLOdx6pWdtuTzxG2JTB0SvyB1Nu0eL0Q
 wOTZN7IYbWwD98X2NZ2qDTyVsjMkcasz30xbRxKrJMm5lXxSB4TCHrFLutv5JfF4vLHCdaJx8
 LXCX+HxppMj36WXI6+XEiVchZQzdninNPEwEQNNjSP17AevUrS8qkrRIIJOuGbFVe7H7xmsll
 0I3t7PfHj7dv8KmtydtjTtIfAnfv/7z+7BnfS9aA5Q6QjDygMXgdU1QqdQzqhw1tBzeyvmjwY
 O9rbwRpkZicqEvXfS6OR3LcF9+ZkAzqgY27GdDXnmB02rN5ggVsfbkUYXJa/5kv0o5rWBsXhv
 BxeTVIMkF56Pcx8O3mwK9cBxQUoFWOBnBSwT5zlpX9BUedcvcjGEMuRO9nbIoEGt8fReM0bhI
 FK6weTXOXoWf0W+S1exF+7LpL86bvtTzAyMsawE+n6P0WBSopsxbw3mLMiGD2RSMIrGwogcP4
 mCApRhA5XHCtzXFB/nBJ8yFXGd/4ZI9H6Y3IW7ktCvLFqeXjdBTgpTg2fL6meDSQN5q8NWpDs
 UFkihLjbduNaCOP9K4kxfk02slE=

Am 22.01.24 um 08:05 schrieb Dennis Nezic:

> On 21 Jan 16:16, Armin Wolf wrote:
>> Am 20.01.24 um 22:39 schrieb Dennis Nezic:
>>
>>> On 20 Jan 21:52, Armin Wolf wrote:
>>>> Am 20.01.24 um 19:58 schrieb Dennis Nezic:
>>>>
>>>>> Guys, the "info" illuminated touch-key (hotkey?) on my laptop "doesn't
>>>>> work", showkey doesn't report any keycode or scancode. I don't see any
>>>>> wmi related error messages from dmesg. All the other illuminated
>>>>> "hotkeys" work fine, although confusingly evtest and "libinput
>>>>> debug-events" report that they're coming through the event interface
>>>>> associated with "AT Translated Set 2 keyboard" instead of "HP WMI
>>>>> hotkeys", but hey, as long as I receive them I'm okay :p.
>>>>>
>>>>> hp-wmi.c does seem to reference it:
>>>>>      { KE_KEY, 0x213b,  { KEY_INFO } },
>>>>>
>>>>> How can I go about troubleshooting this? (I'm using kernel 6.6.8)
>>>> it can be possible that your machine does not use hp-wmi to deliver keycodes
>>>> to the operating system, but instead emulates a standard keyboard controller.
>>>>
>>>> Can you check with "kacpimon" that events concerning a PNP0C14 device are being
>>>> received?
>>> Very possible indeed. "kacpimon" doesn't show anything when I press that
>>> touchkey, but it does when I press all the other touchkeys. (I do get
>>> lots of accelerometer noise.)
>>>
>> Interesting, can you please share the output of:
>> - "kacpimon" while you where pressing the buttons
>> - "acpidump"
> Actually I was finally able to detect something via kacpimon, but it was
> elusive, and it's scaring me now! It wouldn't immediately show on live
> stdout (the way the other touch-hotkeys, and normal keys, do), and I
> even had trouble seeing it when trying to redirect stdout to a file!
> Ctrl-C'ing would prematurely truncate the output, sometimes not
> capturing it, even the more graceful Escape-exit wouldn't capture it
> unless I waited or padded it with mouse movements. Ie. there is some
> very weird delay going on, and maybe repetition, or something.
>
> For example, I swear I only touched that info key 5 times here, and then
> AFTERWARDS pressed the 'A' key twice, and then Esc. grep'ing for
> 'Type: 1' I was able to catch:
>
> Input Layer:  Type: 1  Code: 28  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 30  Value: 1
> Input Layer:  Type: 1  Code: 30  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 30  Value: 1
> Input Layer:  Type: 1  Code: 30  Value: 0
> Input Layer:  Type: 1  Code: 1  Value: 1
>
> A more weird example, again I *swear* I first only touched that info key
> *5* times, and then moved the mouse for a few seconds between 2 'A' key
> presses, and finishing with Escape, but although it showed the two 'A'
> key events properly, it also showed *11* "code 325" and 11 "code 330"
> value1 events, out of order!?

Those events are touchscreen events, maybe your mouse is responsible for them.

>
> Input Layer:  Type: 1  Code: 28  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 30  Value: 1
> Input Layer:  Type: 1  Code: 30  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 30  Value: 1
> Input Layer:  Type: 1  Code: 30  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 1
> Input Layer:  Type: 1  Code: 330  Value: 0
> Input Layer:  Type: 1  Code: 325  Value: 0
> Input Layer:  Type: 1  Code: 1  Value: 1
>
> (Thank you for your guidance btw! Will an acpidump still be necessary?)

I have to apologize, the events send by ACPI WMI to kacpimon do not contain a "PNP0C14" string
or the name WMI at all.

Instead they look like this:

	netlink:  9DBB5994-A997- 000000d0 00000000

Can you try to use kacpimon again but without root privileges? This way only netlink events show up.
You might also stop acpid while you are using kacpimon.

If you still cannot receive any netlink events, then i might need to take a look at your ACPI tables
via acpidump.

Thanks,
Armin Wolf

