Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34C137A3BC
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761839157; cv=none; b=jLeiNEPKPmLCU9dhZRuZvIEuVLCgmxO0PH42fw5U2mDydyfxzib+uZ8vWEctuwkRxCDv+rmvoXJs/NBmaFpowAtM6TjQKfkfzi1FMUvNlSl8Ye62g/dKurad9Di7XVumvDmjn5zBo4QwdO6Q4pf+jYYqfqiF6IEQL2uh1MHO08w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761839157; c=relaxed/simple;
	bh=bLlKnzxFtYU2MbvW6kJW29KE2ka98ZjEWM38mWMU0j4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FYr3+Ae3d2PX64WvD2EX5aiMNgmphO26g0/0+n/JFwbeJlcSJrGcG/Bi0OWDqqYuxoOHbwk6phBI//l2Gc45BAX41ekHe3KWrTYjF1K7S1s71eRgnu6myWJNHxkZ6UvUFGZRyckqE62Ce2Ay+C2+B+SpqPrOehtCP8BVghNStQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFz7cn3M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFz7cn3M"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C822C4CEF8
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761839157;
	bh=bLlKnzxFtYU2MbvW6kJW29KE2ka98ZjEWM38mWMU0j4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oFz7cn3MM4JYH+j7aVDh1WlCmQbrsLbedDf7TF0k601mwhAmqaXH/DXpNMQIhjBU3
	 ED0YWD95hbp26u/xb6z+sZQdrw1iavYRFdFzOG+gTZ2wFk28GMUcIWtVbF2HjL7qwa
	 l1qNFixnf6np+SpgwOSQiLyjl1EHlRgxIQvdDZZsN1qALzmD8+18V0R2YQEdmGjJyW
	 6l4zlYt3xaXgYhhPhVKZUtEUPM1IcYBUNda34KtfIrLToiuxKnGytio77koS4QvpMx
	 BGLrNbHdiJ1wiLy4d5jeSLmWh5IFtv4OVDs9rmyoiSmuVTGL89sNgMoxnWklz3r/Yk
	 QQYa6f+BFSFWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 66310C3279F; Thu, 30 Oct 2025 15:45:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Thu, 30 Oct 2025 15:45:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andretiagob@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220722-215701-hVza43oLE7@https.bugzilla.kernel.org/>
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

--- Comment #6 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #5)
> @Andr=C3=A9:
>=20
> Can you test this patch and see if it helps?

Can you tell me how to use this patch?

Thank you

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
