Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF781448E1
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 18:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709748375; cv=none; b=CUMDtF7Quk2al2v73GG2KLM1qNVcD8ER76P+UCePwvUl/9KXgiY81Dt/wc305FF+TUM+rZxGq9O08bXynK8Ju5F7yB2LUJz13Lm9K1S5qsjHv9lU9rUeI+0X4Vbwx40NTFuPsLsonifWOL14PEMS1PaOmKJAN2MNECiiufICSl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709748375; c=relaxed/simple;
	bh=yTLBa690CDSuh29O/EdA3oqmnr0Q9c7rtY8xsgBCXuk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LR8kHoLG6w53fNA1HO5qxgMfT8yd3VmmBlU03kmnwhs6Fe6r4pj4xCZQc2q2aVoMwFj1mRzl5SrE5llXXlKTD0iyEa3iQzk9AB+SZstzzpgWj093jXKXza3RYgRthDV2160rw3Hajp0A9W1HtcNg/lXWyzCsWnfLTz7weaQ8Cy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOKFO64b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOKFO64b"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57062C433C7
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 18:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709748375;
	bh=yTLBa690CDSuh29O/EdA3oqmnr0Q9c7rtY8xsgBCXuk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JOKFO64bGx4R7uOesL3WPRz5rhQtL2hmPoy9oPx1oaslFlcKBPtBKaQxRXTgvFCQb
	 ijNTPfxmUe1ZF3+q8jC/R1nCID+3bLJ0YEccmhZAkG4tt16J7T/ZLbO1dfHjDoqtZ8
	 gzFYDjSZNx1mLbmWz9RxvL5kMs5+EeRWepRAOJ/xuzngH9E0GXtNfuP1e+aGUgH7nG
	 nt0pVXWFsQmYkifQ3f6UGDXzSeHCz/Y//SRKn38TsKqHY1jeLAg9FIvpHpcqadTrPW
	 Z5h8gLM1YVJ56fymTCzZf7kP3R6dU2K29aGfCN7ULdg+kjPOrUKkS2tZMPefrrMiPu
	 pvIyjtpM5sJEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3D8B6C4332E; Wed,  6 Mar 2024 18:06:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 06 Mar 2024 18:06:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-LYgglLUcJV@https.bugzilla.kernel.org/>
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

--- Comment #36 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
AMD-PMF can be used differently by different OEMs and models depending upon
their needs and desires.

Some will control entirely by their EC.  Some will rely on PMF to do more
functionality.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
