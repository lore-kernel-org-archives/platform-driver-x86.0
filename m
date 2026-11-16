Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823821;
	b=CUjECHjWyKEBR48XY0Vveo/UyU/mLA0fnadpb5h8Tsiw9NdJxuNr/bsv6CB5ThmDoH5p
	 t+1YP3cTah+xuNSygt9e7gGn/yzD8x/XuiNccuW7CX1SmpORrODMQN3XTC2rWBYykAHIZ
	 0z5vvW1Wf+h6GVKndvkhk9NWXkSheOoD9aOz532q2LEVHkphwHjEgygXlTOOHEDjVgPNf
	 gXTu9X8VtKCykUiOwdRet5NaGXRmHjlvJrV0jXszZmuBjxx89JbToNTjfEqEpw9z9DUyi
	 Nhykj9XwAeR+Pk+MVqJM6wPXXBK+3KbrI70xOHz0uzIOgFTcU+I3gFSuv+dxmata5xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823821;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-Bugzilla-URL:
	 Auto-Submitted:MIME-Version;
	bh=y344iVB9E7qeVOOx3lS3DhCfiGFAnkrqRf8OYYF1Svo=;
	b=5jJ9MjWkA4HlyOMaVObLx1r4H1Xiej2y8qtpsdxKSkDitZ9RidmxVfSfaNO4nnEPFUYD
	 471/nFgFWUr8TLw1DeImarmILTFXBCcnbyRFf0M3VdSbDDnThvaEsf4pgLMxNEDQfwDWN
	 6v9u5nx9lwRoNlwTSRZOThapGGJZq+dKaH4yONH0kH+lZ0h469plW+7CfH3aAguGAYDBh
	 MCE9h8AqOaE4WWsllO+/eShx8VuxiOevq7EJFF3OjcV35vuSEWZ0Oc4C2s8/Mbiba1QYJ
	 /Ws9D8l+fwWWbY+JrHpmLfcB6hozE2gIN834ky0Tw+VexP9hauaSYRbNmQRUTFYWpZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nS1cMV5v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040D7606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nS1cMV5v
Received: by smtp.kernel.org (Postfix) with ESMTPS id C07471F000C5
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 10:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794823820;
	bh=y344iVB9E7qeVOOx3lS3DhCfiGFAnkrqRf8OYYF1Svo=;
	h=From:To:Subject:Date;
	b=nS1cMV5vC/ckVXu4t4/901GrFUnOhgxHemGMqnC8ILruvSIwtqkIpHI7CBzMtlZfQ
	 JNsXAsGRrp972O++Cox9EEV9LrStd9tPm4TXz46MlF71OD8QDqQcUlIvaCpWwwXc/v
	 vtBJMXdTSZ21gIAJT9wX2rED2DdhbDNl8zcmuqDgBNxQadwb5oPPA/EGeJ2PQWhLof
	 LBnmtopsCu36HC8joPcacdTAFLbVxh03tzwDHfYochZfSAH1bAPuJwQCJRXZZavIXc
	 tSrdh6rLh5XBxJrcl+FaXDPUTOBb//HPMh0v2jZYai8O+dov7zXhrfs3IdOz8oDnVz
	 62ItOusjcmY0w==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id AE364240040C; Mon, 16 Nov 2026 10:10:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222275] New: lg_laptop: LG gram 16UD55U - kbd_backlight has no
 effect, unknown WMI scancodes on Super key
Date: Mon, 16 Nov 2026 10:10:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daxter1992@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-222275-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222275

            Bug ID: 222275
           Summary: lg_laptop: LG gram 16UD55U - kbd_backlight has no
                    effect, unknown WMI scancodes on Super key
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: daxter1992@gmail.com
        Regression: No

Created attachment 311472
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311472&action=3Dedit
dmesg and acpidump attached

Hardware: LG gram 16UD55U-G.AX85BN (board 16U55U), AMD Ryzen AI 7 445, BIOS
GP115
Kernel: 7.3.3-300.fc45 (also tested 7.4.0-rc2)

1) Keyboard backlight
lg_laptop loads and creates /sys/class/leds/kbd_backlight, but writing
to brightness has no effect: the value stays at 0 and the keyboard
does not light up. Fn+F8 does nothing either.

2) Unknown WMI key events
Each press of the Super key makes the "LG WMI hotkeys" device send
KEY_UNKNOWN with scancodes 0x30020000 (press) and 0x30020001 (release).
This breaks the GNOME overlay key, because it sees another key between
Super press and release. Remapping via hwdb does not work (unknown
sparse-keymap entries). Workaround: LIBINPUT_IGNORE_DEVICE=3D1 on
"LG WMI hotkeys". These scancodes should probably be added to the
keymap as ignored.

dmesg and acpidump attached. Happy to test patches.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
