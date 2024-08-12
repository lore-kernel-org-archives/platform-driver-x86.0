Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD2214A4DF
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 22:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723501208; cv=none; b=Ues50FSGzidA1f3S+iMtXOaBRRzvyjVH6eYBtIDkYSR5YhanOwWiKUTdMIzfzGA7rwI3rKLbwSj75+ojQ5EmsLp7qausy4kb/bSYl26C6lGYG0AnFnhMkTPXMDzkczJELAT1BUI2aHFqbCTb2EJUvPVnCa4zV0sozbUIkdC+PN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723501208; c=relaxed/simple;
	bh=8QRDIqMgCSnJ/7OzvP7yDZx6SG0U4Qh4rpeKj/i+Mg8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IMhCpDBjkLIHrwF1KEsP7ObknB7p4lpaCtVCGegrbyxelZJeR2j0bfW18kbKYcVoPMXaJCiGfUWq/Q3qM4u+DW+vo0FqMtpx0fjGSHSpmX4P/wivagND0p15EwzfII8XRQ3A99lCy4cISFU3u0q4m/B5SHKyj0543avxBkf4psQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpp1D8uj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpp1D8uj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9131C4AF13
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 22:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723501207;
	bh=8QRDIqMgCSnJ/7OzvP7yDZx6SG0U4Qh4rpeKj/i+Mg8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hpp1D8ujXTS4xAKb+UnMwCocNY/Gr/TG4/SlH/+ePJZLCE/T/lUiXhiuv+i/qWb7v
	 /tHT+S/S9hX9uXOw11v9JkvTwwgTDXeLNa5vV2oSzpxpbTAaMGbH6FT47G+6Wm7mXz
	 rDuFS5xzZiSZdGA820j3m87WBCMoyUKqmNb48cQ3jYMODH/XWu00pA+391btPuPGxU
	 1wco35IIkH3cdAGbbq2r85qgjhsJI1nrn1UJhFm/mcAiLkbwZhmZA097sa4PvxWQMQ
	 BqIY7CRlXIW/4nLPTv730Nb6kgwr1SqJ62ygre6Nxk1z/00Tznj31uaraz/EbMmb4w
	 C6GNVULH7ze2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D2164C53BB9; Mon, 12 Aug 2024 22:20:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 12 Aug 2024 22:20:07 +0000
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
Message-ID: <bug-218305-215701-P3OtkmNVd5@https.bugzilla.kernel.org/>
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

--- Comment #73 from Artem S. Tashkinov (aros@gmx.com) ---
Mario, I meant Mario. Sorry :-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
