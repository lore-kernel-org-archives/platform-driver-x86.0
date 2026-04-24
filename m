Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0299F41C6A
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 04:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777003417; cv=none; b=OYjkWL+RhrqjzJ0gMjEK1bigW0ahCgjuP8MGV9C87W9toyRTLbyd2ng9HwoATq7hLA204KOJvE9bWPQu4pK5p3bDWVoUEC39Y7dw+EY2EaRUbP9u28ynA0tunKRLfU5p1CiYFXIAEnqK8w5FiqgqD86sjlTg505uO7Tazf/+nU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777003417; c=relaxed/simple;
	bh=EFyCOhg8c5LHuP2crsUaqK6VJX9sazz9wcznI+6pCPY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=crqdYLSAkrHRD8HMXggpaUblB1nRFgbI6Dtf1pzktmiCrDwv/yfNvaeXK0eDPYZmP713BbygQzLdjGHTL8TW33HP5wCZR7Gp4xbM/9VtZKp8nQHeQJlDjksP5RpOs34DzArOPo3NZSXj3e5CURnqUS8IQSyjWHc01T2sZsw6MGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=de5GW+1A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="de5GW+1A"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B75F0C19425
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 04:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777003416;
	bh=EFyCOhg8c5LHuP2crsUaqK6VJX9sazz9wcznI+6pCPY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=de5GW+1A0D2OLZYy3XaHgOfIYrnfpd6roDmPiU5o+voS2utBI5DXgwx3PRKZPDwoa
	 giq93eowfyKNMtidFFlM8PPD7w6HBwYs8dhBMxZ6mv0X40nPPGIVsSyf6G9YuFvAFS
	 B8adWLmaN737J4EIPUHX91tneGOiUd7lBcs8jUXO3/eVtkY2p8aPx7Gp2p55FZ3/Fv
	 /zf2rMFVkhw2z/OyGS9rhWrXZ+0FMldFwmOd62A82Wx2EWm3Vu7YFZ7GeLqsNkI48S
	 bxJPuTdZMCRTLVJMu8+bavseIM616eQyzW5LQTBPQDGpAbU/fY6rRHPZSoN9EfIm3P
	 iJd5SsKjnfw/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A4186C3279F; Fri, 24 Apr 2026 04:03:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Fri, 24 Apr 2026 04:03:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-cudff9aFNe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #26 from Daniel Gibson (metalcaedes@gmail.com) ---
Regarding Windows, I thought a bit about it and remembered that I was annoy=
ed
that Windows went to sleep without being told to, even when running a comma=
nd..
so suspend+resume worked, if the keyboard had completely failed afterwards I
would have noticed.
Can't say with absolute certainty that I would've noticed broken Fn keys, a=
s I
usually enabled Fn-lock to get the real F1-F12 keys.. but I googled the iss=
ue
and even when explicitly specifying "Windows" or "Win11" in the query I only
got results for the problem on Linux (or generic keyboard issues unrelated =
to
suspend), so I guess it doesn't happen there.

@Mario: However, if it'd really help, I could put Windows back on the machi=
ne
for testing. Especially if you want me to run tools to log the ACPI and PS/2
events or whatever to figure out what Windows does differently to make it w=
ork
- if such tools exists and you can point me towards a tutorial or something
that describes how to use them for this purpose :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
