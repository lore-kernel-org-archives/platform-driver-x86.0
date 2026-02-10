Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D22538A73F
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 17:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770746204; cv=none; b=V6ZIzuojdUIo5gvlm9RzrW9cahdduWvVkZw77ClZeBS+EIp99a0ui7K/Xxl64HiuJoCnKL4fv2OvCWRjMloPIsjsnwRBKK3a+ODmK1LrxLSDOIKGkQl4WFDxBTgL+4cAW/s2G7ZAN8WBxGMrqTWk+zBijEDYy36QDfqEYsz3w5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770746204; c=relaxed/simple;
	bh=mUJG9D8s5MmCE7MsZsad2B9UylP26hyxzVy+3+Pd0nM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VolB7rkhbXIgECtsDBqWNTQR8jA0cdXWy4m8psedZkJgGSxTeCGZt8GF3cBOjRQBXUYwnOvUB8bvdWDoYyAFp4d+QbYRHPcdOlvOTann9PqEqb7HHtULHnPs0nkRLfJ5DlbpRL+X0ggFsTp42eWd+pfhszCFibpk714CiA4iJrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJBhVoCV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJBhVoCV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FFD8C116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 17:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770746204;
	bh=mUJG9D8s5MmCE7MsZsad2B9UylP26hyxzVy+3+Pd0nM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HJBhVoCVmGRK9q0ZRAT0l/cdj7AVh6ppBZTkdVBSEAB6GTw5pnwksLjLjYpJx0jw7
	 toUv2saJGF1gO9s1zzjfjW3FYqILS1bBGGvWw4+HzlSe3TOapjTFkIQ4JbxPpn2Q4d
	 BvnkU4m7oFh6dYXipmWdtzaGtPdkCcj30lE1RUJ0LLmuKX0Y8taUXpQDdf9cRjeeNB
	 AZ/PBrMPQIfuutKFqLiDoo6dZzDYUpJr8k8qlyDG9nrRfLhgUc/zqExhKVwuXPQa/3
	 mw+uZtSxNt48ZIyrpuQVuoNGhLa2h3INRAOuJeRyjK2yyitimT6HndidpVz1wlnu6Y
	 TuemgZ1OsiOzQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 297DCC3279F; Tue, 10 Feb 2026 17:56:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 17:56:43 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221065-215701-0yo50mHXYL@https.bugzilla.kernel.org/>
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

--- Comment #4 from Avraham Hollander (anhollander516@gmail.com) ---
Created attachment 309340
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309340&action=3Dedit
acpidump from IdeaPad 5 2-in-1 14AHP9 (83DR)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
