Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF6D3EBF02
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 02:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771295561; cv=none; b=tcKUbuqypyRwHi9TBgS9dX+MptHZukZXTE1UU3vXoEJouIr+rdfCIC71lWXpH/EFpefDU6LtqOLTis6Xg1u4LJhceU6Vgy6raMWRzdHVO8Rdx0PikLLKSpv6R1dZ90ad515y8hwErJh2xVnXylE/39CNShZ75uNeYM2n9tlSmzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771295561; c=relaxed/simple;
	bh=OXPy9yoxzoY7e9kueKNTBM+D//ipI1vjgxRqQrdiqr0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iPweRvKzqjY6AFlSTYsj0JYESj6M/vDCleiBK0bpieU+ivjwzXL6TIn9Zi2cudoEfHuXOXLPnk1s/Y8aUX50ZXPn2V4Dcvu+sKNDPzrrdgilnyhu9ltoDxNzF3e5zPCqfMPSPLjtHvX/Fu88NgyGXe7UQfcM2XJmucdYaHZWSUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNqkOeFF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNqkOeFF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBE1EC116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 02:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771295561;
	bh=OXPy9yoxzoY7e9kueKNTBM+D//ipI1vjgxRqQrdiqr0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QNqkOeFF6C23v8WRdDzeMkodZImyLgAmIEBH+d2BKSYWyArduhVWBdn7N8LXfFOh+
	 tDxDNaKxsI0+3Fb09lBl+c8oSKcspik6Cg+aN1tmLIQFKK7x5GLBn9xhBa9zlsnR2F
	 Ku/y65dLLkfOL337EiQDVaQkX0FpkIPAKtBdpJpzdvcuBXpoo1zMWRFNo/t6/WiDhP
	 fPsxBgQSPtsDs52pJJfORUr5N8eQCTtvRRBlsqmKePrQF/ekPBVR9+RS6JVaJEfUoT
	 goWXbKr0rSqe+5ACbc36V8Sj+EV8B6QRWiKULO/jfJysdNPBdESXFWCMBepAH2KcjI
	 ANbKTmf4DNgtw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D52F5C3279F; Tue, 17 Feb 2026 02:32:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 17 Feb 2026 02:32:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: mpearson-lenovo@squebb.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-JtfTvWY3wf@https.bugzilla.kernel.org/>
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

--- Comment #38 from Mark Pearson (mpearson-lenovo@squebb.ca) ---
> Rong Zhang's choice to CC Mark Pearson proves otherwise.

I can't promise anything - I don't have any official levers to pull for this
platform I'm afraid (it is better to buy Linux supported/certified systems =
;) )

But, having all the details above is very useful and I can ask for help from
platforms that aren't officially in the Linux program and sometimes get luc=
ky.

Last week was very busy for me so I didn't look at this thread properly. Wi=
th
it being Chinese New Year this week there's no point me sending off emails
which will get lost in the holiday swamp.
Can someone nudge me next week if I don't post a note? I'll get this ticket
forwarded to the Yoga team then and ask for them to look at it.

Mark

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
