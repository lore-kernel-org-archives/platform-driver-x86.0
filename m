Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9EF2DF14C
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Feb 2026 07:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771572015; cv=none; b=r4+li8UMYcztvbrDXhhvJFEkZsTPdP83t+w20i6h8HLG486UVfWpYW2bsQVlCg5XwoOd/l8OKHmTLvtl9c762mERs0PKIi2vsHtMSI6GPQ4r0GJlrFS0bN+fxLwYbuQMPyGoGr23tsEYEoeGQ0anDMFSGD1kVJo8ppuuZZf9/5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771572015; c=relaxed/simple;
	bh=BX4hyFSyMTuK4vHmg+nsD6WGf32nScexEsrVRgwhovM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZQsKiaAB/7v8xxzYL0hhzUlZS82DqOv7R47CuTNR5lx4gq1osEW3uKtgIK56vA4QjdpLJQd7//q+qKJimIZa49q2qvQnFJzz3DlbWx2O7nyBoeuz4/y/nFGAb5wurnnft0p1BAL2czaPUAQNgaFECk6zA9LAsY6RuVA+AYmGi8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDlkWZVV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDlkWZVV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19935C116C6
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Feb 2026 07:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771572015;
	bh=BX4hyFSyMTuK4vHmg+nsD6WGf32nScexEsrVRgwhovM=;
	h=From:To:Subject:Date:From;
	b=cDlkWZVVhd7GkudAKrmlhsU/NRiv5HuledyJNWC/Xyimmw2YAssuRuvCtYGbtyn2l
	 Zg8NncueJrdHG0krA4w32BBZ6asax4+RDB/bBG+StsWxrFIKTZ+Cp4FopHj8VmmC/G
	 ZMyviL7b2kK8jnHosZCkJ3fo7ariv5r2v7rmT+oq+6eITsUhmicLSV/0KNkx8s7xos
	 xgc4KV11a/QigCUrCcb6xRDA8RCENLwQau774ypZRbl+iyAHE6SO0E5QiBzhPsILPV
	 1kvy7Mt4+aWslMAaQpWaLR92hWPhJwodf5TPUav1Jb07cxe+jlm2fhzjAENIj/8Jk3
	 WVfvuztFeCkug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 02DF3C3279F; Fri, 20 Feb 2026 07:20:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221107] New: Acer Swift SF16-51: Fn+F9 airplane mode key
 generates no events (EC firmware bug)
Date: Fri, 20 Feb 2026 07:20:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: desireall@naver.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221107-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221107

            Bug ID: 221107
           Summary: Acer Swift SF16-51: Fn+F9 airplane mode key generates
                    no events (EC firmware bug)
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: desireall@naver.com
        Regression: No

Created attachment 309408
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309408&action=3Dedit
DSDT/SSDT decompilation, dmesg, rfkill state, WMI devices, and module list =
for
Acer Swift SF16-51

# [BUG] Acer Swift SF16-51: Fn+F9 airplane mode key generates no events

## System Information
- **Model**: Acer Swift SF16-51 (DMI: Milkfish_LNV)
- **BIOS**: V1.31 (11/13/2025)
- **Kernel**: 6.19.3-2-cachyos (Arch-based)
- **Modules**: acer_wmi, intel_hid, wmi_bmof loaded

## Problem Description

The Fn+F9 key (airplane mode toggle) on the Acer Swift SF16-51 generates **=
no
events** visible to the OS:

- No WMI notifications (acpi_listen shows nothing)
- No input events on any device (evtest, keyd -m show nothing)
- No dmesg output
- No rfkill state changes
- No ACPI events of any kind

Other Fn keys work:
- Fn+F10 (touchpad): WMI event 0xBC on PNP0C14:00 (function=3D1, key=3D0x82)
- Fn+F4 (mic mute): F15 scancode via I2C HID keyboard

## DSDT Analysis

### EC Query _Q02 (wireless toggle)
The DSDT defines `_Q02` as the wireless/communication button handler:
```asl
Method (_Q02, 0, NotSerialized)
{
    HKEV (0x02, One)
}
```

### HKEV dispatches WMI notification 0xBC
```asl
Method (HKEV, 2, NotSerialized)
{
    ^^^WMID.FEBC [Zero] =3D Arg0  // function =3D 0x02
    ^^^WMID.FEBC [One] =3D Arg1   // key_num =3D 0x01
    ^^^WMID.FEBC [0x02] =3D Zero
    ^^^WMID.FEBC [0x03] =3D Zero
    Notify (WMID, 0xBC)
}
```

