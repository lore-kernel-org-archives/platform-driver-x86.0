Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833F12DA75C
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 12:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781956897; cv=none; b=Ga8qyugei1rFXoFYP8xNAycJfrWJa7PZ52eJwjzYFfBTnP6noBzibU68szlzxxCqrAoM5YOqiOg6hlsn4zobwZA1dQkQyElzYTg6j52O4G9HbiqgTZrXikfKnbFry8rCyryGoH915/YqBh+tic5QT4hWpu1aHaMjy5XR8B4yd6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781956897; c=relaxed/simple;
	bh=CKw0QpE84gDgFgJ0OvK+v13K+yit5pP8rbaSugARnms=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pkr66kXP+hTtS4q5aBdsIDA9AhkqhuT2ySQ3ZU9+ElIj3k3or5xFTogC+VguUTEm9OiOLBHSp6Z+GOVs6T2shT/LDQSLDii804vJ19rHKF0e0t58Ts4qgBJrwg+ATIb9J7c7Wzp/QKLq/xQ2N0yViiXAkASUXAmeUFpt1yhplhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cm6/MBRa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cm6/MBRa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CDE5C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 12:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781956897;
	bh=CKw0QpE84gDgFgJ0OvK+v13K+yit5pP8rbaSugARnms=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Cm6/MBRasbS//sEIsB6Y+qK0gz7U6XtaRMlsBXDWMzv1ToJHAx2JH0tE0zVJi6r90
	 ES5Y8C9167Ic/M/HHGL8LOqh9RIn5hXLAxSdzplxbhloV15CngqMUG8qP2W3cLDyVT
	 T5Jb+ridkndapu0U076SH/v2AfzDlNDZZx9WnZNOLL0LmZ5S8RCGkBnDDml0J4WQQV
	 8LzCg4FnPZrPk4L4iz6L0ZDxIapZjBsfeuRM9uYKEpzzxetkF2afuoekX3LCZRXX2S
	 W48uG4EmSom5bBrev+2ueSB6rCL2EZvQIwFI0EjMbgQEmbBxTycgkr5ivEPSWRQZU5
	 56UkwUr9oOR6w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DEAF0C4160E; Sat, 20 Jun 2026 12:01:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 12:01:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-myDB34J2yY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #39 from Milan Oravec (moravec@ukf.sk) ---
Now is:

mt7925_phy0-pci-6200
Adapter: PCI adapter
temp1:        +52.0=C2=B0C=20=20

same usage...

root@migo-HP:/home/migo# sudo lspci -vv -s 62:00.0 | grep -i aspm
                LnkCap: Port #1, Speed 5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s <2us, L1 <8us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM L1 Enabled; RCB 64 bytes, LnkDisable- CommClk+
                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
                L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
root@migo-HP:/home/migo#=20

In powertop is auto suspend enabled:

   Good          Autosuspend for USB device Wireless_Device [MediaTek Inc.]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
