Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04924260565
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 15:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770822216; cv=none; b=bah58ltNtoB0Z8O4iWTDYWB4V1A+yTyZf/STZGIxfN9neqMjhxkTo96XfBDMZDRzFMHRC/isgUTnqIvt3dImeziT5oQo8bZTb/R36CCqoPyBab992OyDTEu7J9bvS9tK/jSOT3Hrqo02+d6FjBy7dobLYfYFrzLjdxsy9NGLElo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770822216; c=relaxed/simple;
	bh=V7rAXgBGm+w3ijhnHxmc2NCEICwvEK0YaNsIBUNAPCE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fSL5VnoeG+0wUJuW75T70FuEKdl3lNahHF6AMkmbyHIB6AJjj4EVbaYbE5Kk7tHUJQJdCBRKI13yTYwSTAbtaFYz+UAbnS6wWC7L0zJ5dPFdb6w5hZdkUne3Vjqe7cnpBzsHHxLEyIY0XFNGzcICNTNWKaNxhprtw/f4J7xLm1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVvOF+RS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVvOF+RS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4887C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 15:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770822215;
	bh=V7rAXgBGm+w3ijhnHxmc2NCEICwvEK0YaNsIBUNAPCE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bVvOF+RSaso080kGz8ge4E7KMrIiKhv7bLIAhqZs6NOhetQ72FXsMd613lqTjoRsR
	 OwiCdnHnGFLwJ51C3Vhhe74vy9KgMDHAZQhGBxHrms3GTFQcliCtBU5zmrCNrNx+S5
	 93xPjR9wVYr8UyDJM/QViRU+Dhq+aczk1jWfneB/GK4T48xJ1VkNRdIyUqzpjkQLCQ
	 AJ6gEjRWh6b05tI0bgMOJjvzNV/X71MLqueNsD/BVj5ibDI9eSn3U5OwQWbQZGACf3
	 T2BMH65Ton99A6F0bzYtv6KeFpCIC6gXRa5sj2tY+yYWQf89Ega6tLOmMX8f/1v/R3
	 DiAsWOORsXQNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9DD21C433E1; Wed, 11 Feb 2026 15:03:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 11 Feb 2026 15:03:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-nAEdm5uqxl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #24 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to Rong Zhang from comment #22)
> +CC Mark Pearson.
>=20
> Thanks for Armin's insight!
>=20
> Yeah, the root cause should lie in the ACPI table. It's super broken as I
> even found more ECMT issues...
>=20
> I've noticed these methods are broken while glancing at all occurrences of
> ECMT in DSDT: WTER, ECCC, _BTP.

Raphael Bitton can you post your acpidump as well? You have a different mod=
el
laptop, it would help to show that they both have the same ACPI table probl=
ems.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
