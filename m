Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3494397323
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787390761; cv=none; b=iUfIa1eLdEggv3dDywchIqZFmvGgWlFMi3MaIZyQca5zVdVdw+zo24rzy4GplRoaPnFG5dKzd943MwEiSjGPuf5Mpqirki7FxS7lgQGLfvQKi4SOd06Nw0Xkca7tZel3wWpUPc1dgHqYZPvi+IHsJv6mJFmZlTgddlBH63r/l6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787390761; c=relaxed/simple;
	bh=9dgu4RXjPtQVvLyZaCtfJ/SrrtZI1RjE3Qqys39xC1U=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KIzc/BFRKpGPtv3BdP+05nSmUmSmgwQijJn+5NqVwhIDlfhktetMpEfDvADSCQiPgA2nKJffQDdi6JBl8JTkMH+NkG6PrlNQPgPblxbG6JRbfyoUAe5myiFtCpKACnHbPhWUgejgGDnS4twFS34L0sr52G+Yri12pHltf0ApHwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5LO7ZXM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5LO7ZXM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52F0CC2BCB8
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787390760;
	bh=9dgu4RXjPtQVvLyZaCtfJ/SrrtZI1RjE3Qqys39xC1U=;
	h=From:To:Subject:Date:From;
	b=R5LO7ZXMDy/upxqkGbhFIOcgqBJrva7W4q4s4YNs22QQcdBmPZ7JWrUo0iyCVa6zw
	 fkFGTmZEUlw3pgjJVAgBqaUgHrGWgm+5CGov+o5rUaxKtC9Fz9qdTjfg3Dl+UK15Wg
	 RPNbABGT3nAC8MwMrcg/23EmTRqoXkMagIPlnJx13o+8Vg8GW4wLCeuVYZbO8VVSu8
	 F3bJZ4EiQz76R7ou/6iP0/uaQJj/M3TA1kCxA6MtE3UXLpciWxKeOzlCTIPKkSAjn6
	 P4GF7nUqeE4BqfmpyeXakGK7CwXPOINzlsB4FYx0c5NwjguAJBzSsp9ve6C4omgzct
	 JAE5knS4fRCqA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 40022C3279F; Sat, 22 Aug 2026 09:26:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221907] New: Acer Nitro AN515-58: internal display backlight
 cannot be controlled (WMBF/WQ00 firmware bug)
Date: Sat, 22 Aug 2026 09:25:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathena161@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221907-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D221907

            Bug ID: 221907
           Summary: Acer Nitro AN515-58: internal display backlight cannot
                    be controlled (WMBF/WQ00 firmware bug)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: mathena161@gmail.com
        Regression: No

Created attachment 310710
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310710&action=3Dedit
Full dmesg output showing WMBF/WQ00 firmware bug

Bug Report: Internal display backlight cannot be controlled on Acer Nitro
AN515-58 (Linux)

Summary
On the Acer Nitro AN515-58 (Alder Lake-P i5/i7 + NVIDIA RTX 3050, Optimus
mode), the internal
display brightness cannot be adjusted from Linux. Writing to the backlight
sysfs interface
succeeds (the value is updated and read back correctly) but the physical pa=
nel
brightness
never changes. This happens regardless of which backlight interface is forc=
ed
(`intel_backlight` via `acpi_backlight=3Dnative`, or the default
ACPI/WMI-selected interface),
and regardless of the `i915.enable_dpcd_backlight` module parameter value (=
-1
default, 1, or 2
all produce the same result). Brightness control DOES work correctly in Win=
dows
on the same
machine (dual-boot), confirming the hardware/EC itself is functional and th=
is
is a
Linux-specific driver/firmware-interface issue.

System Information
- **Model:** Acer Nitro AN515-58 (Nitro 5 series)
- **CPU:** Intel Alder Lake-P (device ID 46a6), confirmed via dmesg
- **GPU:** Intel integrated (i915) + NVIDIA RTX 3050 Mobile, BIOS Display M=
ode
=3D Optimus
- **BIOS/Firmware:** Insyde H2O, version 2.21 (latest available from Acer at
time of report)
- **Distro:** Ubuntu 26.04
- **Kernel:** 7.0.0-30-generic (also reproduced on 7.0.0-14-generic)
- **Dual-boot:** Yes, Windows on a separate NVMe drive. Brightness control
works correctly
  in Windows on this same hardware.

## Steps to Reproduce
1. Boot into Ubuntu with default kernel parameters (`quiet splash`, no
backlight overrides).
2. Observe `/sys/class/backlight/` =E2=80=94 result varies depending on ker=
nel cmdline
(see below).
3. Attempt to change brightness via GNOME slider, or directly via:
   ```
   sudo brightnessctl set 20%
   sudo brightnessctl set 80%
   ```
4. Observe that the sysfs `brightness`/`actual_brightness` values change
correctly, but the
   physical panel brightness does not change at all.

## Observed Behavior by Configuration

### A) Default cmdline (no acpi_backlight override)
- `/sys/class/backlight/` is **empty** =E2=80=94 no backlight device regist=
ers at all.
- Relevant dmesg:
  ```
  [    1.195486] wmi_bus wmi_bus-PNP0C14:00: [Firmware Bug]: WMBF method bl=
ock
execution control method not found
  [    1.196731] wmi_bus wmi_bus-PNP0C14:01: [Firmware Bug]: WQ00 data block
query control method not found
  [    3.312430] acer_wmi: Acer Laptop ACPI-WMI Extras
  [    3.312473] acer_wmi: Function bitmap for Communication Button: 0x801
  [    3.873181] i915 0000:00:02.0: [drm] Skipping intel_backlight registra=
tion
  ```

