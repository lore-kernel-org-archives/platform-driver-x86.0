Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FED3B52F1
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 10:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772189150; cv=none; b=gViPsGXzOL4DJNTOqJJO6Cc2V2H5VB/mpBD+1zgdlsGITzWM2RSWrRmycilWpxlTtygxStuB3KvJTAN9s9aYGh/KVK4t2+9UDrAqaLWLoIMsVUyZ7k058FBOxfsOR5c6Go0k3PfRUG6LvcHTemNHbyTbTOlxq8ddMQPNt/UFLFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772189150; c=relaxed/simple;
	bh=uzgzuoguRn9GGWIVfJXjDkseOv0BHM9hY8MnAkLdkFw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ruS0rv7RcOc5xLWuRwl4zj6S+EE7fRN6zFDDPqvIXy7uduhVTYHzJjTrDYSwSCICCKgiLTiqSH3YLAWo6QRVYWP5BQvs8/0J2PPT/L/HfwqU0P9uS5xjI6oXCpFnOybe9kMyNxFfNVZNreotAoUHlfD/ht9BTuQmA09ZXzkirsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2AEQaHX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2AEQaHX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3EFBC19423
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 10:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772189149;
	bh=uzgzuoguRn9GGWIVfJXjDkseOv0BHM9hY8MnAkLdkFw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U2AEQaHXERqTZEslJUswvY3g1AUiUbY0DSGdW3NDne4d6bf8dl6OgIwJRYuAQs87q
	 aOqKMTHwiTtdfP9ayvSXrRMkc+54bQKAlt+OkljDx43AJuWiSyVC9evtABueCj/LBF
	 p0KjgD6/KkQGAJlPI7Wc2w5oEhNSP7kq3uVOpPoUutRL4dLNkC6Hd+dEjkOy10RDvv
	 3zmwBenuNGIJFu8+5givG2uhnGWoJZ8CpPp+cYYfw3febA7d80ASLfeHWu75i1Rnlk
	 SLp/zvH2SEf4N4Kvyl0dkdU+ig5apZIaaERpvp1sfnz6iFzbSqZOoDXPTL5UcSxxkj
	 dhzJ+4IpkLdLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BD42AC3279F; Fri, 27 Feb 2026 10:45:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Fri, 27 Feb 2026 10:45:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220639-215701-07g800Qtoh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220639-215701@https.bugzilla.kernel.org/>
References: <bug-220639-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220639

--- Comment #18 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Thanks, I will move the discussion there.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
