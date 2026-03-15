Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A27186A
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 11:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773573486; cv=none; b=c9uad0EebosHRFhU11fyhfg/09MclGsQbuy2uTpJzAhwC1r8Yu1A8x5SedHk8oK6sjgguQhRVQhoweK2waWMHjLxQf2IeQS1B13qAx5tc/0NOSbI2SWTt4drCrAHJin+kfS9gs/4AeO6BxbthTNt2pj8buhycVrKd76LvhlBvFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773573486; c=relaxed/simple;
	bh=fWfucTi3hphVwIJgj8vOHW/RduhP7ygpvhA/agh4Xt4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gIZL8Vj0Ge61xdOsZWikc0+TvFm/a8eVogpXUgKoYkt35YQssR9fVS/yg0CA29X5hLvKZvYutmFQDpCaUQSNHbTFHHNDJL5DPb+zEz/HrdEHcL1QkA5hACdO17QKdKjr2UNDvQbSdhBZvngbOakogt8rr5PCc5UsWzWuu0iN+po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QncQIR91; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QncQIR91"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F7F3C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773573485;
	bh=fWfucTi3hphVwIJgj8vOHW/RduhP7ygpvhA/agh4Xt4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QncQIR91Sbhzkf52uh4DC68755ObuEEUp9Cq05MesUWLSKtPgiQEAtixY4d/JAzLM
	 nHqjA4PLWlQzcxtX+HBh2PxCgNw7KQVWekRGQxZLhkjvQMs8LcKw1kTZtnmLlAVoK3
	 kGI1i5PmG6O9VpVvWrKdti/ERlijxTDZCfvOQQv2OF4Jfi2MaZFUBttKTO1k4vHDEO
	 E5BlJGQf9bPX8i/4kpWDTRYis0ObjMbaPLiDBQAcVFifvgtzVQdRYLXyhLPwixzbIH
	 +BUe1+b0SMqbY8ATW6jIulZcpFjVsPH/FtigsU/1iR1r7QT168A9lhf3+btGBAqwQI
	 ychWKivnJ//Vg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 997CAC3279F; Sun, 15 Mar 2026 11:18:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221238] lg-laptop: Spurious ACK and dropped keystrokes due to
 unprotected i8042 port access
Date: Sun, 15 Mar 2026 11:18:05 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alfonso.garcia.frey@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221238-215701-r8H8XZwLWi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221238-215701@https.bugzilla.kernel.org/>
References: <bug-221238-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221238

Alfonso GARCIA FREY (alfonso.garcia.frey@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |platform-driver-x86@vger.ke
                   |                            |rnel.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
You are watching the assignee of the bug.=
