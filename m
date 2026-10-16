Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51FE41DEF4
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 07:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136356; cv=none; b=Wbi9SFYnKmQG+N40D4eqpzj53S+5W1ynJYVD7X9EktZTGoiZIlo5rElXK43cGIWwE7tIrs/c+rIsjJ9NRBaUcEWvxy5kMlZpq0uJXpEDb9N3+3UmWXy20CkVwJ9POO5Z4n/2b09lRPZIipLPHviyfkuDV8ob3vX1JBwRkChnTrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136356; c=relaxed/simple;
	bh=b2w1qssIKUTlLpH+eVlCW6y7pj5Ls8dXzfzEhjcQqeE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H1OSvtlHqtvLqk/RgL5VCc9N+HHYUPKgIgt4zgo1jKJMQrLIYhN0MeinKWOQwC3FpYsd/YdaEv9hbSsi0EYi+xXU90BxtJutfFJ1X1O990c1oc6/1MfTbJkLQi0Ncx6CSIFGQ+iJ59HZWjGmAPMjD/hxf2X7hlFTAoL9LQrnLwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rvVSEfov; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rvVSEfov"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC017C2BCF4
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 07:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792136355;
	bh=b2w1qssIKUTlLpH+eVlCW6y7pj5Ls8dXzfzEhjcQqeE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rvVSEfovmRT8y2veVNSoChMkHThBtdbcdQFttv9j5PwLNWDj7DaPZSiKHgd6/vaQx
	 lZ4pCwOpSg/78P7iHJdQPE0RCutsEx8O5Ax+pPtIcLpZcW9K9EjW61/16Gbft2f0ub
	 3QFI0CKDe9Lwp9ylrEhTK+QwWk2VR0uIllagjrKUza9P3dN6BS7SWqDt0I84KU5K3+
	 l9nA2pBj+4tXzDKO6lek6zuQpXnqMwciA1Nn7ESrcPqhx++mAYN3ews+ZXGFcCrt7B
	 azPkDbhFM917oqikq0uwnJ+NjPlS3+6zjIYtG0kjAvE5HsXYenY8JKpDiBA5QkUe5R
	 o77vxEKUFgr7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D9F1AC3279F; Fri, 16 Oct 2026 07:39:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222138] hp-wmi: HPWMI_GM queries fail with AE_AML_OPERAND_TYPE
 on OmniBook 5 16-ag1xxx (8DF4); firmware WHCM never calls GMCF
Date: Fri, 16 Oct 2026 07:39:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lorenzocollevecchio17@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-222138-215701-kXfiMkaZbW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222138-215701@https.bugzilla.kernel.org/>
References: <bug-222138-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222138

--- Comment #1 from lorenzocollevecchio17@gmail.com ---
Created attachment 311137
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311137&action=3Dedit
dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
