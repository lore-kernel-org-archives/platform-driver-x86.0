Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AFF13E028;
	Thu, 26 Dec 2024 23:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735256132; cv=none; b=UXY7h9VwxQ2Hua+HN+UNK6xHuZyfktwWxKWDybYgR2QTsZki/ZG7XmHvdw1on1/kujJtZAiNRVRshkVaUFhtMlMTGfTrxc+VjJYkGm+llc7sNKEF2LF8X3FtJCc33a29JIbuM4VbW4wJS8dDAgdLSaiHpGUfSz7rgJSn0Acktvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735256132; c=relaxed/simple;
	bh=kTw8dwxi40mwyAEUxxaW8REkNR3eCHzF6nVmWtaY38M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rc1cOUKMOpEaWyVE46hsluUIC05iIJ9Nehqmocknz9uVTD81q+zI83adwwLll2s7SyzS1AEKUyhzbsJIC/egJQY/DZsV7Pnq9y/exZg8L+KWhBMccR0QeBqfx8uI8uzt+6olf39+UHW7k7eS75hndlEvepAc40okGF52sWpZuq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=nYGzqGwh; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="nYGzqGwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735256117; x=1735860917; i=w_armin@gmx.de;
	bh=6WxTNht6X/oEf/Ah0nV63nLndWrrapZgcB+Eecghgeg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nYGzqGwho6GFOe1FbonjMpTqyIDDhNyZ+sIwCZQvD822BiS2NK/NmdQpPvi7OAz8
	 9ghVaqe8kCrJNwxi/rDAENDCh8R/3w8mJI2JuDZJruWewi0iHZ1o4BHVKjb5yf4QK
	 xzCc5njSLgZGiy9+bS2xktSuJweO2S7K6Qg+Hd1qxJAFkZnQFdQq39n0Vpw+xAccq
	 hNgUdhvhzzpzqtnMxCJgt59QolElmSSCfZNKpmxDIhlJNa6HwLYKDSvM1fdmG8gVQ
	 EA5eAV5X+wIvqqBTXsvqI4teWZa/PqbV/ji6TUZNbr64pvN7kA/4LKD2vsYKZaEcv
	 YuOahkGVXq4b4CD5kA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Wyy-1tUHIW3HzY-004iBf; Fri, 27
 Dec 2024 00:35:16 +0100
