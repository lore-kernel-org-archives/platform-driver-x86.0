Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ABE4CC62D
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 10:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553462; cv=pass; b=NtG0yONfD4nV9S6MyELw7n07k0hNClOA0HzlwNBDN3xyxytTejI3Mst910Vo/fSvgEOtOWRaWsRGEsijs0HMwUnIUf5CEtdPVeJHRbpYiirj6OT1YmKR+Mf/GfO5dvphr/fqE/uoYiKG/Ycy4B1raQ3S4G476Trt8yy+J7RE83E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553462; c=relaxed/simple;
	bh=3PmnXUsDHMiy/ta9S1yq967wuEV7aKeXF0z8aMsi22I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RBTuw+C3vrPndkMQqMkxV0TBIVwl1Ov6GFMZlXfSP26h8rzmZj0JMH39tr8H1zo5HQ66ioLwwUzQt/hd86c4dTaUNdLrWaz/kxB2ddwmT6BwqQyLKTc19fo6zQowHYF239qocbl+nhEKcKh89a5ezlONg3DxD9m8NUR6nV4e1XQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhQuo3P8; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhQuo3P8"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so919252e87.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 03:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789553456; cv=none;
        d=google.com; s=arc-20260327;
        b=VxCthtp1zqDPeQPMXJyWYx+IXezOmWI/scZUAjKET3l7VF26Q5Sjd0N6Mc+NL6SSMB
         BSt/Tkpk2FlBL1o9Qvq3pbsA+CeSaDe5SvWdsh68dnB1k60J3I37fnAWxiXSzsmLJ6hx
         cvaqPI6O07+dO7LiiiI12gUIBzZkWjfEfTObg+vnv3TB5iOXgw9pyDpKT1M3WGxZN0ET
         7gdyQZ99yJRYYEadbie8y+wOr5Q1hJTko7p4dfPuKWyOj3fD3Ft9s4CN9NfPxg2H6hj0
         L7Q71B9SeVo/n3dwajMUrG4sBClygcD3isjO40z1px7aZ8OWAEUCERr53knrko0vRRoG
         kRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QBfrrGxVZ8vwjb1F53gFkFYHEKgSrnYofiSpEh8Slt4=;
        fh=wJZrRG79uYHuIxEPP/T9eFGumxsVVoYrJqIyvGOv+uc=;
        b=hTRIU/rZWyL1CzrDYWoOfi3CgkI51wvItHAJ8OlZaANdPVYm2lV/0NEfVk2yJKQFSf
         eFEquDqUVLHPE0jbbz5nF9JYlTDpbJXbh7ygTXx6Mwu6zwkjG2uUTP1ES0T+59Kc6EP+
         F/w03/S8H+KIsKZVQEIpQQCOiRZCzwK37O5pX5RopWBtyjEQzr96awxxApM5x5VXd6w3
         ZbV1L0Ars1BYCaXd98TPpI6Xn2tp7jwIhZ7xl1JZAr62o1NLgl2lHzW/q57ojZQ6Aziv
         WI81h3JzoMoxYleWpMud3wEgPqnxu0Jy/gjXIk8hxQBEjaqayuYARfWop5QrtpINLy3L
         Tf+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789553456; x=1790158256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QBfrrGxVZ8vwjb1F53gFkFYHEKgSrnYofiSpEh8Slt4=;
        b=hhQuo3P8cTsnI0OnwJKGu2zWlSiRXK9guaojiWclrxaeQLKo/Mty9E8J3P9p6cV0f7
         jcprFOMAdoxXusfZluuEOVv2n0oGPMdfVWc/ALDRmdxjbCQm3ITw0Ix52j5GfsNirBTB
         uavvOHIfv5R2jXz1Dq2Qpn/xdvTygssL9bbTkF5u55n3J9KfAzq20BBL+b07/tgUqo2w
         9riKLxUn0o3S9U8uDGB3v50hOjtD3kj3Kcz85j58hh6bD9O/DCgvwK/aAOQwtCE3AT5H
         9ng5ngY4b3Go0tkYsR2xCo2wPAO4iGRc+ZPtlUo4HbI/Z68a3Y+4ji3P9/7nHmVws3qa
         WqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553456; x=1790158256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QBfrrGxVZ8vwjb1F53gFkFYHEKgSrnYofiSpEh8Slt4=;
        b=xD9MUe0gnzv5kvEkXQkPQJ6o0KSEb+aTBkFwPF1okDxqt/W6O6C9VVO5n21IqrZfDs
         aRygb9o3lwa6UJyp9+B0Qlkn1+B2EWKATsdvzOSivf47e52CWzaRjFWsBGziDCCL2Xp3
         QfdgmzSK4FDPGymzqO5osjQx78H2PKvcTSQp4D5SnkoVLl6bMKrPRymjpjnU83+80r4d
         vKmY2ksnh8lcyONV7gcexX53ZcwAe4bOrgddGG0mznZG1ELan7dnYXvvPuftEuVQAYvb
         x3C9hi4JQkls8ymzIFlyAPZ3PbbBGsq+Lpe5+qwCsXo/96CGfbCXRx+qgSEQiWSlceWT
         qvbw==
