Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CBB239567
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 04:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775105960; cv=none; b=R3fLkmqGVHrRkZ5abjQ4IvERMsQ6wVwK2qVb3RKnJlsU52tH06WSrfFXztqcF1QKc7EI5ifxGsShszEUTqqsvmmqeQdgCimp2b7AQQykE9Vjh9uPfX7fCBImnZ7rHTQGjRlfCG85Tu5rK+VkL8lCJ0+UDZjsNhOTuRnJ29EuMTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775105960; c=relaxed/simple;
	bh=2J2tIgW4bGjg8ntwdigbV4zPfrt82rLlGa2XFZkqv0g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=asYrGex3efUS4GOjR3Lr1WtAvFc5SLNIkzO13fGOq/PTj13fPGdYqZJ0Yo+nFz2T+d5N7MX/6wSFPykP3wyzVvs+6fq9ELEDZVl/3JgcpsRP8/sS+mBKRvy6T8CFY8LijXqNmqUrE9FLMLnpNv/F3KWQC7SZP0XgRP1Md7ixaGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjUOUurX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjUOUurX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C628C19423
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 04:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775105960;
	bh=2J2tIgW4bGjg8ntwdigbV4zPfrt82rLlGa2XFZkqv0g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cjUOUurXlpAOXD6IsYrebuxJjJ6wxVooi/HCt7MxBUeWPysFE5QypcJxCCh/RM9jk
	 z4xOpxvwO3TiyQoEfjMa60j3PfO6RS0qaxQR8wgccqWnL6evxTp8LNlIA0IxSZRVk+
	 B3xKYQAxQFOn7s15HbxgDakFyy6kSuf2OGuSpD4E0QnnD7Ro6ZId/9Xv+n2IF2hX9q
	 dmdE8VYm705m9yECNv2wjEj+T1aK97w02thKAc2c+Pn3yBVYC45gAm3zQKnXaYa6zW
	 K3qr/liFhV4fZl+sW28HrzswsdCkbXTeRQrC1Q4dyR6bq61IFVmheu50z6/nBmCaw4
	 1Mh8h3yevykvw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4246EC41614; Thu,  2 Apr 2026 04:59:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221149] hp-wmi: Fan control fails and RPM always reads as zero
 on HP OMEN 16-wf1xxx (Board 8C76)
Date: Thu, 02 Apr 2026 04:59:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rdunlap@infradead.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-221149-215701-FnZ1Rf53tS@https.bugzilla.kernel.org/>
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

Randy Dunlap (rdunlap@infradead.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |rdunlap@infradead.org
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
