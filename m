Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42AEF9C0
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 12:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293272; cv=none; b=E6lMGp9dGMhMs62QCjZjPV7crWLjfCrQVWVoRmYQ9LKV7XX/K/LsOg2U3Tl9mlaCT73yNTcDFSTK5przP2LxcZ74LmKMshN3QSa7qj2TEo3/FTrODrZlStFqKTsRnzvwUTf9XajEFlSHC5jbUrjvwko0/A0wUw5Awn3baAomYAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293272; c=relaxed/simple;
	bh=C9q8fBk3kOk5ggL8hVBwl/iA+2PYboh0Vgi+I9hiUnI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c6WWt8gLhKzSJ6IIpk8um8z/+EXVTZjVCi2k9aPpZdn1Mlqjr7JrYmbXRDiwxweh2gzl6hPhuQ+OAq6eu93dQeAIALbGpOSSRoR9LS0oGQFe5xmdWefS/2Gam8sJK7PiW5VyCiTZGe8Kl7ADKUmdSJxcBSocAvGVBbBpRw9mq3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIXrIzM5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIXrIzM5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8287EC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777293272;
	bh=C9q8fBk3kOk5ggL8hVBwl/iA+2PYboh0Vgi+I9hiUnI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YIXrIzM5M1/h0iWizjlKbYwpNfBwoCJ1KZcVLI4FNANv1WyvaOJM4rFoUTmMzpjJk
	 OfzKyzMBBVdAobHcmKyktY9ZZsYP2l9FaSP05PFBJSXnLD5Dt1NO7S0lXP/scHZpHi
	 lotGNvzgMwtlcpL8VhLDakihjs7voYj7r50dlEN8hGmdqJuXS7C2hb/HVC41JPZEot
	 3xglqVlVzbfPdl782ZMQGecJgNILMP6q58sgGdxRdxGrjse/3cv3Fm7fcWhFisrLyt
	 Ufgn8L3OZxq6AX/xTjRYoVcBDQowfbXCUN9X4yfPPel+M4kN6vrVqpHuyle+9xv+eZ
	 i7Y1p4JeWDSgA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7D05AC4160E; Mon, 27 Apr 2026 12:34:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 27 Apr 2026 12:34:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-iJG0CYCUdi@https.bugzilla.kernel.org/>
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

--- Comment #70 from Rong Zhang (i@rong.moe) ---
(In reply to boite.pour.spam from comment #67)
> I've read all the comments above and I'm trying to understand how the bro=
ken
> ACPI tables would work on Windows. If there's a "deadlock" in the ACPI
> implementation,=20

How did you conclude that? No one had mentioned "deadlock". The issue is ab=
out:

#1. Errors in mutex acquisition are propagated blindly
#2. Some ACPI methods release a mutex owned by others

I think my conclusion is clear enough:
https://bugzilla.kernel.org/show_bug.cgi?id=3D221065#c33

> how does Windows works around it?=20

Just ask Microsoft and Lenovo.

TBH, comparing Linux to Windows in that way is hardly helpful. On Windows, =
the
ideapad ACPI methods are used by Lenovo Vantage (or something else), which =
is a
userspace program. It probably doesn't query charge types after power event=
s,
but blindly assumes nothing has changed. It probably doesn't check ACPI ret=
urn
values to see if they are insane, but propagates them blindly again. I don't
think "Windows works around it," as burying one's head in the sand works ar=
ound
nothing.

> If I understand correctly, the solving options are:
> 1. Have Lenovo to fix the ACPI tables (which is very unlikely)
> 2. Implement a "live" ACPI fix with a DSDT override but it won't fix the =
bad
> releasing of the ACPI's mutex

Again, how did you conclude that? If you used an AI to "help" you understand
the thread, you probably chose the wrong AI.

The easiest thing to fix is, however, "bad releasing" (#2). Just delete or =
move
several lines of ASL code, and that's it.

But most of the issues here are caused by #1. It generates a lot of garbage
return values, and there's no easy way to distinguish them afterward. Every
method that recursively depends on ECMT must be rewritten, which means that=
 not
only the DSDT, but also some SSDTs, need to be overridden.

I've almost said the same in
https://bugzilla.kernel.org/show_bug.cgi?id=3D221065#c41

> (but we can probably live with it, since,
> except for the dmesg noise, doesn't break anything)

The error messages generated by ideapad-laptop don't break anything either.
They're harmlessly noisy right after power events, but everything should wo=
rk
well once the events settle.

> 3. Blacklist both usci_acpi and ideapad-laptop, so that there aren't any
> contender on the mutex anymore, but I'm not clear about what's lost when =
we
> do so?

It's usually OK to blacklist usci_acpi. Most Lenovo laptops have most USCI
commands stubbed to a certain extent, so they're hardly useful. The EC will
always handle USB-C events itself despite that.

You don't need to blacklist ideapad-laptop if you can live with harmless dm=
esg
noise.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