X-Gm-Message-State: AFuF++m/8ik6BsgZmZikapMJ1HH9+A5pffh7ME47r4B9jinPOgWoOsSW
	Cm79P6zgpXTsc0Jw0kiUHCajNFvtzPSmK9FGCc/PxfREGoaen1EngaWWRD09gJQ5W53L4zTr972
	CEX85GqxPdrIULaNNYeSEsONQ4yRYvjk=
X-Gm-Gg: AYBFou32x7tT9GHq9Q7OZz4He4iqX7jzWMJZ3ISobO+HUlLBf6ggx6PKNUrvmnSm1Lk
	VcikZ5Ups82UaBJN2FPMJ9UyhyFTm6sF0vUFJIlKZSynA7OicBibXFwFc7QZ4HH69w9N5mqrEA7
	SJk9ZzzsR9YvtCqgUvJqlEQUtZ7GinqIbw9sxLSgVmZ55eFAQkP2sDT1ihNkm2s1BifvmRcQt94
	WuZqasoHV/xGHiJQYwaJPwfScxWnzXkfsuPsFM9pkah0ptbmi4Etzh2naIo5mkJmc+EHdXILPLd
	LKjO76xauzfUQ6ShWxrbhaj3L+tFfT7bxKH/vHVWPt6CCAwSYoNLFdVYKFOa83B+iC3GN9WiHLZ
	j5xWVhysnfgFd
X-Received: by 2002:a05:6512:3d02:b0:5b6:1a7c:32 with SMTP id
 2adb3069b0e04-5b8b6656a6cmr525821e87.53.1789553455817; Wed, 16 Sep 2026
 03:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL-my2=5V8Pk+R+aAoJ556-DFR-B0wnMLckRNDbAohdZvB15+Q@mail.gmail.com>
 <2d5d8f5d-2672-4a4e-b9ab-53ad49d4c212@gmx.de>
In-Reply-To: <2d5d8f5d-2672-4a4e-b9ab-53ad49d4c212@gmx.de>
From: =?UTF-8?B?6auYIOS/iuaWhw==?= <btx342@gmail.com>
Date: Wed, 16 Sep 2026 18:10:42 +0800
X-Gm-Features: AcwNN1VH8nr_hunDWXUNce7GRa03BwxpKBJNiwqjE_1mWT8Am-VYUMxu5ARWff8
Message-ID: <CAL-my2n6+GW_=eQS+v0u0kFqFRCRt28UAEig-8rF30XzO8rLXA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BBUG=5D_Redmi_Book_Pro_14_2024_=28TM2307=29=3A_fans_neve?=
	=?UTF-8?Q?r_spin_under_Linux_=E2=80=94_root_cause=3A_EC_gates_fan_engine_on_OS?=
	=?UTF-8?Q?TP_byte_=28tested_workaround=29?=
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	qby140326@gmail.com, ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Thanks for looking at this. Answers to your two questions first, then a
correction to my original report that your questions prompted =E2=80=94 you=
 were
