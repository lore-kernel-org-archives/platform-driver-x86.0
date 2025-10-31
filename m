Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F89F1E9919
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Oct 2025 11:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761908576; cv=none; b=CkWmULkkWaBZsU40dfmkKmyZRlXT+ifheeERUb4Lkkhl/KNwJcuREb7+eUlZ+eNxYR5vPPPN1QKpS2dWoDyDVrESb98sLkcDSbz1TF0+ZzVfwaC82nQCSknFN1NnTWGMIzbBWFm8kPFaFgGemhSusMDcyFu5K4/XV0BShslgyOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761908576; c=relaxed/simple;
	bh=IoTIgrnhaWveQ7ZF7z60Basb/+JfuQ10Y575Q+4+bAE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hrpyQqH7QV+9VSVi7+MHsyC7Mcq8JqFL43y2JPtTREePqjOOZ1IVjMgUMDcHvWU2aWu8iFS78lsIIrTOr2+oiano3d6PiDCifOtGXKHK2FnvvqHHDqUY8ijbHDZUZeipzOAgUxMQ+AkTWa4Lm4h7+tVnjZiFJDoP39sy0ZkdVXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGZVqAxL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGZVqAxL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08D03C4CEF8
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Oct 2025 11:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761908576;
	bh=IoTIgrnhaWveQ7ZF7z60Basb/+JfuQ10Y575Q+4+bAE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aGZVqAxLw7+ljNoXkVcOh02l6k6Ope/qELvYbkr2wJfBNCOycePNwAraNLJFd5/Il
	 Ji4v04XeSLvUJPXSdCuHpVFoik2nk3WTECQ8JYCq/3xwhJs1bOSsxzDDXcgrWjy6+P
	 rTd+1e7/qnj3anYv2DkyhmrKpHTE3CPm2cmZU9oHMROrtNMQ64OquINUVY4zOg24Bk
	 6SEEMNUI8xMaBORp1rbC17aoGOmBtlWBa36gnkQMUBjbbUmdY1uiyPHYuPh7ixGgyr
	 ldkZxN7cjNnKsBskN58WJDGPcg6V/Ykm5s8wI7Xx7jbLGGGfVxrURMdLCEZOHMzplo
	 echvCqGFBg8Pg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 02FAFC433E1; Fri, 31 Oct 2025 11:02:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Fri, 31 Oct 2025 11:02:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andretiagob@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220722-215701-HDvPK8ChOp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220722-215701@https.bugzilla.kernel.org/>
References: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

Andr=C3=A9 Barata (andretiagob@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
