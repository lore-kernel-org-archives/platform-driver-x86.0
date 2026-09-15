Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769843FF8B0;
	Tue, 15 Sep 2026 21:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789508833; cv=none; b=rjT96kq1UJ0iecYx/MN8+oZ0dPUsrF0VQrvuw+1LkBLvpJNzmsK1dnlmIDjpLQtsJ9AfrVOXCZwjnGjLpQBEAf2HaXCDMrYuW/mySCICshuUhoRW2AiusfUL7tJL9ZUNzmbJvNF8D6gdJSWrI+xp9PEb1RfMf4ie0EQHwf8h73w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789508833; c=relaxed/simple;
	bh=xyCvpxD6cp3Y4bHfHdrUKEa4eAhDqTpTLCrVM1B6qSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRnOKXH8PNjwKqvmBxjW4NDfCmoIdz9Qo9AnR3icZLVPl/sSkZNeK/scyta/qKlfvoDTYy3rKav4p1PqUWQNCVRAJBJVfu3r6sNiQvn6VVOX72JtpMhcYmdPT3+G8PrEV7HAaDMqdwOZxIIcv8hOBIdJaD7j5rmkuvMw07haVVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CDWI/LmF; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CDWI/LmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1789508820; x=1790113620; i=w_armin@gmx.de;
	bh=xyCvpxD6cp3Y4bHfHdrUKEa4eAhDqTpTLCrVM1B6qSk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CDWI/LmFJEbQFYIyhlLmHMHO+eUQvsU4BNHNo7ti1S+GpNCVwuY4myHfVxf+9K+k
	 Pc18WlJj667Ew5K2mlIoW8Zo+sDq0YavbpmgCXd+zyV2MY8MX1nus8dmkQJZ/du7r
	 Q2813wXZ8zr8l4o9VVxBTPcGt6v90NSp5pDpuFrlADk3etdjsrAFpRosTd4PHXlHj
	 wkp6b1aayxe85owesIm/IF9DEmymTRdd9qBrTlWykYcGrQuxXeVp9ABnEEBoAcSWN
	 R++XHnJOB/+gni1v3soho+5Bd51SwTWjGwmSBfJnU2zZXoudcUHuGVyFvVdjjjOCp
	 2UXtt7Jhnq50diwS/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiJZE-1wdI2s0tBG-00hfOj; Tue, 15
 Sep 2026 23:47:00 +0200
Message-ID: <2d5d8f5d-2672-4a4e-b9ab-53ad49d4c212@gmx.de>
Date: Tue, 15 Sep 2026 23:46:59 +0200
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
To: =?UTF-8?B?6auYIOS/iuaWhw==?= <btx342@gmail.com>,
 platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, qby140326@gmail.com,
 ilpo.jarvinen@linux.intel.com, hansg@kernel.org
References: <CAL-my2=5V8Pk+R+aAoJ556-DFR-B0wnMLckRNDbAohdZvB15+Q@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAL-my2=5V8Pk+R+aAoJ556-DFR-B0wnMLckRNDbAohdZvB15+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4pBVLgexUKjBl2YPMj0aOMOnclWyvVmcLqX6HEy3cn1IgB3NFbq
 fJ8btcvEBM+1SL0Td/MLDdYIQxHeSWXSyFn67H+WsUveBYkCfnIu+TyY3uMSR7XUIzhPzqr
 NP6Fh/aYe7OtPJJWJF9Nite+sEPY7KiCSC0rgbZ63CkoElBIjAX7cKOHY1KDVrLN6QEAPM7
 YbIIf8F1GzZDP9NEgYPXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:27ZLby5xLWE=;A3rg4LW8MywAp/KzR4Jvx41/9Zh
 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

Am 15.09.26 um 14:09 schrieb =E9=AB=98 =E4=BF=8A=E6=96=87:

