Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894B5385506
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 17:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779124830; cv=none; b=fHHqjiFOYMJP+zdkLdExdVNX9nlvAjJRnXh+usq5t9ovMui83kDeVi8iB+HC7Pbi5yDKLl2zfvUIkIsD/pQuQwpyx5DYGQpkObYOv43xQLX8tYXwOk0QhlR9G+XVzx1jtbtfbJ9poCvM5Bf4NzVyAmIWNy7PhQL9N1qDu8xwYQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779124830; c=relaxed/simple;
	bh=xSNdPbLBgsrEzsIY/V8O42v+NsnBc0x0mW6hgGG/KEw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GOvMLYkA9xW9AOhu+F8NgEZVbgT/dvhQyvUwEF8XlHU9KGUFcSl0f8w5NaFu/RFz+NMId5eQ+Mv8CFK1DXz2m9ydD+uC30sdxwcXH6h7Li5/+csqd7TExjZS3+dCuuClwKOAuVv5hT04/QOOjgCXxRjSnBN9BA39JcdJW7Z1WtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UroGZAPc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UroGZAPc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E0D3C2BCC9
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 17:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779124830;
	bh=xSNdPbLBgsrEzsIY/V8O42v+NsnBc0x0mW6hgGG/KEw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UroGZAPcirOXQ2LWQ8Tg7PH4HHq8T+tE0/OFFVLc/KMOZAjaCH+KjUlBKpw2Vxs1n
	 mrLXXji9kl0Z9bJkeRMFT/yqAtJhyFIrSZGbD16XuebTQnq9ckO5p26xn9m2fjrmTw
	 6uwm1fa55+lInWk3wSntl3vnZIIKHpDQFGqj7gH6L7CTeu0KDnlfr1HXkygyuyGrGc
	 hSbhrB7iijKbgZ2WlYDzf5KbA4yTJ9KpRRV8/UATQX+WIpGJP7NmVGZ8V7qTWtThHE
	 g7gayKzGahBRdHpesR6ZaYJ//UlQUw1ZLyXR5Q8k4LOl3tKv3rQ+GeTps7WhoFxR2i
	 BiNxZx2kFOSjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 280AEC3279F; Mon, 18 May 2026 17:20:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221546] Fujitsu u727 notebook lid close does nothing kernel 7.x
 - normal triggered suspend/sleep working
Date: Mon, 18 May 2026 17:20:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: software@f-hasel.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221546-215701-ETb6XuYGAo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221546-215701@https.bugzilla.kernel.org/>
References: <bug-221546-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221546

--- Comment #1 from waldwegflitzer (software@f-hasel.de) ---
Appendix, does not matter to the distribution. With manjaro and plasma 6.6.=
5 it
is the same as with Debian 13 and plasma 6.3.6, the same in xfce. Always wh=
en I
boot an older 6.x kernel, the lid function is woriking again.

modules belonging to fujitsu are loaded:
ujitsu_laptop         32768  0
sparse_keymap          12288  1 fujitsu_laptop
video                  81920  2 fujitsu_laptop,i915

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
