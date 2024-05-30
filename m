Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DA918396D
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2024 09:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717062538; cv=none; b=hZ7hZeHAcLMV8FOJ1qG0Td1LFdljB5q0XRLoWYqNiOw1nBYOmD17oNWVyAj6U6GytUNVSd4QT6uCfRoQWarLlwXblfrO1wk9u+Wfr9bFYq+K+b5YEq7uycQG7CoXmEqY009gsbqVzkbLVOLc/tahZddT7nmjUMQJ9hdEm3k6hkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717062538; c=relaxed/simple;
	bh=dbpzIMTHbhIB1d7B/cx+xSpx0EKu6d85uaiOforr20c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fEV7AogOUaKQlnxsaOXbxMkr62yWtXkCBKI73rwqrOWz+jIaV1+m8KCfcikn80QvQLVl9mDB/TSaIask0Csyhlkg0tWH3hCTJ8WkKlL+KwxeHtK/a1fN3kN+6wZWMYwe5flONYdVKm0SwZu4shkJoSDSt4CtLp1TPCqveOuzC1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8L+a9bz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8L+a9bz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44CA1C2BBFC
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2024 09:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717062538;
	bh=dbpzIMTHbhIB1d7B/cx+xSpx0EKu6d85uaiOforr20c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U8L+a9bzGn+63WESp0dIw2pzVZrZvHWrFGXY0CtnzSySulnq5iYIwUkQXO6nJmJfI
	 BWvKy0tXI68n5yteiTdUkbnMn8BxI77rVFtsZsaFrQndSnP88K8HXcV7zDTK/LWfHa
	 obdrH6TE9dsHRseHD4NRPXEgqNz+iXh4y+sZDYWFK+c5AjzTyQSGVNqctfRUDo/GpV
	 xvxxh2v4P80Zad6t6KUaR4Rrje238j9anSrZP97oSwoCmvU7u1e3SgZ7YQ9s1B1ivl
	 UzhPD+8qte+ihu78vZyncs+sVjkFN+m9YlZNiSlGVGEj0h+OyJ1m9Uv2DrkHqhrWXW
	 d21jSKUUPNfAQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2C7E6C53B7E; Thu, 30 May 2024 09:48:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 30 May 2024 09:48:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-5Rnh6UDP3n@https.bugzilla.kernel.org/>
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

--- Comment #6 from Agathe Boutmy (agathe@boutmy.com) ---
(In reply to Armin Wolf from comment #4)
Did you have a specific kernel module in mind?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