> Hi,
>
> This follows up on the report from Milo=C5=A1 Vlku about the Redmi Book =
Pro 14
> 2024 (TM2307), where the fans never spin under Linux although the same
> hardware works fine under Windows:
>
> https://lkml.iu.edu/hypermail/linux/kernel/2608.1/13832.html
>
> We have now root-caused the problem on an identical machine (second=20
> TM2307,
> Core Ultra 7 155H) and have a one-byte, experimentally verified=20
> workaround.
> Summary: the EC only runs its autonomous fan engine when the OSTP "OS=20
> type"
> byte in its shared memory window indicates a detected host OS. Under=20
> Windows
> the DSDT _REG handler writes OSTP=3D6; under Linux nothing writes it, OS=
TP
> stays 0, and the EC never spins the fans. All OS-side fan paths (MIFS WM=
I
> fan functions, ACPI PNP0C0B fans) are separately broken on this board, s=
o
> fans are unreachable from Linux even at 100 degC.
>
Nice work, what is the output of "cat /sys/bus/acpi/devices/PNP0C09:*/stat=
us"?
Can you share the output of "dmesg"?

> Machine / software
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> =C2=A0 DMI: XIAOMI / Redmi Book Pro 14 2024 / TM2307
> =C2=A0 CPU: Intel Core Ultra 7 155H (Meteor Lake-H)
> =C2=A0 BIOS: XIAOMI RMAMT4B0P0A0A (06/04/2024)
> =C2=A0 Kernel: 7.2.3-arch1-3 (bitland-mifs-wmi incl. d3666875c75e)
>
> Symptoms (all verified)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> =C2=A0 - Fans physically never spin under Linux, even with the package a=
t
> =C2=A0 =C2=A0 101 degC for minutes (verified by microphone recording: no=
 acoustic
> =C2=A0 =C2=A0 change; user-confirmed silence; multiple independent load =
tests).
> =C2=A0 - hwmon (bitland_mifs): fan1/2/3_input always 0, temp1 always 0.0=
 degC.
> =C2=A0 - fan_boost sysfs attribute (WMI function 20): write succeeds, no=
=20
> effect.
> =C2=A0 - No WMI fan events (26/32) ever fire (no hwmon uevents under loa=
d).
> =C2=A0 - Writing cur_state=3D1 to all five PNP0C0B cooling devices: no e=
ffect.
> =C2=A0 - acpitz thermal zone (SSDT23 TZ00) reports a constant ~26.9 degC=
 while
> =C2=A0 =C2=A0 coretemp reads 56-101 degC.
> =C2=A0 - Under Windows, fans work normally (per Milo=C5=A1 Vlku's dual-b=
oot test on
> =C2=A0 =C2=A0 the same board).
>
> Root cause =E2=80=94 DSDT/SSDT evidence chain
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> 1) The EC's memory window and the OSTP byte
>
> =C2=A0 =C2=A0Under \_SB.PC00.LPCB.Q_EC (PNP0C09):
>
> =C2=A0 =C2=A0 =C2=A0OperationRegion (ERAM, SystemMemory, 0xFE0B0300, 0x0=
100)
>
> =C2=A0 =C2=A0Q_EC._REG (fires when EC region space becomes available) ma=
ps the OS
> =C2=A0 =C2=A0version (OSYS) to an OSTP byte and writes it:
>
> =C2=A0 =C2=A0 =C2=A0OSYS 0x03E8 -> OSTP =3D 2 =C2=A0 =C2=A0 =C2=A0(Linux=
)
> =C2=A0 =C2=A0 =C2=A0OSYS 0x07D9 -> OSTP =3D 3 =C2=A0 =C2=A0 =C2=A0(Windo=
ws 2009)
> =C2=A0 =C2=A0 =C2=A0OSYS 0x07DC -> OSTP =3D 4 =C2=A0 =C2=A0 =C2=A0(Windo=
ws 2012)
> =C2=A0 =C2=A0 =C2=A0OSYS 0x07DD -> OSTP =3D 5 =C2=A0 =C2=A0 =C2=A0(Windo=
ws 2015)
> =C2=A0 =C2=A0 =C2=A0OSYS 0x07DF -> OSTP =3D 6 =C2=A0 =C2=A0 =C2=A0(Windo=
ws 2021)
>
> =C2=A0 =C2=A0On this machine OSTP (ERAM offset 0x64) reads 0x00 under Li=
nux: the
> =C2=A0 =C2=A0_REG write never happens (verified by dumping the window vi=
a /dev/mem;
> =C2=A0 =C2=A0the rest of the window is demonstrably live, e.g. live temp=
erature
> =C2=A0 =C2=A0fields TSR0-TSRB at offsets 0x08-0x13, exposed to Linux via=
 the SENx
> =C2=A0 =C2=A0DPTF sensors whose _TMP read these bytes directly).
>
> 2) OSTP gates the EC's autonomous fan engine =E2=80=94 experimentally ve=
rified
>
> =C2=A0 =C2=A0Writing OSTP=3D6 (/dev/mem, single byte) at idle, then runn=
ing an
> =C2=A0 =C2=A0all-core load:
>
> =C2=A0 =C2=A0 =C2=A0OSTP=3D0 (control): =C2=A0101 -> 83 degC clamp, fans=
 silent (no airflow)
