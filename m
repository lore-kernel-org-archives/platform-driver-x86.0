Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33EB1EFF9F
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Apr 2025 18:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744311587; cv=none; b=cYiJ6tNs+x1R7mYXmAiXkIAaV6L3x7yxW/p116fkobPP8P6Rwy9tYdlAJq3P1YBD1Tmf5a+P1c6IoMxDmMq+ZegC8S26KVr1vvP34EIO2ItLGUEAZefG25YIyvRYL3uNJO2sWQ+ONtFrEqGgSfX0n5uzu2+ZwrcLc3sRSUUlLD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744311587; c=relaxed/simple;
	bh=KFE6HcVDUsKtIMTq5VP8qHH9rUTzBMMvH3ZU4shdvqg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SmrhcILA+J7D5AXixu+5XVC0ou15yKlfV4okqIkpyB2PfqZfN6QrvclgAHzcFTkzoef7BtrrVSHVQBt04VxhxVylsteT/SzFNym6dH+eK1igPBjPA4auIhuAHTRRHth384uVNsmpeh4TrePzV+r8NhQhT+P7s0+2qUvNrgXu8ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkkiY0fH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkkiY0fH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 495D7C4CEDD
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Apr 2025 18:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744311587;
	bh=KFE6HcVDUsKtIMTq5VP8qHH9rUTzBMMvH3ZU4shdvqg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LkkiY0fHpAtpqSuIFl0ET2RKjosf7Wvp9/fBYlFemTx8gNjCy5/j1zcZuKAGCKq8L
	 PKYznmoYKFzBGk8DA/ssW2ZTulf4hH3lsIFTMwA5niNkuIHGiBLHHQt3xw60RIepSA
	 vN3asHb3q2CXPgKx5ckSJZcvaYip3Isq7zmdu39ev4puUWT/QXIa53MFblYDKoPF36
	 O5HWx98wW9iEt12qT2DPwE6Of2467h8HJJdvuaTJNAB2Gxl+bLAYwsrY3/7JkoEWeE
	 DSBdr9FWRNdHexSntD4raUkHMYBSx3Le/Am2Y1AuFqZEZ50j+jk9GRlSx9u0gcIkn9
	 hU3F1wfMt/b+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 35857C41614; Thu, 10 Apr 2025 18:59:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 10 Apr 2025 18:59:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mail@dmewes.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218305-215701-iD1ceNM1iU@https.bugzilla.kernel.org/>
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

--- Comment #89 from Daniel Mewes (mail@dmewes.com) ---
Created attachment 307953
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307953&action=3Dedit
s2idle_report-on_bat_without_reproduction_steps.txt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
