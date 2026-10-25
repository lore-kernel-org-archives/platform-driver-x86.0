Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792933799;
	b=tBjU9uE100+WK2p7iXStmKvGBCTxiXei1lSdZjwxG/Asq8wZ2Hg/m68rpxWtIsyqQyCP
	 A8emtAdLZguIYUAUQ8RlkhK7ip9Bbs77vwM5PhOilJ6JgL+/mmyAJoBZwuKQOom/emy5O
	 eKR3kUf44sErmQZwenirSiCy8+rNL7zl+hwewNprMDAAsggrSJqdDQ/5GNJkxE/w6VLf9
	 VEok5Gwsz7TQihWROf4X6lgyDPJHaz301ZirhmXG5HaEFw6pO1bbxoO2Z/z/gsyEVS/Nx
	 ZdIrPBfnwzD8OUgxCWzRiCX90DmpVhBbdlUTEjpOtZ6ocIvuiRX95sZawfGdEnMuWQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792933799;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=sgsa1oF1MNWMxN4GKTTIjOKiHQN9NsrweZOfWpeMAgw=;
	b=w6OeqMGuwLyDSVDnDrJZc4xqht48MI90X+a/NSmaWfueatW1u3eVMBQo4F9whkLxTJtI
	 eSt4BQ7HpmZgsES2gm4+hdGXalo6umgjqDgHtGJRqz6Oz2x5h/z4QJyxSm1If/xconMa5
	 xWcZ+woLQMhdBLOa7zYv9MS/xVD7wJd8OzacsqZlhxZQZ6cTa7fWmIwoV9JUZ2BazBgvj
	 mIB3L6jLmzx34OrjWbmDMAbeul8wxfqT5NVOw226NXkJTBWNN4eKjSWEkvoikkwduNCSC
	 nPH7NsGM/6GPMZ4OahH+OFJf8N08PKDabrdtZkA2c6tq9HJPgqXjzBUSzq2vGJmhDXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b="Kt/obrtk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A880606A31A
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Sun, 25 Oct 2026 13:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kt/obrtk
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FE36513C0
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 13:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792933799; cv=none; b=FTQUWt8yI8YU7XI7zSMn0g6ueHps3KxeWrf5RZmfjCklwp/JbCjICxFZuS8ZsTGCeQIiC3HaUkIcNVCDoWHE2zKIgnwrluF0OeZKWHk8EMh6HqvFud9j6apEfaxkwVEJfxKEv623Gx/+PPa0vkErQw6SkATpqYtHC7GYpPT76yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792933799; c=relaxed/simple;
	bh=K6xjA/pRI/cY+yoKVaFmoWMf7eWwIhFrcmosq+WcvqY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WVsFDWfdOAjYljEEhi4aAUZqiR9ZNa1nVAH9AUfGSb4yKLqLyYsjX5rfoHPwZ3kSnZmE1qi9W1viIhNHJvw337sXTZ1xwQaeHLAjbSe157BwyIiOX64dr2//y/aSEmmE/Y9w70IDKhiw8cQOhK1b57XgCYcqjboI1ONSexgC+Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kt/obrtk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD62DC2BCFA
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 13:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792933798;
	bh=K6xjA/pRI/cY+yoKVaFmoWMf7eWwIhFrcmosq+WcvqY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Kt/obrtkUqMe2xOyDWsxedc5uBKcIed3SPUg5LNWN69PEpiU65wByqhcZEK/MsFaI
	 rAhbjq06LDQw8N6PHO6xdvV6LiDVPmhEV52NworGZOItkBqS/PZ31kMftrB3i2TaYZ
	 ha8EKxswrRFQfoNDLUq5NtdaAHTVXSh298W7LAY8R6ara6k8dFbKQL0eGaK2LW0i75
	 bSiQ7hQrhsYzlOJpRNDe7Wn/OwsHMa9CjP4RbrtDzizJHwfBrBa2Y+TiXF8CuODp4V
	 s40w4znAdQ6mnbKhw7HQ+Os+8TZXYVrZfWBHSiZRFgfGOgar7nDnmShzSFwZYxXotf
	 ucT1/yrdlIwQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B57C9C41613; Sun, 25 Oct 2026 13:09:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Sun, 25 Oct 2026 13:09:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: helian.caumeil@clever.cloud
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_regression
Message-ID: <bug-222161-215701-fj2FQNosL2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222161-215701@https.bugzilla.kernel.org/>
References: <bug-222161-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222161

helian.caumeil@clever.cloud changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
