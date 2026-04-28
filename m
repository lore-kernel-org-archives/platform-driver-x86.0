Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7767B16132A
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 21:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777411437; cv=none; b=J+MWPeEfYtxw67NlxyXgSlt3YrBHJ68TR4A/b5/V0wgxAe7MeAgdwiy187UhjrWMjPgIzwooK2z3z5zxiLbbP8aNCpv+GylJmqqgsKedyL8IW6Ga7Lovt/XRh9eQQf8fqB5pskYVraVZ29BBGkPgPzik8HsECSLi/B+KPFzCQ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777411437; c=relaxed/simple;
	bh=7/c6Rw+TgD9Er8R8X+VKTAKn9zjXITIp29ogNa8yaDM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=beDFMxIoxj4fqhgub7RNVDGRfkSDMC3P+UCNN4mCdrsEX28A+k1HTgZNv40dGQhyGsneh8R7MBzu/eNyY15qZLsjrOt25XtrLx8Cb+H/m2xBcankU5DEf3rVBstx973/bIb5bx+000uIJn1ud5BX+T6DtCZykn9m9CZ4Ps98juI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgcrQLHZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgcrQLHZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14951C2BCAF
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 21:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777411437;
	bh=7/c6Rw+TgD9Er8R8X+VKTAKn9zjXITIp29ogNa8yaDM=;
	h=From:To:Subject:Date:From;
	b=ZgcrQLHZLyPDkTCi0QzWixqtstSbfO6m3XHCKYY3Rv9pdVQkDl9PpYSN674C/NBN8
	 +NJfWltendv4EIhAfCZwPFodHdOSe1zNFTQGr99e3zmys+Pc+owodOm+NimWJnKhzL
	 y9BcGmpr6RWTL3251kBYix8yk7M2Iaf1r+d1E63vK0tWvgnFW+y0NeERwwAaMvHXqo
	 7H8ioRa6/e066aDu1LaB9lVE26YC7LespikviAWfK8/t/fTehEmXncTolWkVGPQRhT
	 DEbN/ZJiIr9b4T1MmLTtpzyqS91nEIrj3qqh8Gtq9fd3x+G3vkjVppoq/ZLacT1rsu
	 zXeEa4wmvw7JA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0BB90C3279F; Tue, 28 Apr 2026 21:23:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221430] New: nvidia_wmi_ec_backlight: brightness writes
 silently dropped on HP OMEN 16 (2025)
Date: Tue, 28 Apr 2026 21:23:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: floquimaurice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-221430-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221430

            Bug ID: 221430
           Summary: nvidia_wmi_ec_backlight: brightness writes silently
                    dropped on HP OMEN 16 (2025)
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.19.14
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: floquimaurice@gmail.com
        Regression: No

Created attachment 309992
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309992&action=3Dedit
ACPI tables (DSDT + all SSDTs, raw .dat and disassebled .dsl)

Reporting a backlight issue on a recent HP OMEN 16 with hybrid Optimus.

# System

- HP OMEN by HP Gaming Laptop 16 (2024/2025)
- Intel Meteor Lake + NVIDIA RTX 5070 Mobile, NVIDIA driver 595.x
- Fedora 44, kernel 6.19.14-300.fc44.x86_64
- Hybrid graphics mode (BIOS)

# Symptom

nvidia_wmi_ec_backlight loads, sysfs is created, writes to brightness are
accepted, but the panel does not respond and actual_brightness returns
"No data available".

  $ echo 50 | sudo tee /sys/class/backlight/nvidia_wmi_ec_backlight/brightn=
ess
  $ cat /sys/class/backlight/nvidia_wmi_ec_backlight/actual_brightness
  cat: actual_brightness: No data available

The AE_AML_OPERAND_VALUE errors visible in dmesg come from hp_bioscfg
against \_SB.WMID.* and are unrelated to the backlight path.

# What the firmware does

The NVIDIA-bound WMAA is at \_SB.PC00.AWMI.WMAA, GUID
603E9613-EF25-4338-A3D0-C46177516DB7. Its write path declares LEDB as the
new brightness value from Arg2[4], but never reads it:

    ElseIf ((MODF =3D=3D One))
    {
        Sleep (0x64)
        Local1 =3D \_SB.PC00.GFX0.CBL1     /* reads existing value */
        Local3 =3D (Local1 * 0x02)
        If ((Local3 =3D=3D Zero)) { Local3 +=3D 0x02 }
        \_SB.PC00.LPCB.ECPW =3D Local3
        Return (Zero)
    }

The firmware propagates \_SB.PC00.GFX0.CBL1 (which the Windows display
driver populates before invoking WMI) to the EC PWM register, instead of
using the value the OS driver passed in. Under Linux nothing populates
CBL1, so the WMI call returns success but is effectively a no-op.

# Attachments

- dmesg-clean.txt
- dmidecode-clean.txt
- acpi-tables-omen16.tar.gz (DSDT + all SSDTs, raw and disassembled)
- lspci-full.txt

Happy to test patches or provide additional traces.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