### B) `acpi_backlight=3Dnative`
- `/sys/class/backlight/` shows only `intel_backlight`.
- `brightnessctl set <N>%` updates `current brightness` and `actual_brightn=
ess`
correctly
  (verified via `brightnessctl -l`), but the panel does not visibly change
brightness at
  any percentage from 0=E2=80=93100%.

### C) `acpi_backlight=3Dnative i915.enable_dpcd_backlight=3D1`
- Same as B =E2=80=94 sysfs values update correctly, no visible change on t=
he panel.

### D) `acpi_backlight=3Dnative i915.enable_dpcd_backlight=3D2`
- Same as B/C =E2=80=94 sysfs values update correctly, no visible change on=
 the panel.

### E) Windows (same machine, dual-boot)
- Brightness slider and Fn+brightness hotkeys work correctly and produce a
visible change.

## Root Cause Analysis (as far as I could determine)
The kernel explicitly flags a firmware bug on this system during WMI bus
enumeration:
```
[Firmware Bug]: WMBF method block execution control method not found
[Firmware Bug]: WQ00 data block query control method not found
```
This indicates the ACPI/WMI method blocks (`WMBF`, `WQ00`) that Windows lik=
ely
uses (via a
vendor-specific WMI GUID, possibly through Acer's own driver stack /
NitroSense) to control
the panel backlight are not correctly exposed to the generic Linux ACPI-WMI
driver
(`drivers/platform/x86/wmi.c`), or are present as a data Buffer rather than=
 a
callable Method
(similar in nature to prior firmware-bug reports on other vendors, e.g.
https://bugzilla.kernel.org/show_bug.cgi?id=3D207835 for a different Acer m=
odel).

I also checked `drivers/platform/x86/acer-wmi.c` in mainline (torvalds/linu=
x)
and found this
model already has a DMI-matched quirk entry:
```c
static struct quirk_entry quirk_acer_nitro_an515_58 =3D {
    .predator_v4 =3D 1,
    .pwm =3D 1,
};
```
matched against `DMI_PRODUCT_NAME =3D "Nitro AN515-58"`. This quirk enables
platform-profile,
hwmon, and PWM (fan/RGB) capabilities, but does **not** set the `.brightnes=
s`
quirk field,
so `acer-wmi` does not attempt any EC-level brightness read/write for this
model. This may be
relevant if the correct fix is an acer-wmi EC quirk (similar to how
`.brightness =3D -1` is used
for the Aspire 1520 quirk) rather than (or in addition to) an i915/ACPI
backlight fix.

Since forcing `intel_backlight` (native PWM/DPCD via i915) also fails to mo=
ve
the physical
panel, my current best guess is that on this model the eDP panel's brightne=
ss
is NOT
controlled by standard PWM or DPCD at all, but exclusively through the vend=
or
WMI/EC path
that is broken due to the firmware bug above =E2=80=94 meaning i915 native =
control may
be
architecturally unable to reach the panel on this hardware, regardless of D=
PCD
mode.

## What I Have Already Tried
- `acpi_backlight=3Dnative` (forces intel_backlight to register) =E2=80=94 =
no effect on
panel.
- `i915.enable_dpcd_backlight=3D1` and `=3D2` =E2=80=94 no effect on panel.
- Updated to latest available BIOS (2.21) =E2=80=94 no change in behavior.
- Updated kernel to 7.0.0-30-generic (also tested 7.0.0-14-generic) =E2=80=
=94 no
change.
- Confirmed via `brightnessctl -l` that sysfs values do update correctly in=
 all
  configurations; only the physical panel fails to respond.

## Requested Information / Next Steps
- Could this be addressed via an `acer-wmi` EC-level brightness quirk for t=
his
model
  (similar to existing quirks for other Acer models), bypassing the broken
WMBF/WQ00 method
  path?
- Alternatively, is there a known DPCD/AUX-channel quirk needed for this
specific panel that
  isn't covered by `enable_dpcd_backlight=3D1/2`?
- Happy to provide `acpidump`, full `dmesg`, `sudo cat
/sys/kernel/debug/dri/0/i915_display_info`,
  or test debug patches =E2=80=94 please advise which is most useful.

## Attachments to Include When Filing
- [ ] Full `dmesg` output (`sudo dmesg > dmesg.log`)
- [ ] `sudo acpidump > acpi.log` (or `acpidump -d -t > DSDT.dsl` for a deco=
ded
table)
- [ ] `sudo dmidecode > dmidecode.log` (confirms exact model/BIOS version)
- [ ] Output of `brightnessctl -l` before/after a `set` command
- [ ] `cat /proc/cmdline` for each configuration tested

## Suggested Filing Location
- https://bugzilla.kernel.org =E2=80=94 Component: **Drivers / Platform-x86=
** (for the
acer-wmi /
  WMI firmware-bug angle) or **ACPI/Video** (for the i915 backlight angle).
Consider filing
  under Platform-x86 first since that's where the explicit `[Firmware Bug]`
originates, and
  cross-reference from there if maintainers redirect it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
