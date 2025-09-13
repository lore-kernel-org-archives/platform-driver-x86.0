Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B710A11CBA
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Sep 2025 17:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757785061; cv=none; b=SJzgQoGzga5WOJ23NCpHvtRL3WbgegZyT4QkpdAMDPATNgfMBzX33gwmGZtNAVZTxjV40vNn0HlWC6/JT4sZF5lkk/ZYWuoG8mCT2ttBcteVhMeZ5+ZdpaJqddaXCHKCXP0+GwCccvku4A/dhOUNsia2ZXZNkcGm4QTGjiZuElo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757785061; c=relaxed/simple;
	bh=QsWoLMrvNMFOQnEAPuQzqaG3iNe/hu0jYmtBD7eNSu0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LTq6h3UqbmU3Qhcd4XaDbxeQG1yksSLwX4b+6CotXklEwQzrDEjPKjM13w78ScyoxTIQprydwH9Ai4OmrSHJB5hCkpxsp2u8LfmW+/yWpSOSgZNRqe0fSHq3iF5wsJ0KVgzmp5I6wKSzDonSrpprI3O7wF0ICxnETrKHFexmX0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAX+CLui; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAX+CLui"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42F87C4CEFB
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Sep 2025 17:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757785061;
	bh=QsWoLMrvNMFOQnEAPuQzqaG3iNe/hu0jYmtBD7eNSu0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CAX+CLui/zjuqJEnGv0pGBEYeicaxe0jaRR8VF57FQc4bagyLD2i+mp0Turjtj4n1
	 tIX5M/HjleAhxuflasfsWlrqdHkaPQQgJVnt+kcskR4EgbYrFr/EYufDjWJoWRLBzP
	 fNtd4AwUwHZhnZQfNu6HTp1ey58/KprH0FjBkE/hRmlueJs+eriBs78FU7wJCHlUer
	 uvp6AcY3cuBoHk3zVMUh3nemYYKyS3gcmdwG25kCc/rX7NiiGagFe5LEVbTOQnfabS
	 ZNObIc8u7mD7C4ulA24ylJYjCRBd30v25SlyXOdJhr5ObG5iIXHs7Ow/HKNfe3Zlos
	 opYtEWlATUDNQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3B05CC41614; Sat, 13 Sep 2025 17:37:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sat, 13 Sep 2025 17:37:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-4o9Hy3yDBs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #112 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
That's quite an interesting result.  Let me ask this - how quickly are you
unplugging / plugging in the adapter?  Particularly after you've closed the=
 lid
but before unplugging the adapter.

Without the revert if you follow this (specific) timing does it still happe=
n?

1) Close lid
2) Wait 10 seconds
3) Unplug adapter
4) Wait 10 seconds
5) Plug in adapter
6) Wait 10 seconds
7) Open laptop, check frequency

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
