Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794758547;
	b=DL7Gz6CfFuw08+Dbcfm21hSQxQd4CVHjioLuA7sp/PvLqmjo/T+gv1qRnOSXq1yt9mGS
	 SVvEhP2oRoG0uDNyPmF5jQVbP3/uKdym2fxyiTPrC7K2y05R+byyYNzxAuRsqrZeij6/v
	 YMl92JAWp5gD1QW9UD/qAucGwHeQtWFNnUTP0/1pKygG4WlaO6EEL0de5emBVLE/EwONC
	 hrdcN+nMY5Zxx18IeuxUoglUVjYNxpiTYi2IDGxgvAM4UQuBF9NpmXO5GKlB6oqv0+X1I
	 V+KaBS0Gvoq13L/wTUOQ/0n0XnW+2uH7glZZ7klpjmKqRkIkz4IU/eRMmS5MncWc4Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794758547;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=nM7x2UUXa5QKlH7JfPiPLY7TwfG+MIbiyA7GVUMyX0k=;
	b=AhqhQIQbtajed6Xi+aLNLYViexywLGKa7ppCJW0DZvojPk/6SrOmT9RfN7jHpZu/dc0b
	 CIKHE8XimyYFXhNBmYmVCCu2gwTeP3+xMV1oFcML2yc4ilDL76ORe8flOLYxaE7DiW91K
	 e0KliFHX+T/VC6rBW5cwfznOQo2sIIidmSDO1LPpndu4QGkWxXSJceG2N3wdpVfWSNYDC
	 NXsguKkNBwdtmEsWWOaONFMM0oNDnSjZMg8PftWB78+hKwml94Dhn4iQeydqQ5fSu27Ze
	 SRiPbIoH2mHqm6NnDdfZgp+O1Xr73LLNauhz/XbQS36AM9E4DeAlJlKLiii1YPlp0aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=l28JSU+G;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096B7606A327
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Nov 2026 16:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 096B7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=l28JSU+G
DKIM2-Signature:  i=1; m=1; t=1794758545;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:UIxNiRCQfcwDZadSKdG77vWVJHUl
   UhtrkaAY6q5PQotympjI6ZCQJH+Pw0tulJC8zqnie6jmmaIR0ocDAKAguSMUw5TSEj3DYjkhQf3
   Nh+sAlRTExwpQeft6kx5ucDc+1DyPt2mUZMn8ekCRdfE5DTtAdP/2AOeW8hSjYiP1r7xwhKV+oN
   HDMkSlrDPdVKsjwz0AewrGOZQ4qC/ptBKForXLGqTFfoWOA4i10bpyiDDxUWhk565Hd2gjbeaLn
   ThTxTJKLC960cxLUcySsrT7yFVoz2Dkm5PuOnoal/MTSTypzuxvB6XUke+xPoTzgY1Js+EVo530
   xjtXuDY8AJYGmg==;
Message-Instance:  m=1;
 h=sha256:
   +7Kdf4BuEmoizioB2tKpqcJoEdvsceopj2WZXuNdVqs=:
   uw/KdFqdUGSPWqqc4fGNAsonyOwr/rkdwEe1areWce4=,
  sha512:
   NDRBi90taUhyps3LtseldV9SrObhOTqgO/noXa36bAHjGeErOZtjZBSAzjpcqYoe7SjfjRXnF3IAqRjr/EyDEA==:
   imfLycxbRrE8s6gK1z+ljItjvBwjgtyMZPiKb/e5QGkxjpYhFRj9736Lpk2WnjiPqjHh/7cXumAFmT3A5t3ddA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794758538; x=1795363338; i=w_armin@gmx.de;
	bh=nM7x2UUXa5QKlH7JfPiPLY7TwfG+MIbiyA7GVUMyX0k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=l28JSU+GhSzK0E0acwzTGUkdjYonvQ34OGLhtaEUEAOOkziQmhA95wpIayop54lx
	 9LB49VfKjapONo4/PvYas8kb23oY9k1BodnYP/nlnjs0p37CliuEIa9UbdoMhcnTt
	 DyRDTdboBuaF+RXz9pns88Lq6qxmkyCOwgtGtnkKj6GEZVadkP7nDWzHNZeIDX0Fg
	 26xrtkQz51VAsQXd0jw4PquwYmScvUaOFYMF/HF3RuD2XfgGt4ekup3tFe0GEjSHM
	 NM2cnRKgFqpf1l68DrDnaSBc+QNGNal7r4TnvtjaZKX8DojpzeKYBwc/heGcDeq8P
	 HLmasymuXUnhXWmX0w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsHns-1wZyam2NdC-00vcpW; Sun, 15
 Nov 2026 17:02:18 +0100
Message-ID: <8f6eee63-a0f0-4c16-a622-310e695fe7a5@gmx.de>
Date: Sun, 15 Nov 2026 17:02:16 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] platform: lenovo: architecture independent home
 for the Lenovo WMI drivers
To: Hans de Goede <hansg@kernel.org>, David Cemin <dcemin@nvidia.com>,
 ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, xy-jackie@139.com,
 ikepanhc@gmail.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, ldemarchi@nvidia.com
