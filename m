Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AB9194124
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 13:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746105937; cv=none; b=HswzzZQz4P2dD+PzAWO1s1j2xJAzhG40Kn6A1LjwxvCxfajEFgcKkYP201xdcu4IoR/TDDQOxL3iL00lhdOfEuh+coKFE22mKENN3qLIikswzwOFFPJzRPX9sLoKDlCgmLSNVmf/7NjhfRbYah28WEza34Q8ZmfbOgf8PqsipGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746105937; c=relaxed/simple;
	bh=vPJhpcxnbEWgBNaQIN+gB7+fNT37b8GayoeezJExX28=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rr0Qh5TshxCM2zhxKVsOqRzVvyYy+ZkGU0B8jOCWGZ3mK6rW1Z/rmUp1aF058XZ+aWixAiLatDqjEgnBfvSpUK3yUUguzOgShbmna9swCkkjM24ssEkmZ32aA9luCs+wPwW9amt1ZakenNn0f9NwcVrW5rgIKQj+vdxXRsugJTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dicfq4Lu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dicfq4Lu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A965C4CEE3
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 13:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746105936;
	bh=vPJhpcxnbEWgBNaQIN+gB7+fNT37b8GayoeezJExX28=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Dicfq4LuiBoAnigPv72gzTIH1l3FUuEgyC6Ak+TLy8kh8nfGYWai+v+kXKUNFN7TG
	 nZDbjl/+d/kr5Rrcx5wcQef3JhNvRt7YS5hzmiFl4ueI0ZF8eZMVf7ISCakDlTGh3X
	 BEz/KcGwEXwGlpvAfs1jfqvogbP6nCYptqffK3ervRJGjIAy5KEV5Tuf1pcX02XQZp
	 aY4a1LR5iXVv0WEkZC9WK7xuIM08jlT876PHCJqQBMKShxspAZIU4SvpUqt7Hx0G4B
	 zxLmmm7mnuyg8XtyMsD09U60xrsk7IcYMbfsqohnoF8uFmqOrVs4ymBL7Yl/UEWBSa
	 Gl5hV723K5RGg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5E73DC433E1; Thu,  1 May 2025 13:25:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219786] asus-wmi: WLAN is permanently soft-blocked on S5406SA,
 but can still connect to networks
Date: Thu, 01 May 2025 13:25:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel.t8jyh@passmail.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219786-215701-34WQTJMwPC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219786-215701@https.bugzilla.kernel.org/>
References: <bug-219786-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219786

--- Comment #14 from Charlie R (kernel.t8jyh@passmail.net) ---
Thank you for the patch, this is a great improvement.

Providing feedback -

With this patch, the Wi-Fi comes up automatically (great!).

The only quirk I can notice is that when I'm connected to a network, if I
toggle off Wi-Fi, it shows toggled on once again, and I have to toggle it o=
ff
twice to have it remain off. I would expect it would only have to be toggled
off once, but this does not hinder usability.  If I'm not connected to a
network, I can toggle it off once and it toggles off normally.

Toggling Wi-Fi on works as expected.

I am happy to provide additional/debug information if you need it.

Thank you for this patch!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
