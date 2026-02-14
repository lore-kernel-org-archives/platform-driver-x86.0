Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15762F690F
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 05:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771045212; cv=none; b=ei/DbUqlPVEdFQfEUh20akYRJ87MAp37K2ZvaPhfO8O1KUP0yzMC39amU43X481Bs2kQGJPWc1aQcHKiJPI2RENsIybwolsfDQLKCJS/nGePYbQRNGRtpQUoPx0DF62wTSie2QKGhrkQba0g49znRKrKrGM6z+1UrC9ojgzB1mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771045212; c=relaxed/simple;
	bh=dTbbNl4XYSau5nEoLSzDwpaNgTjec8mkYU8kEFREHj4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EEKzWS7q8fomwByfXUgT9aQmO/20SVWP7f5BwPeJuOL34YOK9rQQTCcOuMJRYARfz/GbvZNfVuAWWTMuZB1NLEFz5fcnEh8KzC1sg6lqz5pZtBhrNlAL3JigvDnCUIwyNjpgpra3lfJnJkx5jH/EVCK0rrfHjgLsgz5IpD+yZDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRk5V5Jh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRk5V5Jh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3AC4DC19421
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 05:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771045212;
	bh=dTbbNl4XYSau5nEoLSzDwpaNgTjec8mkYU8kEFREHj4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oRk5V5JhgVohUSy6S3TMlxB5I/fIGiXUtGgi7PVSmlr15pkYKDSur48GXog4MHfK9
	 tNVwiNzEzqtKgspnhM1ZMRXwP+Hs/4vgytZ4FO4EdlDtfcrTx1syS/BslvjsXTWZKc
	 GWeC5NMIoBFhE8byx7KTeOq87GcM86ucR41oe2YwCTyUTp56mhZI+LpDbOUu6vqZ6j
	 8q5Q8YPz4l5m2e+2vjXm0Yq/jm9FXhjsDfH5a1zqEMlU4TUx5EkDvJDIusFAdI1TmV
	 aCZmvd+0/QAGMCsIkBnttTKNY6UHeQotxpaVEF0KIxd8TizUjCpLQ8VgjChcEPxYPK
	 lrpO5elMFexQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2BB3EC3279F; Sat, 14 Feb 2026 05:00:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Sat, 14 Feb 2026 05:00:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: juanm4morales@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220639-215701-OD3d3QPhIv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220639-215701@https.bugzilla.kernel.org/>
References: <bug-220639-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220639

--- Comment #7 from Juan Martin Morales (juanm4morales@gmail.com) ---
Created attachment 309374
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309374&action=3Dedit
HP Thermal profile validation

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
