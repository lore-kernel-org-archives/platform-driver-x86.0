Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B013A3E74
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 09:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123948; cv=none; b=rdaPCct3dH6633GEbflLCkOh+g6cIKnNhoL0Qk31gjt/04KFDD9k4WDVtGuJS7siLdSMEQnvH8IveY7yL6+kgFwaNyh3fqro76hvKyEAf9zpcyjOqu2TFOp0R4PhGz1u0MPNbSNW/Nx7vsLPSQT5uYWLpSGphQPcCrkp+v/6G20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123948; c=relaxed/simple;
	bh=pTPYvpMDauejvyjKNPR1ptgoZO8sri1WJIXPtMOvY1Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HOtXiWegkuJ02+M9/4JZD/tB1y1GnBtypWr03rtsim09WV9I/AQ6PoJ4LIuIf8C2a2dXXRP1vzJRqRglEAdA5tdvHHiwjptcSWVg0qOuEZEKE20XiczoRqjcIBjrqbw+y8JUmEDHHzeu5cvVBhYWMivzUExtm0gNWlaW9fMphf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDKPYvLp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDKPYvLp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9796C116C6
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 09:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775123947;
	bh=pTPYvpMDauejvyjKNPR1ptgoZO8sri1WJIXPtMOvY1Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JDKPYvLpuQ37/gZrllqPdrb0KVS0LbAwKKk14rTOCdkWMQfpB5RskLknIo0BRaXFG
	 FqIBHiB9SwMKMiif1RdoQeiQ+Yaco61dyud43aB6o1eLv2ZQ/A6vhMCzpHenqyYub6
	 S3871rPDwxB+TpTLjqM6WPwt/j1Vq38Badpn/Kz/uxm0IcRAFVjcvOQi8SGZ5ndKL5
	 KhZzD/wKRIrVHsLfYV454edwVVmb8qGNjQilKh6xjxalyDI3UPV/f3zVQ/jMDG+scS
	 Hn5/3DDxkplskWgHbSkIERa5Gb8fBmx9ccnjoKhYchPkImJCsZn2KYD9ZvfdAqDLMn
	 RCJ7Gw1Xf8Kbw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E0A9DC433E1; Thu,  2 Apr 2026 09:59:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjEzMTFdIEFTVVMgWmVuYm9vayBTIDE2IFVNNTYwNldB?=
 =?UTF-8?B?IOKAlCBUb3VjaHBhZCAoRUxBTjEwMTApIGJlY29tZXMgdW5yZXNwb25zaXZl?=
 =?UTF-8?B?IGR1ZSB0byBFQyBzdGF0ZSBjb3JydXB0aW9u?=
Date: Thu, 02 Apr 2026 09:59:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david@flyboard.ai
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-221311-215701-yJpMaWsxi0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221311-215701@https.bugzilla.kernel.org/>
References: <bug-221311-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221311

david@flyboard.ai changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.19.8-200.fc43.x86_64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
