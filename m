Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904353C24
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 18:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723054521; cv=none; b=Wr30PEgX3VTjlOy03L9RQwF3b2zSmDB1c5UtAR2eUNS9FQdDa7SK5y2j9iTq/jGMY/A72bhbRjveVLcoIciFGMHW2R/ZpxWTtlvuqztNP1kql8TcBZdOJnd6f0YArnvVSYdc07ofySBZdOqMsDj3lab9K+4ygJ7PgFGs3BvX3vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723054521; c=relaxed/simple;
	bh=1K8osps/Rubb2MGU/qp+LlFGnTbzTUW2rEcJFEr6z7U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KdST/TWliKrLzWPrNeaAlnJruBKYPxC3QElHJc5/rrxItUUXwcQzlFXrECuOMNbDgaI3S5gMsVtB6LZNZpe3m8QR9gkKbus6LvKEguHzQ21jd3JKnvAG9Nnx+5I0k5lZ/Gh4/HsjqGUrgePzzHOkZmUATq6qdoFIsud+YyYwv40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhidDWvO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhidDWvO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17E50C4AF09
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723054521;
	bh=1K8osps/Rubb2MGU/qp+LlFGnTbzTUW2rEcJFEr6z7U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FhidDWvOp28W+kxsgsRkGtJD3CAJZuHHPeDgIQIjDtgUy43fOBx1NmbQhU9PaSOjQ
	 zAl8dbxHK9K/Qzr6dRuGHLGJs6Yr+FKQ+9GrcvMUZlC50WrLrWJH17YRrWCidH89sE
	 oaPNeSY+JA46gMgmcF8WnKd9JRuQGy9KCginOOLs88pQaYWHENacgR3HYm9oL9mrJc
	 yxZVbTvy8byCAy5JWJUew3pPFQUEnfNDXObFPyK/fHnpfGkDPwtEdZU/PgNt0rLoGL
	 kkgjyC7OgHugZf9frwY3eIsA3GTVLes3i8CmWR0gq4iEWwsAcqjYwuUEz0LAkQ/zd0
	 J6/KnNvGpdzeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 01913C53B73; Wed,  7 Aug 2024 18:15:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Wed, 07 Aug 2024 18:15:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ghostwind@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-0o2QMx7J6e@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #54 from Chris (ghostwind@gmail.com) ---
please ignore the above post. wrong ticket

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
