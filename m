Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765752;
	b=d5W5QuD5VwijpQoJQv8YX22YceSQPgHo7FDBHTz9T3Uc+RvtE8UDOZtz+nbzVbRH0L5H
	 /ZBVLL5ez/wznY4+kR+JDHdPWMsaSusMDc8nSO2Pte9stC56eoXN+XL9VhHXWja/OscPr
	 YG79rl8RWhOcoPtfuaadlebwHEDpuDFGoz4eGlVR7LIPj/viKTCY7yAsS00XXTylGyqcO
	 wxp+jo2hEQilFHoyszueozSTNiXmA8oElPCv5yacQwQkO1F1RLS1VnQ34mcLNUpQX5lQL
	 ELfFFuYYLFgjpFRbfE+jLn+uG0+4okI3g7gr3h+aafsAH1Xm4Mn5J54QV0NgHwmE8Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765752;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=bGUvCNwOyhlg4c1ooaZecAH9izpaNsFVB2oGdDFZw8s=;
	b=aQRQbUgTuqgSPsXA9MURrySAmKChcwusSG2U1ima3/51cmWdtZnMxN5+Flm1eBTzOMHr
	 u+rSJ2pWRO72tsdaEbLd9qG19Wrun8Ix4kVyaNaMXP0LPMX6Q5TJktInwsaNdngGexnKm
	 HqbgSKtMDGaZrSh3Hept+1uVR7CuMGEw7urpJBdKjq+x6SngmKhGG+QDYq2UP+wadDz5l
	 40YrkMsByzEyq6/GZYr4P87MNI86fg20NqOzUSNsi/Iq/Md+YWA78qgl91cnXvVaL/lY8
	 s/hJ4GNMrRA2UhtUWxW+c4Ww7w5UrQALXAVSIbBlNw5z4UqfTT3qRg47eox0mK9T7TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a7N5QY5P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66494606A31D;
	Sun, 15 Nov 2026 18:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a7N5QY5P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16721F000C9;
	Sun, 15 Nov 2026 18:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794765752;
	bh=bGUvCNwOyhlg4c1ooaZecAH9izpaNsFVB2oGdDFZw8s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=a7N5QY5PBMM0HjL1GkeLZrL8hTFUkXwxKmP2ORiG3P5I9dP0hp8kM1hlaOroqOYqT
	 rdKfEeM09IBw57YT/v3LEcBYi0T8Prh06WvAC0RwRsnTH3qmOXgBXlNblI2Ritlp0/
	 qn41bseJoXG/8gBM2Kux7MjzxoxhP5zJG/hQKryX27nIamCWao4JM5Qpq2xDcn3z/T
	 LrOSw2c6rkZfUzTZHvA/WDt9QT/pAYaFBJ/PXbt76YqdOiVh+OzFXiL7CqgGxYcnKq
	 drZWYXh2PFJbwFEqMB7K6vw9vffjGwLjvUxzXcvtIDXYg2sErx/6ssLmPsBibAqnEt
	 7sVdYrTmIQ8vw==
Message-ID: <26f44428-80fe-4533-aeda-5cbf11b90de9@kernel.org>
Date: Sun, 15 Nov 2026 19:02:27 +0100
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
To: Armin Wolf <W_Armin@gmx.de>, David Cemin <dcemin@nvidia.com>,
 ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, xy-jackie@139.com,
 ikepanhc@gmail.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, ldemarchi@nvidia.com
References: <20261113222755.1696567-1-dcemin@nvidia.com>
 <e8cef61a-2864-4749-a734-3c42c2f32f28@kernel.org>
 <8f6eee63-a0f0-4c16-a622-310e695fe7a5@gmx.de>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <8f6eee63-a0f0-4c16-a622-310e695fe7a5@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 15-Nov-26 17:02, Armin Wolf wrote:
