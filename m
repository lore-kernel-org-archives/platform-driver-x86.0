Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324332;
	b=wqsE0MPn30/UYabr9zTHM7lXtpXbwdbcdBpANI5yIznn6KPSK3CWJTeDTq2kbwtBl8Kj
	 XcCNXvXnw8Dla2aEKCB+3Htx+2QRlkO6YxZEzHgNd0Wms1spoVmKcTw/mbA/WebyRkbj/
	 nxkL2mH/L3GERO7Mkr7wdumJcteoxDw1ZN4ddJqceC1++pRYgcCbPB3DoD3rIGO8SnGwi
	 JFZsuTnIbj4ujQz2g8KE9RDMHZEvi7qgXtHF4g8Vt/2c9PLW/UjrcXciLTz7lIg18z3V6
	 BHLnCfJKtLkZWz+/0iAP5IMPHqLRlRa2LXdBhUbmSa/3tx2fCTm+Kcm81dBUH6zo3wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324332;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=gF1VQPlWcZuP8bhykX42uaufsmzqTT5R4Kcyx71WNRU=;
	b=btvjTEW/cYEJEyCt7uuEYDQkSWmPm6Q7n5sg2yk99kIQaEHIbmXus7IIiQj0rodzzZiX
	 8BoF1gfrNCi5R3Q6mZulColphhUTjy5bAPprW+t2T1GDUfLPvOcjfzxrFSgvS5dWPVV/9
	 wTkMKNj7LKsJShCJzCh3eBqmLTI5H2uC6CC3vYg9jTan++DR5NkirK6srjcGcR+3S7gdo
	 LRDzCM+2Vo+G8DuezaVd9GiqEoA+NTVHxcVncoKN0GrOxnwfr/0Sjf/iwMr6vicrIsmPQ
	 FDkmVCHlalJlLR+0uBBVDpJvQVXFrBQ6rePYVMzAWLS1VjKY0I9yGDBIBAYo4BLS0Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQ9ioArC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16193606A321
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 15:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQ9ioArC
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEB541F0089F
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 15:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794324331;
	bh=gF1VQPlWcZuP8bhykX42uaufsmzqTT5R4Kcyx71WNRU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fQ9ioArCWUP7WHJl/euQ9NDAXvz/vPYbdYwt3bzSOAfTsamPqLqu8jBH1/ZidZf/H
	 N50324GJ3aPydbGqs8/b3Z2XdhR1x5ZeGka6FrwSB8y1Pd5bvIdLIS5eHXJsb2WbLf
	 YXZf4NZSVU7QyIkVAG9ZA3DbkfsK8ciE04DKG/MfrFxMW3Kg8enGxWKzq03V+bW63v
	 NFiUAD0FDFAYgm+p6NZvXSFG/RdbTr4IhTWciD5O+F2MG7siGxfw2+i/sG2XxrEFu/
	 L2maUdIS2SN1oRj6lenoPPmQf6y1ljURaQBLZncxF/C/556yD31129Ip91YuKgVFS0
	 HBZVJEXHUNQUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A18E2C41613; Tue, 10 Nov 2026 15:25:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Tue, 10 Nov 2026 15:25:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: helian.caumeil@clever.cloud
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222161-215701-LE0Jfe7BSb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222161-215701@https.bugzilla.kernel.org/>
References: <bug-222161-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222161

--- Comment #18 from helian.caumeil@clever.cloud ---
> Ok, i send the patch upstream (with some cosmetic changes).

Thanks!

Has anyone had a chance to review it?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
