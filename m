Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0352A1BA
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 16:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757952994; cv=none; b=HepYevrSrm7b4RnJHQh6gGxp3vjEe5TjLItyvPjKF7h+VqaY7uvrEHwRAJStqp6kcIv9eR76moObwlGXH71WDLOhwJ8Nci8R0065UoA2+0NhG7QlRELNlmjgpsJ3TOV9gki5vjJ4ojugZ9POc9M9N6DVDYdfCyfnecrSTM2rE+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757952994; c=relaxed/simple;
	bh=VhJa2w8iiBPPVzkrYZa1CI6h8scvtFEqPJLSbI4NeD8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FIBEYEXhPdRZ7i1yTe2KS50ZLcW2RG3lX38ogTlKlpZfMY6TsZfOcEXg8aaCMvtjLtcOb1CqEVgR/GjnF2tKgYeMe/0MymBPUAnSkGcL3uJktRMGm6tr8dX/kYnUx2Wt/AtZuWE5G7XcjY6OvsAj//buavtecxL+F+a+1jKNOvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGSYWTaN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGSYWTaN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67656C4CEFE
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757952993;
	bh=VhJa2w8iiBPPVzkrYZa1CI6h8scvtFEqPJLSbI4NeD8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jGSYWTaNoUU9FZrMRdog15wmEvAWUA9Hmb08a00bK+xS37w6cLh5gPYZZveiUpSCP
	 wRoCNdZNeHnmoLV/2BThPs+/n5xTZMNiVcbvRR0xHb1fgsDiWRf9rvLV3znDxorK7n
	 yej05JWGnvFIes3zpAMSpSi753SjxCtr4oXAgD6OfkYgkX9oGCNsD7wwqz1g9P7s1t
	 hgS82WB4F+qBPvrJM2ZhSI/lLZLP93wHdgJYeSl986XgbT2/xdfJqMLQ0OuUj8fe1z
	 XKCAPGGQ79uHm28152Thk/25TTVVSSK+o6sW4r22As+DDgLRQK4DiU/9LWgXYvxSub
	 C4jEmfFV9REBA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 600B1C433E1; Mon, 15 Sep 2025 16:16:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 15 Sep 2025 16:16:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-e6SpuQXZyr@https.bugzilla.kernel.org/>
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

--- Comment #122 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Mario Limonciello (AMD) from comment #121)
> * Adding a delay for all hardware is another possibility.=20=20
> This seems relatively unfair to other hardware not affected by this issue.

What kind of delay are we talking about?

If it's under three seconds, I doubt anyone would notice.

Perhaps AMD could really push for a certification program for the EC. It ma=
kes
no sense that you, an AMD engineer, have to struggle with your own hardware.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
