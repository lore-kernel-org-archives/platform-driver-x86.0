Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650CA3DE43B
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 15:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485990; cv=pass; b=pws8AGaKI6H9NzMCTNm/QCcGCFjIy9hV8hvLRuWFUnctwJ2l2Ntr8hNmZEauwgJOMtZs1x1e/y90oGtfW0bjwKVf58bLp4d3g7Hq/FNX7Xi70U16xoWS74UAFrIIprMHIqhVIA+DSqf51IlP3FRXYwTMjENrGfQQEYjd+a609OM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485990; c=relaxed/simple;
	bh=jIeDsPrHmbiiXFFaYJvd/WqEYmNkFNH/DqJyCXr1uWs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PADhZcM31Tp5dsCbPMoOPPDYccmMEK9GEWXFoiVvzlWSuSQQry5tpxSOc0mc5T8E8bmR6OY1m31ahjMWpLo5Rnzdr8HljVvnUCCBFKoDxw365/a+xwexMOu2ci3iNvl5/WVdw8lk2SjuBzHXMYDiwHf5hPIUt/7VYT7+aKzz1YY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edE+ZqaX; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edE+ZqaX"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a302c06eceso4257941fa.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 08:26:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789485986; cv=none;
        d=google.com; s=arc-20260327;
        b=VmJMRaxBwhGwoYJ1TRoBTDpokZYb3H0Xslz9h/wEH8SZ1pKz3fcdPciTad9wED16Qf
         lmsxTq1Y4r8FCmXt+Cyu3AYk2xk90w+TVYh5rlgqlJeZtAXnZ4vRwdJ6Tlv3Jgr0eH4r
         z8DGsNXwKg7Ia4HzCsjb9QAS05CKQL2E6xCb3IKCV4r3N/US1dYyFezpzuJE+swIPgbN
         EyTbb5uAWboxtS44gno5MDNwymQvxnxpRFdnyvS27+FSXIqqtLvX1LLHLfLQl5NB4PqH
         IdLdaLmJNqPAmBazZ+q7qNLhtnveoZyJNNrfpZZH/x6+ipMhZgQ3snrM0WLxVa5Tc1EW
         L7ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=2dTXBcl4xpkc0pmu2+DSHTNRZ+nnnblY3RMBasOVP00=;
        fh=evxKe3X1gwhQ5WTgxwMxnfuRw6NwTahi0foy2EogC9k=;
        b=MhjGySRgP9hZAM2tIcDl7gljWbxgCzO3IAmvTruynr88BhWlgRG8MtolnN7MO8TXRv
         hTYbB0nfOnK0YSPqpygm0yVy8Sfm4vaJmaEbA4yckdAjVW6YeplEUJ7FSbYpIMpl2258
         FTYDptdwMou4VICTp/i5txLXq0RQ30l1aQ1jBRfiwGKxW+HwQ7B15LN0BFldyitIFsJN
         lqxaTWdgVQmpQ0LPe9UFNpQxtIQJgYJ733LUf1neRTAuVnVJ1h+UIEyryYyq3Xg8Y+qH
         i+P9ylQk5xQqsgtOmu+Hv36Wa+3BVYfvdOxAW2nDIq9BU0up/q3GBpDBZvIvHH8b1CnA
         iQrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789485986; x=1790090786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dTXBcl4xpkc0pmu2+DSHTNRZ+nnnblY3RMBasOVP00=;
        b=edE+ZqaXw3q+1wWjYhpfXny4pP3d7nm49FGJ+Qcw/kKkgr2GaPcfUssZpqoeBnqDXK
         hbDBSlJtw0evw+DStFy+Z3hdho/52pK1LU6XcPYRDucvUtA1ACG5QIsH08Gu7cB6RmgV
         nc/mur/ERoDhULetLUmZsv4r71oF7ppGf9jbuxKMq4XvAnQ4JSKe9C3oubRNaPYF9RG2
         nsbC5c4nXCFVttbCO7yrdSYw3TcvtLX7tif3QBjBHne7gNljHbOP2ptxS7XpEi3qtMiy
         vfnWMIs2WyfiCpfzpvInO8QTwTpTzcEffeVDXl5aKANzX29JnSD3/X2aCD5MLlLBrViQ
         vlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789485986; x=1790090786;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2dTXBcl4xpkc0pmu2+DSHTNRZ+nnnblY3RMBasOVP00=;
        b=kwPTrWI1nSdLo8lpizvK7Ko0j+Y1B3Vu7+bKQcmcnHMDAyhrN9QeiZXqL4bW6rqxGm
         oFz35vZUgVsPaXN7HGpbC83xMt+UVt/Eq5MCmwylU8/KIoQgN0eiNwKcix8+W5N846ep
         82mj47Sqs1LrsSw8oRZe4AusxWQ/9rijLTeaJZCiJGDezFOtvqbKwpQG3A7AAxHMJvU2
         x44xkmLDNDnHljFmCCTg6XaLcOUDPrRZxHVChhHD4cGIVzmOzoUf2A2M0Ie7uZCgH85F
         NCRHwjk5ydN0Z7WDpRh+hz0qZmUAsdheZTIQfud+MWHbF9OPzInUGgFqgl8yfp/tom/1
         KHhw==
