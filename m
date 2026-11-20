Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202864;
	b=Gr5nGdMmDkf+RlVq0cbuqKF2pvsIsXClR7FrixroMVt5XCk3sB3qmbKBo59i7OTdSrws
	 996M1MsIajpMSGpp+SAgcKdOy7kXM46umx6gx0AZTYgbx+9HiHaI0vijTksa/8t1dSqbT
	 LcmOhugoP2/fBzHjGoKxoINxnmU8cKBeY1gNOCu/rdAL1Wqad3FAQoqMus63LrI1goayM
	 xbadEru3Rst1oldgRfk3yXqH1KSyIiirmi6YNrKVU2+Ac2swRrn1wKkvf/QukrvdEwp2a
	 +577HWgtTJ7PwlVI5inJ69hX38vbkHthBJJoQ38Eqw54/b3FpRa3qy7jBR3PM3DQ0tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202864;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=gQVlXtXBo8yR6ltRXww2m4IU2+N+A1bIboCyxFqMAmw=;
	b=Rq7TJBBfpcLRqSmQ6R2L/DR6l39WyzGeIlvkPtRl7oBrMFLT2DUjqZX4r3WUUYt3eF3b
	 U2ShDYLIhpC7QZLeK7u0IAmxb6gRQHlEkoKFdz+1c+/RNNANxF6S4rbLf7sXf0WEkcQXo
	 OQooxCyjp8AlgDzlp69plNYG2wOxKo86naqpuB2Zx34d2biGmVZ4rL8dpKxEglzV3EA+d
	 8R4saItC1RwLKQL++W0lXKEHQi5q6doz4LfbYjyeXI0eOn6z36YKlWYQhWv9IyJWd9LYj
	 e/8/L//tetcXVnOYuureUzwrUst8iXl7xg5HfN1q9//TtmYGxARWXMptDXcJKJFNZQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ct3AHRsI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACAF606A6ED
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 19:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ct3AHRsI
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEBC01F000E1
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 19:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795202863;
	bh=gQVlXtXBo8yR6ltRXww2m4IU2+N+A1bIboCyxFqMAmw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Ct3AHRsIEWtwf7iCkmentda+J09LhFp9sARa420VVYrpgDfcNgzKZbU0sVUsxgsfw
	 l0Sflpkp/7Putf16XKgrwKkjgDSjFcPf4qAZTspm8xSlUo6rc4FnJPRxcKhItU3WVO
	 1FlBluGtZ3Egb4spuw+ZaSb2jcoz3BU8STwSvZ7Pzu5LxH3Dx4sdFd2R9iCxY9Eokz
	 fN9aTmnPY+/ULLjHsBs0N9FmH1lkDJ5yD4mGSk1gAbo4r6G3lYpeLr6+Jyjp6vZatV
	 /yGqFKmY0rHzXzpoE3Kw6k6PJNWpTzaDm9eZY53wtRAEy8cfr0+rb1pOgHQer/7DFL
	 iGWE7s8eLRNMQ==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id AAAF7240040C; Fri, 20 Nov 2026 19:27:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222275] lg_laptop: LG gram 16UD55U - kbd_backlight has no
 effect, unknown WMI scancodes on Super key
Date: Fri, 20 Nov 2026 19:27:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222275-215701-3DhjLIoVW0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222275-215701@https.bugzilla.kernel.org/>
References: <bug-222275-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222275

--- Comment #9 from Armin Wolf (W_Armin@gmx.de) ---
Can i get your real name too, so i can produce a proper Tested-by tag?

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
