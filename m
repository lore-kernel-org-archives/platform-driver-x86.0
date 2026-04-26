Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C7ABA34
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 18:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777229431; cv=none; b=XzDXIwozU/lXmZSi08GGO/FV/4VHqnia37xeJfgU15Sb5m8gpfN66WjMqabU885XMlBEdWmEy84NuBMxbLK8Q7TdL681xiFIMqU+duA/Pnpy32sHEAomZZ80ion6Ha9dseBY8aNgM4U9lhefeuTRWhvoYH2V91JKHTqahU2AGoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777229431; c=relaxed/simple;
	bh=PunlfBOT3nnqdeumzB+KgJly9gOCcYSCzjmzTyob6OE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=clo56g3i/d1lsK3XtRlKbUlX413fpBbPazy2gTJzT/IhSjyD+7ovcGouImJuD4Leq1hGC9avw8ig8vzqzTcURNAqL0VxSXvYGw+CAICq7Fx8/blYsan5vORQJ7b9lNiEQ7T3POgGf5YwuJzaZ78N9itMRqOUAKaoN3J8BMgwVgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4sPzLgq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4sPzLgq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3EFA3C2BCAF
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 18:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777229431;
	bh=PunlfBOT3nnqdeumzB+KgJly9gOCcYSCzjmzTyob6OE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U4sPzLgqH19baiMdG2cdPNEfTZJqzE9LuDRGtE3o2CfNUuPhqVPRJ2Uxga5RCV8Ys
	 oBvo/xiQ3t5RptYu+27ajKFY9b9xpYBTktnjWqu3wTNAozrk6Ss2j9qY3gC+f44x4f
	 5n5ccZNTDQjfgUjSENAP6T2uOQtScvbFMFDLK2CRFjuetDO1RCbtYKJGh7AdcE0h8H
	 CHdOn1KzlBGipLLSuRaaEowgP2BXmwfVg1qYq21f/C+Qb3KOMHOc/F1rQhqf3q2fwH
	 vtPg61cWtNlI+60OCOtSj/QzzZjW1pzjmWGEpTsHl5M/OGm668j5vE9eJeotp05lAB
	 oSWuGEOZfE6xA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3930BC41614; Sun, 26 Apr 2026 18:50:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sun, 26 Apr 2026 18:50:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-y9wWhdVdh6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #64 from Rong Zhang (i@rong.moe) ---
(In reply to boite.pour.spam from comment #63)
> What changed with version 6.19 that made this errors pops out? I don't
> remember seeing this with 6.18.

v6.19 added a check against insane values. See also
https://bugzilla.kernel.org/show_bug.cgi?id=3D221065#c14 for how the insane=
 value
is produced.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