X-Gm-Message-State: AFuF++mL5m+ivgmYm+wNiZdpXdsZY4sPlA4+dWJaFqW2qj7zDRFaUVVM
	N5oSABD2SiYiIU0HWe8aI3KFTBoF0aYawcsCPwC3qdZk7Ydmmaai8IsCYrDbHzVh4u/10mm05zs
	5XlE4Hpd6S67sDiM+3vFIv62x99OSUFybjoHU
X-Gm-Gg: AYBFou0GCMM9NlNBYGj+keOkyo0JigMfipNtRzLuPv+Rg5xhsQ+t3GRJs6Oc0YbCcv4
	dO1w6xUPU7UWOAjSjE+mGlwfiNkVhs4Ls8aK0EqvJAni6ntEV627engg59HpBN0xEDjSqxcEH+I
	Vz13nOBV7DEFMetT3UNK8wrZWfElYLlIRNSEbml6f1De2CCuw9J5URyTGKfsAD3LqZ5yMoA2TDA
	RedMyNhnKBRv4IfZjyFthPe5N/2JIIDP0ZGknj7Mo0plh8AuCtcHn3aEYnnj2QpxsWgCOLf9USL
	OgFGEs6p7Ho496qggpB4YLssLQSeJibi3neZwfCOH6JH2VKESvaNfe1j83x3ZWV2xVFdO6Xvu+K
	e+P4gUQkJcubE45IuHgof4v4=
X-Received: by 2002:a2e:be14:0:b0:3a5:86d:cc95 with SMTP id
 38308e7fff4ca-3a5d836a181mr3616851fa.3.1789485985787; Tue, 15 Sep 2026
 08:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?6auYIOS/iuaWhw==?= <btx342@gmail.com>
Date: Tue, 15 Sep 2026 23:26:12 +0800
X-Gm-Features: AcwNN1XLI-S8Qri36KguHBABgP6A7DQrLH0F9Q1qg0RpxEQlptTw_i6Ri3nwkQI
Message-ID: <CAL-my2kByQ9LEkXwRbPJLR=B3szj4oZ73PVfQoTtiXfj3XZW6A@mail.gmail.com>
Subject: =?UTF-8?Q?=5BBUG=5D_Redmi_Book_Pro_14_2024_=28TM2307=29=3A_fans_never_sp?=
	=?UTF-8?Q?in_under_Linux_=E2=80=94_root_cause=3A_EC_gates_fan_engine_on_OSTP_b?=
	=?UTF-8?Q?yte_=28tested_workaround=29?=
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, qby140326@gmail.com, W_Armin@gmx.de, 
	ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This follows up on the report from Milo=C5=A1 Vlku about the Redmi Book Pro=
 14
2024 (TM2307), where the fans never spin under Linux although the same
hardware works fine under Windows:

  https://lkml.iu.edu/hypermail/linux/kernel/2608.1/13832.html

