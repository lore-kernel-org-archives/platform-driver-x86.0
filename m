Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FA84EB857;
	Tue, 22 Sep 2026 20:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109600; cv=none; b=OJnFAxIhOKGa8gQcx4jO8hY2jV8ouJp4s7ZQPxwypSkT8UuM/u6iXlFsvCbcqpXERX06kmGxss507+rveLkg5ehCWQ63gz9TTiXwlRS75e1/+013qfy+hszL3qLJsqc3XEjURZw8Iww5HndrtBBki22HQcNR0BTIbK7ICOqtJoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109600; c=relaxed/simple;
	bh=rESqC3fKGZolef9S8p4wJRNAPhvnjhtARRqOj+H5zCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqjsenfzEbftVeu3T5d7NzAn8W+4+1FTmfgvVkkePb2SU94iuvkVJcZbpTu3haRLt58OaOPPFdBb4HE4YXdGUnmno+S7HxS+SlkRCh1AHB3SM2ATYp4bJiJ1wyjbi4PiTJSGEs4dJaIy69U9ZuZB9siO9Cc2ir0L/hc5GkjjNz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=sRhQEpP7; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="sRhQEpP7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790109580; x=1790714380; i=w_armin@gmx.de;
	bh=PYQ7rVglOAFupxoXihRzqwusaL1MgyeSy4sN82ebuv4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=sRhQEpP767fuFwxPJm3NgfDL3sdmZ7UNyY95gT6Gc5KmePSdGnDtGgIwVKAOqROv
	 i13HHtPfoIzhWIAytWbzh7XXtg558PTGOiLDsU+uFiDzrCdjD09uom+jvCvA26Yap
	 tvkDV1ljD6FC18J+3UubRcf0/EIIA5OTkwHlwNiaW8vRt1by+1+TqxNxT/Pe64WTX
	 344bbjptwbbf40gBNBKNL+1oXJxu6BRnFXDz3anYU0JLd+Ht7H7+21veH2PfVH3F1
	 wSHkHbIs7Zq8pPLhwAWlWUqQWIiHsQw+vOAI/GayvOpXWspRixsQcms7HVzsSOFKF
	 xCqnQYYiLM59jzel6g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7Jza-1x82Pg2EGK-006t3x; Tue, 22
 Sep 2026 22:39:40 +0200
Message-ID: <12e24501-8f0c-49ce-b440-fbf661cd9a41@gmx.de>
Date: Tue, 22 Sep 2026 22:39:37 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BBUG=5D_Redmi_Book_Pro_14_2024_=28TM2307=29=3A_fa?=
 =?UTF-8?Q?ns_never_spin_under_Linux_=E2=80=94_root_cause=3A_EC_gates_fan_en?=
 =?UTF-8?Q?gine_on_OSTP_byte_=28tested_workaround=29?=
To: =?UTF-8?B?6auYIOS/iuaWhw==?= <btx342@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 qby140326@gmail.com, ilpo.jarvinen@linux.intel.com, hansg@kernel.org
References: <CAL-my2=5V8Pk+R+aAoJ556-DFR-B0wnMLckRNDbAohdZvB15+Q@mail.gmail.com>
 <2d5d8f5d-2672-4a4e-b9ab-53ad49d4c212@gmx.de>
 <CAL-my2n6+GW_=eQS+v0u0kFqFRCRt28UAEig-8rF30XzO8rLXA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAL-my2n6+GW_=eQS+v0u0kFqFRCRt28UAEig-8rF30XzO8rLXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D04JDAxrR/yNN+6zQdsvOo8Dq41fpu8ZlDD+vH+Ex6BZQpmXpXV
 cZO5s8+fKsCn6dl0Z5Bj0dZKnYWHYQH4hAREhJRRifukDox0/T/wUG+F6pUmrNzYFypYzyA
 9XpwqjeDv/gyw2Am4uO77cmBT1P4CtnT0a7fhmng35TDM5ld3VcT/rieA4GpO3U4Y5zYYUf
 ovj6162Gp1Vn/PWVkPetg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:J5Mhyaqcz/c=;xQv8XYS4flkuiulFLEsURQ58D1f
 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
 ig/y75P7PBM=

