Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5432376036
	for <platform-driver-x86@vger.kernel.org>; Sat,  5 Oct 2024 07:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728113990; cv=none; b=Jb6x8k2FYBFRh1NRGklM0itRBlZl9QgCM0cueKDRTekKNkNFVw6AUaL/B5kY9fYVS6TLczch29r2zDFab689mHEzb9PLl8eItNvGXEmjsMFnZheRfFgjIKwdjhUzduacs7vK4VI/i6NnPzRJuhEKnsMrz5pRpvesc5OcgBo0v8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728113990; c=relaxed/simple;
	bh=dsPdMVZF1sewMCCegJkPzwAD/deNmr6PMf31QnLZ1rE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n6Vt5oPbfIgQY05jkkWAqcOEUft5WcbGifKAYcDQVmVu5DY3tFBYkRge7CM6YtKlqU2RZajDAIdm5WVx9cIxoxvkbiYN+RK33RDe/R+xKIbmz6vAkzt0AkpPYLOGzQKE5qNEL8fJxSVFTUixXmqVT58gm4+CgS2CkZ24DlFIFBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCd3QriN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCd3QriN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC52BC4CECE
	for <platform-driver-x86@vger.kernel.org>; Sat,  5 Oct 2024 07:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728113989;
	bh=dsPdMVZF1sewMCCegJkPzwAD/deNmr6PMf31QnLZ1rE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CCd3QriNPLC/kIn+D5jQxexx0D+0P6eIPushVjBIiDMvw0v6ySrhfOGZyEs0/i50f
	 73C3ujvIL+5gmd8gst04duHOcgQgNW799Ntbj0uQmbMlVJ/r+BLJyBgL1/sMI5ln5z
	 rwtoW0eYZYvo+ntLkZe8pY9rdetxtIWN7T/zaqs5GTI5VMThPUk6pas2Lj/JPlP5jc
	 kG0kuu/xRYlKLk9ZM7h6/aIIqTVy8+8O+CNod/HBTBxXVpzql0n35/9VAcVNg4Le3p
	 awa7m2/D8KAH9Id2fNZ41N7fNGQVkY0bzAI1QPT1KUl2ppWiV+UXkY+/vS2oPGTPh5
	 rn6ltE6YDfq4g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CC942C53BC8; Sat,  5 Oct 2024 07:39:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] amd-pmf AMDI0102:00: ta invoke cmd init failed err:
 60005
Date: Sat, 05 Oct 2024 07:39:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: tomas@digitalspace.name
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218863-215701-UOVE3RdwKX@https.bugzilla.kernel.org/>
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

Tom=C3=A1=C5=A1 Mark (tomas@digitalspace.name) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tomas@digitalspace.name

--- Comment #35 from Tom=C3=A1=C5=A1 Mark (tomas@digitalspace.name) ---
The same on=20

OS: Kubuntu 24.04.1 LTS x86_64=20
Host: HP ZBook Firefly 14 inch G10 A Mobile Workstation PC SBKPF=20
Kernel: 6.8.0-45-lowlatency=20
Uptime: 22 mins=20
Packages: 4630 (dpkg), 7 (flatpak), 21 (snap)=20
Shell: bash 5.2.21=20
Resolution: 2560x1600, 3840x2160=20
DE: Plasma 5.27.11=20
WM: KWin=20
WM Theme: Breeze=20
Theme: [Plasma], Breeze [GTK2/3]=20
Icons: breeze-dark [Plasma], breeze-dark [GTK2/3]=20
Terminal: konsole=20
CPU: AMD Ryzen 7 PRO 7840HS w/ Radeon 780M Graphics (16) @ 4.290GHz=20
GPU: AMD ATI c3:00.0 Phoenix1=20
Memory: 4193MiB / 58760MiB=20

log
Oct 05 09:16:00 nb-vortex kernel: amd-pmf AMDI0102:00: ta invoke cmd init
failed err: 60005
Oct 05 09:16:00 nb-vortex kernel: amd-pmf AMDI0102:00: registered PMF device
successfully

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
