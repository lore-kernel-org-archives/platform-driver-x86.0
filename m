Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E41F29A1
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 04:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757565161; cv=none; b=FyEHdPrCABi4m9gec7Zgbuaos7xApmeJkJZW4ZPkorJPXS2fMKqsJJm20QnYF/sw10/YtWyvt1JrcQF8GW50fOMST2DJcNyIvIqbwuWKq1+km5Dn+h/QIYhp3AY3ql8y67RaAk2UA3srHDVfjIdOrzwXsplIizPiYd1cMkjt8Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757565161; c=relaxed/simple;
	bh=HvbeGbW+1lk2L6RsTNrTZY9BDdScxVWc+tDNwKBQvC0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pbVB98yqzADy+fDJiyIIDD8TUHdHMKDYwyqkc/HAE6sHHYYYYkmc3FAtLHkzC2ntyAm5j8LDUYPcmICc7VV7EgV88NqkcBjgSrUZgoqD6Ofvd8mrLxtzxFwwhR5UempgXWKnVTTA9111PvxEqdWNfO4eCKngAooccyvo+c5qvU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZGy0lCW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZGy0lCW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 914D6C4CEFB
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 04:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757565160;
	bh=HvbeGbW+1lk2L6RsTNrTZY9BDdScxVWc+tDNwKBQvC0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EZGy0lCW4oa7u9zzsiJ1v/vVHRi2I6edICfiSaMoh37UFhLzPYb1sYXJjOm57oZNm
	 zgMjjAeVuTVD+a65T/wT9O4rzcMVys2llVFhSSKCi1vICQg5BklWgTs7b1Dgm1EgJX
	 zCy34i68FNkHwgD3O2p1SQUBov6vj5ZEGkol67p0SHcp5ACdm7zF7gYUW6vn1vHHmd
	 /anqqHTckiI3TehH0HggcSxYLnTKVB33QGbq1MtUkT8Hdc6Tmqvb4v5VSzM4eBvsj8
	 SYsDVQBTo1BTXt6wb5gZ6T1pUpeG8y4mVXHBQS0GmdLD9wz1dkTAv86AjUnvS4adlc
	 r4ESdzmCIsIcQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 86A0FC4160E; Thu, 11 Sep 2025 04:32:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 11 Sep 2025 04:32:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: petar.vidosavljevic@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218305-215701-ql1IC8QYwQ@https.bugzilla.kernel.org/>
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

--- Comment #107 from Petar Vidosavljevic (petar.vidosavljevic@gmail.com) -=
--
Created attachment 308659
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308659&action=3Dedit
petar_amd-s2idle-report-2025-09-10

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
