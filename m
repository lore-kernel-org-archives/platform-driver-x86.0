Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42B315B971
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Feb 2025 10:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739959615; cv=none; b=alOAC9bZe1ER0qKfi9hB48Sp80O3ezo7zgZWNyULCHzuSj9tj/QFThiqgg3klfleFXqAWuINwLGB/RVC1i5QfMXukRgeQbUlCcbJFUUSkacI7y+2A98y5T730yTWhbvrUrp5Qn+3LGvG94XhRSQddI4B2EeKlCUtDbVdnG805DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739959615; c=relaxed/simple;
	bh=2rNefNk4d8k03KvHlinOxaAgUt1eZZxZvdwOHZwpbCQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N3jOf/0M1Eg43Qc8qu8hNhpH0Uz+QGjOmT6zmhu4LU7LvPMoNi271PdvLgHWIptFNRKvkptfhLG5Jeec3LEK4RMfwu20xLeMJLVy9E5H4El2uyJXUhWiJ3SsXturmNSxSEUwyx5Tnddangd2t6dJjto/LFF6wQhnQsMt6CseeRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbKiZkQg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbKiZkQg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 514F8C4CEE7
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Feb 2025 10:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739959615;
	bh=2rNefNk4d8k03KvHlinOxaAgUt1eZZxZvdwOHZwpbCQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FbKiZkQgjswuCw9PYD944ugoqV1ZVoOe+OHRhzTwkdqKB4o+1seROw4oGbROBPHhV
	 V+LNi6uCdD9auMKpTa4Mgi5P3N9JI+vA+2KGcH5FqOifcxyjbvAaIX7qvc3LcogAbR
	 z0Xc52+5w/Aizcy0A0pp2ym7b7JLq7v6otUs5WKg7fvwUK44FuK8Yf1T2xPd8mrR2w
	 5Wm69m2PPghUA2jupHr7DPTkHNEvPX71RmM7WLuCthK/IMp4Jc3XJhcJfQnGkHxqLf
	 8q7ffWNWP9HYsXk2g+IPtmnseZQ0APO10ooNTWnrRmNSF++tZgjVfDRlT0ACP04FG5
	 pswMfmRSV5TVQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3EC5EC41614; Wed, 19 Feb 2025 10:06:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] [BAD FIRMWARE] amd-pmf AMDI0102:00: ta invoke cmd init
 failed err: 60005
Date: Wed, 19 Feb 2025 10:06:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: yaroslav@lll.gd
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218863-215701-kUv6XRRqGE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218863-215701@https.bugzilla.kernel.org/>
References: <bug-218863-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218863

Yaroslav (yaroslav@lll.gd) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yaroslav@lll.gd

--- Comment #36 from Yaroslav (yaroslav@lll.gd) ---
Have the same message

System:

  Host: elitebook Kernel: 6.13.3-cachyos1.fc41.x86_64 arch: x86_64 bits: 64
    compiler: gcc v: 14.2.1 clocksource: tsc
  Desktop: KDE Plasma v: 6.3.0 tk: Qt v: N/A wm: kwin_wayland with: krunner
    vt: 2 dm: SDDM Distro: Fedora Linux 41 (KDE Plasma)
Machine:
  Type: Laptop System: HP product: HP EliteBook 845 14 inch G10 Notebook PC
  Mobo: HP model: 8B6E v: KBC Version 60.34.00
    part-nu: 818N0EA#ABU UEFI: HP v: 82 Ver. 01.07.00
    date: 11/14/2024
CPU:
  model: AMD Ryzen 9 PRO 7940HS w/ Radeon 780M

[    5.375196] amd-pmf AMDI0102:00: ta invoke cmd init failed err: 60005
[    5.396214] amd-pmf AMDI0102:00: registered PMF device successfully

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
