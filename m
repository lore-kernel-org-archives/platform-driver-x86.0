Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C95A392821
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787391508; cv=none; b=cvXimW20DGAu+/Y4CvufEIH+UuiNDergrWC9DNlPZtBxvwrAC3998WVGUlJq38JX0Gt0iZ0CJp06eLYmM1wV0sm/iJX3zlLKaF6OtvibznUMzB9zjMaKiLrCFS6AhLtPLRoWA0FFLW0sGVChWYlA9nwI6oAkbNZn9lfSn5x1SME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787391508; c=relaxed/simple;
	bh=X1f67GZYAHrDfSyI9i5wBsPMIUq+qeDT25R4vyxDTig=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B7EOWjVmTdWvyjHD8s1xGPX/mr3+ot0ms4cmsoLFxt2CRR5cMJr7zvsXIW5z1vyZfC3STNbiWvkWfHomOJ6PfqLhokqwLXw4JAzUGKp8S0HCvpxIWuKVqo37jszVCf5ckrOS/tGUUmJK8prGiIkQMZ2Dc6M3GAyeULBfVXe5H1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndgmHk4r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndgmHk4r"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFFB1C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 09:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787391507;
	bh=X1f67GZYAHrDfSyI9i5wBsPMIUq+qeDT25R4vyxDTig=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ndgmHk4rbBRmi1tminkPkWb+RrA4NBMeV8Gz0ggWJEdwpokSRYHpNo00zVk6n126z
	 QiBuqD7weTdcMw4bH5SbWdZfVQHSydX+rDNUeOzpqNqT5vSdf4J+FsQec+DxKEuyeh
	 lcICXpYQn5IGnPaySN/l+70K7WyLbekb2zRW7oLLdgZ8V2sV/4JIImdNkGG+0REr++
	 dE5SH3X33kATcB6/Ygv1/u4akFq0MUFUbLEfHrSZsjIvb4emwZWUojAep/IdwgKt6Y
	 /7pQSMLQaVhv9FNr2fSteU3KVnHbnv5QpVNt9AL8vB30J8UqIu81D6k95VHJoOwNtl
	 m+3IrWEdKmCCA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A027DC433E1; Sat, 22 Aug 2026 09:38:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221907] Acer Nitro AN515-58: internal display backlight cannot
 be controlled (WMBF/WQ00 firmware bug)
Date: Sat, 22 Aug 2026 09:38:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathena161@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221907-215701-U5EjC3EJyX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221907-215701@https.bugzilla.kernel.org/>
References: <bug-221907-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221907

--- Comment #3 from aich (mathena161@gmail.com) ---
Created attachment 310713
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310713&action=3Dedit
acpidump text output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
