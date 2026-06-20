Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD1F346E51
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 12:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781957755; cv=none; b=bpspGY+p16SjjzagKyeDUok4NXndKWN9PDIJjbIo0kW7U/EDosbor7kRqHKtPG3ycdNalo0wiWeFQIolEiPHzKjziVOVVdvlhFXcXa/4csYHtJNm27N3sMg/THLthtKD08frtEM0sO6bkUfqq9G6BCIxabH2sW5L0G0u90SyJAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781957755; c=relaxed/simple;
	bh=Xk2C/YPX6fxZMAb6fQK2+NtqJUmRsHiz8rTkG5awfg4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J2eImpsPySc+QBfqqM74ihfRXid11cgnsEVnDNlrMZ5sUlSBujQIrf+/YP7QmQo6U6Dw2fd+A4Ifyp8xskDmvv3gfdlEY/AC7YSYlXexJN6LMJvzvM0OPMyXlAbir/Ip1za13+WtJMcCDesThQdS2uZ5+EdtvCrxCcLpgjpsJTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vIyHjo5d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vIyHjo5d"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5346C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 12:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781957754;
	bh=Xk2C/YPX6fxZMAb6fQK2+NtqJUmRsHiz8rTkG5awfg4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vIyHjo5dE7ZdF4BiMdjn5UXb+TenybGqXX/I6/hbjfxO7Dwg7+IL/+TCmIzvTXZcV
	 OuslfwYo14+Ew5tpxzX+s5btbpEVLmxmQSyZOav9JXGdrWkotAGOf77q+/Q3iv57UH
	 FAr4u1n16KJr6KA2C8liSocCrRSAJQnxZaHsdz7805kIkd6GzitGj0wanY18kCIFoQ
	 90HV7uDiwpPvU+oAuKf6O6DSiQK9ggQq7GPMFqsX7JC1x7hOnv7GQlHhxQvmqIrhif
	 CwjzI4eZ9VursW87haPPcU/JAolvT7bMvtefE3I2xVMb39MdfJBbpWKNkEUugiq0A9
	 Mwewy6oSuAIBA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DD886C41612; Sat, 20 Jun 2026 12:15:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 12:15:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scardracs@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-o4GFSIZxsH@https.bugzilla.kernel.org/>
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

--- Comment #40 from Marco Scardovi (scardracs@disroot.org) ---
That is a great improvement! 52=C2=B0C is a very healthy idle temperature f=
or a WiFi
7 module under Linux.

Your lspci output shows that ASPM L1 and the ultra-low-power L1.1/L1.2
sub-states are correctly enabled on the PCIe link.

The powertop auto-suspend option you noticed is for the Bluetooth component=
 of
the MediaTek card (which operates over USB). Enabling USB autosuspend and P=
CIe
power tuning via Powertop is often what allows the card to finally enter th=
ese
low-power states, explaining the drop from ~80=C2=B0C to 52=C2=B0C.

Now that the WiFi temperature has dropped to 52=C2=B0C:

1. Has the fan slowed down or turned off completely?
2. Did you use powertop --auto-tune or manually toggle the power savings?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
