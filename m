Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794756805;
	b=o904tLwxn6g2Dz6ZZ8vdvrI1uQO+ScX42t+aRsPNpm/AxN37mRnr3nLWU1WjoKFsECt5
	 d/5rx6sTWH+c0h3zw/gkX7FpH2uVmjxAz+hWRUgiCWa1tigaOovWDFelPCSX+Lq2pTr78
	 7oAlniOS+AFd5SnKVUaDu9xKT+zWOU7uM1AHZJKC1QLMW1rt/xfZhAYpo+3Ey6Vd0f0XW
	 HMMFyc5S8kCYgZaPn07dNJApll75r9Q1Pb45WIvFncNeHavDEex3zcbovbgv1DoUDnOuU
	 CM7GNLpe6E/hPSeSN+txfzn1Y3lG2gO99qncEqVdTSGDanokXyA4RSdB3T37sob568w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794756805;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7ZIVhTCxyNIPtpIntkKvM4bJDiDCZk9NqCLuk3NLq4k=;
	b=P+rx5M3DV0yvU7aJW29niFv0MJEBn509IeSJFjY8R1zbz6rvtmSnEVMWxP5Ll3kckJdr
	 xQqrgvF/Fy8Cb6+YPSAna3QM0N6p4DNUCfTrg37cQZhiVgaVR91WxeMJsx34hz0LZLR4f
	 ummjR6Tw27/VEL5ho20NmGZXLEjOL8R11UbkFGMBna5yC3OsQSJiCPPS2XQ4d1Y15Gm2o
	 fCNAv1kD+S4xuVo4dF6hXNKqgVLAo9S804FaQPJ8Z4pPlzhv6DmB31VHSFCVX6N0+hh07
	 Ed/IlZ9tQOvn4MQvwbNUgedXDO3falmgM6Iv0Fy1jHW/DoSov8Eled7w9DHGauAl4ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=enlHlSU5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BB5606A31E;
	Sun, 15 Nov 2026 15:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=enlHlSU5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1928C1F000C4;
	Sun, 15 Nov 2026 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794756805;
	bh=7ZIVhTCxyNIPtpIntkKvM4bJDiDCZk9NqCLuk3NLq4k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=enlHlSU5QVeAh2k5Fs2/B4rwLe5ou99IJfku+4jP+6VMTzUNdX9OGampMcumNR0CT
	 9L3FXFu1Gf23V3wlL8NbDti31Mw7ibbMnLubx+AH/fSHT5IdMVhe6n50O03yjaobjX
	 713bsE1OQH/IkhvXeK29KvcuqMJYqneo6SyFoeldZsRE2dSCR6Ufflfgx3mso+y724
	 22U/lEXzGjIpah8/nRDnnhcauYHuNYgNitWbgpg+ao/sTupGvpSUX2LOBSNUOx0vEl
	 j7/3fQ1ip5OYpZ40Xn3NDt6NHKBG/hwnBCnc+3oaNUgAJQFYY63Sb9Se/29ik4RqfF
	 IRL8d9YZHeFcA==
Message-ID: <e8cef61a-2864-4749-a734-3c42c2f32f28@kernel.org>
Date: Sun, 15 Nov 2026 16:33:22 +0100
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
To: David Cemin <dcemin@nvidia.com>, ilpo.jarvinen@linux.intel.com,
 W_Armin@gmx.de
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, xy-jackie@139.com,
 ikepanhc@gmail.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, ldemarchi@nvidia.com
References: <20261113222755.1696567-1-dcemin@nvidia.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261113222755.1696567-1-dcemin@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

<sorry for any double-send (first reply incomplete) Thunderbird has a new Ctrl+s send
 shortcut which I sometimes fat-finger when copy/pasting>

Hi,

On 13-Nov-26 23:27, David Cemin wrote:
> Lenovo now ships ACPI based arm64 laptops whose firmware exposes the
> same ACPI-WMI interfaces as the x86 IdeaPad and Legion machines: the Fn
> key event GUID consumed by ideapad-laptop, the hotkey utility GUID used
> for the microphone mute LED, and the GameZone, Other Mode and capability
> data GUIDs behind the thermal operation modes. Since 884d53763d30
> ("platform/wmi: Remove dependency on CONFIG_X86") the ACPI-WMI core
> builds on arm64, but the Lenovo WMI drivers still live under
> drivers/platform/x86, which is gated by X86_PLATFORM_DEVICES, so none of
> that code can be used where the firmware is.
> 
> This series:
>   1. moves the architecture independent Lenovo WMI drivers into a new
>      drivers/platform/lenovo directory, following drivers/platform/surface
>      which exists for the same reason (Surface ships x86 and arm64);
>      ideapad-laptop, thinkpad_acpi, think-lmi and the Yoga tablet drivers
>      stay under x86 because they need i8042, port I/O or x86 only devices;
>   2. adds a small WMI hotkeys driver for the Fn key event GUID on machines>      where ideapad-laptop cannot bind;
>   3. makes ideapad-laptop's own WMI event driver decline the GUIDs when
>      the IdeaPad VPC device is absent, since it can never report events
>      there.
> 
> Patch 2 was tested on a Lenovo Yoga 9 2-in-1 16 (arm64): microphone
> mute, airplane mode, the Smart Key, the Smart Connect key and the Fn+Q
> operation mode key all report input events. The same key set is dead on
> a Lenovo Yoga Pro 9 (arm64) today and uses the same GUID.
> Patches 1 and 3 are compile tested on x86_64 and arm64 (defconfig plus
> all LENOVO_WMI options as modules).
> 
> Two questions I would like the maintainers' view on before this goes
> further:
> 
>   a. Is a vendor directory (drivers/platform/lenovo, like surface) the
>      right home, or should the architecture independent Lenovo WMI
>      drivers move under drivers/platform/wmi next to the core instead?