We have now root-caused the problem on an identical machine (second TM2307,
Core Ultra 7 155H) and have a one-byte, experimentally verified workaround.
Summary: the EC only runs its autonomous fan engine when the OSTP "OS type"
byte in its shared memory window indicates a detected host OS. Under Window=
s
the DSDT _REG handler writes OSTP=3D6; under Linux nothing writes it, OSTP
stays 0, and the EC never spins the fans. All OS-side fan paths (MIFS WMI
fan functions, ACPI PNP0C0B fans) are separately broken on this board, so
fans are unreachable from Linux even at 100 degC.

Machine / software
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  DMI: XIAOMI / Redmi Book Pro 14 2024 / TM2307
  CPU: Intel Core Ultra 7 155H (Meteor Lake-H)
  BIOS: XIAOMI RMAMT4B0P0A0A (06/04/2024)
  Kernel: 7.2.3-arch1-3 (bitland-mifs-wmi incl. d3666875c75e)

Symptoms (all verified)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  - Fans physically never spin under Linux, even with the package at
    101 degC for minutes (verified by microphone recording: no acoustic
    change; user-confirmed silence; multiple independent load tests).
  - hwmon (bitland_mifs): fan1/2/3_input always 0, temp1 always 0.0 degC.
  - fan_boost sysfs attribute (WMI function 20): write succeeds, no effect.
  - No WMI fan events (26/32) ever fire (no hwmon uevents under load).
  - Writing cur_state=3D1 to all five PNP0C0B cooling devices: no effect.
  - acpitz thermal zone (SSDT23 TZ00) reports a constant ~26.9 degC while
    coretemp reads 56-101 degC.
  - Under Windows, fans work normally (per Milo=C5=A1 Vlku's dual-boot test=
 on
    the same board).

Root cause =E2=80=94 DSDT/SSDT evidence chain
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1) The EC's memory window and the OSTP byte

   Under \_SB.PC00.LPCB.Q_EC (PNP0C09):

     OperationRegion (ERAM, SystemMemory, 0xFE0B0300, 0x0100)

   Q_EC._REG (fires when EC region space becomes available) maps the OS
   version (OSYS) to an OSTP byte and writes it:

     OSYS 0x03E8 -> OSTP =3D 2      (Linux)
     OSYS 0x07D9 -> OSTP =3D 3      (Windows 2009)
     OSYS 0x07DC -> OSTP =3D 4      (Windows 2012)
     OSYS 0x07DD -> OSTP =3D 5      (Windows 2015)
     OSYS 0x07DF -> OSTP =3D 6      (Windows 2021)

   On this machine OSTP (ERAM offset 0x64) reads 0x00 under Linux: the
   _REG write never happens (verified by dumping the window via /dev/mem;
   the rest of the window is demonstrably live, e.g. live temperature
   fields TSR0-TSRB at offsets 0x08-0x13, exposed to Linux via the SENx
   DPTF sensors whose _TMP read these bytes directly).

2) OSTP gates the EC's autonomous fan engine =E2=80=94 experimentally verif=
ied

   Writing OSTP=3D6 (/dev/mem, single byte) at idle, then running an
   all-core load:

     OSTP=3D0 (control):  101 -> 83 degC clamp, fans silent (no airflow)
     OSTP=3D6:            fans audibly engage and follow the EC's own
                        temperature curve; package temperature bends down
                        mid-load (83 -> 70 degC) instead of plateauing
     QFAN (ERAM 0x60)=3D4 ("full speed" performance mode value): fans spin
                        at full speed regardless of temperature

   After writing OSTP=3D6 once, fan behavior matches Windows (moderate ramp=
,
   full speed only near the EC's high thresholds). A systemd oneshot that
   writes OSTP=3D6 at boot and after resume has kept the machine cool and
   correctly fan-cooled since installation.

3) The MIFS WMI fan functions are not implemented in this firmware

   The MIFS WMI method is WMAA in SSDT20 (device WMID, _UID "MIFS"; _WDG
   entry for GUID B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B, object id "AA").
   Its GET (0xFA) and SET (0xFB) switches implement only functions 0x08
   (SystemPerMode), 0x0A (country/kbd, sub 5) and 0x10 (misc). The fan
   functions used by bitland-mifs-wmi fall through to

     Default { SGER =3D 0xE000 }        /* unsupported, zeroed buffer */

   i.e. function 0x0D (WMI_FN_FAN_SPEEDS) returns an all-zero buffer
   (hwmon zeros incl. WMI_FN_CPU_THERMOMETER 0x16), and functions 0x14
   (WMI_FN_MAX_FAN_SWITCH / fan_boost) and 0x15 (WMI_FN_MAX_FAN_SPEED)
   are silently ignored =E2=80=94 exactly the observed behavior. So this bo=