> =C2=A0 =C2=A0 =C2=A0OSTP=3D6: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
ans audibly engage and follow the EC's own
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 temperature curve; package temperature bends down
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 mid-load (83 -> 70 degC) instead of plateauing
> =C2=A0 =C2=A0 =C2=A0QFAN (ERAM 0x60)=3D4 ("full speed" performance mode =
value): fans spin
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 at full speed regardless of temperature
>
> =C2=A0 =C2=A0After writing OSTP=3D6 once, fan behavior matches Windows (=
moderate ramp,
> =C2=A0 =C2=A0full speed only near the EC's high thresholds). A systemd o=
neshot that
> =C2=A0 =C2=A0writes OSTP=3D6 at boot and after resume has kept the machi=
ne cool and
> =C2=A0 =C2=A0correctly fan-cooled since installation.
>
> 3) The MIFS WMI fan functions are not implemented in this firmware
>
> =C2=A0 =C2=A0The MIFS WMI method is WMAA in SSDT20 (device WMID, _UID "M=
IFS"; _WDG
> =C2=A0 =C2=A0entry for GUID B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B, object=
 id "AA").
> =C2=A0 =C2=A0Its GET (0xFA) and SET (0xFB) switches implement only funct=
ions 0x08
> =C2=A0 =C2=A0(SystemPerMode), 0x0A (country/kbd, sub 5) and 0x10 (misc).=
 The fan
> =C2=A0 =C2=A0functions used by bitland-mifs-wmi fall through to
>
> =C2=A0 =C2=A0 =C2=A0Default { SGER =3D 0xE000 } =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* unsupported, zeroed buffer */
>
> =C2=A0 =C2=A0i.e. function 0x0D (WMI_FN_FAN_SPEEDS) returns an all-zero =
buffer
> =C2=A0 =C2=A0(hwmon zeros incl. WMI_FN_CPU_THERMOMETER 0x16), and functi=
ons 0x14
> =C2=A0 =C2=A0(WMI_FN_MAX_FAN_SWITCH / fan_boost) and 0x15 (WMI_FN_MAX_FA=
N_SPEED)
> =C2=A0 =C2=A0are silently ignored =E2=80=94 exactly the observed behavio=
r. So this board's
> =C2=A0 =C2=A0firmware is "MIFS reduced" in the same sense as the MIFS v2=
 machines
> =C2=A0 =C2=A0discussed in Yuming Sun's series, except here the WMI metho=
d exists
> =C2=A0 =C2=A0but the fan function cases are absent.
>
> 4) The ACPI fan path is gated on a device this board does not declare
>
> =C2=A0 =C2=A0SSDT23 declares the five PNP0C0B fans (FAN0-FAN4) with Powe=
rResources
> =C2=A0 =C2=A0FN00-FN04. Their _ON/_OFF only set software flags CVF0-4 an=
d call
> =C2=A0 =C2=A0FNCL(), which ends in:
>
> =C2=A0 =C2=A0 =C2=A0\_SB.PC00.LPCB.UPFS (ETMD, Local0, Local1)
>
> =C2=A0 =C2=A0and LPCB.UPFS (DSDT) does nothing unless
>
> =C2=A0 =C2=A0 =C2=A0If ((CondRefOf (\_SB.PC00.LPCB.H_EC) && Arg0)) ...
>
> =C2=A0 =C2=A0H_EC is not declared anywhere in any table on this machine,=
 so the
