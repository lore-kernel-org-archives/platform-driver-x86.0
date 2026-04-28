Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBA4425CCD
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378960; cv=none; b=pmbzjpL0yeMaBVwLRbx3gb/3AFUcArkPSL28K7mcfAFyjQ17HeRnTuJzgZzTGJdBkPSzBI+keFOUvSXxTaiOu+kll3BsLwBN96dnqM2nNGKUK8slaf/1S5LMiM42jC0E2WGg157tIvswdtVSX2Ti77o9ewBZItTMwue0CY9IY8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378960; c=relaxed/simple;
	bh=VvGEJagqaQMM/Wc2hE1aNZiIordyK1OPhvHnL9AQr2Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ifXQiOjqAd/i3JIfKsElo9rHMgU5PewuG+szkPENqi7FhcWhH/6T4tFV25woz5cnj7j8GDKVsVu1fF5jQdQhkbp+inxsOAJ1T7kPL72RyOTusngm+DzIpH0/rygTvV6XIQOruTyXRNp2GIoIHcLZev+svaA68JPwY8YnEuQKxLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5DMZZMj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5DMZZMj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8ECA6C2BCAF
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777378958;
	bh=VvGEJagqaQMM/Wc2hE1aNZiIordyK1OPhvHnL9AQr2Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=N5DMZZMj2C8NL8wphSnb8hA25HNrx9MpxIr0sQTXZ0ZFxqFyVXlVCprb8hmJFLaMd
	 sgfNuH+PDKBxft/M1psm7a/ZFWQkbAQ3sd9k4gn0nC6ftQMjOm/keDkdosewF1/15X
	 ry5M42/KcPAWZFWr23qNKTu5xTLi/xGHO6x1GmZDhmn/qNNSTpIAHWT3DlnWIpjj0u
	 IVKt5WLDDfBNNvBD+JnhFkPKtsUO8GlhOJFt7z7MFlmXh40rPYQtFU+P3dhJNaz05t
	 dhN0ecGALZ/bT13MgjztrjDsLyZJ679z9Yh5a/8GHjzFIzjyUlYFmSaMtseyw4fKfV
	 G/Kt6mZu/HXKw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8964AC3279F; Tue, 28 Apr 2026 12:22:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 28 Apr 2026 12:22:38 +0000
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
Message-ID: <bug-221065-215701-ck6B37wVNT@https.bugzilla.kernel.org/>
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

--- Comment #73 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to Hans de Goede from comment #72)
> > However, with only ideapad_laptop loaded and not ucsi_acpi, I still got=
 ...
>=20
> There is nothing we can do about those messages. The real question is if
> there are still any messages which repeat periodically filling the disk w=
ith
> logs, like the original messages starting this bug.
>=20
> Or if there are any actual problems when using the laptop?

Oh yeah, it is indeed still printing the "unexpected charge_type" message. =
 Not
sure why I didn't just mention that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