Message-ID: <2786ed04-dfaf-4098-be21-7d32719e8c6b@gmx.de>
Date: Fri, 27 Dec 2024 00:35:15 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241216103855.18457-1-josh@joshuagrisham.com>
 <13184052-baf2-4e7d-b8ef-9ba3f34d475a@t-8ch.de>
 <66897a27-5f81-46fc-898d-682456d7f37f@redhat.com>
 <CAMF+KeZ3uAWZuuPJcrrvTJS-TgyxkqXOY_w=wNw7eZQiUkV5YA@mail.gmail.com>
 <c2b5e0c8-651f-426e-ae96-13857313997a@t-8ch.de>
 <a4ad8907-34e3-4785-a62a-a1f41ddd6e1e@gmx.de>
 <CAMF+KeYEarSLRyhS1o4AA7-Uy40_v0k2Bebhjzo9yKF=2k0jQQ@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAMF+KeYEarSLRyhS1o4AA7-Uy40_v0k2Bebhjzo9yKF=2k0jQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:3epNYntH9kM/vADsiJWsu+BvYfoCmpY+MKXrfx84Em5oYu5u7n0
 GnufeoeE2mCzBDZQV0EKm4byWlHi6pdoxZc40GjuqSSZjTczUNJzO3onSlE2Cly+Z84J0ZZ
 ll3GMP69OWg9Nxt2LlblT5QShp9U33hzaO8V/A06NEPNNl8oaIm+TAB4/VANKAW2dpmcjCL
 E4Dv99ICeAVUaMeFFaDcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:f2I+lQ0dMCs=;tceHgf7GJjvr4vPT+lHMdwMzTyX
 QonFcZGExN7MMAgwmEAlbTfG2Oh2RXtOUXvoS0RWZ1uDtE0Zbp8zBGDuFAY7qD5+QOQyp6Ojw
 YXRvJnrRZHCdQCbKWYDSg7yravRg8aLBnMluIdX6qTX3wwS7y0Y2ToDu8wTQ1+wuFknS9Qt85
 5MS5pcWdTI4zKmecS8h9RygprtPm2IvQ/P7e3HGTAqOeNnjHvGlbZrg4qhhfkfjn27+L3mBJS
 1+5EqlZ7n4ZDlqD8H938Az5OKbILGVihpfFHDxbCe43RuRi76Am1UTYENAbok+G3rDJuUrY34
 qTkadHttVclJuEUFqVW5TW9nrzEFvdj+1Ee1dnDXYCMFnSwl7oJ5eUNmRXDsd/JhHQEW2TXUd
 V4eXKvJjJD2OLICnzh5fysjqoOg1hU5npP09ZNRyxBmbzDU60g7PiPLXbq1kbdEqLBsV7Q5tT
 DSESrv3DAq4MsYimpV3SWLQLOGNG+xUvvUaJHwyGCecMpymhmDollkgdlrxcbQCxfnzWq1Sez
 7LEBxaS79kfQMnPvNFL/XWMGNQbL0UPxQl69WKgQ2BdX2nBuuQgMCCHCgaPND41mbiwGFchgK
 Um2OMpN3P+O7vxOG/cErxmCFmCv/zsHd32sAvCI7s0mOjAhBDx4Zn2QCUXAhD+8Y31tzBcRWJ
 rHwgmiHsJtqVbDKWzRUcT0jHCsp5An72oDqrqeoxkUfNfC2ONYETmlHkAR3WF3jY4ntudyjCh
 LfHDeFizAbhFh3y5mkg6lcwzLChrqHFoZxJ8nkQnIZ5vnYK6jhpff8T1XH20rC7Klx7OpoN3Z
 8sV0GZ5Xs7/ZMcNEKCsIDCWRbG0m1adJDwD794ri2WcW+O1i5MTtEBN8S5Le4JJTv5NJTurXc
 P5mSZ8nzWurC6iykELmUDayHCk1CN/XMTpVpR9TAbHWUVcvO+UtQ9Edb1s2tOIB07TJCzDeEz
 /Yq7O2ISfp6Bsb8IsJSNkplrf+Nm+fMMScysPX1o4SiDNUkMl73idS6YW6sl0dPJYiQZQ4K1K
 2YGNy3t/J5ohfpeiUUCSp2Enwlj4cJ0VB6tqhp4LIg3g4rQoZFosa9jSKfcOK4I++wD1oXCFV
 Iw+e0/PNMISkYFa36bdLvSOFSJWNGE

Am 26.12.24 um 17:08 schrieb Joshua Grisham:

> Hi Armin,
>
> Den ons 25 dec. 2024 kl 21:23 skrev Armin Wolf <W_Armin@gmx.de>:
>> Harmonization with other platform driver regarding the firmware attribute names will
>> likely not result in any benefits. I am not aware of any utility profiting from such
>> a thing.
>>
> I just posted a v4 of the patch where I have moved the device sysfs
> attributes to firmware-attributes as requested by both Thomas and
> Hans. With this change, I did try to "harmonize" the names as best as
> I could anyway, recognizing that there are several device drivers in
> the tree which have actually currently implemented these as device
> sysfs attributes instead, but in theory they could be moved over to
> use the same firmware attribute instead ? e.g. all of the ones that
> have a usb_charge or usb_charging device attribute could be moved to
> use this new usb_charging firmware-attribute if it is desired at a
> later time?

Yes, but this should be done by the maintainers of those drivers. They know best how those
drivers work internally.

