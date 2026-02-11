Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAEF19E819
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 15:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770823022; cv=none; b=mFRjXcEV/8CLmPQ+kntTPgNbWgx7iODoLP5hmNOixqIsNgZs94hlz6CfcTVAftvjeSlhHKvllZyswWgxA7piuVT3xgJdG7VFaViq5vwDaxPXbQcO6TmAhYI0+LZ+9AYXRuHrNGJ8so4B+m/FzE/fWZ6exa2fEoA2r6cEg59Eshc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770823022; c=relaxed/simple;
	bh=ILLhj1O1am8LXSq7ittctk4OzJYllH3O/+RX1i0BXWA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SDE5D0W+mkO8oCGQQGriImSIFo+6+PFd68k3APFjUXBiqAsHbmrfj5Ys5HCRckBNmDDoYjknJquabz1e2EKSTrpG5RKNS4uKGKT5c2+9V5fjzof8MhBKJnEhsX8Seq7yitojDxTBPc1K1gBTtvFYOrRa7gXy5YYS9u9hQWRFHFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0UIchCG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0UIchCG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF6A7C16AAE
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 15:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770823022;
	bh=ILLhj1O1am8LXSq7ittctk4OzJYllH3O/+RX1i0BXWA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=L0UIchCGRWTNTqWu9veD6w8820s1n57X1Jw9QBb5WiIG3YgfaOgEL2EWECEmi/9S0
	 Rpyt4dGZt1P4n9yUffxgnpLbQ1CnaGuxXqdQklp/ft7q5yjcu4VMOMCOklrWGCu1+M
	 qM1g8YesllnNNnnBdfI/PYdrayJNcn1jwVVw08tUIITFv7rpHhHg9oBr3KrV9HjA4J
	 Hoz4eib55S83yPhsPK750FdjzZxUfDHjf7DcDS7YwWjCdQvqrFtpeZhNdLSM8bpwXA
	 c5Ocna7bm9lqojJKrpXwfvgxrTEsVza1BNvViQ0vtHI4Aifhus9aiAWomCNQuiby3T
	 YDB23z1cCareA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DB1F6C433E1; Wed, 11 Feb 2026 15:17:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 11 Feb 2026 15:17:01 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221065-215701-1cJPOHMefb@https.bugzilla.kernel.org/>
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

--- Comment #25 from Rong Zhang (i@rong.moe) ---
Created attachment 309348
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309348&action=3Dedit
workaround for the FW bug

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
