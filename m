Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0474F271451
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 21:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764366258; cv=none; b=PiSOPaBHGMo/L5/MGxwfQiUbeXVM14L2H54o2tPcObLf8hGNdyFmj4lIG3gl+bJdWdK64Vm+IWm8M8rnoUFjKhXL9FXEwT4hDwB6Zih4gtXiLKtSYpvo9Mhfxg5J8VqbokIK89hv6x1m57imnYf1J9MgfANW127Q868oZfn0lBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764366258; c=relaxed/simple;
	bh=CMtMlqYk2WvyCnOWz5UoW1npsUPg8iDL7qEtWNGQ3rI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MYpetxKEVnJy992a7uK1obrdzppYKK7e2cFix9ZCGrOMHeUf79jekqaySkr3AYlhWt/Hx63k0TuRvv0tNjR7YbXS7GP6jhLzzJANE8cpjjpQTHzZNNU84jGLypXrhGMi4eiKE15RKRqNqKKayYwlHK6FQPR1Em1cLHe530QDRNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/omBA27; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/omBA27"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95394C116C6
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 21:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764366257;
	bh=CMtMlqYk2WvyCnOWz5UoW1npsUPg8iDL7qEtWNGQ3rI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=D/omBA274AiygMKU0RhsitcEFkywfPW5U34FqJX3ayl9ejXnZjUeqm8JGyzO3Ddaz
	 r/j2YkmI/Dz8ngRsYXBhpYCOvW3aZNM+4W7JJOWebg4pS8TPoOudlWG80r02IQJLxD
	 nPf+LRjw5u0sX1Q79j1q2P/65eneyrYaZfOy1zpgQ054hDMRO7cIdYD6cQ88YWmNcL
	 Tg/DBGF95vd61NqzN67N5HR0ff5ouu6Cg/JxMtGkkEC1ckTcjc8XlxqOGO007D8Hz0
	 xkWe5EG/hQagxGDVjN1Dy7PmnZOfJuQa7JRAEThTsqbF+fEIixHfqUUFZ/FhWMMiV3
	 h3q8eMIr4gNFg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 81DB9C433E1; Fri, 28 Nov 2025 21:44:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Fri, 28 Nov 2025 21:44:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: keyofblues@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219904-215701-IWgzHXWYzL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219904-215701@https.bugzilla.kernel.org/>
References: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

--- Comment #17 from KeyofBlueS (keyofblues@gmail.com) ---
(In reply to masterwishx from comment #14)
> I understand that fixed bios still not released?

Not yet, the fixed BIOS hasn't been officially released.
ASUS provided me with test BIOS versions for my two specific motherboards (=
the
ones I reported to them, ROG STRIX Z790-F GAMING WIFI and ROG STRIX B660-F
GAMING WIFI), and those do fix the issue.

Now we just have to wait for them to publish updated BIOS releases official=
ly
for those models, if not for all affected models. Hopefully it won't take l=
ong,
since the fix is already confirmed working.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
