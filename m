Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9562580D7
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778408184; cv=none; b=fX9VRvC4KIwmGi34YOktZpBtkJaa7VXDr8W0O5R02/KEG0LLQzaPN3ZdNQEmtsvUpKA3wWj8iVNyTYBoAXq41TeKtnZ6xkXE9+6JULWNQXQqbXnS7eWJl71S2+1LMN5druVP1mDYMEl6xTFfLc0HW3woATupuvHtYB79/7lgo8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778408184; c=relaxed/simple;
	bh=oKJBaGc2s7x1DOvqa4BDDRo2bvv00tsuCdFtKObwMJk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hdUCIog7+gtQmrtCk5zRLh0Dl4Hpy3e/HCz00q+jiYRk1QjwnGUmqQhNtGKBW53GgoKuSVds6IuhI6qZxxaSxNfeZ3AmlNLyEw4bOLq2bZFoiEgK+6QTm0zvHyL7riLUjzwIF4llaJiEQYOYhVNwKj516vxe3gjrjKBoiNHTWvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgvG24jN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgvG24jN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C139C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778408184;
	bh=oKJBaGc2s7x1DOvqa4BDDRo2bvv00tsuCdFtKObwMJk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NgvG24jNCHEVspalMRKjy+Jh9OGzevp7CkgQeV9uWejbhl96lC+XNtNJEvc3XX/ES
	 fPkiEBhMRYZAreU4kw9ACvbmIxZtXktto7D7Cir/9RahRghtJQhB/UwaSUfnmzLq6w
	 TAHtZ/yvhz9PHTpMKV7916DP0DXhlllxY9jY2DbrB6GP0VzP+Gnmlf/k+WORadnAsN
	 RAT1T0/0JrbA8qGxL/DY/K8HUZcPuLdCiELC8zxLO0bAXu99tjstGB5y+mJK6oy0Q7
	 YR4GpVjyHx1iNKPagfpmnHV5jLiObBkhgt9WPrO8RduoeumIHUMEoxdMqWoTbeiepn
	 TL5DPEAOW/RGg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 48C8DC3279F; Sun, 10 May 2026 10:16:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221430] nvidia_wmi_ec_backlight: brightness writes silently
 dropped on HP OMEN 16 (2025)
Date: Sun, 10 May 2026 10:16:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: floquimaurice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221430-215701-VxEYsNltcM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221430-215701@https.bugzilla.kernel.org/>
References: <bug-221430-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221430

--- Comment #5 from floquimaurice@gmail.com ---
Hi Hans,

Thanks for the lore link. The backlight-aggregate plan to mimic Windows'
behavior makes perfect sense!

Regarding the workaround: I tested acpi_backlight=3Dnative, but unfortunate=
ly it
fails on this OMEN. The sysfs entries populate, but the panel ignores the
changes (likely because the EC is still waiting for the unpopulated CBL1
variable).

Since you are short on time, let me know if I can help draft/test for this
specific model in the meantime.=20

Thanks again!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
