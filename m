Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11CE330B2B
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 21:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770759806; cv=none; b=Uyjm6fXTamVUEd0uKZFCL/HndeOWWekBMtbmWEnGVpPyioa2QlUeMbtYtZff/p6H8Mr7L3hoZZLfAuk2SkmM6vZGKyc+qGW2+0Qw0dyCuyUKIPdea57QMZ8XFDlensCrr16ak3XRmdjTpnNLmbYd5pScHplkcyHqar1E8X1KkGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770759806; c=relaxed/simple;
	bh=VkurPBmkhjW98W48kH+rzVzbSttPthissffWy5yLcS0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ssERsSii1yQQPiGLPNPPXU8EHgxcx+QDjyuTiVP2iRdoYt0Mh/dtDCVu9AaN9ajvZy/pm8TjhZlCoNVffP1fH7QYFkslk9Q1yNSy59YNCHNo8HVO/gtcNCOxOxJ2+kjNdp+sw1/bEpEoYwKLaR/fc1quE0i63IM7zKqi5rGyNoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJzNZDov; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJzNZDov"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D341C116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 21:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770759806;
	bh=VkurPBmkhjW98W48kH+rzVzbSttPthissffWy5yLcS0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MJzNZDovL+QxKlx0lkAA510l0j+SybEdy6SLb/kI7pPkvD37LOFMZkUwX1Iaism5u
	 V5QxfHkxyhhT2DHKRwKyN5xeyJUnhW6l8WjkRZDQBFB+TsbkpHmIZzNAS6TF6kuFGu
	 NMt5IqB1FJ0Rp3T8wAaVJ/D94Fjm0cYpgz+NS2ByBgo565S/Iig6bWbeR0QD8//1K3
	 /Auwp1ecQPbyp34UonJrwdfxUR9in9cwtPzWc11yuzRlhhVRARyy4yAs25ujBSNWpX
	 EgFL/33/x/mSNTnypxvzdFBvlwOL2CYVGpsM+gLX9i4sYyrRBxtFCcMYzqeIADwZnD
	 oSwKbgKLky24w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 64B03C433E1; Tue, 10 Feb 2026 21:43:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 21:43:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-jvblsobPVs@https.bugzilla.kernel.org/>
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

--- Comment #20 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to Armin Wolf from comment #17)
> Also, can you read your current battery status successfully?

Yes, battery and charger reporting works just fine, other than it sometimes
taking a little longer to detect a change in charger state.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
