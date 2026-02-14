Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE052D8DB5
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 05:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771045761; cv=none; b=OidtyKfWtC9l5nRSBpuzzFSprN2KAlRbXxz7++jD+Hcn2SSHP92wuMeBPg749IEIf+7+F/7nKgPHHbpMvztZxfHSIpnSllhop7UyrnrapjhB6FmgIi1/Ry+bSmyzuJhKqqS6eoj8XKNC9f3E9P5jl1/lKKJ6FPidO9DoC7tGYfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771045761; c=relaxed/simple;
	bh=B1Ty7a3cygFoqpjQs6p7lgj7OIfgnRTJqKkF1NlM2TI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ugBBfZ47/c8m8tD9BPBkD25r6vfth8lTLQOBx4bN+hkml782XqcKTWeMPPlBI+D3rHUXg4NIbl+pAsCLo5vlavZ3wyK4eTxBViBHCv1ZarJ4zm4ffa6EkN4cn6Wmr41Vj2yyFcNAkACdfarR9SadMn9nG0UEBQv9qrgjKro13tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhNsAaCL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhNsAaCL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08308C19421
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 05:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771045761;
	bh=B1Ty7a3cygFoqpjQs6p7lgj7OIfgnRTJqKkF1NlM2TI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OhNsAaCL0/4Ab7ws+eOJuHouka02JEZHiycVo5AjIxbGPpULiSsjjWLPVif4qowi0
	 qGrm5s/5Ss4z+r/LKaYy9Zv2AGxFH+sgEfX8uKjHOBHs5wex4dZiq4IoQ9GBU3LLRP
	 kAWulX84NMAikOc+cE2octsPrbu9e4YKFak+MUkD86FHEvq0DVx+Rcd3BU8Jd1hlis
	 bqq0UDj0QYQwSUaneZBmTKLGNWYTAT/O0pbGq8B0oJqBwFI1pRpe6cYig/Z5kpsacO
	 ir737tXfQEyovRRZV2PDlnMQLAorQPshCrHfkrrkaJ0ROb5S7RTrgG7ELFhsK8L8Km
	 9zXu4j4WZnZ2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EE3CDC3279F; Sat, 14 Feb 2026 05:09:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Sat, 14 Feb 2026 05:09:20 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220639-215701-JQi8ZETfjf@https.bugzilla.kernel.org/>
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

--- Comment #9 from Juan Martin Morales (juanm4morales@gmail.com) ---
Comment on attachment 309374
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309374
HP Thermal profile validation report

Results from attachment 309375

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
