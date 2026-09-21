Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC463B961A
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003106; cv=none; b=ejTGF5MuVl3xYGbcGRT1/XRzoELBsFTcLpCoYA3pqGv/pfOxHhDcAVkmz3JSt2vkkkOnFGjhe0BDXtajG4UOcLC2zIAkMuSWVW6B2BVyo5J2gIwo6IhyAjLL8IsSs8YSt3bacwa+06L0jMK4dTvIwLJnAbPDVIrdmRcWW9+yfAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003106; c=relaxed/simple;
	bh=w5ruA24afrPSuUvZGgkVOlOvNB/a3e0IW+RkrjQiytc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=noA9Y/FK2+cXKoRZ1qqIMHoxE9hAueD1Gu+xijVbHg+iBbXSaLOYseH38UMK1EBr2mdsYq9Vx6edNmNAZhYKsCKCl6B4UHy7GqQdjasB+hogyupF/id5RGH/9UYvUQ2PWGxfM9zmXXCDvxJzbbryMFUZxqSey84BoyxHOI0J7K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCU+cMaR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCU+cMaR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62C89C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 15:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790003105;
	bh=w5ruA24afrPSuUvZGgkVOlOvNB/a3e0IW+RkrjQiytc=;
	h=From:To:Subject:Date:From;
	b=MCU+cMaRbuDmDpuVMTs2zhFunrWwFdExZz+Cfjjg0MYEvo3Wznky0PCsf+IKJXSnh
	 k96PGwEQOKCq7MFMgdaT2DJeoB1UgsmSehA3+vSwc4fW0S6rUdLaEyOlWH06kqhfrV
	 6hkOqa0jfJIEPfdMoAva42SeN9sB/69NPRlVXu9Qhi8KOrneaiVdToBg9lYjfd/nbp
	 T0C/A2SeieRuCaJ9LYnifvusn/Rz1e3oJLWMoOYxOIaSu0OToACiHSf61hcmo29VbP
	 Y5FwEiebDuXGIG7vRPH6VR3+BwWgPT+bXbhnhVyuAXkipDUyECTASr/Ck6M79mz3jR
	 DW5Uev4QHs0qA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 26285C4160E; Mon, 21 Sep 2026 15:05:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] New: hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Mon, 21 Sep 2026 15:05:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: neonblade018@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-222044-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222044

            Bug ID: 222044
           Summary: hp-wmi: Mute and mic-mute LEDs not supported on HP
                    Laptop 15-fc0xxx (board 8DC9)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: neonblade018@proton.me
        Regression: No

Created attachment 310897
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310897&action=3Dedit
Hardware, DMI, and WMI diagnostics

Hardware Environment:
- Laptop: HP Laptop 15-fc0xxx
- Motherboard DMI: 8DC9
- Subsystem ID: 103c:8dc9
- BIOS Version: F.25
- Audio Codec: Realtek ALC236 (103c:8dc9)
- Kernel: 7.2.6-zen2-1-zen x86_64

Problem Description:
The speaker mute LED (F5) and microphone mute LED (F8) work under Windows, =
but
remain unlit under Linux when toggled.

Diagnostic Summary:
1. Ruled out ALSA/HDA codec control:
   - The LEDs are electrically decoupled from the Realtek ALC236 codec.
   - Standard ALC236 quirks and direct hda-verb coefficient writes (node 0x=
20,
verbs 0x500/0x400 on indices 0x0b, 0x19, 0x34) return value =3D 0x0 with no
effect on the LEDs.

2. Input and ACPI Event Status:
   - Keypresses are properly received by the input subsystem (KEY_MUTE and
KEY_MICMUTE).
   - acpi_listen shows that F5/F8 emit standard button events accompanied by
WMI event notifications:
       button/mute MUTE 00000080 00000000 K
       wmi PNP0C14:01 00000080 00000000
       button/micmute MICMUTE 00000080 00000000 K
       wmi PNP0C14:01 00000080 00000000

3. WMI & Driver Status:
   - Both the HP BIOS event GUID (5FB7F034-2C63-45E9-BE91-3D44E2C707E4) and
command GUID (95F24279-4D7B-4334-9387-ACCDC67EF61C) exist under
/sys/devices/platform/PNP0C14:01/wmi_bus/.
   - The hp-wmi driver instantiates the hotkey virtual input device, but do=
es
not register any LED class devices under /sys/class/leds/ for this board
revision.

Request:
Please add support/quirk mapping for HP board ID 8DC9 (subsystem 103c:8dc9)=
 in
hp-wmi to control the Embedded Controller mute and mic-mute LEDs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
