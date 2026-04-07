Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918A21E9B3A
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Apr 2026 19:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775588559; cv=none; b=rnvFlPflEbTTuQz2qnTNPWN7x7XE00yhq9ZaOx+8cOIvYvQPJaGovZmY04pP/lqI8A0biKILNvLN6CE4v9qRsIyzuVohqRJKnUP0HdXPtdh+8XHN/XE5UemI/sYfUhMOyz1Tk8svmBOvTmC//O5ENxezhaAVC7e2EHcG+Y+FBHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775588559; c=relaxed/simple;
	bh=0veukqc9aeZdJ/vsnwPO8OoM9TYfRi32rj6yA+pbtrg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MvOAPpfYUu5kL7wcKFM5UcJU0sKIu+nrz5KJ+quLY+ZsdiAU66wBDPXJU5tqlIoROtKp+XmMZ8BiNeuk1KBpVwyxTi2gXVzaeyRp6mDeiNXI89Pkg/KeSED60ALKeQdiu9z79rpR/bH0xx7oQAdCkZm9cLey0oZnhkED4iK39Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=prQgji7k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="prQgji7k"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2344DC2BCB0
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Apr 2026 19:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775588559;
	bh=0veukqc9aeZdJ/vsnwPO8OoM9TYfRi32rj6yA+pbtrg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=prQgji7k5f7PCQCP3PxDpqU99bW5A764B1xbfSjF5dc19fuGWvD/vDFK13ev0p5R0
	 8uQw8wITRnjsGMEfYp9CeGXAHunOmW8/AifCpj8HYiBwfZ1buW85yveckAEDyLaxft
	 MEjd8fKfYCvOhbegKylm+62SfMI7Ypa7ZTOqqJtRhn13BXPl59hN9N7OvCbcHipzXr
	 IrMsdkuuzNkvlEbM/0AMbhIUlj+rGLUkDcj0FQm/ju/uukYddTCZVz/TGbqjtTig/q
	 SX9xQ8EeaJcm1i3Ypdu9uRS/EE+4dV7AooYzE49iDjoZDwbZuRjtXHkIqHj/aUAyxl
	 iK3Z0Q6Wo+I0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1A603C41613; Tue,  7 Apr 2026 19:02:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 07 Apr 2026 19:02:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: team@nitrosubs.live
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-V9jYdbTQ1Y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #57 from fililip (team@nitrosubs.live) ---
Alright, I did the update which was easy thanks to fwupdtool but unfortunat=
ely
the issue still remains.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
