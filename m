Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611A4396D14
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2026 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947818; cv=none; b=VeYyKg7frl5Gfevmn58cXzsZdc9x+RnLjPoIUY39hIZvSTTr7uNdoUZFLf14PIdz0THVcvHKAOWaZ3zEnQxrBN3WeB/kFHe28Tt4Pi2XOoF7xMOAQtNNyW6SQN/LTPrbMGa24N8hiQMdb83lra7FtuntTzvhNaBfSOM35zVxWF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947818; c=relaxed/simple;
	bh=WRV3mPzePWOz5LDtIMXaDNNP9F7G/JBRcfLuawgcihc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CFaEpsKXPZaZEQ2luD9+G42d14We9YFSCeL/mISNLDSqTuVPouSErYkwQCEKzthuZ75Ntjz7EHgcS4BjMj4I1xiRWnx7sE8Mwib4PnWabzDZURPAlraNAZIEhn936MmjgbiqPCCD5aM5bQfXlRpNXmLdwM93YIKxDaG5UifTdx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0mxIUjO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0mxIUjO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07155C116D0
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2026 15:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771947818;
	bh=WRV3mPzePWOz5LDtIMXaDNNP9F7G/JBRcfLuawgcihc=;
	h=From:To:Subject:Date:From;
	b=u0mxIUjOteY+jG47XL5atIQ1sC5LiwaUCgfEE3HCcKO+b5SvvDJou7IcdHOYF+HGT
	 pikFHVX1jiKoZ7VRY4RWo2s1nOWE5pTmtLlYRn6YpP3q59UmhNR3RlQ0Y646CoU1Pz
	 usneT2BQv5LCrY/y934Jcun57+sRj/8Kaq3VwLx+RHmL1vvbt+OC/xZGuukeQuUpBo
	 /saHU74ZMj0OMtIv66R9o5RZUN0MP3wIZaXh4ivwVYhh5dcZDMhKaAwaVoLEPeixnh
	 hY+BkFRQY9W7rfsBNU3tYZhmXMfWFBvq1ud056G6Thx7l5JkEgzSylMwUUkYj+3sSB
	 IEeTMDdSFXZQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 01D68C41613; Tue, 24 Feb 2026 15:43:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221133] New: asus-wmi: keyboard backlight not detected on ASUS
 Zenbook S 14 UX5406SA due to KBLC flag not set in BIOS
Date: Tue, 24 Feb 2026 15:43:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: keithpsu03@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221133-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221133

            Bug ID: 221133
           Summary: asus-wmi: keyboard backlight not detected on ASUS
                    Zenbook S 14 UX5406SA due to KBLC flag not set in BIOS
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: keithpsu03@gmail.com
        Regression: No

System:
=E2=80=A2  Device: ASUS Zenbook S 14 UX5406SA
=E2=80=A2  Board: UX5406SA
=E2=80=A2  BIOS: UX5406SA.308 (06/05/2025)
=E2=80=A2  Kernel: 6.17.0-14-generic (Ubuntu)
=E2=80=A2  Platform: Intel Lunar Lake

Bug:
The asus-wmi driver does not create asus::kbd_backlight on this laptop, even
though the keyboard backlight hardware works. GNOME cannot display a bright=
ness
OSD or manage auto-timeout on inactivity.

Root cause:
The WMI DSTS handler for ASUS_WMI_DEVID_KBD_BACKLIGHT (0x00050021) calls th=
e EC
method GLKB(1), which checks KBLC & 0x80. On this laptop, the BIOS does not=
 set
bit 7 of the KBLC ACPI variable, so GLKB(1) returns 0, and the driver's
kbd_led_init() sees -ENODEV from asus_wmi_get_devstate_simple().

However, the DEVS handler for 0x00050021 calls SLKB() unconditionally (no K=
BLC
check), and the hardware responds correctly:

# Confirm GLKB(1) returns 0 (backlight reported as not present):
echo "\_SB.PC00.LPCB.EC0.GLKB 1" > /proc/acpi/call
cat /proc/acpi/call
# Result: 0x0

# But calling SLKB directly turns on the backlight:
echo "\_SB.PC00.LPCB.EC0.SLKB 0x83" > /proc/acpi/call
cat /proc/acpi/call
# Result: 0x1 (success, backlight turns on)

Relevant DSDT excerpts (BIOS UX5406SA.308):

KBLC is an 8-bit field in the AECO SystemMemory region:

OperationRegion (AECO, SystemMemory, AECB, 0x1F)
Field (AECO, AnyAcc, NoLock, Preserve)
{
    AECS, 32, ACPF, 8, DCPF, 8, TPSV, 8, TCRT, 8,
    PPSV, 8, DSYN, 8, WOLO, 8, EGBF, 32,
    KBLC, 8,   // <-- bit 7 gates kbd backlight presence
    KBLV, 8,
    ...
}

GLKB (get keyboard backlight state):

Method (GLKB, 1, NotSerialized)
{
    If ((Arg0 =3D=3D One))
    {
        Local0 =3D (KBLC & 0x80)
        If (Local0) { Return (One) }
        Else        { Return (Zero) }  // <-- always hits this path
    }
    ElseIf ((Arg0 =3D=3D 0x02)) { Return (KBLV) }
    ElseIf ((Arg0 =3D=3D 0x03)) { Return (0x80) }
    Return (Ones)
}

SLKB (set keyboard backlight) =E2=80=94 works unconditionally:

Method (SLKB, 1, NotSerialized)
{
    KBLV =3D (Arg0 & 0x7F)
    If ((Arg0 & 0x80)) { Local0 =3D DerefOf (PWKB [KBLV]) }
    Else               { Local0 =3D Zero }
    ST9E (0x1F, 0xFF, Local0)
    Return (One)
}

Additional context:
An earlier unit of this same model (before RMA replacement) had the keyboard
backlight working correctly under Linux, suggesting a BIOS update removed or
broke the KBLC bit 7 initialization.

Proposed fix:
Add a DMI quirk for the UX5406SA that skips the KBLC presence check and for=
ces
keyboard backlight support, since the hardware and SLKB setter work correct=
ly
regardless. Something like:

static const struct dmi_system_id asus_wmi_force_kbd_backlight[] =3D {
    {
        .matches =3D {
            DMI_MATCH(DMI_BOARD_NAME, "UX5406SA"),
        },
    },
    { }
};

And in kbd_led_init(), if the DMI matches, proceed with backlight setup eve=
n if
asus_wmi_get_devstate_simple() returns -ENODEV.

Workaround:
Using acpi_call to directly invoke SLKB:

modprobe acpi_call
echo "\_SB.PC00.LPCB.EC0.SLKB 0x83" > /proc/acpi/call

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
