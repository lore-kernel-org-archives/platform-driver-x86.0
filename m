Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2F81E869
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Feb 2024 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707230064; cv=none; b=hz2GyUkcFCVsHEMBZAr1h6rOgnZhq9pa9Ky0H8E3WNv2PgxnC9NJ97mJQRuD1JqudZvyhgFAxBHwKtdVCIN0CeARwKHPCJvZGGIcO8iPl9xjaWehmCuaaAzVEiBsFbWyjF5WIIhOENcPD265fbsUP1zBoznr0fy4jzpyONEOMCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707230064; c=relaxed/simple;
	bh=UTCc/Iss3ZtkewqaVuWosc9JbqBV0bFoe+rrQmUlyq8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gbVWmfzgTqH765bY/tRt7dI9c5+k/nIjtUY4f5o0vZs6ExqVYBhFz+SV23FJJfw4xvtkz/TnO9G1nZwm8NWdbqEt8DFBY7eTyamNULXfseYZQIEYAnZ+ZZdZpjJC2+J2AypIqqTz3BBzW+IU27G6VMAb52lJM+BAaZCit9GKGj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sp0MiXu8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sp0MiXu8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30FF8C433C7
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Feb 2024 14:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707230064;
	bh=UTCc/Iss3ZtkewqaVuWosc9JbqBV0bFoe+rrQmUlyq8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sp0MiXu8+vwaQRQZNiHH5rtna5zTTzUPpZ6KK5GS6I/mPtxx3vdgPJ5GUrMC/FxRQ
	 lpDg3QUsx22H45EGeZRcXhuWU1URdDz7YMhRYirTS5nvnf1WfFZ44Bghd/s24s95at
	 f+ZDxSzZLhCM1ukMokqvRi22LQflaMD8rNwuq6pO/4YO5fmQPXCIlBl4D4idNUJvOH
	 7JKiYe2qlu2SZ/la1eAQLpwGjfh4sGLY8sV2oOGay4c9AjW6So08TDEN2iJObSA5VQ
	 ijGb7YTXC5ThG6iBq4QvZi4j9kc9cQSKhc8veqZXIZy4X0A6hDQ7CgTgPDdWUbzruI
	 BykqG4TAuNpow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 17C01C53BD0; Tue,  6 Feb 2024 14:34:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 216176] ideapad-laptop doesn't expose rapid charge
Date: Tue, 06 Feb 2024 14:34:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: amirkh20@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216176-215701-VbvD3giJI6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216176-215701@https.bugzilla.kernel.org/>
References: <bug-216176-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216176

Amir Khayatzadeh (amirkh20@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |amirkh20@protonmail.com

--- Comment #10 from Amir Khayatzadeh (amirkh20@protonmail.com) ---
Any news on this? please if you can do anything let us know. thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