Am 16.09.26 um 12:10 schrieb =E9=AB=98 =E4=BF=8A=E6=96=87:

> Hi Armin,
>
> Thanks for looking at this. Answers to your two questions first, then a
> correction to my original report that your questions prompted =E2=80=94 =
you were
> right to be suspicious, though it is not a probe failure on this unit.
>
>> what is the output of "cat /sys/bus/acpi/devices/PNP0C09:*/status"?
>    15
>
> (single EC: PNP0C09:00 under \_SB.PC00.LPCB)
>
>> Can you share the output of "dmesg"?
> Attached, captured on the current boot (kernel 7.2.5-3-omarchy; the
> original report was on 7.2.3, same behavior). EC-relevant excerpt:
>
>    ACPI: EC: EC started
>    ACPI: EC: interrupt blocked
>    ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
>    ACPI: \_SB_.PC00.LPCB.Q_EC: Boot DSDT EC used to handle transactions
>    ACPI: EC: interrupt unblocked
>    ACPI: EC: event unblocked
>    ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
>    ACPI: EC: GPE=3D0x6e
>    ACPI: \_SB_.PC00.LPCB.Q_EC: Boot DSDT EC initialization complete
>    ACPI: \_SB_.PC00.LPCB.Q_EC: EC: Used to handle transactions and event=
s
>    input: Lid Switch as .../0000:00:1f.0/PNP0C09:00/PNP0C0D:00/input/inp=
ut0
>
> The EC driver probes and binds fine here: PNP0C09:00 has a physical
> platform device bound to the acpi-ec driver, there is no ECDT (the EC is
> DSDT-only), and EC transactions demonstrably work at runtime (BAT0 _BST
> reports live voltage/energy/serial; the lid switch and GPE 0x6e events
> work). The only ACPI errors in the log are unrelated _PLD/_UPC failures
> in the XHCI/TXHC hubs (AE_AML_TOO_FEW_ARGUMENTS in a RUCC helper).
>
> Your other concern =E2=80=94 that any firmware attempt to access the EC =
would
> error out =E2=80=94 does not apply to this board, and chasing it down ex=
posed a
> real mistake in my original report:
>
> 1) No AML anywhere in our tables (DSDT + all 27 SSDTs) uses EC address
>     space. All 308 OperationRegions are 242 SystemMemory, 50 PCI_Config,
>     14 SystemIO, 2 SystemCMOS. The EC's data surface for AML is a plain
>     SystemMemory window:
>
>       OperationRegion (ERAM, SystemMemory, 0xFE0B0300, 0x0100)
>
> 2) Consequence: Q_EC._REG can never execute for an EC-space connect,
>     because no EC-space region object exists for ACPICA to fire it on =
=E2=80=94
>     on any OS. The OSYS->OSTP mapping inside _REG is dead code (vendor
>     cruft from a reference design). Q_EC._INI sets ECAV=3D1 when
>     _REV>=3D2, and all methods proceed through the ERAM window instead.
>
> 3) I misread the window layout in my report. The iasl field layout is:
>
>       Offset (0x60): QFAN, 8
>       Offset (0x62): SCFG (0x62), HBPF (0x63), PCMD (0x64), OSTP (0x65)
>
>     The byte I called "OSTP" (0x64) is actually declared "PCMD" in the
>     vendor AML =E2=80=94 and PCMD is referenced by no AML method anywher=
e. The
>     real OSTP at 0x65 already reads 6 at every Linux boot with no help
>     from us (pre-fix dumps: 0x64=3D0x00, 0x65=3D0x06), so it is written =
by
>     the EC/UEFI firmware itself, not by AML.
>
> 4) Corrected root cause: the EC's autonomous fan engine is gated on
>     ERAM+0x64 ("PCMD"), which nothing ever sets under Linux. The
>     original experiment stands with cleaner isolation than I realized:
>     with OSTP (0x65) already 6 the whole time, control load runs stay
>     fan-silent; writing 6 to 0x64 engages the engine and the fans follow
>     the EC's own temperature curve; QFAN (0x60)=3D4 forces full speed.
>     That one-byte write has been running as a boot+resume oneshot since
>     2026-09-15 and the machine behaves exactly like the Windows side.
>
> So on this unit the EC driver is healthy, and "replicate the _REG
> OSYS mapping" (my original proposal) would be the wrong fix =E2=80=94 _R=
EG
> never runs on this platform regardless of OS. The open question is
> narrower now: who sets ERAM+0x64 under Windows? Not AML (no
> references on any OS), so presumably EC-internal logic or an SMI
> path (there is an event-driven one: _Q35 writes 0xC2 to the port-0xB2
> SMI port). If Milo=C5=A1 (dual-boot) could dump ERAM 0x60..0x6C from
> Windows =E2=80=94 or even just byte 0x64 at idle and under load =E2=80=
=94 that would
> pin down what state the EC expects to see.
>
> Happy to test any patch. If a quirk approach is still wanted, the
> effective workaround is "write ERAM+0x64=3D6 at boot/resume", not
> "replicate _REG". Full acpidump and the raw ERAM dumps available any
> time.
>
> Transparency note: the ACPI analysis, the experiments, and this email
> were prepared by an AI coding agent (Claude Code running the GLM 5.3
> Flash model) working on this machine. To be honest, I still find much
> of the ACPI detail confusing myself =E2=80=94 what I can vouch for first=
hand
> is the hardware behavior: the fans were always silent under Linux, and
> after the one-byte write they spin and track the load exactly like on
> Windows. For anything deeper than that, please ask and I will relay
> it to the agent.
>
> Thanks,
> dista

