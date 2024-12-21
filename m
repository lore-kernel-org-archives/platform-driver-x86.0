Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118201F37B3
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Dec 2024 14:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734790306; cv=none; b=eRcYXikJMMCRcbpMezG5UjJWg++pwK6zAzNoVbtfh7Hm55b/phOXdMBovFLChU5j1dt1HMAYQM2YrlWzhAKRfFZTNpiTRNi8XQlllJPwWRzGB/ZSGSqcn/bj68p6nXCyxcJQ3xaE5/EBvX0EI9SkBotjxPuSrg/iQfWtwwanLpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734790306; c=relaxed/simple;
	bh=NcKMIv3jhPpJhmMtzeELkdCn7+gxHrod5WsqdXYEa9Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FlyKtP2UI7CZqPoHudbWiwosebzZNgv5/ioWZVqX78ALHbTCeX+BrWcJUlSUIkm3/k9CNMfYLpir14gqP7y1bOqulw0srtbpZlufec/NHtM0lM6vlXuGNMbVv2/wd2a2sOrrStkyv6CcXwv7i2I0AK1gEi2x6/ZEEUDGbe/BF9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cS865eVM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cS865eVM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 814EFC4CED7
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Dec 2024 14:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734790305;
	bh=NcKMIv3jhPpJhmMtzeELkdCn7+gxHrod5WsqdXYEa9Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cS865eVMbCWcTT+f20HljGxOZ5n7aob2iKvJxQ5tFp2+3tNdoEX7bB0nLoi0JlPrL
	 N0lR1Nobva6lYnzTOqvQWUf/pSnYK34Mvbggbrh1E7L0GI5YRIyWnZnBqzMyCnijgS
	 OWVkELl61tx2XcPmiN2Vgy0XxBrWa9ZPOCs0RWxFElGi1i0PZxo4YU3h0KABU7lIZG
	 QaLBsRfexjJdXpmI3g/OSuSl4YJHxZKvgdT9dXSJI3KuCLqOgEZToL1TpYAXichzd8
	 q4z2soJfjiYhEFA1H1jq2+dUbsHofIGel5HmI9mbwkkeqcWGtsuzHpTcVGr8u6paf/
	 XVWRcio4Jy24w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 683FFC41612; Sat, 21 Dec 2024 14:11:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Sat, 21 Dec 2024 14:11:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-anhefQK5cS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #46 from jarkko@kernel.org ---
I tried my patch with swtpm with both TPM 1.2 and TPM 2.0 emulations and al=
so
emulated both TIS and CRB chips. I don't have large regions but the test sh=
ould
give pretty good coverage, given that now memory mapping is always used for
ACPI log instead of allocating a buffer.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