References: <20261113222755.1696567-1-dcemin@nvidia.com>
 <e8cef61a-2864-4749-a734-3c42c2f32f28@kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <e8cef61a-2864-4749-a734-3c42c2f32f28@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:tRFR4M58qQ03awalCbiQ9KZK/ulxFYdYt2JwxkgFspOu5a6ULsw
 lK+t/OGnh2zdteyxXRWtjUfzz1df9OeJJ9hOU7CUzxM0rbws/vVZor+9H9wWAMkzgwxidYX
 bstTPTj7vNpQGlWqWkRJXZ5FP8O1kIq7Usxsh/XLGMTL6aWD6FGv7otyWkasCD0h68Ryt3F
 cTqbkR8UzyANJDlOVVpLQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YnHFS6n6/YM=;9RQ/fdcBWOfYoKln2Ch6iRKpkZ+
 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

Am 15.11.26 um 16:33 schrieb Hans de Goede:

> <sorry for any double-send (first reply incomplete) Thunderbird has a new Ctrl+s send
>   shortcut which I sometimes fat-finger when copy/pasting>
>
> Hi,
>
> On 13-Nov-26 23:27, David Cemin wrote:
>> Lenovo now ships ACPI based arm64 laptops whose firmware exposes the
>> same ACPI-WMI interfaces as the x86 IdeaPad and Legion machines: the Fn
>> key event GUID consumed by ideapad-laptop, the hotkey utility GUID used
>> for the microphone mute LED, and the GameZone, Other Mode and capability
>> data GUIDs behind the thermal operation modes. Since 884d53763d30
>> ("platform/wmi: Remove dependency on CONFIG_X86") the ACPI-WMI core
>> builds on arm64, but the Lenovo WMI drivers still live under
>> drivers/platform/x86, which is gated by X86_PLATFORM_DEVICES, so none of
>> that code can be used where the firmware is.
>>
>> This series:
>>    1. moves the architecture independent Lenovo WMI drivers into a new
>>       drivers/platform/lenovo directory, following drivers/platform/surface
>>       which exists for the same reason (Surface ships x86 and arm64);
>>       ideapad-laptop, thinkpad_acpi, think-lmi and the Yoga tablet drivers
>>       stay under x86 because they need i8042, port I/O or x86 only devices;
>>    2. adds a small WMI hotkeys driver for the Fn key event GUID on machines>      where ideapad-laptop cannot bind;
>>    3. makes ideapad-laptop's own WMI event driver decline the GUIDs when
>>       the IdeaPad VPC device is absent, since it can never report events
>>       there.
>>
>> Patch 2 was tested on a Lenovo Yoga 9 2-in-1 16 (arm64): microphone
>> mute, airplane mode, the Smart Key, the Smart Connect key and the Fn+Q
>> operation mode key all report input events. The same key set is dead on
>> a Lenovo Yoga Pro 9 (arm64) today and uses the same GUID.
>> Patches 1 and 3 are compile tested on x86_64 and arm64 (defconfig plus
>> all LENOVO_WMI options as modules).
>>
>> Two questions I would like the maintainers' view on before this goes
>> further:
>>
>>    a. Is a vendor directory (drivers/platform/lenovo, like surface) the
>>       right home, or should the architecture independent Lenovo WMI
>>       drivers move under drivers/platform/wmi next to the core instead?
> I think that drivers/platform/lenovo makes sense since eventually we may
> want more then just WMI drivers, e.g. the thinkpad_acpi driver which
> actually sort of works on Qualcomm Snapdragon laptops when booting these
> with my experimental DT-ACPI hybrid mode patches:
>
> https://github.com/jwrdegoede/linux-sunxi/commits/acpi-dt-hybrid-v0.4/

Agreed, the drivers/platform/wmi directory should only contain core WMI
infrastructure code and maybe some generic drivers like wmi-bmof.

>>    b. Should the Fn key event handling stay a separate small driver, or
>>       be factored out of ideapad-laptop so x86 and arm64 share one path?
>>       ideapad-laptop handles the event only when its VPC platform driver
>>       is bound, and the arm64 machines expose none of the VPC interface
>>       it is built on (no _CFG, VPCR/VPCW, DYTC or HALS/SALS), so making
>>       it the single driver means gating most of its probe. Two smaller
>>       options: lift ideapad-laptop's own Fn key wmi_driver and keymap
>>       into this file and let ideapad-laptop register for the events it
>>       still wants (Fn lock LED, DYTC cycle), or the hid-asus/asus-wmi
>>       shape where a companion WMI module exports the event to a
>>       subsystem driver. The keymap in patch 2 duplicates entries of
>>       ideapad-laptop's table on purpose until that is decided.
> IIRC the ideapad-laptop driver is a bit of a mess atm, so factoring
> a common handling for the the Fn key events out of this and sharing
> that sounds like a nice cleanup.
>
> I see that patch 2/3 uses the new wmi-driver/-bus infra which is
> nice and clean.
>
> So maybe just keep your existing stand-alone driver for both x86_64 +
> arm64 and drop the WMI event handling from ideapad-laptop.
>
> I guess this may hit some problems where WMI event handlig is used
> in ideapad-laptops integrating with some VPC functionality.
>
> For that purpose I think that the new
> drivers/platform/lenovo/wmi-hotkeys.c could maybe expose some
> notifier and call that for events it does not handle itself
> and then ideapad-laptop can depend on some function to register
> a listener on that notifier (1) and register a notifier handler
> staying out of WMI handling itself.
>
> No idea if this is feasible / how clean the end result will be,
> just brainstorming and saying yes to doing some refactoring of
> the somewhat messy ideapad-laptop code.
>
> Note that https://github.com/systemd/systemd/blob/main/hwdb.d/60-keyboard.hwdb
> has some mappings for "Ideapad extra buttons" input devices
> (+ DMI match), so if any of the buttons remapped there end up
> under the new WMI driver then that should probably give its
> input device the same name, to make sure those mappings still
> apply.
>
> Regards,
>
> Hans