ard's
   firmware is "MIFS reduced" in the same sense as the MIFS v2 machines
   discussed in Yuming Sun's series, except here the WMI method exists
   but the fan function cases are absent.

4) The ACPI fan path is gated on a device this board does not declare

   SSDT23 declares the five PNP0C0B fans (FAN0-FAN4) with PowerResources
   FN00-FN04. Their _ON/_OFF only set software flags CVF0-4 and call
   FNCL(), which ends in:

     \_SB.PC00.LPCB.UPFS (ETMD, Local0, Local1)

   and LPCB.UPFS (DSDT) does nothing unless

     If ((CondRefOf (\_SB.PC00.LPCB.H_EC) && Arg0)) ...

   H_EC is not declared anywhere in any table on this machine, so the
   entire ACPI fan-control path is a silent no-op. This is why writing
   cur_state=3D1 to the cooling devices changes nothing.

5) The ACPI thermal zone yields to the (disabled) firmware controller

   SSDT23 TZ00._TMP:

     If (!ETMD) { Return (0x0BB8) }          /* constant 26.85 degC */
     Return (\_SB.PC00.LPCB.MXTP ())

   SSDT16 IETM._OSC sets \_TZ.ETMD =3D Zero when the firmware reports
   native trip-point capability (CAP1 bit0 | bit1), selecting "firmware
   manages thermals" mode. Combined with (1), the firmware never enables
   fan control and the ACPI zone never reports real heat =E2=80=94 the kern=
el
   never sees a reason to act.

6) Tachometer caveat for this generation

   The ERAM offsets 0x69/0x6B used by the MIFS v2 fan-tach patch do
   exist here, but they do NOT live-update on TM2307: they hold stale
   values (fan1=3D2, fan2=3D0) even while the fans audibly spin. Reading
   tach on this model will need a different mechanism (or none).

Proposed fix
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Short term (upstream): have bitland-mifs-wmi write OSTP=3D6 (or evaluate/
replicate the _REG OSYS mapping) at probe time for boards where the
firmware leaves it at 0 =E2=80=94 ideally behind a DMI quirk. Note the pend=
ing
DMI-matching problem reported by Milo=C5=A1: this board (DMI_SYS_VENDOR
"XIAOMI", DMI_BOARD_NAME "TM2307") matches neither "Redmi" nor "TIMI"
entries, so any Redmi-specific quirk table needs an explicit TM2307/XIAOMI
entry.

Longer term: a hwmon pwm/fan interface for boards with the reduced
firmware could drive QFAN (0x60) and read the SENx temperatures (ERAM
0x08-0x13 / TSR0-TSRB), giving Linux users real fan control on this
generation.

Current workaround in place (for reference):

  systemd oneshot service, runs at boot and after resume:

    python3 - <<'EOF'
    import os, mmap
    f =3D os.open('/dev/mem', os.O_RDWR | os.O_SYNC)
    m =3D mmap.mmap(f, 0x1000, offset=3D0xFE0B0000)
    m[0x300 + 0x64] =3D 6   # ERAM offset 0x64 =3D OSTP
    m.close()
    EOF

I have full acpidumps (DSDT + all 27 SSDTs, disassembled), the ERAM
window dumps before/during/after experiments, and the load-test
temperature logs. Happy to provide any of these, test patches, or help
however useful.

Thanks

--=20
@gaojunwen
