Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C034B3B19AB
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 21:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693724; cv=none; b=YT2uI/Xoc3WFhTF0R57KTsMaVHPOPEfGFLZR9o6Vqy8J4j+A0ps8EAIkP61cbtfV7jcaeSaVHxnHMVipsHDU6GRBGIZ4LGePqhntbCUR1XD+wCVhAa+3QfNwtzt5hZIw5YWrRXGmocrPpXKNuVaWI1iGZYMtP8vRF+BYMaVsxi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693724; c=relaxed/simple;
	bh=+4M6MAb5V1qnKeiE0Ljys5K1MneHtdxVzCjBvcwY2f0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l1Gqe7dvXv+Es2xhQlAsLnEqbSpk6kKX94YAf0X/JTIqy3VyfAXsEMBVo4N7V7xxrWHDsnAM9MSssIjiXhtm22nIB9B5Noodw65TqZHa51QStAusRVP3Ek25HXhVwwIUtNqzfPAAyQLNC2WQdhc+hNl0aXhrS/k6qLxpXoM+NB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3mJaM97; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3mJaM97"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47223C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 21:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780693724;
	bh=+4M6MAb5V1qnKeiE0Ljys5K1MneHtdxVzCjBvcwY2f0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=M3mJaM97bdDKswhnUiWEPVk/+2kEWsvXkxpV9Fncbua3eOZEqp6rsfpC/qsMUjcIq
	 6TKdAPFp9HhaU4btX6eWT5gRPQJ6h2H1c6UPVJZoDEW9fRT7pKkpnVpsRAdUvA3wdd
	 XARX2KejFRrzy4dU0cs9UOzdYPld8xqf5O/861IgQeWo3Y+QNciJj7rWTMMmlu24kj
	 N5RE8noUExHuuroAVi2AwnTMiVL/QL5EafWmFk6ehhi0Q+fC7DMU3jitJH+eehNuub
	 eaYXIT77KRF2NTfLTbYG3rSB7OQqE3F+o5cVJqj/diMyGPVEaOQHSx4CgruHhd43pX
	 5DcGKUj3mECmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2BBDAC3279F; Fri,  5 Jun 2026 21:08:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 21:08:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-kgGc5fLpyv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #26 from George (george.stafilidis@proton.me) ---
Hi Rong,

I did the lid test exactly as you asked. I set the keyboard brightness to H=
igh
using Fn+Space. When I closed the lid, the keyboard light turned off after
about 5 seconds. When I opened the lid again, the light turned back on at H=
igh.
(Closing the lid when the keyboard light is off does not turn it open when i
open the lid)

I also ran the diff command on the MMIO dumps before closing and after open=
ing
the lid. The output is:
2c2
< 0x00000000FE00D401: 00010000
---
> 0x00000000FE00D401: 00000001

7c7
< 0x00000000FE00D406: 00011100
---
> 0x00000000FE00D406: 00011010

177,178c177,178
< 0x00000000FE00D4B0: 00110010
< 0x00000000FE00D4B1: 00101100
---
> 0x00000000FE00D4B0: 00100110
> 0x00000000FE00D4B1: 00101010

184c184
< 0x00000000FE00D4B7: 00101000
---
> 0x00000000FE00D4B7: 00100111

199c199
< 0x00000000FE00D4C6: 00010010
---
> 0x00000000FE00D4C6: 00010011

I also did the manual test of register 0x8A as yoy asked

Step 3 (KBLO =3D 0, KLFS =3D 0): the light turned OFF
Step 4 (KBLO =3D 0, KLFS =3D 1): the light did not turn ON
Step 5 (KBLO =3D 1, KLFS =3D 0): the light turns ON at LOW brightness
Step 6 (KBLO =3D 1, KLFS =3D 1): the light stays at LOW brightness

Hopefully i got everything correct. I am also attaching the stock dsdt.

Oh  yeah also Bios info:
Version: GLCN68WW
Release Date: 03/19/2025

Have a wonderful night!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
