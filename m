Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6579A5E08B
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 17:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709746684; cv=none; b=tYcYHGu/12+nEIipc14SuLukTnTx6zttQJC9KwEO0inPrex25QOyrDte2nOEigu/M+Q/NMXcjI+4XcIoVOilq1+sH41cXA6UqTaYoY2G6YJG6UNb0Ho0Pe3WBM8IM5oGfR75TITNq2U80TXoo1jMv49AfJhTNZdUg7AFgWNi7rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709746684; c=relaxed/simple;
	bh=XoHqOanKeYNDxj7L59G5YQUSg/YBGTNpNYbXOjswVwA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wd73mV9mVeTQ3Htgi9w423dhf4KR5hnCMcmUeRdWrDtBMZvnnb+JSgI4zUAcgx7uQDAYQMQvGCkC+0szw7EjhLD63m1f+VuAjHa2NCysKsa/K/bDaqR1oftG7rOdIekTxrk99r7T5lZI4z5yNEjsURF7JiucWOvCqQ5yTNT7yN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFBDl36/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFBDl36/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1F2CC433F1
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 17:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709746683;
	bh=XoHqOanKeYNDxj7L59G5YQUSg/YBGTNpNYbXOjswVwA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VFBDl36/0U55tYvxj+wbsex4ECWCaDPyprc1N15pAiv53fFAGDfTyDZD/ojS8JBva
	 wbDax6dDcFaIo1seBUWdqrbKVJOdP0c3zmvFjc88y74fJlHmgekKGxYgkG+JJUSe8b
	 syMrAk46U55xvYMgJiW9KC/uW+emYTjZaZ9HwqYVpAGwF/9Q8uGLkId6ZUdrk3Nchc
	 L0TAcCujtL/97CDff6YkDP0aUCeUPLUsvyZihPjbqg3HdkE/M0NUyKUzuTov+B31WU
	 bVuxBZ2i7vUSJPviWK9cwTNrJDjKdOqyx+xHRE7jrgO2aJ6mLUawberTdgIzDJpn94
	 m5wR3dPV503jw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B2F70C4332E; Wed,  6 Mar 2024 17:38:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 06 Mar 2024 17:38:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-WoLGNoOM7Q@https.bugzilla.kernel.org/>
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

--- Comment #31 from Artem S. Tashkinov (aros@gmx.com) ---
1)

current_power_limits=20
spl:51000 fppt:51000 sppt:41000 sppt_apu_only:41001 stt_min:25000 stt[APU]:0
stt[HS2]: 0

2)

cat current_power_limits=20
spl:51000 fppt:51000 sppt:41000 sppt_apu_only:41000 stt_min:25000 stt[APU]:0
stt[HS2]: 0


3-4-5) done

6) cat current_power_limits=20
spl:51000 fppt:51000 sppt:41000 sppt_apu_only:41000 stt_min:25000 stt[APU]:0
stt[HS2]: 0


7) cat current_power_limits=20
spl:51000 fppt:51000 sppt:41000 sppt_apu_only:41000 stt_min:25000 stt[APU]:0
stt[HS2]: 0

While we have been discussing this, I've just found out that when this bug
occurs, all I need to do is to unplug and that fixes everything.

It's actually such a simple workaround, I will leave it up to you whether
anything needs to be done to address it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