right to be suspicious, though it is not a probe failure on this unit.

> what is the output of "cat /sys/bus/acpi/devices/PNP0C09:*/status"?

  15

(single EC: PNP0C09:00 under \_SB.PC00.LPCB)

> Can you share the output of "dmesg"?

Attached, captured on the current boot (kernel 7.2.5-3-omarchy; the
original report was on 7.2.3, same behavior). EC-relevant excerpt:

  ACPI: EC: EC started
  ACPI: EC: interrupt blocked
  ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
  ACPI: \_SB_.PC00.LPCB.Q_EC: Boot DSDT EC used to handle transactions
  ACPI: EC: interrupt unblocked
  ACPI: EC: event unblocked
  ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
  ACPI: EC: GPE=3D0x6e
  ACPI: \_SB_.PC00.LPCB.Q_EC: Boot DSDT EC initialization complete
  ACPI: \_SB_.PC00.LPCB.Q_EC: EC: Used to handle transactions and events
  input: Lid Switch as .../0000:00:1f.0/PNP0C09:00/PNP0C0D:00/input/input0

The EC driver probes and binds fine here: PNP0C09:00 has a physical
platform device bound to the acpi-ec driver, there is no ECDT (the EC is
DSDT-only), and EC transactions demonstrably work at runtime (BAT0 _BST
reports live voltage/energy/serial; the lid switch and GPE 0x6e events
work). The only ACPI errors in the log are unrelated _PLD/_UPC failures
in the XHCI/TXHC hubs (AE_AML_TOO_FEW_ARGUMENTS in a RUCC helper).

Your other concern =E2=80=94 that any firmware attempt to access the EC wou=
ld
error out =E2=80=94 does not apply to this board, and chasing it down expos=
ed a
real mistake in my original report:

1) No AML anywhere in our tables (DSDT + all 27 SSDTs) uses EC address
   space. All 308 OperationRegions are 242 SystemMemory, 50 PCI_Config,
   14 SystemIO, 2 SystemCMOS. The EC's data surface for AML is a plain
   SystemMemory window:

     OperationRegion (ERAM, SystemMemory, 0xFE0B0300, 0x0100)

2) Consequence: Q_EC._REG can never execute for an EC-space connect,
   because no EC-space region object exists for ACPICA to fire it on =E2=80=
=94
   on any OS. The OSYS->OSTP mapping inside _REG is dead code (vendor
   cruft from a reference design). Q_EC._INI sets ECAV=3D1 when
   _REV>=3D2, and all methods proceed through the ERAM window instead.

3) I misread the window layout in my report. The iasl field layout is:

     Offset (0x60): QFAN, 8
     Offset (0x62): SCFG (0x62), HBPF (0x63), PCMD (0x64), OSTP (0x65)

   The byte I called "OSTP" (0x64) is actually declared "PCMD" in the
   vendor AML =E2=80=94 and PCMD is referenced by no AML method anywhere. T=
he
   real OSTP at 0x65 already reads 6 at every Linux boot with no help
   from us (pre-fix dumps: 0x64=3D0x00, 0x65=3D0x06), so it is written by
   the EC/UEFI firmware itself, not by AML.

4) Corrected root cause: the EC's autonomous fan engine is gated on
   ERAM+0x64 ("PCMD"), which nothing ever sets under Linux. The
   original experiment stands with cleaner isolation than I realized:
   with OSTP (0x65) already 6 the whole time, control load runs stay
   fan-silent; writing 6 to 0x64 engages the engine and the fans follow
   the EC's own temperature curve; QFAN (0x60)=3D4 forces full speed.
   That one-byte write has been running as a boot+resume oneshot since
   2026-09-15 and the machine behaves exactly like the Windows side.

