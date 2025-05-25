Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF96B2F2D
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 May 2025 20:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748204644; cv=none; b=fQi5tiWlth6n7cBrbrbxoypLWraovi42XGZlJhoF71Jhb0astwJi6Ua7Y6CK7r8r7jL3pGOK7B5IUIW2JMgVTJPcJ/chTFQSvLndbdnlSAFHYgXOlAwp5luxZfBA+zfwjeLkIQZaea6rugPBnzrAtkdDzgUMdcdc49p3ys0LOVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748204644; c=relaxed/simple;
	bh=/J8H6ogedCIDBGTfdNyAFUvKvFXa5OGn2H8ReEhsGyU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iKu6icnv6rGY6383XWHBhOYzv9wuy6lO+KyP1uDYw7/je1v/u7TdgLIY/PpxrWQFgYK99IkUKbE9BEAC6tZ3xcL1SavBhV11BFk72ZtY7DrcEnmo9v2LBjA+zOg427DZVPBR/34b6puHa8YTAAvUFH0xtIw2BwZO0eFv+hsyyto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHBiPy9I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHBiPy9I"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D6B9C4CEEA
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 May 2025 20:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748204642;
	bh=/J8H6ogedCIDBGTfdNyAFUvKvFXa5OGn2H8ReEhsGyU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JHBiPy9IdUZOvqORFb8WoHY1O2K6W0aK8YpebHGiHkczS0oW3IYLgYP2BOQuQeU7t
	 rAifsgGKSrldecKgWbmY4f6cFGmjp0vAvL74FJL+V5f6U31UR8RvMuWkFo97HbwB4i
	 89jnnrqqy2S+SATTnd3CSJFvq/31A7COrzcchpUIb42z4QQqNkImtJnjiLVQ9d2oi7
	 zpTdhvGQtYhFuDIwnWNB4BtzZyJnlTK2bAeW/UV1CI4Hbodp3PxqC5+Vb2ptN0Ulwl
	 1LqI+O/5BNNyDBg+uaXMh6IF+71dMNS8ztD3rDhnDsyJYLdlUqrPWCUD3bEdvOnmwd
	 JXWaFaxz9BVCA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D2295C433E1; Sun, 25 May 2025 20:24:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218771] Lenovo Thinkbook - turning off after closing lid or
 (dis)connecting charger
Date: Sun, 25 May 2025 20:24:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218771-215701-iYFk7XZR9R@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218771-215701@https.bugzilla.kernel.org/>
References: <bug-218771-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218771

Rong Zhang (i@rong.moe) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |i@rong.moe

--- Comment #10 from Rong Zhang (i@rong.moe) ---
Hi all,

I've sent a patch to fix the issue, see
https://lore.kernel.org/all/20250525201833.37939-1-i@rong.moe/

If this fixes your issue, you may reply there with your Tested-by:.

Thanks,
Rong

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