Did you install and enable thermald? Your device uses the Intel Thermal Fr=
amework,
so you will need thermald for proper thermal management.

Thanks,
Armin Wolf

> On Wed, Sep 16, 2026 at 5:47=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Am 15.09.26 um 14:09 schrieb =E9=AB=98 =E4=BF=8A=E6=96=87:
>>
>>> Hi,
>>>
>>> This follows up on the report from Milo=C5=A1 Vlku about the Redmi Boo=
k Pro 14
>>> 2024 (TM2307), where the fans never spin under Linux although the same
>>> hardware works fine under Windows:
>>>
>>> https://lkml.iu.edu/hypermail/linux/kernel/2608.1/13832.html
>>>
>>> We have now root-caused the problem on an identical machine (second
>>> TM2307,
>>> Core Ultra 7 155H) and have a one-byte, experimentally verified
>>> workaround.
>>> Summary: the EC only runs its autonomous fan engine when the OSTP "OS
>>> type"
>>> byte in its shared memory window indicates a detected host OS. Under
>>> Windows
>>> the DSDT _REG handler writes OSTP=3D6; under Linux nothing writes it, =
OSTP
>>> stays 0, and the EC never spins the fans. All OS-side fan paths (MIFS =
WMI
>>> fan functions, ACPI PNP0C0B fans) are separately broken on this board,=
 so