> =C2=A0 =C2=A0entire ACPI fan-control path is a silent no-op. This is why=
 writing
> =C2=A0 =C2=A0cur_state=3D1 to the cooling devices changes nothing.
>
> 5) The ACPI thermal zone yields to the (disabled) firmware controller
>
> =C2=A0 =C2=A0SSDT23 TZ00._TMP:
>
> =C2=A0 =C2=A0 =C2=A0If (!ETMD) { Return (0x0BB8) } =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* constant 26.85 degC */
> =C2=A0 =C2=A0 =C2=A0Return (\_SB.PC00.LPCB.MXTP ())
>
> =C2=A0 =C2=A0SSDT16 IETM._OSC sets \_TZ.ETMD =3D Zero when the firmware =
reports
> =C2=A0 =C2=A0native trip-point capability (CAP1 bit0 | bit1), selecting =
"firmware
> =C2=A0 =C2=A0manages thermals" mode. Combined with (1), the firmware nev=
er enables
> =C2=A0 =C2=A0fan control and the ACPI zone never reports real heat =E2=
=80=94 the kernel
> =C2=A0 =C2=A0never sees a reason to act.
>
> 6) Tachometer caveat for this generation
>
> =C2=A0 =C2=A0The ERAM offsets 0x69/0x6B used by the MIFS v2 fan-tach pat=
ch do
> =C2=A0 =C2=A0exist here, but they do NOT live-update on TM2307: they hol=
d stale
> =C2=A0 =C2=A0values (fan1=3D2, fan2=3D0) even while the fans audibly spi=
n. Reading
> =C2=A0 =C2=A0tach on this model will need a different mechanism (or none=
).
>
> Proposed fix
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Short term (upstream): have bitland-mifs-wmi write OSTP=3D6 (or evaluate=
/
> replicate the _REG OSYS mapping) at probe time for boards where the
> firmware leaves it at 0 =E2=80=94 ideally behind a DMI quirk. Note the p=
ending
> DMI-matching problem reported by Milo=C5=A1: this board (DMI_SYS_VENDOR
> "XIAOMI", DMI_BOARD_NAME "TM2307") matches neither "Redmi" nor "TIMI"
> entries, so any Redmi-specific quirk table needs an explicit TM2307/XIAO=
MI
> entry.
>
> Longer term: a hwmon pwm/fan interface for boards with the reduced
> firmware could drive QFAN (0x60) and read the SENx temperatures (ERAM
> 0x08-0x13 / TSR0-TSRB), giving Linux users real fan control on this
> generation.
>
I do not think this would really solve the problem, because any attempt by=
 the
ACPI firmware to access the embedded controller would still result in an e=
rror.

The most important thing right now is to determine why the embedded contro=
ller
driver fails to probe.

Thanks,
Armin Wolf

> Current workaround in place (for reference):
>
> =C2=A0 systemd oneshot service, runs at boot and after resume:
>
> =C2=A0 =C2=A0 python3 - <<'EOF'
> =C2=A0 =C2=A0 import os, mmap
> =C2=A0 =C2=A0 f =3D os.open('/dev/mem', os.O_RDWR | os.O_SYNC)
> =C2=A0 =C2=A0 m =3D mmap.mmap(f, 0x1000, offset=3D0xFE0B0000)
> =C2=A0 =C2=A0 m[0x300 + 0x64] =3D 6 =C2=A0 # ERAM offset 0x64 =3D OSTP
> =C2=A0 =C2=A0 m.close()
> =C2=A0 =C2=A0 EOF
>
> I have full acpidumps (DSDT + all 27 SSDTs, disassembled), the ERAM
> window dumps before/during/after experiments, and the load-test
> temperature logs. Happy to provide any of these, test patches, or help
> however useful.
>
> Thanks
>
> --=20
> @gaojunwen
