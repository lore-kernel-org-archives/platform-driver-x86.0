Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66D8314B73
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 17:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781200039; cv=none; b=l/Q1dRQxDMeCnFXoZy3QQByuOKcV0eeWCcPhBAGASYo+SdQDdoGGdPnyBXWYEXYbMKRDU8zT17tHa6UUXlF0jP9vqLDrtnfbuVV6DMfR+pK4oSlSSIB7QMqNjCEgCPwkBOwQaZ17qRQ/3fXVLHgiNDW88ir6POPnn6LCj2PFBPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781200039; c=relaxed/simple;
	bh=IP9vDqTphjg2LMkNddZo6ttxzV4J24GLN2X48hN2Fuo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kMe0L6L3bRkdsvrnxu7R8E1yx6aS0xbpeUocIGOPmpUJxl957RYdGagBFaNQneDXJVjxHTjmtrDTrdJ8HPd9vJluEFosR+xPg57BacFz4GgvOqcBVNU60jB6NqabSPmISbj33dN6j1Vv0qYk+NRnRPGGZMNjjWTPKj0vVEEVB3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZ3QnTYi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZ3QnTYi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65125C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 17:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781200039;
	bh=IP9vDqTphjg2LMkNddZo6ttxzV4J24GLN2X48hN2Fuo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SZ3QnTYiTUb65oQkYVdxouDvyRDl5WETSBMcJV9n11IZaK4Ogv+BmDwu6FmqtXU/y
	 YAfCdSVNU0bP8RomcUREEBbvNfSbQCYuL6yce5BiSCTPab+9wO4Znl4mfdl65np/ob
	 q574iA0jLFMRs/Kr2MExndyN+jofPEoecOmDY3J7YxKWw84D6ph+8+RZKp0zV+MOJJ
	 uIOGiQirw1ZruwWK3C6ASnKYZLbDsKeOyUOUMwb9TBdkBeEo1Ya85ZxkNTGlOcQHwV
	 314vsxBZBNiOdxXgl/KzvhpQzlznzvgkDSqu3/3Q5SvCldfgXfPK0/WkLeVBEF1Dhd
	 msmXyn33Ne1Jg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 526A2C433E1; Thu, 11 Jun 2026 17:47:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 11 Jun 2026 17:47:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chgenn.x@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218901-215701-e0Q2WxKk7B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #87 from chgenn.x@gmail.com ---
Created attachment 310302
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310302&action=3Dedit
LG gram 2022 16" i7-1260p/32GB/2TB/RTX2050/Ubuntu 26.04 LTS. sudo acpidump

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
