Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464B1347524
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777131124; cv=none; b=n2QonmjJmiBbrxoD4Xo/obbJkPYWOXP3M3/3T3jR5IsmIamWSJVL7eP0SaaGX2UnDY2PyUU1Mzp5spZ5Hg+kFPCctHBZZn7NVpzGIjqAj1xmr8PANxii6wSGoFzPVcLX0DrFex06zWev2PD2gIb8Lq9fsSMVKpfFNx1Q58Ge6vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777131124; c=relaxed/simple;
	bh=wS8Sufr8gc2OuWeUeZhmxGAn1A15XjCDASvn8e1/nG0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bKfQe3oqXdFA+VQfgI92FezOQOIyyJLPP4XmsGue3g8We3YIEx194gCDo5VNcSuukEHgyJ3xOa9ovxUw7Fj/C6XewdMm/cIRjuvkMMZBxqYQXuVO660l4tqjwSfmaa8GIwKHxm6f7/BZxHSQtEqs+fGRaEx8shM0xKQXMZbPDGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QoGAjztc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QoGAjztc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDE1FC2BCB5
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 15:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777131123;
	bh=wS8Sufr8gc2OuWeUeZhmxGAn1A15XjCDASvn8e1/nG0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QoGAjztcnvI4TihLE4viP8aj1hnj2jfCiYs0X8k0Qwix5/mOQ+V4zo0sF+esPjJz9
	 uwIsRgmFihacL3R09Q/8ML0iYDVHE93xYz1SswIdEYeDlClOVOwJfdrSxw+AfqgLbR
	 1gGjQRs0gYSxeekB2c0AwUaKhSn7czIEItegKP+dBgHEHypssRNb+71PkLAWr79q7q
	 +pYbk6NycIai3zX9uVq3m+v2w5xUDYscR6ftYo4wMHLcwzrabUpFo4pBcDUv93vfqY
	 8V3aRXqnMVTicSqe6ZtMEgVm0nH/436EjMHUaUeEFM7YrBOmBHYTl7GlIaKUrgPFEU
	 yxI6z5sQOAT3Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C9F6BC433E1; Sat, 25 Apr 2026 15:32:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Sat, 25 Apr 2026 15:32:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221383-215701-rL54ooMFqG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #38 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Created attachment 309954
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309954&action=3Dedit
patch to force clear EC events on resume

FWIW - I passed your logs and this bug through Claude + the kernel
review-prompts skill (https://github.com/masoncl/review-prompts) with a loc=
al
kernel checkout and it at least agrees that this is primarily an EC FW timi=
ng
bug.

----
  1. EC Interrupt Blocking: When acpi_ec_enter_noirq() is called during
suspend, the EC driver switches to busy polling mode (ec->busy_polling =3D =
true)=20=20
  2. Critical Window: Between EC interrupt blocking and actual suspend entr=
y,
the EC firmware needs time to:
    - Complete any in-flight transactions in polling mode=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
    - Flush internal state=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
    - Save hotkey handler state=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
    - Prepare for suspend=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  3. The Race:=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
    - Without delay: EC interrupts blocked =E2=86=92 system suspends almost=
 immediately
=E2=86=92 EC firmware doesn't complete state save =E2=86=92 On resume, EC l=
oses hotkey event
state=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
    - With 2.5s delay: EC interrupts blocked =E2=86=92 2.5s in polling mode=
 =E2=86=92 EC
firmware completes state transitions =E2=86=92 system suspends =E2=86=92 On=
 resume, EC restores
hotkey state correctly=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  4. Why SCI_EVT differs:=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
    - In the broken case, the EC firmware lost track of hotkey state during
suspend because it was rushed=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
    - In the working case, the EC had time to properly save state and resto=
re
it, so SCI_EVT=3D1 appears naturally on resume=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
----

But - that being said I pushed the LLM a little bit more and wonder if maybe
draining the events on resume would help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
