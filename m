Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C7832861F
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 16:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469350; cv=none; b=A0MlQwq5tvmLXAnj10vT5O9aQBKFkdWpeQ/IqgCnGNiYObvJd5D+P04A4tz/i81WD/cUnIe2hMsNwOaR1DLEb+ac8ksZhi/4Y7ZmS4oEOppDEnvVQ+X9uzAvpzP2gm6fDgI1IU0JUt3mu9VRfd2qj+XOqvIDpcN47MA9qN7+tKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469350; c=relaxed/simple;
	bh=BpPD8csn0VJmfiy9SOeNk74PJf0FhehcMKgKzim0w8Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HWeQm9A9WA/MqHsQGJOEC9Mxfjkh7Ao26rYZE1DB/wt3r9s3k0dUzY8DSrcOyA/qir8cA2GVthEUMyPzNcdfzcWK5TsxxvgLTLb3V1s+4EfQ58eKLDtgymNMgeCTccpCIEcJEXM5zkRpES47prabTrSgBFN1VlciSHuglvbHnSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/EniFH7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/EniFH7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E25AFC19423
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772469349;
	bh=BpPD8csn0VJmfiy9SOeNk74PJf0FhehcMKgKzim0w8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a/EniFH7/j9q0pTZ6obnsNv1KzFgxiaSo/LirL5ICXcOEJS2YftdYId9jjK3ltj0a
	 9JqrqH+vF2Bb3eVPD9IPfq3kicwM+44KAk/lihF9Bhr8JFr5fEYzifgz1fele4YR+g
	 fmF7exJNgpy7XY8PX2JkxB7CKJ/J0XjS/HdOCuF9bWJ8bgGkc0gy1cF0JrzvnyGKME
	 RoC6VICgUibGaALzg9fy8low8Zsa6pqmzE0JMEru/Vud33MO+8c2F/7CZ9DUwNv39Q
	 49GRF6kUHRQqi/MODCDzFbkrQg6ilmDfdU5qkal7AAW84iyZQi2OK3mfJnRZPqeqkX
	 eEI3Bm/CrKb/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D4A9BC4160E; Mon,  2 Mar 2026 16:35:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 02 Mar 2026 16:35:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: team@nitrosubs.live
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221065-215701-sQ4WqwabQ6@https.bugzilla.kernel.org/>
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

--- Comment #47 from fililip (team@nitrosubs.live) ---
Created attachment 309511
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309511&action=3Dedit
acpidump from 83HN

Sure, here it is.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
