Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032243;
	b=b10yIwBwNfh4czNqNaJssxM/54yfEkxUPHSYsbxoOM4RzcDo0v0VXsr23YT6l/fGnjZR
	 p/9Lz50gygV+j8atqVpZBqdm3VmierXgbw1FlZKA9b16erSAL8ujREE1CiKjFbaxsExpw
	 e8UfFPbzJ/VOw6lldPybRu3dCQM/NiVbEWP6HMNFCfSL2wyQmOphWOoHiOZDEBuQDZ7iH
	 YlHhuigaombV0oYBp01zvAg1fu44rEaY3TmaGS6FYK8DBLvX3sdYbSLTISGS0flQ8kOZa
	 EUYCJ11mI0vqUnSlH9bIx88qwwvJWY1DSuxF4kGhfu6AfTdx6mMI57vglKEmhX5NtuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032243;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=RbbaZNlZFzkMihVmry6njIzcuh8gZkdOrZUAodIhjSk=;
	b=DFmmoIibHStNde6DGKULdWecc+5pXxgW+gWVxF4JvXeY2FETaL881CM+AQk2ErFuJMn7
	 5fNwlruiKkndXKJZo921eVqx/0IohTwubLvfsooRP+jKDu6yrvMvrhJuTckYu49H+rf20
	 q6OA2to/HyJ09LoTx8EfXw/KiLIvrJItFkdfwYRf54TD6BlvKozVG7Z/DFSJvc5mRUJ7i
	 oH/s6SediGFxtgDJJxlgANkmQ6xvj/CrEh54ldH8Tf5ndJVQHfJp5IbEOMiwyxs/728QN
	 K4CIhbuDKxXyfYUpqpXvPxuMNiHRhTrpJpAD9sCL1tCo7lVrT3fFTKEwGt80Ty4uS6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPWTrWiG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3DA606A32F
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 20:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPWTrWiG
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD56C1F000C5
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 20:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795032242;
	bh=RbbaZNlZFzkMihVmry6njIzcuh8gZkdOrZUAodIhjSk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=lPWTrWiGZYTo2KgwrHk14VayQ+p4mlWp7ZHb5SJcf0uUUsp6Wge2zbJbEuvxbHHTN
	 Y5mFmB17jExayDD39D6BNZOfHthe8I/gqb3UAf5AUzdCm/SYKOFbS/O/OkWdjMcSMZ
	 eP88bXKfwFkevCcq44TBk4eIaq/2rJm7AjB2KCOCLaacEt0v+NIHiXvoKfNf90W9lW
	 HWJ8+cO0BL+kFK/f0anow+mw7nMMz+MnfWIc7aSFbNG2q6h5QHjAfFWU1iZaiaQB3M
	 TvwUTKrJS22H6t83RfmnYfwKlfu7gIuh56eMEm34H/HLQ5mDfDXEDTBJc7b4qL/97C
	 /ZXSITEYxK9Jw==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id D0D36240040D; Wed, 18 Nov 2026 20:04:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Wed, 18 Nov 2026 20:04:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jvallep@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222161-215701-PLp5i9BHCq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222161-215701@https.bugzilla.kernel.org/>
References: <bug-222161-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222161

jvallep@gmail.com (jvallep@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jvallep@gmail.com

--- Comment #19 from jvallep@gmail.com (jvallep@gmail.com) ---
I can confirm this issue on an LG Gram 16Z90TL-G.AU88B running Fedora 45.

Test results:

Kernel 7.2.15-300.fc45: the integrated keyboard Super key works correctly.

Kernel 7.3.3-300.fc45: the Super key does not work.

Kernel 7.3.4-300.fc45: the issue is still present with the original lg_lapt=
op
module.

I applied Armin Wolf's modified patch, adding the two KE_IGNORE entries for=
 WMI
events 0x30020000 and 0x30020001, mapped to KEY_LEFTMETA.

The patched lg_laptop module compiled successfully against
kernel-devel-7.3.4-300.fc45 and fixed the issue.

I installed the patched module under
/lib/modules/7.3.4-300.fc45.x86_64/updates/ and confirmed that the Super key
works correctly, including after reboot.

Hardware: LG Electronics 16Z90TL-G.AU88B.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