>>> fans are unreachable from Linux even at 100 degC.
>>>
>> Nice work, what is the output of "cat /sys/bus/acpi/devices/PNP0C09:*/s=
tatus"?
>> Can you share the output of "dmesg"?
>>
>>> Machine / software
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>>    DMI: XIAOMI / Redmi Book Pro 14 2024 / TM2307
>>>    CPU: Intel Core Ultra 7 155H (Meteor Lake-H)
>>>    BIOS: XIAOMI RMAMT4B0P0A0A (06/04/2024)
>>>    Kernel: 7.2.3-arch1-3 (bitland-mifs-wmi incl. d3666875c75e)
>>>
>>> Symptoms (all verified)
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>>    - Fans physically never spin under Linux, even with the package at
>>>      101 degC for minutes (verified by microphone recording: no acoust=
ic
>>>      change; user-confirmed silence; multiple independent load tests).
>>>    - hwmon (bitland_mifs): fan1/2/3_input always 0, temp1 always 0.0 d=
egC.
>>>    - fan_boost sysfs attribute (WMI function 20): write succeeds, no
>>> effect.
>>>    - No WMI fan events (26/32) ever fire (no hwmon uevents under load)=
.
>>>    - Writing cur_state=3D1 to all five PNP0C0B cooling devices: no eff=
ect.
>>>    - acpitz thermal zone (SSDT23 TZ00) reports a constant ~26.9 degC w=
hile
>>>      coretemp reads 56-101 degC.
>>>    - Under Windows, fans work normally (per Milo=C5=A1 Vlku's dual-boo=
t test on
>>>      the same board).
>>>
>>> Root cause =E2=80=94 DSDT/SSDT evidence chain
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> 1) The EC's memory window and the OSTP byte
>>>
>>>     Under \_SB.PC00.LPCB.Q_EC (PNP0C09):
>>>
>>>       OperationRegion (ERAM, SystemMemory, 0xFE0B0300, 0x0100)
>>>
>>>     Q_EC._REG (fires when EC region space becomes available) maps the =
OS
>>>     version (OSYS) to an OSTP byte and writes it:
>>>
>>>       OSYS 0x03E8 -> OSTP =3D 2      (Linux)
>>>       OSYS 0x07D9 -> OSTP =3D 3      (Windows 2009)
>>>       OSYS 0x07DC -> OSTP =3D 4      (Windows 2012)
>>>       OSYS 0x07DD -> OSTP =3D 5      (Windows 2015)
>>>       OSYS 0x07DF -> OSTP =3D 6      (Windows 2021)
>>>
>>>     On this machine OSTP (ERAM offset 0x64) reads 0x00 under Linux: th=
e
>>>     _REG write never happens (verified by dumping the window via /dev/=
mem;
>>>     the rest of the window is demonstrably live, e.g. live temperature
>>>     fields TSR0-TSRB at offsets 0x08-0x13, exposed to Linux via the SE=
Nx
>>>     DPTF sensors whose _TMP read these bytes directly).
>>>
>>> 2) OSTP gates the EC's autonomous fan engine =E2=80=94 experimentally =
verified
>>>
>>>     Writing OSTP=3D6 (/dev/mem, single byte) at idle, then running an
>>>     all-core load:
>>>
>>>       OSTP=3D0 (control):  101 -> 83 degC clamp, fans silent (no airfl=
ow)
>>>       OSTP=3D6:            fans audibly engage and follow the EC's own
>>>                          temperature curve; package temperature bends =
down
>>>                          mid-load (83 -> 70 degC) instead of plateauin=
g
>>>       QFAN (ERAM 0x60)=3D4 ("full speed" performance mode value): fans=
 spin