So on this unit the EC driver is healthy, and "replicate the _REG
OSYS mapping" (my original proposal) would be the wrong fix =E2=80=94 _REG
never runs on this platform regardless of OS. The open question is
narrower now: who sets ERAM+0x64 under Windows? Not AML (no
references on any OS), so presumably EC-internal logic or an SMI
path (there is an event-driven one: _Q35 writes 0xC2 to the port-0xB2
SMI port). If Milo=C5=A1 (dual-boot) could dump ERAM 0x60..0x6C from
Windows =E2=80=94 or even just byte 0x64 at idle and under load =E2=80=94 t=
hat would
pin down what state the EC expects to see.

Happy to test any patch. If a quirk approach is still wanted, the
effective workaround is "write ERAM+0x64=3D6 at boot/resume", not
"replicate _REG". Full acpidump and the raw ERAM dumps available any
time.

Transparency note: the ACPI analysis, the experiments, and this email
were prepared by an AI coding agent (Claude Code running the GLM 5.3
Flash model) working on this machine. To be honest, I still find much
of the ACPI detail confusing myself =E2=80=94 what I can vouch for firsthan=
d
is the hardware behavior: the fans were always silent under Linux, and
after the one-byte write they spin and track the load exactly like on
Windows. For anything deeper than that, please ask and I will relay
it to the agent.

Thanks,
dista

On Wed, Sep 16, 2026 at 5:47=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 15.09.26 um 14:09 schrieb =E9=AB=98 =E4=BF=8A=E6=96=87:
>
> > Hi,
> >
> > This follows up on the report from Milo=C5=A1 Vlku about the Redmi Book=
 Pro 14
