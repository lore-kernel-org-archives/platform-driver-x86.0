Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514712F9D98
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 18:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775931165; cv=none; b=jpxbIQpaW49zM/ptUyoxtUz7lB0I92nGCWAabDqCWSmqV1/s3qeyz7+W/sn3/ZNHQJb/oioHIaZS17bfYvISf/ImnoJuzU/vR0n6xufrb/GZNG+RWGNGPilJUZ9kzkQuFhubzfKrsljUe3BR81JgatJzsDXe6IE4BWllHZ2e1KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775931165; c=relaxed/simple;
	bh=cCjCtQRBKJLb0uVcttJaGZULWIZZ8uQd9S8NDnlR2GA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cKQ6Lcvg3JuYTVqMQ4yLHIlhdKdiFlw8duouwZhWsVY347q6QlNs2FjEJ6zH4Aw0yre+0vu1NesRZSK9LzjnKUX4CQvl45XJWqXoO8SRoKwEhmL+UfLUz85MMpwHKu+MA211TVccVtjOG2GD+eOjRD7bSoltPmQNfMnS7xZROQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Um1Iu8QE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Um1Iu8QE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8DCFC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 18:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775931164;
	bh=cCjCtQRBKJLb0uVcttJaGZULWIZZ8uQd9S8NDnlR2GA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Um1Iu8QEPdaZyG74z0mMr0BJOKHLJEMIcOvMdBbrw0sed10nGCfndJNRoM4YZ3xg2
	 Ed5WLpHqrJHSyL8QCeh89ChlEgKzSoVswFgXzPwAA45TFvAG+w4c83iA5NiBEKW2TJ
	 mwAuv4GHAy51t67NT8H7Lv7MjnPLBLwvNRAgKdrxMcGq7rd0E+JGkB3uyLe1ALUwg4
	 KEIwUTJE3I0YVI32Qwg3SPzH4VYZasZQEvRm8O/Vizphw4e+BMyjoibT7HrHA+UZmp
	 AXIMYjzm0vSjlLo3ZXQfuj0/3YFUXzOMvM9KX81SH4DQhWUPT4mcnjlo3avJYm/3lr
	 FLJJJeTPbmAzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D3074C53BBF; Sat, 11 Apr 2026 18:12:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sat, 11 Apr 2026 18:12:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221065-215701-yqgbWnHdBQ@https.bugzilla.kernel.org/>
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

george.stafilidis@proton.me changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |george.stafilidis@proton.me

--- Comment #58 from george.stafilidis@proton.me ---
This also happens on my Lenovo IdeaPad 3 15ALC6 but all I did was change a =
file
from 1 to 0 and then back to 1 again with a text editor and now I don't see=
 the
error anymore on my logs and preserver battery mode shows up on my settings=
. (I
don't remember the file I opened I am on Fedora Workstation and Preverse
battery mode did not show up on 6.19xxx kernels until I made this change.)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
