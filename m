Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BBA3FB07E
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785406130; cv=none; b=Kv0GN5x1C+rCAbLb4REJ54ug+vASq5xgh9ZDKZaPTj/8r0XDvDOjGXlft4Qs17W3bqegmfGIKmhziq8I0KVCgEX0FnfOo7FXJC+K1G+SVpCj5rAHAp/YijTWo5AugQP42sEAH4IUbYw+4okDaB4+0CYBhrPkBs88u8zgTrEV/V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785406130; c=relaxed/simple;
	bh=l10OBvvBBIUFo1aa3l64mgjgZ8J4DM70y/1POWvkWfs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gHmA558BxUK9rIqCVD2zVoqSiuvOr5yg73ycWjyGGxkkXJYqnEo+ILVjJN/L7cxWb9GIfoOMp8jC2Quetiz6VVV4SYVtMk581nuOJ+3ofQkSetgpFn/FdmeFEIFewlWOHk3yQA+D5MTOPEIFjm8Ej61MpaqLUpED9QzAm/3fGgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8cXwrWU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8cXwrWU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F14F9C19425
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785406130;
	bh=l10OBvvBBIUFo1aa3l64mgjgZ8J4DM70y/1POWvkWfs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=f8cXwrWUxxXeqnfMm2FuaKq/FO5+nrnSERKAIPmGkAbzCUlSv+lzO5xNx0G5EFCwm
	 ehQdb+EcXYeOAhAqq9oSSVuxxyaPF55UQT3gGkKp5TRT0Cs4mYY22+PEX+ChqQ2Pbd
	 DJ0kMIuEeYnVQ5GVUQhpIoSM+HiJOY5a4W8SiBhQNqAQlmJL57M3t7csf+0qpPm5dA
	 rW315mKyHjq6vRsdQZ/kVmItM5f6O1Qs9C102uUj6JcERvprUpAVRLXpoei5pjO10v
	 LaqVpZTcDLL7IFHOGF0bsZFNePfd9j/bvGa9zxdRzDL2+vX8RPTYCxaaMisgIAYUfv
	 K1H/3lqEMOWaw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E10E1C41616; Thu, 30 Jul 2026 10:08:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 30 Jul 2026 10:08:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: gunnar.kistner@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218305-215701-JEMTRAI9Ve@https.bugzilla.kernel.org/>
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

--- Comment #159 from gunnar.kistner@gmail.com ---
Created attachment 310539
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310539&action=3Dedit
Combined diagnostic evidence showing the CPU stuck at approximately 544 MHz
under full load before an AC adapter state change, and recovering to
approximately 4.39 GHz afterward. Includes cpufreq/amd-

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