I like the idea of using a notifier to allow ideapad-laptop to consume WMI
events from wmi-hotkeys. This would even allow ideapad-laptop to override the
sparse keymap inside wmi-hotkeys by simply returning NOTIFY_STOP when "catching"
an WMI event that has to be handled internally (like event 0x3D (Performance Key)).
wmi-hotkeys can check for this return value and not emit a key code in such a case.

Thanks,
Armin Wolf

>
> 1) +Kconfig dep, which will also avoid regressions by wrong
> Kconfig
>
>> Patch 2 declines to bind when the IdeaPad VPC device (VPC2004) is
>> present, so machines handled by ideapad-laptop keep it; patch 3 is the
>> mirror on the ideapad-laptop side. The new MAINTAINERS entry uses
>> platform-driver-x86, the list that already covers drivers/platform/arm64,
>> the ACPI-WMI core and the other Lenovo WMI drivers.
>>
>>
>> David Cemin (3):
>>    platform: lenovo: move the architecture independent WMI drivers out of
>>      x86
>>    platform: lenovo: add WMI hotkeys driver
>>    platform/x86: ideapad-laptop: do not bind the WMI event devices
>>      without the VPC
>>
>>   MAINTAINERS                                   |   9 +-
>>   drivers/platform/Kconfig                      |   2 +
>>   drivers/platform/Makefile                     |   1 +
>>   drivers/platform/lenovo/Kconfig               | 101 ++++++++++++
>>   drivers/platform/lenovo/Makefile              |  23 +++
>>   .../platform/{x86 => }/lenovo/wmi-camera.c    |   0
>>   .../platform/{x86 => }/lenovo/wmi-capdata.c   |   0
>>   .../platform/{x86 => }/lenovo/wmi-capdata.h   |   0
>>   .../platform/{x86 => }/lenovo/wmi-events.c    |   0
>>   .../platform/{x86 => }/lenovo/wmi-events.h    |   0
>>   .../platform/{x86 => }/lenovo/wmi-gamezone.c  |   0
>>   .../platform/{x86 => }/lenovo/wmi-helpers.c   |   0
>>   .../platform/{x86 => }/lenovo/wmi-helpers.h   |   0
>>   .../{x86 => }/lenovo/wmi-hotkey-utilities.c   |   0
>>   drivers/platform/lenovo/wmi-hotkeys.c         | 151 ++++++++++++++++++
>>   drivers/platform/{x86 => }/lenovo/wmi-other.c |   0
>>   drivers/platform/x86/lenovo/Kconfig           |  67 --------
>>   drivers/platform/x86/lenovo/Makefile          |   7 -
>>   drivers/platform/x86/lenovo/ideapad-laptop.c  |   8 +
>>   19 files changed, 294 insertions(+), 75 deletions(-)
>>   create mode 100644 drivers/platform/lenovo/Kconfig
>>   create mode 100644 drivers/platform/lenovo/Makefile
>>   rename drivers/platform/{x86 => }/lenovo/wmi-camera.c (100%)
>>   rename drivers/platform/{x86 => }/lenovo/wmi-capdata.c (100%)
>>   rename drivers/platform/{x86 => }/lenovo/wmi-capdata.h (100%)
>>   rename drivers/platform/{x86 => }/lenovo/wmi-events.c (100%)
>>   rename drivers/platform/{x86 => }/lenovo/wmi-events.h (100%)
>>   rename drivers/platform/{x86 => }/lenovo/wmi-gamezone.c (100%)
>>   rename drivers/platform/{x86 => }/lenovo/wmi-helpers.c (100%)
>>   rename drivers/platform/{x86 => }/lenovo/wmi-helpers.h (100%)
>>   rename drivers/platform/{x86 => }/lenovo/wmi-hotkey-utilities.c (100%)
>>   create mode 100644 drivers/platform/lenovo/wmi-hotkeys.c
>>   rename drivers/platform/{x86 => }/lenovo/wmi-other.c (100%)
>>
>>
>> base-commit: 2800868f63227c8237d70c41e70d441c919620d6