>
> Here were the examples I could find online for different devices that
> drove my rationale for the names that I picked:
>
> 1) and maybe easiest to start with: for what I had as
> "allow_recording" I thought would be better to change to be a "block"
> as per Samsung's own documentation and implementation, but then to
> also try and harmonize how it would be interpreted by other tools
> including this switch input event, I chose to switch this entire
> feature to the name "camera lens cover". Hopefully this is ok! The
> only "weird" thing in my opinion is that on this particular device,
> there is a side-effect that the microphone is also blocked as well
> (which is not obviously indicated by this naming, but not totally hard
> to understand, either).
>
> 2)  for what I had called "start on lid open", I found the following
> vendors with various names for the same kind of feature:
> HP: "Power On When Lid is Opened"
> Dell/Alienware: "Power On Lid Open"
> Huawei: "Auto Power On"
> Samsung Galaxy Book: "Startup when Lid is Opened"
> Lenovo: "Flip to Start"
>
> So for this, I tweaked my driver's name slightly to try and fit the
> middle ground between all of these, and went with the name
> power_on_lid_open

Sounds OK to me.

>
> 3) for what I had called "usb charge":
> Lenovo: Always On USB
> Asus: USB power delivery in Soft Off state (S5)
> Dell: USB PowerShare
> Razer: USB Charge Function
> Existing drivers for Chrome, LG, and samsung-laptop call it "USB
> Charge" (long name "USB Charge in Sleep Mode")
> Fujitsu Lifebook: "Anytime USB Charge"
> Acer: "Power-off USB Charging"
> HP: "USB Charging"
> Samsung Galaxy Book series: "USB Charging"
>
> In effort to make this as descriptive as possible and mostly fit all
> of these, I went with the name usb_charging

Sounds OK to me.

>
> All 3 of these I have added to the ABI-Testing documentation and
> removed my local documentation for them.
>
> Anyway I am hoping that all of this makes sense and helps, but please
> feel free anyone to say if I got any of this wrong :)
>
>> [...]
>>
>> Can you send me the acpidump of your machine (with the fan bug)? I can check how the
>> ACPI battery handles this case internally.
>>
> I looked further into this one as well. What I see is that the battery
> device itself actually also receives a notification when this happens
> (so 3x events are generated for the same thing on this device; a
> keypress on the keyboard device, an ACPI notification on their "SCAI"
> settings device, and an ACPI notification on the battery device
> itself), and based on what I can tell in the code in ACPI core is
> already "updating" status based on what is read from _BST from the
> battery device. I think then that the "real" problem is that my
> device's _BST is not reporting these parts correctly as per
> https://uefi.org/specs/ACPI/6.5_A/10_Power_Source_and_Power_Meter_Devices.html#bst-battery-status
> and especially in regards to the part about reporting Battery Charge
> Limiting state.
>
> So for now I have made it so that this driver will aim that the
> notification to the battery device is the one that "matters": the
> keyboard event is now filtered away, and I removed any special
> handling of the extra ACPI settings device notification (but do send
> the notification along as an ACPI netlink event in case anyone really
> wants to create their own notification or action from it). I thought
> to also try to take this one up with Samsung; though I am skeptical
> that they would fix it for existing devices like mine,  maybe it will
> help with newer or future devices! In the end it is not too big of a
> deal as the device works well, it is only the icon and status that are
> not being updated correctly.

I see, it could be that Windows does not support this charge limiting state, so vendors like Samsung
do not implement it.

Still i am OK with your approach here.

>> Thanks,
>> Armin Wolf
>>
> There are lots of other adjustments in the v4 of this patch in attempt
> to address all of the issues brought up by everyone, so everyone is of
> course welcome to take a look and see if I managed to catch everything
> or not, and I can adjust from there!

Thanks, i will take a look soon.

Armin Wolf

> Thanks again!
>
> Best regards,
> Joshua