> Am 15.11.26 um 16:33 schrieb Hans de Goede:
> 
>> <sorry for any double-send (first reply incomplete) Thunderbird has a new Ctrl+s send
>>   shortcut which I sometimes fat-finger when copy/pasting>
>>
>> Hi,
>>
>> On 13-Nov-26 23:27, David Cemin wrote:
>>> Lenovo now ships ACPI based arm64 laptops whose firmware exposes the
>>> same ACPI-WMI interfaces as the x86 IdeaPad and Legion machines: the Fn
>>> key event GUID consumed by ideapad-laptop, the hotkey utility GUID used
>>> for the microphone mute LED, and the GameZone, Other Mode and capability
>>> data GUIDs behind the thermal operation modes. Since 884d53763d30
>>> ("platform/wmi: Remove dependency on CONFIG_X86") the ACPI-WMI core
>>> builds on arm64, but the Lenovo WMI drivers still live under
>>> drivers/platform/x86, which is gated by X86_PLATFORM_DEVICES, so none of
>>> that code can be used where the firmware is.
>>>
>>> This series:
>>>    1. moves the architecture independent Lenovo WMI drivers into a new
>>>       drivers/platform/lenovo directory, following drivers/platform/surface
>>>       which exists for the same reason (Surface ships x86 and arm64);
>>>       ideapad-laptop, thinkpad_acpi, think-lmi and the Yoga tablet drivers
>>>       stay under x86 because they need i8042, port I/O or x86 only devices;
>>>    2. adds a small WMI hotkeys driver for the Fn key event GUID on machines>      where ideapad-laptop cannot bind;
>>>    3. makes ideapad-laptop's own WMI event driver decline the GUIDs when
>>>       the IdeaPad VPC device is absent, since it can never report events
>>>       there.
>>>
>>> Patch 2 was tested on a Lenovo Yoga 9 2-in-1 16 (arm64): microphone
>>> mute, airplane mode, the Smart Key, the Smart Connect key and the Fn+Q
>>> operation mode key all report input events. The same key set is dead on
>>> a Lenovo Yoga Pro 9 (arm64) today and uses the same GUID.
>>> Patches 1 and 3 are compile tested on x86_64 and arm64 (defconfig plus
>>> all LENOVO_WMI options as modules).
>>>
>>> Two questions I would like the maintainers' view on before this goes
>>> further:
>>>
>>>    a. Is a vendor directory (drivers/platform/lenovo, like surface) the
>>>       right home, or should the architecture independent Lenovo WMI
>>>       drivers move under drivers/platform/wmi next to the core instead?
>> I think that drivers/platform/lenovo makes sense since eventually we may
>> want more then just WMI drivers, e.g. the thinkpad_acpi driver which
>> actually sort of works on Qualcomm Snapdragon laptops when booting these
>> with my experimental DT-ACPI hybrid mode patches:
>>
>> https://github.com/jwrdegoede/linux-sunxi/commits/acpi-dt-hybrid-v0.4/
> 
> Agreed, the drivers/platform/wmi directory should only contain core WMI
> infrastructure code and maybe some generic drivers like wmi-bmof.
> 
>>>    b. Should the Fn key event handling stay a separate small driver, or
>>>       be factored out of ideapad-laptop so x86 and arm64 share one path?
>>>       ideapad-laptop handles the event only when its VPC platform driver
>>>       is bound, and the arm64 machines expose none of the VPC interface
>>>       it is built on (no _CFG, VPCR/VPCW, DYTC or HALS/SALS), so making
>>>       it the single driver means gating most of its probe. Two smaller
>>>       options: lift ideapad-laptop's own Fn key wmi_driver and keymap
>>>       into this file and let ideapad-laptop register for the events it
>>>       still wants (Fn lock LED, DYTC cycle), or the hid-asus/asus-wmi
>>>       shape where a companion WMI module exports the event to a
>>>       subsystem driver. The keymap in patch 2 duplicates entries of
>>>       ideapad-laptop's table on purpose until that is decided.
>> IIRC the ideapad-laptop driver is a bit of a mess atm, so factoring
>> a common handling for the the Fn key events out of this and sharing
>> that sounds like a nice cleanup.
>>
>> I see that patch 2/3 uses the new wmi-driver/-bus infra which is
>> nice and clean.
>>
>> So maybe just keep your existing stand-alone driver for both x86_64 +
>> arm64 and drop the WMI event handling from ideapad-laptop.
>>
>> I guess this may hit some problems where WMI event handlig is used
>> in ideapad-laptops integrating with some VPC functionality.
>>
>> For that purpose I think that the new
>> drivers/platform/lenovo/wmi-hotkeys.c could maybe expose some
>> notifier and call that for events it does not handle itself
>> and then ideapad-laptop can depend on some function to register
>> a listener on that notifier (1) and register a notifier handler
>> staying out of WMI handling itself.
>>
>> No idea if this is feasible / how clean the end result will be,
>> just brainstorming and saying yes to doing some refactoring of
>> the somewhat messy ideapad-laptop code.
>>
>> Note that https://github.com/systemd/systemd/blob/main/hwdb.d/60-keyboard.hwdb
>> has some mappings for "Ideapad extra buttons" input devices
>> (+ DMI match), so if any of the buttons remapped there end up
>> under the new WMI driver then that should probably give its
>> input device the same name, to make sure those mappings still
>> apply.
>>
>> Regards,
>>
>> Hans
> 
> I like the idea of using a notifier to allow ideapad-laptop to consume WMI
> events from wmi-hotkeys. This would even allow ideapad-laptop to override the
> sparse keymap inside wmi-hotkeys by simply returning NOTIFY_STOP when "catching"
> an WMI event that has to be handled internally (like event 0x3D (Performance Key)).
> wmi-hotkeys can check for this return value and not emit a key code in such a case.

Ah yes, I was thinking about only calling the notifier after not finding
an entry in the sparse keymap, but calling it before allowing notifier
handlers to return NOTIFY_STOP and filter out further processing is
a good idea.

Regards,

Hans


