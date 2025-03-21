Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341F022D7A2
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Mar 2025 17:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742577063; cv=none; b=tT9TP9qa99kIGGTL5TfeBpszefDUUdGybQc37ckpiw5NVDC3wl1XOLUUFWbLsB/nU8bUPq+4h7V+gNlz0RtWURmUf5972X8Gszuiz72ecuLi7MQ4Cd4qjXppC+yDCn5YSsUTHcNhBf+Vgu8ORd1Je/Gy6+Ab9UYP93bN6yBvoAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742577063; c=relaxed/simple;
	bh=jIPgSS1QhduBUe3nZHIOPCI/RQk8eWcmOrfqyyGh9F8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ng4ycE2nZpeaSeKRRuoYKiw55rQuRrn3g65RLZCFXfEpFdgd7xzkK3bZWjr1m/PCTJ8c4VvDG0eRPSGQBdKAR+dSpOxnzHD4D2K2aEU++lsoYHR0oRnOzdOwS9tudZZ2jl3m/+mEMaAdfMckTOXyZdUiTIpmqRECEU1yBQcx94c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMGTMdEA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMGTMdEA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98B19C4CEE8
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Mar 2025 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742577062;
	bh=jIPgSS1QhduBUe3nZHIOPCI/RQk8eWcmOrfqyyGh9F8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fMGTMdEA2E+OCvbe5e4HwQmf/aTi9yjsgf9h9aVyOEjz0v/usXwgQcRt7zyBLs6lr
	 OOteZmHLrCauoHF2E9+aa0u0VYDDhRUYp9grszHm18JBN7rrndsBjZD4zXG9iO01RR
	 7pVN6dU4Kg0zo+zr/+oE4eIQT3CvtFoHsT3mDyPk830hg1sLFmBCE0W1tkH1o81cJX
	 +oazDJ8V/Mdw33hrEL2B54K0JzbYihBqWdfhCbsGaUZsUOf0kzxx+LtjxiYtUAbBjb
	 PtOQxbuuSQh2vuUWoEcPgv3XIb+KMYStljdqaNZ6dDCzSIIgIlpo7PjUd5xYWjDGPc
	 5LF4OZWI8O3rw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 89751C41616; Fri, 21 Mar 2025 17:11:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Fri, 21 Mar 2025 17:11:02 +0000
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
Message-ID: <bug-219904-215701-G4ig3ickYu@https.bugzilla.kernel.org/>
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

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
> * The issue is also present in windows.

This could mean a HW issue (a buggy BIOS maybe).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
