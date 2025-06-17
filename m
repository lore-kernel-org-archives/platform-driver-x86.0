Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F902F5303
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jun 2025 21:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750196598; cv=none; b=XeIA0hb2+jPZthC0yU5u6vP/SPD1RvXA28cMajVtDjhMmv/jFhWWGQfQEHRunVAdahBnEZ+515VcyKHfds8BL0qa7dyGNHAe94wiaFnFKtkUtMGY4MPl8DU5A/Apa5IIVJiJm4HYbpIOk9J73PVQWJGPKc04T+Z/R4klt4GwdMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750196598; c=relaxed/simple;
	bh=MlxkNIXhL4wjXxqAoLNnrHQynOo20eRul0VPav29xRQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YxCxuGnadW54oWFADS3rl8XfXKnMp3qE8AW1zLu5gwAHupAihI6ZmbNW0EcurBT3Z4jMkyN+LJPSQiIQusLJ0RERcc27g6jaAVk/LSF0dwJCYfI294L9OMvTzawBQrBRf6q9SQO1CGc+Zl5g0eGIcEnwZ3+DS352YqpU4CROAW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGG/1U/p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGG/1U/p"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF285C4CEEE
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jun 2025 21:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750196597;
	bh=MlxkNIXhL4wjXxqAoLNnrHQynOo20eRul0VPav29xRQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BGG/1U/p1TxG5TfeRclvStPmD+V+LC7xp0fU5FE4MYxy9A3b2Cxdg4npqswytAcvz
	 SZ+CoWRKN9q1Okq6TMyr8RG/6sqK2WvhCoveZ4ELPfKV40hzSkYH4tPuwSB/+4YXj+
	 0XvqVP0JFTr4uIQyLaT53O4FGMRv6yFzY9rqwsaSL3S8ElJI9on8KcHU80EV1ceKX6
	 8SeNHRrPkUvwYzcooAuot2x1VcmIWi5rF6sduuOJDkbVfWRjlWY787Sg03Ic29loIi
	 SAkwUIqZeNUKsfe5m3POHJiyBuuHqRHnUE7p5y2prR6c2Zj64SUuC4HmUSk6J5aDD+
	 2PynWtcbwOhIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D671BC41613; Tue, 17 Jun 2025 21:43:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Tue, 17 Jun 2025 21:43:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_input-devices@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220116-215701-K6uL8xTTSM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #30 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
W/A is landed.  Will be in 6.16-rc3.

https://github.com/torvalds/linux/commit/9ba75ccad85708c5a484637dccc1fc5929=
5b0a83

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
