Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4616D350A0F
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Feb 2026 18:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771785694; cv=none; b=apPUkEXCwn2zEg/leZ920iHaFl+DlNIhvCz2UI+6Wyb3jEKb/nyg0BE5oU8MA39LiVRgeOC/r4aLBUGnhNMgdHnl3F6/BKJE+b8ejoJkZuHmzcDAYotQgG5RGR4qKcQaZuz6yvGzSfHiMEFig7dEz1eTao8kVCeowPVAIgnh0RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771785694; c=relaxed/simple;
	bh=9coE8+FvMsUHOVMznCBsNgkgJzncS9F9UaFtokwQmsE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sGDyWkCWAPDuC9GG28x0nFYW3/afgywkiBlD350rLMJP4zlJpkRaPIOnT86we7AeeE+LPSofHh9GALz8+evhoOsRvpIPg/prLQzDMjmBYuW88H9Ivi917+YNIwkmcYSybR+QyVQCSE/zGnOUv6w8yVUSFWIsvBFE2P4VG+80E8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izjrQ7KP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izjrQ7KP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE5D9C2BC9E
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Feb 2026 18:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771785693;
	bh=9coE8+FvMsUHOVMznCBsNgkgJzncS9F9UaFtokwQmsE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=izjrQ7KPDKRICZHUqcPwduxrgs+18XpuC0aVHCgr7vbihzT2Bjis7SQvMBYJDjrAk
	 3FQ/a8wV1LbyVD9M2W2Asa2wlxCgDUbRLdi+7IsDyT+Pa2IJ0pKp1ZioLocCVj4nWd
	 UDIVQOTlQra7dfNuAslDzJomAUYet49RsOpjPQA3Ny/EHrwZNJrsqC7ChnlgoabJ26
	 2ySeozbj3K0wkeP9gMk2pWs0KvbAvvz6HsvkfKPLrwhp1JqjIHQzbWoyyT4NyBFZI4
	 QWjBBhPC6aLc8DgiV52BgJDOEssA0XGcRpOtd9EGZw5+owc909cyjAzURKB9ou74e4
	 bJx+o0OwtHxCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C84D6C433E1; Sun, 22 Feb 2026 18:41:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Sun, 22 Feb 2026 18:41:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bugs@bzatek.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-WxCoxzPRnB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

Tom=C3=A1=C5=A1 B=C5=BEatek (bugs@bzatek.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugs@bzatek.net

--- Comment #350 from Tom=C3=A1=C5=A1 B=C5=BEatek (bugs@bzatek.net) ---
Created attachment 309425
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309425&action=3Dedit
Asus W480/SYS DSTD dump

Same problem on Asus W480/SYS, booting with acpi_enforce_resources=3Dlax he=
lps.

before:

[    5.627706] nct6775: Enabling hardware monitor logical device mappings.
[    5.627751] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
[    5.627754] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20250807/utaddress-204)
[    5.627757] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?

# cat /sys/class/dmi/id/board_name
W480/SYS

# grep -e ''  -n /sys/class/dmi/id/board_{name,vendor}
/sys/class/dmi/id/board_name:1:W480/SYS
/sys/class/dmi/id/board_vendor:1:ASUSTeK COMPUTER INC.


This simple change makes it work:

diff --git a/drivers/hwmon/nct6775-platform.c
b/drivers/hwmon/nct6775-platform.c
index c3a719aef1ac..d6e3f381d9b8 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -1259,6 +1259,7 @@ static const char * const asus_wmi_boards[] =3D {
        "TUF Z390M-PRO GAMING",
        "TUF Z390M-PRO GAMING (WI-FI)",
        "WS Z390 PRO",
+       "W480/SYS",
        "Z490-GUNDAM (WI-FI)",
 };


dmesg after:
[    5.575896] nct6775: Enabling hardware monitor logical device mappings.
[    5.575941] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
