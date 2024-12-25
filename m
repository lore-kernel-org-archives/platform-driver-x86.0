Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4BF84A3E;
	Wed, 25 Dec 2024 20:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735158187; cv=none; b=gloqSnnRnneiD02Bfi66/36WrBf7odjd9MzpwXnXB4Venfglq6+Irm/tP9Ll/7DQPnSbax2rk6N9gOlTDAWq2bQ5UElYNGgg9sPW71HZf5W82js8rhW/hr/3WZgPTQ39QGiTV2Rhkipx0Oj0vaAp8X3SiQAV/bqwsxzLGk9sNWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735158187; c=relaxed/simple;
	bh=D50Id4GqglsJzTPRDYfYazMwBwxJjtVdRxU1xlTe6Yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W81FKgH/SFgk556Wkjp7mutmspNWpgiwiTSo0Gc/iEb1F2KT/1mIgm9S0r/CvIfwDjipwnEFoPk53n5nR2CouMo5pyu+XfaCk19v+SKtwCWRYBct2T9A7S9JZAJ960x/gqRXHECXvc0/BoiLHgUyxFOMEwSh8xqIjCICOtYjE60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=d7+axHj1; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="d7+axHj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735158171; x=1735762971; i=w_armin@gmx.de;
	bh=D50Id4GqglsJzTPRDYfYazMwBwxJjtVdRxU1xlTe6Yg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=d7+axHj1i/L6PIfbXCwsfZMRHyUBBO91C7LddOboxoFvh5e9PFb8D+J+0HR3BHb+
	 0cR4dNCga3r6/gNQK3wNOkiR4MOE3r12qgqcKEo5OIfeCo+JF7IZxop28e5yx3owv
	 7vwc76/I4WwiwOcNGwe/rUTMx9bs3XSo20LBWKFZ8vx4f8cKH8XhE7gSh4NmCOd+1
	 Hk2qLPBwf7IMiG43TgHTTL5oyORVpFXY1MRwonPtwHoglYpwztbewGBkN/fPZ1Z+G
	 T33erWfr6QY4X3eyj+otdsgBhq5MG/AFPrweNLabjV5ub13eEXTPaPOUIW54Rrz0l
	 aA3UyFZrlPWdPYIAow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.35] ([91.137.126.34]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1Obb-1tXzsW0lHH-010tkR; Wed, 25
 Dec 2024 21:22:51 +0100
Message-ID: <a4ad8907-34e3-4785-a62a-a1f41ddd6e1e@gmx.de>
Date: Wed, 25 Dec 2024 21:22:41 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Joshua Grisham <josh@joshuagrisham.com>
Cc: Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241216103855.18457-1-josh@joshuagrisham.com>
 <13184052-baf2-4e7d-b8ef-9ba3f34d475a@t-8ch.de>
 <66897a27-5f81-46fc-898d-682456d7f37f@redhat.com>
 <CAMF+KeZ3uAWZuuPJcrrvTJS-TgyxkqXOY_w=wNw7eZQiUkV5YA@mail.gmail.com>
 <c2b5e0c8-651f-426e-ae96-13857313997a@t-8ch.de>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <c2b5e0c8-651f-426e-ae96-13857313997a@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kIxQr3PyRC8TlVMJP5LmiP+X/9SyzOlJgS4C3cvIvzkwtGM2MTf
 qIIaPiIwhP1lrKsfSkS87Yt0Qttv1vATwA4TUoOGeOKSKSCckte8AymLMlmMGj/kq+uacsv
 W9QOfNEA2iriseKK4B1tQ2T5xe6+U3EL6NvrniUMVYtUjk+MuP+vB4/+MrXqycAWbjulBxy
 FQsTbZk5/N5BMNydUJ/VQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1Jm0hXpIBHM=;19Q7+rRl9iiLM9hOJzFJuhmuMLL
 nHc1JV6ybJUMoNmdOV582sOpwbJlImNNvXayhBcYWQJV92tyhQM+RVsRXvoaDxnbflFcyrNBz
 cFAPmuuomoHCESQFuN9EfowPyiq52c+DgOxEdLjgZOzOJGSDrwgucQ7RJ+lNThJPEUfFDR4jI
 X/89bzgEwzDzM//iHv43gj0jx8MNjBWgmZaMS3lUE7I98M0xv2Cn1tMYma68x/b+I3rEksPne
 hY2a2cTYXMiUKO2Yg5AhB9uGnnMDBNYsK99rWCrLfXDs2vlrIRVeb2z17aZLzipzl1TKaKq/x
 VmPSdHQIue0rN/r41DXO4s0yYOa4ZOc3I2TAkdPHg2pGIPFrrTM8ABHyhII5Mt1kUfMs+kcV1
 DZzNMefw7qQjCXDzAiY86bj4v8qoqgUujYz4uBPaq8y0o56J01dhaTfjxvgRdKSu833D8OSla
 qKSOoYCjDkFJe3e8WX9FyaQV8tQbYI+76y0Tmt/8NdUuD3sTObxYhFl+hecfzankAPzio/dj2
 b07T+8QayS1ki+bpl09UaOOKglbzL61RZOe15QhhH5v3TALnuivOqmAtEk0M2J79MrIooiaaK
 IriIvAaadDhN5f0B4WNQ1tiCnTOJ7g/HWbEcWH8xsAAafoqOHK9rx8s7Kpd5YUPkQkFW/yVSb
 /huBWgHGytlvY7ksSy4oe872wXi33EG94WVOeDzfofapmKN0XMK0bmd48aR4SBu4HD6EI1n6U
 TWmyoJM2A7xzH5pOTC81bazyqt66AW9Ra2mZS5Jq1l7N64gO+f54ocNRwTl6jj/3oQmU812kY
 qnmPzY6aGAYZGjLeLryiytrx3ZvOA3WG3xavzWBhC6uS2wxE9fqBIyYROglR/ykrQjFcLhkH2
 34oCQ9NDIt+KvBlqD2DCdVrKZ6ADTxI74hhPuT0GgQbfBF64TVtEzqwpaGid8kzvn2OOdoChZ
 JPEn6ZMLzksixWgZRMNyFvF5J3zUwzIeQIz/CFP/pYEEROQv0p1US+HVKh94cGGPzqCHrGwjO
 ysVcuorB+PbAGu+zbL+Rz9KRwM+kB6snMYS6QyMyf+W9SMA2gECkAP2SrAhP16KuhEeufGhO2
 zLcKZY8Z7nkY05wMzrgT5z7ZfUm3MK

Am 22.12.24 um 13:09 schrieb Thomas Wei=C3=9Fschuh:

> Hi Joshua,
>
> On 2024-12-19 18:31:22+0100, Joshua Grisham wrote:
>> Thank you both Thomas and Hans for your review and comments! I am
>> working on a v4 of the patch but had a few questions which I wanted to
>> clarify (they can also come after in a v5 etc in case I managed to get
>> this ready to go before anyone has the time to confirm and/or clarify
>> some things!).
> Keep them coming :-)
>
>> Den tis 17 dec. 2024 kl 15:23 skrev Hans de Goede <hdegoede@redhat.com>=
:
>>> On 16-Dec-24 5:46 PM, Thomas Wei=C3=9Fschuh wrote:
>>>>> +Various hardware settings can be controlled by the following sysfs =
attributes:
>>>>> +
>>>>> +- ``allow_recording`` (allows or blocks usage of built-in camera an=
d microphone)
>>>>> +- ``start_on_lid_open`` (power on automatically when opening the li=
d)
>>>>> +- ``usb_charge`` (allows USB ports to provide power even when devic=
e is off)
>>>> Non-standard sysfs attributes should be avoided where possible.
>>>> Userspace will need bespoke code to handle them.
>>>> This looks like it could be handled by the standard firmware_attribut=
es
>>>> interface.
>>>> This would standardize discovery and usage.
>>> Ack this really feels like firmware-attributes. I would not be surpris=
ed
>>> if there are matching BIOS settings and if changing those also changes
>>> the sysfs files and likewise if the sysfs settings persist over reboot=
.
>>>
>> Yes 2 of these (not this "allow_recording" I think) are available via
>> BIOS and all 3 of them persist over restarts.
>>
>> Just so I am 100% clear what you mean here -- these type of attributes
>> should be created using the utilities available in
>> drivers/platform/x86/firmware_attributes_class.h so that they are
>> created under the path /sys/class/firmware-attributes/*/attributes/*/
>> ?
> Yes.
>
>> What exactly should they be named (any preference?) and should I also
>> add some documentation for them in
>> Documentation/ABI/testing/sysfs-class-firmware-attributes ?
> I think they are meant to be named consistently with what the native
> UEFI setup interface calls them.
> And yes, they should be documented.
>
>> I am fairly sure I understand the concept and can agree that it kind
>> of makes a lot of sense to be able to standardize the userspace
>> interface, especially for attributes which do the exact same thing
>> across different vendors/devices (unless it just as easily possible to
>> go based on some pattern matching e.g. like is done in udev and upower
>> with "*kbd_backlight*" etc) but as of now it looks like the only
>> examples implemented are for thinklmi, dell-wmi, and hp-bioscfg that I
>> can see so far?
> The firmware-attributes don't really have a standardized semantic.
> Here the standardization is more about the discovery and interaction.
> Somebody can build a generic UI to change these settings, without the UI
> knowing anything about what the setting actually does.
>
> If the setting maps to a another, more specific interface, that should
> be used.
>
>> Before, I had tried to look through all of the various platform/x86
>> drivers and harmonize which names I picked for these sysfs attributes
>> (that is how I landed on "usb_charge" and "start_on_lid_open" as I
>> recall correctly) but I am not aware of any existing userspace tools
>> which are looking for anything like these (apart for
>> driver/vendor-specific utilities). Any recommendation from the very
>> wise people here would certainly be appreciated for these :)
> [..] Snip, I don't feel qualify to comment on the input bits.

