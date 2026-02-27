Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE2A4315F
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772192067; cv=none; b=T+4kBRlWNVZ7H4OYXlXwTFAfloz3EGD4K5nJL4PmisPebxbDFzGWRZPcbuFhn/NFfJMl/2AVO4hSADRPhD/nNWPAfY4FTY8UgntpWiAX+8lnXtSwZR6I0tmsMQpwLglD6cCjh1NupVB2Xy3EoDtHXq6wg2JGMonMbo0feuUBBqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772192067; c=relaxed/simple;
	bh=vWikz3GIMbPkYLpbdaO3Dh9Gn+bH5kmFBbJ8cv0bF3E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jy3BAMb6dXjBMtzhx97qKcnl3V6faKcXRDQYcpJR0IDkkATqrTSH+E0qA7fM7pR7H5hV428NSnS3Pio0ch75PFc88Qqd+fjpIn2q5g+r02YebjT6NLXb1uTA6IdzE0yVctgd4kNShXwuCMQIkgCU1s0i3tD1Pk+juzquBSJ2Vvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvdjkvBW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvdjkvBW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D82E9C116C6
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 11:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772192066;
	bh=vWikz3GIMbPkYLpbdaO3Dh9Gn+bH5kmFBbJ8cv0bF3E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RvdjkvBWoEdkk2QxQ94lALeuCf/q/RVHubXYrtc5xOQHUCiq2l6V4DK+F5745i5w4
	 NgHxqTQG14Xar7iQVaEutHO1EGXkh/qpn26F4xnhMN3T3KgZOQ5/XxvDpJJNqP/2PQ
	 WsWGdAQIBHwY/DTIWt+yIqgoKJWw3jyV8F3U3StqPehexxclW9KwbMsHdFTA0M8Zwz
	 bSVF0PMBS+Cu6mo8G3Cw+3mET4/TjIDD7gn7WnvpB3oqDujYgDT/iiXLk8tYRhfA9r
	 6J47Ks1SLASDoTFv10cgjB2j1GmE9ANGbwNy/g8zXQ3FP2f0XUIhssuwltNP6G1kSJ
	 FfeSXM/oya3VQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C1FD8C433E1; Fri, 27 Feb 2026 11:34:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjExNTBdIFtCVUddIGhwLXdtaTogT01FTiAxNi1rMHh4?=
 =?UTF-8?B?eCAoYm9hcmQgOEE0RCkg4oCTIHZlcmlmaWNhdGlvbiBvZiBwbGF0Zm9ybV9w?=
 =?UTF-8?B?cm9maWxlIGFuZCBFQyByZWdpc3RlciBiZWhhdmlvcg==?=
Date: Fri, 27 Feb 2026 11:34:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: qwqgong@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221150-215701-zkR0NhMhyh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221150-215701@https.bugzilla.kernel.org/>
References: <bug-221150-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221150

--- Comment #3 from wudd_maya (qwqgong@gmail.com) ---
Created attachment 309488
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309488&action=3Dedit
windows omen gaming hub log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