>>>                          at full speed regardless of temperature
>>>
>>>     After writing OSTP=3D6 once, fan behavior matches Windows (moderat=
e ramp,
>>>     full speed only near the EC's high thresholds). A systemd oneshot =
that
>>>     writes OSTP=3D6 at boot and after resume has kept the machine cool=
 and
>>>     correctly fan-cooled since installation.
>>>
>>> 3) The MIFS WMI fan functions are not implemented in this firmware
>>>
>>>     The MIFS WMI method is WMAA in SSDT20 (device WMID, _UID "MIFS"; _=
WDG
>>>     entry for GUID B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B, object id "AA=
").
>>>     Its GET (0xFA) and SET (0xFB) switches implement only functions 0x=
08
>>>     (SystemPerMode), 0x0A (country/kbd, sub 5) and 0x10 (misc). The fa=
n
>>>     functions used by bitland-mifs-wmi fall through to
>>>
>>>       Default { SGER =3D 0xE000 }        /* unsupported, zeroed buffer=
 */
>>>
>>>     i.e. function 0x0D (WMI_FN_FAN_SPEEDS) returns an all-zero buffer
>>>     (hwmon zeros incl. WMI_FN_CPU_THERMOMETER 0x16), and functions 0x1=
4
>>>     (WMI_FN_MAX_FAN_SWITCH / fan_boost) and 0x15 (WMI_FN_MAX_FAN_SPEED=
)
>>>     are silently ignored =E2=80=94 exactly the observed behavior. So t=
his board's
>>>     firmware is "MIFS reduced" in the same sense as the MIFS v2 machin=
es
>>>     discussed in Yuming Sun's series, except here the WMI method exist=
s
>>>     but the fan function cases are absent.
>>>
>>> 4) The ACPI fan path is gated on a device this board does not declare
>>>
>>>     SSDT23 declares the five PNP0C0B fans (FAN0-FAN4) with PowerResour=
ces
>>>     FN00-FN04. Their _ON/_OFF only set software flags CVF0-4 and call
>>>     FNCL(), which ends in:
>>>
>>>       \_SB.PC00.LPCB.UPFS (ETMD, Local0, Local1)
>>>
>>>     and LPCB.UPFS (DSDT) does nothing unless
>>>
>>>       If ((CondRefOf (\_SB.PC00.LPCB.H_EC) && Arg0)) ...
>>>
>>>     H_EC is not declared anywhere in any table on this machine, so the
>>>     entire ACPI fan-control path is a silent no-op. This is why writin=
g
>>>     cur_state=3D1 to the cooling devices changes nothing.
>>>
>>> 5) The ACPI thermal zone yields to the (disabled) firmware controller
>>>
>>>     SSDT23 TZ00._TMP:
>>>
>>>       If (!ETMD) { Return (0x0BB8) }          /* constant 26.85 degC *=
/
>>>       Return (\_SB.PC00.LPCB.MXTP ())
>>>
>>>     SSDT16 IETM._OSC sets \_TZ.ETMD =3D Zero when the firmware reports
>>>     native trip-point capability (CAP1 bit0 | bit1), selecting "firmwa=
re
>>>     manages thermals" mode. Combined with (1), the firmware never enab=
les
>>>     fan control and the ACPI zone never reports real heat =E2=80=94 th=
e kernel
>>>     never sees a reason to act.
>>>
>>> 6) Tachometer caveat for this generation
>>>
>>>     The ERAM offsets 0x69/0x6B used by the MIFS v2 fan-tach patch do
>>>     exist here, but they do NOT live-update on TM2307: they hold stale
>>>     values (fan1=3D2, fan2=3D0) even while the fans audibly spin. Read=
ing
>>>     tach on this model will need a different mechanism (or none).
>>>
>>> Proposed fix
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> Short term (upstream): have bitland-mifs-wmi write OSTP=3D6 (or evalua=
te/
>>> replicate the _REG OSYS mapping) at probe time for boards where the
>>> firmware leaves it at 0 =E2=80=94 ideally behind a DMI quirk. Note the=
 pending
>>> DMI-matching problem reported by Milo=C5=A1: this board (DMI_SYS_VENDO=
R
>>> "XIAOMI", DMI_BOARD_NAME "TM2307") matches neither "Redmi" nor "TIMI"
>>> entries, so any Redmi-specific quirk table needs an explicit TM2307/XI=
AOMI
>>> entry.
>>>
>>> Longer term: a hwmon pwm/fan interface for boards with the reduced
>>> firmware could drive QFAN (0x60) and read the SENx temperatures (ERAM
>>> 0x08-0x13 / TSR0-TSRB), giving Linux users real fan control on this
>>> generation.
>>>
>> I do not think this would really solve the problem, because any attempt=
 by the
>> ACPI firmware to access the embedded controller would still result in a=
n error.
>>
>> The most important thing right now is to determine why the embedded con=
troller
>> driver fails to probe.
>>
>> Thanks,
>> Armin Wolf
>>
>>> Current workaround in place (for reference):
>>>
>>>    systemd oneshot service, runs at boot and after resume:
>>>
>>>      python3 - <<'EOF'
>>>      import os, mmap
>>>      f =3D os.open('/dev/mem', os.O_RDWR | os.O_SYNC)
>>>      m =3D mmap.mmap(f, 0x1000, offset=3D0xFE0B0000)
>>>      m[0x300 + 0x64] =3D 6   # ERAM offset 0x64 =3D OSTP
>>>      m.close()
>>>      EOF
>>>
>>> I have full acpidumps (DSDT + all 27 SSDTs, disassembled), the ERAM
>>> window dumps before/during/after experiments, and the load-test
>>> temperature logs. Happy to provide any of these, test patches, or help
>>> however useful.
>>>
>>> Thanks
>>>
>>> --
>>> @gaojunwen
>
>
