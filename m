Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1873E8C5C
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772199808; cv=none; b=pUwCMkyEj35goA5kVJ7xPMT80ipiH9RCJaYhSNuzirbSfrrhH3xCN8FubXid+7xNw5Hy5GqBm28JYXjt04tOzfU92+5jpQE9g3iesKCQIZjqn96rn+/cLrHWFWVIsCJRhdSKXnyJQbaq9pV1xi+8mueYLRSFi6BKT0YoC0no4RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772199808; c=relaxed/simple;
	bh=UVDBrnNG//HCmfk62qikRa77/TQlcS7wAEgBgbMuuJ8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pFZXywYl3hM7GvoYG6D9UTZU7N6iXJwoELefGaoTuOBFJqXq3wNBn373E1f1OlmjU6eRySUOW/am5QrYOVUAjJCccumhcaBaUnWBkYwjCpRjaoa40vK11R51G0sy32u4P+w0Df6baNWpzRCbXCps0cFVWyv9GdcUO3E9NWg8icU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMJJMSa6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMJJMSa6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B80F1C2BC86
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 13:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772199807;
	bh=UVDBrnNG//HCmfk62qikRa77/TQlcS7wAEgBgbMuuJ8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NMJJMSa6dyo5NTtjaf+lcPNONUcrdaI3We3f5OUtFV3DYGt23hgxwEGTsKKEKn1ty
	 SSLuS4EZIpX0VSFABLVLq5UKVjM85Mnpveh8vIfdhG7xBRXsdUOysuYJOn5G7Vg3sN
	 WEoBBdrKvRp4YgWwYWgZBhbTLAJLc/+j47k7pbGs/cX+mEfbvJqRjrkV/3flYiZLQV
	 jSQ4iaExM421RAi5Lq4W4UclYbWfQXje4UJmbhJMP6LLlLPT0U09CNDcx9qko2UwYg
	 rsIW5U/B8fl7bvYRGqMh4rQNS13Fw/sT38cfTmv+MXPabSY7rauub9O1XVB/9qeKeN
	 BPQilrzuGthrw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B3478C3279F; Fri, 27 Feb 2026 13:43:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221149] hp-wmi: Fan control fails and RPM always reads as zero
 on HP OMEN 16-wf1xxx (Board 8C76)
Date: Fri, 27 Feb 2026 13:43:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Jie7172585@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221149-215701-zo4RMDj0L6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221149-215701@https.bugzilla.kernel.org/>
References: <bug-221149-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221149

--- Comment #4 from Enderlava (Jie7172585@gmail.com) ---
I must apologize, the 0 RPM reading was my mistake. The RPM reading actually
works perfectly fine! There is just a slight normal delay in the EC updating
the value after the fans spin up. I re-tested it, and the RPM values are be=
ing
reported correctly.

Also, writing 1 to `pwm1_enable` works flawlessly, and adjusting `pwm1` fro=
m 0
to 255 scales the fan speed smoothly and exactly as expected.

Thank you so much for your fast and incredibly effective help!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