Harmonization with other platform driver regarding the firmware attribute =
names will
likely not result in any benefits. I am not aware of any utility profiting=
 from such
a thing.

>
>> Other notifications that I am wondering what the "right" way to handle
>> / using the right interface:
> [..]
>
>> - When the battery charge control end threshold is reached, there is
>> an ACPI notification on this device as well that is the one I have
>> marked "ACPI_NOTIFY_BATTERY_STATE_CHANGED" -- the Samsung background
>> apps pop up a custom OSD that basically says something to the effect
>> that their "Battery saver is protecting the battery by stopping
>> charging" (can't remember the exact verbiage) and they change the
>> battery icon, but without doing anything else in my driver currently
>> the battery still reports state of "charging" even though it just sits
>> constantly at the percentage (and has the charging icon in GNOME etc).
>> I have seen the event come and go occasionally when I did not expect
>> it, but my working theory is that maybe it is if/when the battery
>> starts charging again if it dips too far below the target "end
>> threshold" and then notifies again when the threshold has been
>> reached. Armin also mentioned this before in a different mail; I guess
>> I would hope/expect there is an event or a function I could call to
>> have the state reflected correctly but I would not want that it
>> negatively impacts the normal behavior of charging the battery itself
>> (just that the state/icon would change would be ideal! as it functions
>> perfectly, it is just that the state and icon are not accurate).
> Optimally the ACPI event would integrate with the ACPI battery driver.
> See the handling of POWER_SUPPLY_STATUS_NOT_CHARGING in
> drivers/acpi/battery.c.
> Does the battery report the current rate as 0 when limiting?
> Then something like acpi_battery_handle_discharging() could be used.
>
>
> Thomas

Can you send me the acpidump of your machine (with the fan bug)? I can che=
ck how the
ACPI battery handles this case internally.

Thanks,
Armin Wolf

