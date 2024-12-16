Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B59541C94
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Dec 2024 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734361303; cv=none; b=EHIFV99BI9ad4Q2RrnhYQpfYkCy2sZrxEpiyDDtvH9QwdJNNAlZDuvdusSOdBbrYbahtiPtdcD6PidKVoMD1L441DZEq4Dm7ejvj+v84KiTAgzn2jfRWpGJ5nqr2TvssLMFxpEHn3UlIglfX2p48DTc2tO8OxbWjgH5io5HpUu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734361303; c=relaxed/simple;
	bh=Aab1+5640z3X7wmej7yhp5/94qIuJJs0AMrZyw0bymU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bJ8LQpX4DkX6OQ9oeq41FDy/TqKs7hDoHkNYKo7Yt+OrPuTjWvf8c/vmcw7fNpbUxf2TJ3XLYS+7jZn67ge+zQKoB2R8AqUHKYgfEWbhxOuVdNFrO2/fMhlZ1j17z1f61bHtPpHWW/aI+9v7EvT2GB5uncFztSb5rP3sB9U/uhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAlDLqZ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAlDLqZ1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9A78C4CED7
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Dec 2024 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734361302;
	bh=Aab1+5640z3X7wmej7yhp5/94qIuJJs0AMrZyw0bymU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CAlDLqZ1j2wJGtGYYoCWuJGZaIoHcZxb7Xt44Vcy0BZdGFyzrF/2sG9QV4EtmLeHi
	 pxH5XX2jbZzjcycMocoIuwXQNqsxm5ajoUoy3OQlSw6LVgp4qvMnGqmBLvO/SCN2gi
	 rJV+U6YquIgaX+HQ4nCQeLsmCRlrfhcFPv1wtoRE7IDS6bdTcnxvyAH+iu/LxiXiVQ
	 BMpMJtBotHTzNDTEvga1BhhVXsJaLUrUVMCzqOVmEinLEVA3k3aXbHqaIILQFrQ1SB
	 mrnmCQy1+jAGt52k6syFhtPssX5hYWFCZEDgb7PVTQWLiF5mj55uu56Ksey77eopSp
	 UCTo5C4Q4xI6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9C26EC3279F; Mon, 16 Dec 2024 15:01:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Mon, 16 Dec 2024 15:01:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: auslands-kv@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219517-215701-TCcs2G5OdU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #24 from Michael (auslands-kv@gmx.de) ---
(In reply to Armin Wolf from comment #22)
> The linux 6.12.5 kernel should now contain the necessary fixes. Can you g=
ive
> it a try?

I'd like to, but at the moment Nixos repos are still at 6.12.4. As soon as
6.12.5 is available I'll give it a try and report back.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
