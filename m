Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5FE27A91D
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 01:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784164435; cv=none; b=G1mJ1GLB9U8w9422VrUnN9MOgQmYly7K6yys8ujmhO160gRZ34qaLeLP5bY4ggUvR4gvp3urIlSFcLFHGH19x1KxG+i5ysxyq5Y+pEODckU87ySjtVZbiuqakc8l1xRjCa0jJm4SyhEz0R4Ng2juydzhh3T85XPgh6QgMNoWxHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784164435; c=relaxed/simple;
	bh=mbj38HmJNEusxXCYGwlGLkqohWl1wfeL465yaHXgUMg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kf1b+R6OBx8dkFOT4UknUF7IvZP2IHTU+TWa38kZUdh1go5ZhXjIvWi/PQblXd3TdnHemVwubEKnzardWLmduK9o1dInCl8OWQ6kZ50/FrItsBrsdBn0rNZp6SdDZcyKx+1MkT7c7blB3rdxIIvfq9a6K9jM5PbNOftP/3YJAwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tehC+3kg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tehC+3kg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6466DC19425
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 01:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784164435;
	bh=mbj38HmJNEusxXCYGwlGLkqohWl1wfeL465yaHXgUMg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tehC+3kgrVBDLyjFE7qoOCk7bd9cQEsvL0F19FbqBx9D1WnQr1YFZlw++P4+bJ4Tq
	 sXYhDenvp/W4YJNYolmMFjRUxuVNMeD0V2bvBDsvv6HPpoTzyM5+/J0JkE1sorXjBw
	 j76xa9j/JeqqbqO/4ggwTv5f1dUmpAw9RaMdZaAzicMh5Q2z0FfMGY9W1Bp5tA56sR
	 wMjzP6DAaGMI/CBwSkLgWfyk//Uoi6Wrl/qi/XwA6kogZYTgywxKZ6WB4lKmRrv3+h
	 EtJh5NTf78Tvt7FHNeFuAm0QWL+oO1hdECc+upSRleu+J0NUPGexF3ftbnmE1r+y1+
	 ZEU25eWkLAj5A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 55683C41613; Thu, 16 Jul 2026 01:13:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221755] amd_pmc: ThinkPad T14 Gen 2 AMD machine type 20XL
 missing from s2idle quirk list - intermittent ~10s resume from s2idle
Date: Thu, 16 Jul 2026 01:13:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ywc8891@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221755-215701-glF33DCKv1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221755-215701@https.bugzilla.kernel.org/>
References: <bug-221755-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221755

--- Comment #1 from ywc8891@gmail.com ---
Created attachment 310454
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310454&action=3Dedit
Add T14 Gen2 AMD (20XL) to s2idle quirk list

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
