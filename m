Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A86C1C5F1E
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Mar 2025 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742637828; cv=none; b=rrfc3TTFn3lBIjmTMBtfVNUZz4dzqUNDSODh5izbiEsCxHDTQfP4fN1WHsiRCXzeUMXP3931rZTd8J8/CvRHbbUqWAWLSksyH1NpRgTtE6zk3kBq/ruqH1iD4hmLDk1yS7FJ6PD/5zvUgprijVCxqrH3knPriqqXQiWy62GSb8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742637828; c=relaxed/simple;
	bh=JsOlZvC/AJMu3r4OfmOSH1STWve7JaGaS9q65RFbLkk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YCi2xlzSlUg4nz1WNU28O69tOczuHRvRRQAOAM4xy5oTO2WmfWtLV5NagFv4t3H+YGMGLRpXkJlF2xDpXIWFkbyP3vfLLAxNC/dFHqGNTr2a3UR5D4cLaFDSgMzLiHRuNUvGheFICxrm+kZ8EPTElFdaOiL2wmi425jR1P7J9Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErqpOI6C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErqpOI6C"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF1C6C4CEE9
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Mar 2025 10:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742637827;
	bh=JsOlZvC/AJMu3r4OfmOSH1STWve7JaGaS9q65RFbLkk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ErqpOI6CYcLF6VcsHF8apnkQsRYaGQf+c4c2CAeYU2lIA8cIGprH0nucVtTf2Lt5c
	 8CD7yyh2Sdkvlx8xGe1QmTyfMY9C2cvakkKQ9pakzqoqNXXCEbyNyM05E32rTpiBbl
	 lDGlD3YOBAGUsA3sepdoRvDk2Q9hXoDm8PAOEggyQkNeEQ4ARZ+eUSGqUvC5ZVjjQi
	 F8YlgGk83QdkYz7h6vg2f4ljbvysQyZYyjt+9cJyAV5YrxcjCxsJwyu1aJ+Ymg4sbb
	 rRBkOK1wGV+OyCzx/mh7OC2b6tNstBWzaFC+b6LeD1Dpt8ysaiZubthccMmrny7lkt
	 IAla2yjgskm8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CF226C3279F; Sat, 22 Mar 2025 10:03:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Sat, 22 Mar 2025 10:03:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219904-215701-ot9q5t38Pl@https.bugzilla.kernel.org/>
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

--- Comment #5 from Artem S. Tashkinov (aros@gmx.com) ---
You could really ask for support from your respective companies.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
