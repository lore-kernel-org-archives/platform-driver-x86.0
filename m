Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900413;
	b=PBdf27383pBb8quOPDs6vxOGtNNPdvL+3r8hpLqaZQtQqb/VqCzyExdZ4rj87yZUKy1S
	 baaUypIJRKxzaCiNg1II28SeNOFNZ2ktJHgaANq5DN69qqF9Oj6s+N2gEKzXrVBgQhUSe
	 7OwJ+9VDZ/DzQoIc7du0TycphxDKosJ7VftKJO6NJv0USjaWKDn54cTom9PSj35nChLKT
	 rMPz7vJ9V2jOTp9eyYFQSxyka/0sO4yeg2gFjW6vuPzxchoCD/G+XDsUc45qYzH+B6JF2
	 YURrNBBiNIfSr4dAVznTvGB5CDjC1FYOjQ68XvSQqprX3TZj1ZB39ZsPUGXsmeEyyHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900413;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=tqNhalxXrCLUT4QvOYFsrCnfZNGvOQlPzIwyQC9TMMc=;
	b=O+Ar1l4BpcFhCz0AxzbP2K1gn94ZZOZnr6KrHtWVG2NQZNSQkAdjUWjqrszhk7BcBFou
	 ecZILZl0ajvLOeZ3/8eHDvLpg4yc1UN/F6SE9Kt2GEXpdWBdoRPLfRgK2DN/RF8Ou1dg9
	 nb1EdrrHl2VZ8T9TEaDHlmQdAM9CKCz7AmTzuqS5Gbnwo3/x+hiPiFcI6lcC7SjlLCOrl
	 +bNNl/1wzV5bhkA8H5nhQLFSR4WpUbp0tTdbs0HhiMgLkF40UQmqWEunPXKzwq9zYr0fp
	 dljZm8uMKcRWT7TnqD6fCqfPTo88Vp1j/4C123YaUEDMWBlM1uq7dAzo1QcWLEZ6ieA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fOpf2wv9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362C4606A32C
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 07:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fOpf2wv9
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC3321F000C9
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 07:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794900412;
	bh=tqNhalxXrCLUT4QvOYFsrCnfZNGvOQlPzIwyQC9TMMc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fOpf2wv9y5bLYErfKJ1ju+NKmTnkG8S/2Oomit4jJyCoGtsaCyvgTYjf61wXqgXUE
	 nxLZGXh13vzOrvkQdaSgINnx4CGRgZ4S47t8K6QKOu6jWQjoQk4y1+EhEm+a9z9BNq
	 FHEpsDoeL/M8VloCLg/JGNRPoNAm8fZeCOLo95NRZTQnzVp82bbXwnGCbM/9CEUr8O
	 b83twPZ4fNRHo+2CrsSlPOpt5YDwkmq9x7o42wiu9yknIk5zwiyQwNtlJ8zlh4tZVq
	 8YzIT1c3rSiGZRtplOYHzgMIqlal1czwNwRszToBNdy2DCZ7P49PAR3YKj1hCnFd6Z
	 0KN/wiKpc+VJw==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id BD5F2240040D; Tue, 17 Nov 2026 07:26:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222275] lg_laptop: LG gram 16UD55U - kbd_backlight has no
 effect, unknown WMI scancodes on Super key
Date: Tue, 17 Nov 2026 07:26:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222275-215701-06YVeFUwHP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222275-215701@https.bugzilla.kernel.org/>
References: <bug-222275-215701@https.bugzilla.kernel.org/>
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

--- Comment #2 from daxter1992@gmail.com ---
I tested the patch "platform/x86: lg-laptop: Fix input of super key"
on my LG gram 16UD55U-G.AX85BN (BIOS GP115, kernel 7.3.4-300.fc45).
The KEY_UNKNOWN events are gone and the Super key works correctly in GNOME
without any workaround.

Tested-by: daxter1992@gmail.com

Regarding the keyboard backlight issue, which is still open, when loading
lg_laptop I see:

  lg_laptop: product: 16UD55U-G.AX85BN  year: 2022
  lg_laptop: Cannot get handle

The year detection seems wrong (this is a 2026 model), so the driver
may be using old-generation methods, and one ACPI handle is not found.
This could explain why kbd_backlight has no effect. acpidump is attached
to this bug. Happy to test further patches.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
