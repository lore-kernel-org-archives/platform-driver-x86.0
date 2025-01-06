Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D411FB3
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jan 2025 03:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736135546; cv=none; b=hfohgZZhZjmys51eCJwAga2UxM0NmXoLnIp7HOnPXX5Uj3OfVo7LK0+dqAbUokbp5WFQkAdI4o8xvZhXYmAo946OJEMI1UrhoO/CPggtgBW9+Gb9hrLIYNzPxD3boyzvnnwiF0kejlo3nAxRa2ufwK+rU9l+YZj5up3lieu3hcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736135546; c=relaxed/simple;
	bh=CnZG1qdGTJ54YdA3Tt0thdnKvYEbjR3Vk+2VX7rXP/s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HD2l9gmMUox+W3FF5ssfWOxzbtRmZjE3JB7gOzhe1+ZB0Msf+Xaq6TJoUauoxzzLaC9gI3VeGBxtSmDnKsOThBO1QcXJlXN0hfn4tek3S+44PChKbaPkH6OxJLIL1zSJbFoGQJK0go6ixkrTNyBdISBRWhbBs1qKmey/jdJx7Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFDKuKwc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFDKuKwc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D1B8C4CEDF
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jan 2025 03:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736135545;
	bh=CnZG1qdGTJ54YdA3Tt0thdnKvYEbjR3Vk+2VX7rXP/s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fFDKuKwcwcyQUXXl6heQ0xKhpRMo+DbG70VtHgjU9AXh0czazEhWLb4Z/a7c/ldf0
	 TMktVTR2L8mHs7dwCTodTKhkKYJD3dtlOy/xj1A6gyYDdIWz2eLjl46JKx/J7R9G+f
	 YLdcl9gXRAKuT7nqbpyB19nNiEm9e25jOZXsNkiOCa+EpOKxZezcTR5cqvoz/N2oN2
	 Ki0bf5yRibEMND+qTGfDqWfY5xuLO01yKnDW9hoj2WZUWzcbv7fDL8QN1DmkcOZUV6
	 IsjPCxdiApIjMcjVg0i+3a9vOFesdDDHmFtgkEf2FPYiJAFXtMbTXliY9iJVPtV32s
	 BT2Hn0iUXXTJQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4233EC41616; Mon,  6 Jan 2025 03:52:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 06 Jan 2025 03:52:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-ZzIcIByNYp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #83 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Mario Limonciello (AMD) from comment #82)
> > But that makes it even more suspicious. Why would such a critical compo=
nent
> > be outsourced?
>=20
> That's how the PC industry is.  This isn't an "AMD" specific thing.
>=20
> > That almost sounds like a recipe for a disaster. Possibly even a securi=
ty
> > issue?
>=20
> How is it any different than BIOS, or PD controller, or any other compone=
nt?
> OEM designs have OEM specific bugs.

I hope how the EC works and its firmware could be validated by AMD in the
future. Or maybe you've already implemented that - I've not heard about this
issue from Zen 5 owners.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
