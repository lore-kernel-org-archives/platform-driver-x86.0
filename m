Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2B33009C8
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 05:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771045246; cv=none; b=Wc4k8cJZH3RLOdlA11uOEOKBgI9f+kxUBxGMGywr7y2COpspEvVMPgwJ/n70mhrKWUvRT1xEMtYvv3+qjR99RCZjbNzbpdtQJBXqs7CPBzfuai9kp6+skoqHRt0HB9CeyxOEev1Tqgn47sg5i6gcYkG//+xsKLgOL7h/Qz1gc2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771045246; c=relaxed/simple;
	bh=j3Y8giUN2S4gCK2WrekzkuT9lLJ1jUO87mLa9GeLBoU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I8q6F8vfxvM6MRgFjA+JQSs+C7zGUwUeTsHnKUizovfXH218f3IVayewOuHkBCVzlVvwICBOUwuSZNqhPFZduNcuJ48PXsOTPtHz5l+2XnF0VaiC8+jLu0fMHBY4vNAHRosg90fYiSFV1n3xNu5IvhnFt0GzaMrxQEu51i/coH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVFJb7jm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVFJb7jm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 545FEC19421
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 05:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771045245;
	bh=j3Y8giUN2S4gCK2WrekzkuT9lLJ1jUO87mLa9GeLBoU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gVFJb7jmUZ5jWX19eaN5BWS3LA2S9mIkNISbZQdPsQiaZNZvKkrrPCnhXbE9D4q27
	 1w03SjV1Vmb+V9vzmwJQIqOy1KoxOkMKYmL29nA9C5K+CWgwBicYbUn8kYRUZsE4oH
	 Otg4iQ40vGTrDae6TioyRQ4n/sNNwXKBLx1sUy2PQY+Da9FC1l1V2K9SrGonDwfTkF
	 m+8BiwFT7ekBV1ccZvN9BSRi4pWk1iNlu/tPuu/p12TSbvwTXpkUfIu7kMEWse8Ric
	 qfPYqNBdyGXTDKP8zhfZz3u4pzqt/vEdd0xv4SOd4EKyA3kC3REyU6Qf3AVOQdeaKx
	 ak6BBUDGZglcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4D66EC41612; Sat, 14 Feb 2026 05:00:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Sat, 14 Feb 2026 05:00:45 +0000
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
X-Bugzilla-Changed-Fields: attachments.description
Message-ID: <bug-220639-215701-kZCfGhlOm8@https.bugzilla.kernel.org/>
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

Juan Martin Morales (juanm4morales@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #309374|HP Thermal profile          |HP Thermal profile
        description|validation                  |validation report

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
