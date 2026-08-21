Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0725C4766A0
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309456; cv=none; b=hpHLRQtsAiiNr42d6PeRZW0RLz2DSe2ZWwv6MCMTuWNrHw+lx8p0lvjsf5sJKfK7y41HT4cufcUGR9DDkC1YKvYtWpcZiQ0zPDCy5RH7WTB/11Hod43g6WlteTcqeyaz/rkaOYIBZy2F39rXV/nwyoDwDSMRAadZBCrArKKm910=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309456; c=relaxed/simple;
	bh=uqQxoJyRcbkasIpyZ46iNuflnqFWQlywHD9XKFnjw/w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aH41bZAPqpAPISFmpoA61I3NfmSSisqjQ3px8O3HlCwmR+C9FC0b6kuov5tEUhdkMyqqtSj1xUTi5j6gGEOw+e7SIvkh3dqRLmIlgWor3mMlotBnD/yIwI2NATzh9FS3HY8lBxAoLQ8ZfyiQ+U/pDahOvHM29+CefhQoe9vukck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTUFBvfV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTUFBvfV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 370FBC2BCF6
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787309455;
	bh=uqQxoJyRcbkasIpyZ46iNuflnqFWQlywHD9XKFnjw/w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hTUFBvfVpUb0UdoejMLLQ25YT5bYM9BdHKWABx1/f/19Dl58RknvHC2FKowXDGYB8
	 sP8XnIiVVlfIR4oPFoTtGOMtUM8lnfLRKoJYWjfMlcFo0lQPijmZClwwT2auiWhvpg
	 AolwLFLv0xwe8HcQa/ARnIM6S4Gz7yM/Q+KpALMW7HxAcA1czmj96IFqm6H8t/thAF
	 TaQ5aw6l/n5FYSgYy1l3OC9yv32adcCZnyZf3hW/aNsItZO9JQbT/ZN6oqhOLpBCUh
	 Wj9KJVGcT08my4oOd3wWFlkilyydedwLloG/ZzBS+W9lVrrJYb4pUjuCCrhivQUQs4
	 ELhbJH6EzteKQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 279FEC41614; Fri, 21 Aug 2026 10:50:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Fri, 21 Aug 2026 10:50:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gibs23@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220926-215701-8qlWQJsksx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220926-215701@https.bugzilla.kernel.org/>
References: <bug-220926-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220926

--- Comment #11 from Gibs (gibs23@proton.me) ---
Created attachment 310702
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310702&action=3Dedit
ec dump when fans are off

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
