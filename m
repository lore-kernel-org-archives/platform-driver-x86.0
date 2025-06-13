Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A338A9444
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 15:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826989; cv=none; b=BMZlLiPXDFfGMPb6rHBdFGjq0ChHdiSF3VgSfIGgEo2TSfaxdqHrvFMxVXMQaV6A9kUh/WU+CITCN3XQAQc6+DPLDBmbxZ79AktpUZSH1dhezQtDH13XQ4Lia99BNzV70SGeU4Iv4k1ls/57r2/1CzeHWvXOib/qtqmdCyui+1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826989; c=relaxed/simple;
	bh=IyHxSsjVykf4q41913H/BBuTm+XEAX1ScQQJrVJBQl4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NtC6QWxM48Gl5wtHRM2Z9lNpKM6lUCP8G8KRe/km3+2j3p3HGYDM+RUlQ3NEf6hy1clMOTHx85Lstb/s0/rIQOT1X+bkV8fmipQaO/pGbXOwND/cQGzdCZwPeWUz0/O9wgHOp43ul4DpSBC21rOsKTEcw/QnUfKAv68uBH6BVZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXa3V9lb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXa3V9lb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41327C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 15:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749826989;
	bh=IyHxSsjVykf4q41913H/BBuTm+XEAX1ScQQJrVJBQl4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XXa3V9lb+ShbOtkgk/BGb30N4qPAKIjKnRh6ak34QdlyezaPSjQbHXLqNE08fBqiL
	 nGfjMkHkUMGswRMi8oMGLw7RLwof6Aag1MOs/1ikq6SC9yRQHUHXVZCMdNGg5Q6rqD
	 WJorsYLXb8lx7Dn1o3Ok6DoFkDF8+tL26KcMrN89LYcouXx8xLOlWupjPMj3KSXPzX
	 WUEbs4779UWeMsOJrCxmYbJDT030HxEBOFClQOHGs44fBfM7siepsw1el7h/H/7cGs
	 X6QCyvqp9BzKpUFKXukWk0kBMexcz2cBpl1pQSPw+JRyqftBQmIJo3oEtHukroopDY
	 BiD7Xj6H6y8NQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 35884C41614; Fri, 13 Jun 2025 15:03:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 15:03:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: g.molinaro@linuxmail.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220224-215701-xoPmASkSht@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #20 from g.molinaro@linuxmail.org ---
And yes, downstream is patching that module.
https://github.com/CachyOS/linux-cachyos/issues/483#issuecomment-2970669001

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
