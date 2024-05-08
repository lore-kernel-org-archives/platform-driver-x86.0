Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7C436AF3
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 May 2024 07:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715153995; cv=none; b=cwa3oQJo8IeTy7TKgjjaiMqVWQC6pJwjycb51GFGRrcw6Wci/Ce75RUQv4g967H48nw4pMcqfeOpfVG358nRLqkVlb6Hitx5NXtTLOnqS+dtuot95K5LWQyNfm4pRK0UAG3QU4cIhhg0zPbKI/ucqM+1FnAxS5haZtKdv5vat1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715153995; c=relaxed/simple;
	bh=U3nZmobWEuj9qKROb9ph29MWZtd+9ogKjdEhCafR8vI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LJFfvWYezVp2rfqKtEX6pWb0XXLh0vZrasxmJ/438gMLCS6rhypd44BgNdwMtsZ2dUqw36FZP9ve0Q1G+HEp5GzR8A4xg2+JdxNF3MdLo/e8xkDrdqXjyY9YuZkZKMBHi11sSujLFpFlWA+MTbA3HAKBey9A/QuMldID+FREwok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1bW+bTg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1bW+bTg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3F14C4DDE0
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 May 2024 07:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715153994;
	bh=U3nZmobWEuj9qKROb9ph29MWZtd+9ogKjdEhCafR8vI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O1bW+bTgAhl107VoqszdIlSkaIz+1xinXB9+C7FW/4fW0lIngyB0sWWe+fd/5eU1V
	 5hXJH75YDlTE983exxleDHplQ+dJuAMCytUqvGn484ZwwSvHJyX3ddibgX+P13AjBb
	 vcQ707gAPxdtDGZv4hG6bOz5ZgEDwi4CTHWVYRoTV5mUuHE96bDKuWkE90FdFSXrp6
	 Tt6N+ZkN+kvJ6VEi9VFgltqPjrLF3qzZowOx+UZY6ostDmgbUfEzd847QanjjejHKi
	 Ef6P1gANGGFwJuRSxAjsYznFXUKBAP3p9g0CEHdxJpe2yNW2ASzcWncfxcYU9XL+i2
	 /nsTfqO7rLpwQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A5C00C53B6C; Wed,  8 May 2024 07:39:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 08 May 2024 07:39:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: vanoverloopdaan@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-u4vISKUnGu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #61 from Daan Vanoverloop (vanoverloopdaan@gmail.com) ---
I was able to reproduce the issue consistently at work with the USB power
adapter that was included with the laptop, with or without a display and USB
devices plugged in. I was not able to reproduce the issue with a different =
USB
power adapter at home.

These are the smn values I found:

1) at bootup: 0x017f1201
2) after reproducing the issue: 0x017f1201
3) after doing the workaround (unplugging the power adapter): 0x017f1221

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