The _WDG table in SSDT24 confirms notification 0xBC maps to
`676AA15E-6A47-4D9F-A2CC-1E6D18D14026` (ACERWMID_EVENT_GUID).

### Two bugs identified

**Bug 1 (firmware/EC):** Pressing Fn+F9 does NOT trigger `_Q02`. The EC
firmware appears to not have Fn+F9 mapped to fire any EC query method. The =
DSDT
defines the handler, but the EC never calls it.

**Bug 2 (acer_wmi driver):** Even if `_Q02` were triggered, `acer_wmi` does=
 not
handle `function=3D2` in its event dispatch:

```c
// acer_wmi_notify() switch only handles:
// 0x1 =3D WMID_HOTKEY_EVENT
// 0x4 =3D WMID_BACKLIGHT_EVENT
// 0x5 =3D WMID_ACCEL_OR_KBD_DOCK_EVENT
// 0x7 =3D WMID_GAMING_TURBO_KEY_EVENT
// 0x8 =3D WMID_AC_EVENT
// 0x2 =3D NOT HANDLED (communication button)
```

The driver would log: `"Unknown function number - 2 - 1"`

## Additional Observations

### Boot-time unknown function
At boot, dmesg shows:
```
acer_wmi: Unknown function number - 9 - 1
```
This corresponds to `_QCA` in the DSDT:
```asl
Method (_QCA, 0, NotSerialized)
{
    Sleep (0xC8)
    HKEV (0x09, Zero)
}
```
Function 9 is also unhandled by the driver.

### Missing acer-wireless device
The `acer-wireless` driver expects ACPI HID `10251229` (SMKB device), which
does **not exist** on this laptop. The wireless toggle path goes through WMI
(HKEV/WMID) instead.

### Intel HID 5 button array
Enabling `intel_hid` 5-button array (`enable_5_button_array=3DY`) did not h=
elp.
The DSDT
has `_QE0`/`_QE1` methods gated by `BTLD` (set by Intel HID `BTNL()`) and `=
OSYS
>=3D 0x07DF`,
but these appear to be for different button events, not specifically Fn+F9.

### Forced acer_wmi capabilities
Reloading with `force_caps=3D0xFFFF` did not produce events for Fn+F9.

### Windows comparison
Fn+F9 airplane mode **works correctly on Windows** with the same hardware/B=
IOS.
This confirms the EC hardware can generate the event, but the EC firmware
selectively does not fire `_Q02` under Linux (possibly based on OSYS or
another OS detection mechanism).

## Diagnostic Steps Performed

1. `acpi_listen` - no WMI events from Fn+F9
2. `evtest` on event2, event11, event12, event20 - no input events
3. `keyd -m` (monitors all input devices) - no events
4. `dmesg` monitoring after clearing - no kernel messages
5. `rfkill list` before/after - no state change
6. Reloaded `acer_wmi` with `force_caps=3D0xFFFF`
7. Reloaded `intel_hid` with `enable_5_button_array=3DY`
8. DSDT decompilation and analysis
9. Confirmed Fn+F9 works on Windows (same BIOS V1.31)

## Proposed Fix

### For acer_wmi driver:
Add handling for `function=3D2` (communication button) and `function=3D9` in
`acer_wmi_notify()`:

```c
case 0x02: /* Communication button - wireless toggle */
    /* Same as WMID_HOTKEY_EVENT but for wireless */
    if (return_value.key_num =3D=3D 0x01)
        sparse_keymap_report_event(acer_wmi_input_dev,
            return_value.key_num, 1, true);
    break;
```

Also add scancode 0x01 =E2=86=92 KEY_RFKILL to the sparse keymap for functi=
on=3D2 events.

### For EC firmware (Acer BIOS team):
Map Fn+F9 to EC query `_Q02` so the OS receives the wireless toggle event.

## Attached Files
- `dsdt.dsl` - Decompiled DSDT
- `dsdt.bin` - Raw DSDT binary
- `ssdt24-wmid.dsl` - Decompiled SSDT24 (contains WMID device definition)
- `dmesg-acer-wmi.txt` - Boot dmesg (acer/wmi filtered)
- `wmi-devices.txt` - WMI GUID listing with driver bindings
- `loaded-modules.txt` - Relevant loaded modules
- `rfkill-state.txt` - rfkill device listing

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
