Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077EB79EF
	for <platform-driver-x86@vger.kernel.org>; Sat,  8 Jun 2024 07:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717830144; cv=none; b=evvc7Zsv/tEf4y+2aDZ+jPEUh/ZpyKIYgj0lfzxvlQs5Aa3Ie/+t1CBjgJ+XhfOjGFvd6fMX8hATZFOycXf/chATvQEvGYrnCQEHu/44BNbi5nuSiGzzreCPskM60+vAAXK9hxmUbQK7lmkUJ2cLVGgxfrVzQuGof7KbzZkcv5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717830144; c=relaxed/simple;
	bh=65GJ4pE9eE1Y9sBHUsOVeOgo6qaT1yItZfjBioIRvkI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FJttFsZQtGIhPBWU21c8Igf9TJ6KayFJGdsBRbQnX4tsi+tduBUSuRcvYQ9D9mATS9DQW7dDAq8h2OGY6YamPZRiOi4lY9EYeCh4O6qEHl7PCNYtD4tVaXhQOC45hHsvl1JSCWzeFUBKy3TsbQDQlnC/3GPPFojlAUDdZ/hlwxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6dG742Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6dG742Y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 606B8C2BD11
	for <platform-driver-x86@vger.kernel.org>; Sat,  8 Jun 2024 07:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717830143;
	bh=65GJ4pE9eE1Y9sBHUsOVeOgo6qaT1yItZfjBioIRvkI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=q6dG742YxdCZqtpdT1iBRTkr6iw7aM6484M8BWOOfYGYCdJ0fqcOZaJ5cnue1oWHM
	 ocKpQf2b6WyN/5YsrPN3dGSTSG3Du2caZydb+AJ11ltF+PYtHpRZbgDgW1bSewEUOP
	 GCGkiBt6XbSC56It9dKFpcpx4AcLBWW98IZlCKqCdrO+6N3e+DEe7UCIMkWPktUkTT
	 /2+KDTLzPZctZceLiuizJdhD3GtB0s4V8UuJa/iHnqrQTfq5l6oUHmaKTWasZNMRxT
	 RHuLTu9FDpB5o/pOe4/FjnfJvFbLnGI3YmW1EFVELZDg0zmcXYTOMF69pprbJSXV+X
	 ah5boV6zYjlGw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4B169C53B50; Sat,  8 Jun 2024 07:02:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Sat, 08 Jun 2024 07:02:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lmulling@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218696-215701-LiNUnrG2yp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

--- Comment #13 from Lucas M=C3=BClling (lmulling@proton.me) ---
Thanks, I'm out of ideas, so anything is appreciated (even opening this thi=
ng
and probing it). I've tried the kernel ACPI debugging stuff, but it was just
noise to me.

One thing i forgot to mention, the machine does make a weird coil-wine sound
under certain loads, the kernel instruction decoding sanity test seems to
trigger it 100%. Happens both on AC and battery. I Will try and get a video=
 of
it tomorrow.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
