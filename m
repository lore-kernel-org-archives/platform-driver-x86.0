Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422171EB27
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717336975; cv=none; b=pk0IsU75WOROPIaU2me4VuIujD9qEktxK9hAJG2Mrl+hGGd71z+BMCRwiss+LMDroHwLoImefc4BBAGEMEBacgTclTMjso82W97jo8Bqz71qGLp6LJ8dpS3W6c5/2fdm2bpOuoUJMbUuiAVfe9ahHMVLlj3V22RCM99msqOSGwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717336975; c=relaxed/simple;
	bh=2HBjEnguuYk5XzMHb0JwH98gPfyVvnPwBoJ8W0T+x7U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ry4a83pKbEDPTShK+3rseD8nWa/wo3NavQCiAZCALY6pd5RXraRjZZgn8C4NHLsZ8lWV/RcaqFZYeRMoj1DIov1x+DALv6F8ioZAPBsyrqQ5KEgUVD89km/vcXH6BaPmTmWz9U6XiJMI+ZWEVRVllTht1Ckhw0Knn8pf5yaVFPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=squ7W2+X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="squ7W2+X"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B65C3C32781
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 14:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717336974;
	bh=2HBjEnguuYk5XzMHb0JwH98gPfyVvnPwBoJ8W0T+x7U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=squ7W2+XKRZqVbRQhPcrdihayBIuZESgygMcQpBgiW9ow9x0oQkKuThYyBtoeWz56
	 kpsJmtT4/TydvvjGMardYqczFxwyv7XolwEoHBu4If2YcyqbxtbpfMAxhW9loo6DA3
	 XxMy/m+w0CTip4vYdAM4LeE7FJp/lXSfarqusNmkUQ53A4aKKLIjWG8vNO7QpFm8w7
	 3rOwMycA/AYY3B/NbvdEEI9u3TfMMOQMIN3naRiAsPpWqeXCFhmGeKi9M5azttzdnh
	 1no7gg9gMFlg6oOdfPDfLdWEwBS3vhTZb7lXZrJ69wu/cr0/Ryfc7MsT1rNB/TBsHM
	 WGjJVWpIXhVdw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9F861C53B73; Sun,  2 Jun 2024 14:02:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 14:02:54 +0000
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
Message-ID: <bug-218901-215701-BmFL1ICUC5@https.bugzilla.kernel.org/>
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

--- Comment #12 from Armin Wolf (W_Armin@gmx.de) ---
Did you unload the old module first?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
