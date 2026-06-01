Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A834386576
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303961; cv=none; b=JJdFGBPjNn7TlrI/f9zNZCS9Beg0uGm/rg0J5VPsbEakDOI4KwSRP44C211gOdI69DslXxA0P2Zp04IjQB0UikKA+ErrUBPXHxi8DCi/dICR3mX9okyV2ibzr/jDmbw4Czsbnm4fCNQ18CBrlRhV0l0i89gmKveM2z5VpJ+bBD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303961; c=relaxed/simple;
	bh=6V2PiKPlI4APfTIHqgsUEevxYY/Hx+lJRRe58LsYLPg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cMMBzASwjpLOFXj5rEi4A/pgsZZ/BoqlY4yeDEyIqiaEwSxoggPxHZbfzxb81RjnD/9Rkb9nMHCY9M5CUoB7+YIOcWE38723d2NFUcaMvoa823xOPenhoXboxGW808hCQ3cbhjQ1uMsteyApJfUDf2BbB6/R8CJ+hxBoWcGEiso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4FlEF4S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4FlEF4S"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91FC9C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780303960;
	bh=6V2PiKPlI4APfTIHqgsUEevxYY/Hx+lJRRe58LsYLPg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P4FlEF4ShzCASEWmrHudqDrdtoQxSx8vWVTSLQN70bjgNislYUVBwk6i/7VkkrYCC
	 HHmmsvnjl66NhfcHR/5oxMseUD3/ljWTkEUUbBs34LP+u+AKzO1vSbdmlKqMV4qbAK
	 IGP67M2rXVWtf8KWWNP/Dv93CrkUwHEG790Tqyk2AtyefL+YfkC1ow5CS0MpxsU9GV
	 otVmKHMWHV8QaknVXA/XOXBOWvOovfTtp3uIctfzwVdtQ/On+aqlCo9Gv1Db27MHS3
	 NJ06NABG0Qzw4MF3HEBEisFT40usTWk8mCeQ9An0weTHKQ8fXiRo1OSnVTw72HSBXK
	 2vw6RtYUXEnIw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 75EC0C3279F; Mon,  1 Jun 2026 08:52:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 01 Jun 2026 08:52:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-8oJdLIclAz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #16 from Milan Oravec (moravec@ukf.sk) ---
I'll roll back to 7.0.10 first to see if it is different. Will do that now.=
..

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
