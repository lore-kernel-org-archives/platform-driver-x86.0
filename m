Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16985C613
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 02:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777084140; cv=none; b=COJc6CY7wdqCxK2+Sa1Ml4BjzK7CVQ8iVXTeB5nQNpPClMZDyH4eEJaScBdmdokrIpjal/NtruvVCMYaCcOWZZfP9OBklgw2Qfi+cQ8radPpWyTcgLsZj77jJhSRrKyqK6CPQcb2EfHl17mnbWADD5i+yEzQ9pN5moMwPFfj/CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777084140; c=relaxed/simple;
	bh=Go43CcaL9DbuK0Np8XwsxKdD7ai8besaznfl1hdzQ5k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UIdejfl5Wuf18prqJWcY7AjRAZLPHMVdXXOVWHW0OP0frv3UTCiN5E6pgn3AXkUElIGfx9NQHrBRgmUng9ee9wf+SR9lm9IIto8pPaJu0KX+ep1pMOjFNNCaPqtHQqfu3LoMA6WSBEr/8++2L05AhS6SjXRG+Y0qtWmqu/MeHJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQHrryUd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQHrryUd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49C42C19425
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 02:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777084140;
	bh=Go43CcaL9DbuK0Np8XwsxKdD7ai8besaznfl1hdzQ5k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WQHrryUd1ynaufoOpLjt3eTYchcfWSQ5S0VYkdnxfcFBLJ++OOehI9bYWCeDiHSRY
	 Q6j67WqtghAO+/J2VsWoHSJU3yE165KjiIBbIJOeYezuVU5GVQswh5bSfGn1RmR3vv
	 qmtpKlkX0t5ujMDnId30foF3AI+9iV56RywPUZC2icnvfZ2N6icBuXX/j4HPRseW4c
	 LLTV8a5g1jzAYGhnEct4n0DoQPisOsnY/WXudHxl01TZBDYKQTE/YfICRUcEIqVYQP
	 2CuD4tD9Ij7mxj/Tdbrf1AdNYjSmGw9CBULrpqXivNnTpylOIpluJ6wqUjX+uCjudp
	 4qihzHktYu3Jw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 36953C433E1; Sat, 25 Apr 2026 02:29:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Sat, 25 Apr 2026 02:29:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-Efx4gHVN51@https.bugzilla.kernel.org/>
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

--- Comment #37 from Daniel Gibson (metalcaedes@gmail.com) ---
One thing from the dmesg messages of the broken case that might be notewort=
hy:
Within the last few lines, after "PM: suspend exit", are the following two
lines
  [   43.693610] ACPI: EC: IRQ (1)
  [   43.693623] ACPI: EC: EC_SC(R) =3D 0x40 SCI_EVT=3D0 BURST=3D0 CMD=3D0 =
IBF=3D0 OBF=3D0
(no more ACPI: EC: lines after that)

In the non-broken case the second line looks like:
  [   54.644940] ACPI: EC: EC_SC(R) =3D 0x20 SCI_EVT=3D1 BURST=3D0 CMD=3D0 =
IBF=3D0 OBF=3D0
and it's followed by many more "ACPI: EC:" lines.

I looked at ec.c, and "EC_SC(R) =3D 0x40" means that acpi_ec_read_status() =
has
read that value, and most probably advance_transaction() is trying to handle
it.
However, 0x40 is a case that is not handled by the code at all.

0x20 is ACPI_EC_FLAG_SCI, and according to the ACPI specification (which ca=
ll
it "SCI_EVT") it "Indicates SCI event is pending (requesting SCI query)"=20
(https://uefi.org/specs/ACPI/6.5_A/12_Embedded_Controller_Interface_Specifi=
cation.html)

0x40 doesn't have a constant in ec.c, but the specification says it's "SMI_=
EVT"
which "Indicates SMI event is pending (requesting SMI query).", where "SMI"
apparently means "system management interrupt handler", whatever that is.

Is it possible that handling this case (instead of ignoring it) would cause=
 the
problem to be fixed somehow?
Or should 0x40 just not happen there and indicates a bug in the EC?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