I think that drivers/platform/lenovo makes sense since eventually we may
want more then just WMI drivers, e.g. the thinkpad_acpi driver which
actually sort of works on Qualcomm Snapdragon laptops when booting these
with my experimental DT-ACPI hybrid mode patches:

https://github.com/jwrdegoede/linux-sunxi/commits/acpi-dt-hybrid-v0.4/

>   b. Should the Fn key event handling stay a separate small driver, or
>      be factored out of ideapad-laptop so x86 and arm64 share one path?
>      ideapad-laptop handles the event only when its VPC platform driver
>      is bound, and the arm64 machines expose none of the VPC interface
>      it is built on (no _CFG, VPCR/VPCW, DYTC or HALS/SALS), so making
>      it the single driver means gating most of its probe. Two smaller
>      options: lift ideapad-laptop's own Fn key wmi_driver and keymap
>      into this file and let ideapad-laptop register for the events it
>      still wants (Fn lock LED, DYTC cycle), or the hid-asus/asus-wmi
>      shape where a companion WMI module exports the event to a
>      subsystem driver. The keymap in patch 2 duplicates entries of
>      ideapad-laptop's table on purpose until that is decided.

IIRC the ideapad-laptop driver is a bit of a mess atm, so factoring
a common handling for the the Fn key events out of this and sharing
that sounds like a nice cleanup.

I see that patch 2/3 uses the new wmi-driver/-bus infra which is
nice and clean.

So maybe just keep your existing stand-alone driver for both x86_64 +
arm64 and drop the WMI event handling from ideapad-laptop.

I guess this may hit some problems where WMI event handlig is used
in ideapad-laptops integrating with some VPC functionality.

For that purpose I think that the new
drivers/platform/lenovo/wmi-hotkeys.c could maybe expose some
notifier and call that for events it does not handle itself
and then ideapad-laptop can depend on some function to register
a listener on that notifier (1) and register a notifier handler
staying out of WMI handling itself.

No idea if this is feasible / how clean the end result will be,
just brainstorming and saying yes to doing some refactoring of
the somewhat messy ideapad-laptop code.

Note that https://github.com/systemd/systemd/blob/main/hwdb.d/60-keyboard.hwdb
has some mappings for "Ideapad extra buttons" input devices
(+ DMI match), so if any of the buttons remapped there end up
under the new WMI driver then that should probably give its
input device the same name, to make sure those mappings still
apply.

Regards,

Hans


1) +Kconfig dep, which will also avoid regressions by wrong
Kconfig

> 
> Patch 2 declines to bind when the IdeaPad VPC device (VPC2004) is
> present, so machines handled by ideapad-laptop keep it; patch 3 is the
> mirror on the ideapad-laptop side. The new MAINTAINERS entry uses
> platform-driver-x86, the list that already covers drivers/platform/arm64,
> the ACPI-WMI core and the other Lenovo WMI drivers.
> 
> 
> David Cemin (3):
>   platform: lenovo: move the architecture independent WMI drivers out of
>     x86
>   platform: lenovo: add WMI hotkeys driver
>   platform/x86: ideapad-laptop: do not bind the WMI event devices
>     without the VPC
> 
>  MAINTAINERS                                   |   9 +-
>  drivers/platform/Kconfig                      |   2 +
>  drivers/platform/Makefile                     |   1 +
>  drivers/platform/lenovo/Kconfig               | 101 ++++++++++++
>  drivers/platform/lenovo/Makefile              |  23 +++
>  .../platform/{x86 => }/lenovo/wmi-camera.c    |   0
>  .../platform/{x86 => }/lenovo/wmi-capdata.c   |   0
>  .../platform/{x86 => }/lenovo/wmi-capdata.h   |   0
>  .../platform/{x86 => }/lenovo/wmi-events.c    |   0
>  .../platform/{x86 => }/lenovo/wmi-events.h    |   0
>  .../platform/{x86 => }/lenovo/wmi-gamezone.c  |   0
>  .../platform/{x86 => }/lenovo/wmi-helpers.c   |   0
>  .../platform/{x86 => }/lenovo/wmi-helpers.h   |   0
>  .../{x86 => }/lenovo/wmi-hotkey-utilities.c   |   0
>  drivers/platform/lenovo/wmi-hotkeys.c         | 151 ++++++++++++++++++
>  drivers/platform/{x86 => }/lenovo/wmi-other.c |   0
>  drivers/platform/x86/lenovo/Kconfig           |  67 --------
>  drivers/platform/x86/lenovo/Makefile          |   7 -
>  drivers/platform/x86/lenovo/ideapad-laptop.c  |   8 +
>  19 files changed, 294 insertions(+), 75 deletions(-)
>  create mode 100644 drivers/platform/lenovo/Kconfig
>  create mode 100644 drivers/platform/lenovo/Makefile
>  rename drivers/platform/{x86 => }/lenovo/wmi-camera.c (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-capdata.c (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-capdata.h (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-events.c (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-events.h (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-gamezone.c (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-helpers.c (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-helpers.h (100%)
>  rename drivers/platform/{x86 => }/lenovo/wmi-hotkey-utilities.c (100%)
>  create mode 100644 drivers/platform/lenovo/wmi-hotkeys.c
>  rename drivers/platform/{x86 => }/lenovo/wmi-other.c (100%)
> 
> 
> base-commit: 2800868f63227c8237d70c41e70d441c919620d6

