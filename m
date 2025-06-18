Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36F61FBCAD
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 17:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267959; cv=none; b=C/u7TsN3GL5UwgtV0fUqca8XOIw149Pvpr2fiB+p0oFE+PkU6W7DBodDWoYChsrmQcsVsMgshWWyNAb5pKMh7hueOwBGOoLpO80j3HDCioI1N6MK85ASmOqWk++UyF7a/m29P60BBVZOfe1lyULtxEODhLEMxurWXbBOLIYhwqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267959; c=relaxed/simple;
	bh=H4glMASaOaNh1iNpQrrTy2RAiENEpfWBJEweDu0VF3E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tBa0T2hZrVtlLQFAtbezQbfJ0z18g2CBhYx0PAbytsFeBh7gCDcjdAbtNEcicnTW6jn2ZHtCzDBhFEH1oGS47XGOJYQ1xbE6oIrdNwz7GOQELDAXQ49Il15s4H3/FTRqyj86mg/Tta9NE3oSmx+i9IXwRCreLgcdCHhjlSJuxDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjmrheRe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjmrheRe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 722CEC4CEF0
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 17:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750267959;
	bh=H4glMASaOaNh1iNpQrrTy2RAiENEpfWBJEweDu0VF3E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AjmrheRegtp4msXm9lqXX3jKV0RHwbXlWNiQN2iaLGLD+rsS8DuL+iKEURbGMXCzJ
	 UaAU+p+MhfkJhl3HxfzQD3XYDO0qbwwwwpLEPukfb0zDKCI1U/sv2AvhWKNDqnzyKH
	 JDi5Mt8pOPyWte1/CpErnJEzBDqe0IXlHUpFOafFtryetGz8Cpc1NnsB4BI6w7qhR5
	 YlJyxPDON0hBUb/nMUFbrKaQjkBh0PcdY1heQ1bSNDBrC9tMId/2QnUh4Mvuvo/idO
	 BgjZWUUiRdiyujKg4d3dLBPn8tRU9LfED4CRoX/bENjiLIzlaGvkHNsDxBDloamtJ9
	 FDK0308P+KH5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6AE8FC41616; Wed, 18 Jun 2025 17:32:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Wed, 18 Jun 2025 17:32:39 +0000
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
Message-ID: <bug-220224-215701-9lz712JXSO@https.bugzilla.kernel.org/>
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

--- Comment #23 from g.molinaro@linuxmail.org ---
So, I've been trying a kernel with this
https://lore.kernel.org/linux-input/57eb65bc-f710-4c86-ad0e-7473cc6db135@am=
d.com/
(provided by downstream) for a few hours and it works.
I suspect this can be closed.

Thank you and keep up the good work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