> > 2024 (TM2307), where the fans never spin under Linux although the same
> > hardware works fine under Windows:
> >
> > https://lkml.iu.edu/hypermail/linux/kernel/2608.1/13832.html
> >
> > We have now root-caused the problem on an identical machine (second
> > TM2307,
> > Core Ultra 7 155H) and have a one-byte, experimentally verified
> > workaround.
> > Summary: the EC only runs its autonomous fan engine when the OSTP "OS
> > type"
> > byte in its shared memory window indicates a detected host OS. Under
> > Windows
> > the DSDT _REG handler writes OSTP=3D6; under Linux nothing writes it, O=
STP
> > stays 0, and the EC never spins the fans. All OS-side fan paths (MIFS W=
MI
> > fan functions, ACPI PNP0C0B fans) are separately broken on this board, =
so
> > fans are unreachable from Linux even at 100 degC.
> >
> Nice work, what is the output of "cat /sys/bus/acpi/devices/PNP0C09:*/sta=
tus"?
> Can you share the output of "dmesg"?
>
> > Machine / software
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >   DMI: XIAOMI / Redmi Book Pro 14 2024 / TM2307
> >   CPU: Intel Core Ultra 7 155H (Meteor Lake-H)
> >   BIOS: XIAOMI RMAMT4B0P0A0A (06/04/2024)
> >   Kernel: 7.2.3-arch1-3 (bitland-mifs-wmi incl. d3666875c75e)
> >
> > Symptoms (all verified)
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >   - Fans physically never spin under Linux, even with the package at
> >     101 degC for minutes (verified by microphone recording: no acoustic
> >     change; user-confirmed silence; multiple independent load tests).
> >   - hwmon (bitland_mifs): fan1/2/3_input always 0, temp1 always 0.0 deg=
C.
> >   - fan_boost sysfs attribute (WMI function 20): write succeeds, no
> > effect.
> >   - No WMI fan events (26/32) ever fire (no hwmon uevents under load).
> >   - Writing cur_state=3D1 to all five PNP0C0B cooling devices: no effec=
t.
> >   - acpitz thermal zone (SSDT23 TZ00) reports a constant ~26.9 degC whi=
le
> >     coretemp reads 56-101 degC.
> >   - Under Windows, fans work normally (per Milo=C5=A1 Vlku's dual-boot =
test on
> >     the same board).
> >
> > Root cause =E2=80=94 DSDT/SSDT evidence chain
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > 1) The EC's memory window and the OSTP byte
> >
> >    Under \_SB.PC00.LPCB.Q_EC (PNP0C09):
> >
> >      OperationRegion (ERAM, SystemMemory, 0xFE0B0300, 0x0100)
> >
> >    Q_EC._REG (fires when EC region space becomes available) maps the OS
> >    version (OSYS) to an OSTP byte and writes it:
> >
> >      OSYS 0x03E8 -> OSTP =3D 2      (Linux)
> >      OSYS 0x07D9 -> OSTP =3D 3      (Windows 2009)
> >      OSYS 0x07DC -> OSTP =3D 4      (Windows 2012)
> >      OSYS 0x07DD -> OSTP =3D 5      (Windows 2015)
> >      OSYS 0x07DF -> OSTP =3D 6      (Windows 2021)
> >
> >    On this machine OSTP (ERAM offset 0x64) reads 0x00 under Linux: the
> >    _REG write never happens (verified by dumping the window via /dev/me=
m;
> >    the rest of the window is demonstrably live, e.g. live temperature
> >    fields TSR0-TSRB at offsets 0x08-0x13, exposed to Linux via the SENx
> >    DPTF sensors whose _TMP read these bytes directly).
> >
> > 2) OSTP gates the EC's autonomous fan engine =E2=80=94 experimentally v=
erified
> >
> >    Writing OSTP=3D6 (/dev/mem, single byte) at idle, then running an
> >    all-core load:
> >
> >      OSTP=3D0 (control):  101 -> 83 degC clamp, fans silent (no airflow=
)
> >      OSTP=3D6:            fans audibly engage and follow the EC's own
> >                         temperature curve; package temperature bends do=
wn
> >                         mid-load (83 -> 70 degC) instead of plateauing
> >      QFAN (ERAM 0x60)=3D4 ("full speed" performance mode value): fans s=
pin
> >                         at full speed regardless of temperature
> >
> >    After writing OSTP=3D6 once, fan behavior matches Windows (moderate =
ramp,
> >    full speed only near the EC's high thresholds). A systemd oneshot th=
at
> >    writes OSTP=3D6 at boot and after resume has kept the machine cool a=
nd
> >    correctly fan-cooled since installation.
> >
> > 3) The MIFS WMI fan functions are not implemented in this firmware
> >
> >    The MIFS WMI method is WMAA in SSDT20 (device WMID, _UID "MIFS"; _WD=
G
> >    entry for GUID B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B, object id "AA")=
.
> >    Its GET (0xFA) and SET (0xFB) switches implement only functions 0x08
> >    (SystemPerMode), 0x0A (country/kbd, sub 5) and 0x10 (misc). The fan
> >    functions used by bitland-mifs-wmi fall through to
> >
> >      Default { SGER =3D 0xE000 }        /* unsupported, zeroed buffer *=
/
> >
> >    i.e. function 0x0D (WMI_FN_FAN_SPEEDS) returns an all-zero buffer
> >    (hwmon zeros incl. WMI_FN_CPU_THERMOMETER 0x16), and functions 0x14
> >    (WMI_FN_MAX_FAN_SWITCH / fan_boost) and 0x15 (WMI_FN_MAX_FAN_SPEED)
> >    are silently ignored =E2=80=94 exactly the observed behavior. So thi=
s board's
> >    firmware is "MIFS reduced" in the same sense as the MIFS v2 machines
> >    discussed in Yuming Sun's series, except here the WMI method exists
> >    but the fan function cases are absent.
> >
> > 4) The ACPI fan path is gated on a device this board does not declare
> >
> >    SSDT23 declares the five PNP0C0B fans (FAN0-FAN4) with PowerResource=
s
> >    FN00-FN04. Their _ON/_OFF only set software flags CVF0-4 and call
> >    FNCL(), which ends in:
> >
> >      \_SB.PC00.LPCB.UPFS (ETMD, Local0, Local1)
> >
> >    and LPCB.UPFS (DSDT) does nothing unless
> >
> >      If ((CondRefOf (\_SB.PC00.LPCB.H_EC) && Arg0)) ...
> >
> >    H_EC is not declared anywhere in any table on this machine, so the
> >    entire ACPI fan-control path is a silent no-op. This is why writing
> >    cur_state=3D1 to the cooling devices changes nothing.
> >
> > 5) The ACPI thermal zone yields to the (disabled) firmware controller
> >
> >    SSDT23 TZ00._TMP:
> >
> >      If (!ETMD) { Return (0x0BB8) }          /* constant 26.85 degC */
> >      Return (\_SB.PC00.LPCB.MXTP ())
> >
> >    SSDT16 IETM._OSC sets \_TZ.ETMD =3D Zero when the firmware reports
> >    native trip-point capability (CAP1 bit0 | bit1), selecting "firmware
> >    manages thermals" mode. Combined with (1), the firmware never enable=
s
> >    fan control and the ACPI zone never reports real heat =E2=80=94 the =
kernel
> >    never sees a reason to act.
> >
> > 6) Tachometer caveat for this generation
> >
> >    The ERAM offsets 0x69/0x6B used by the MIFS v2 fan-tach patch do
> >    exist here, but they do NOT live-update on TM2307: they hold stale
> >    values (fan1=3D2, fan2=3D0) even while the fans audibly spin. Readin=
g
> >    tach on this model will need a different mechanism (or none).
> >
> > Proposed fix
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Short term (upstream): have bitland-mifs-wmi write OSTP=3D6 (or evaluat=
e/
> > replicate the _REG OSYS mapping) at probe time for boards where the
> > firmware leaves it at 0 =E2=80=94 ideally behind a DMI quirk. Note the =
pending
> > DMI-matching problem reported by Milo=C5=A1: this board (DMI_SYS_VENDOR
> > "XIAOMI", DMI_BOARD_NAME "TM2307") matches neither "Redmi" nor "TIMI"
> > entries, so any Redmi-specific quirk table needs an explicit TM2307/XIA=
OMI
> > entry.
> >
> > Longer term: a hwmon pwm/fan interface for boards with the reduced
> > firmware could drive QFAN (0x60) and read the SENx temperatures (ERAM
> > 0x08-0x13 / TSR0-TSRB), giving Linux users real fan control on this
> > generation.
> >
> I do not think this would really solve the problem, because any attempt b=
y the
> ACPI firmware to access the embedded controller would still result in an =
error.
>
> The most important thing right now is to determine why the embedded contr=
oller
> driver fails to probe.
>
> Thanks,
> Armin Wolf
>
> > Current workaround in place (for reference):
> >
> >   systemd oneshot service, runs at boot and after resume:
> >
> >     python3 - <<'EOF'
> >     import os, mmap
> >     f =3D os.open('/dev/mem', os.O_RDWR | os.O_SYNC)
> >     m =3D mmap.mmap(f, 0x1000, offset=3D0xFE0B0000)
> >     m[0x300 + 0x64] =3D 6   # ERAM offset 0x64 =3D OSTP
> >     m.close()
> >     EOF
> >
> > I have full acpidumps (DSDT + all 27 SSDTs, disassembled), the ERAM
> > window dumps before/during/after experiments, and the load-test
> > temperature logs. Happy to provide any of these, test patches, or help
> > however useful.
> >
> > Thanks
> >
> > --
> > @gaojunwen



--=20
@gaojunwen
