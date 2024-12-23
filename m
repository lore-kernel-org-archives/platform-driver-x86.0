Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7DE18A924
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 18:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734978743; cv=none; b=GcKw993lM/djBy3f1hzPi+h61X+mUpRzd+IVCqLEyxdDID4hGClPk0qf2/QgztigO1SFsyCT0Lg7BhXLZE3xjZ68lI9oQC17tZdHAZBfqwyx5piqc1ZL4wXt+hrCDrQSiKvt9OXRRu0Lvbv3onyA1k+uEskUBh7ntXmlj7OdmnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734978743; c=relaxed/simple;
	bh=Dm5yRIwA2ifikNSUKN9lnxu51+EJWtBP0FqTXJx+l2s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IjPw5bRCBQE7vew9mMyvAvKTz5J9Nf+ORIYoVyfKIs4OLC45IKBD9wIg4JK0K8l8awqvCBoIDIEKzOlUdVWLofRPBouAuadoNmMypjau1cj89f6E2h4mNRAuOOr3hQlWt3SiMbmUXVSu0oqH/SPQDH9Nm73NHQSCWZVMe0YbOcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vBK9L6v/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vBK9L6v/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF234C4CED3
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734978742;
	bh=Dm5yRIwA2ifikNSUKN9lnxu51+EJWtBP0FqTXJx+l2s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vBK9L6v/aYmO/CfWuvQ2mo1NoGzoRCqAZIKZ2k2781/fiYi/buBt7zTamLMuNeYMU
	 o+VzbHbFZ8XzNty6e8oJHWswTOQl1jxjAK+ShOuvczEzXiyC5yv8KYF3S9HMMCHGff
	 tORIddTaeTu8DhU7KtEIc8pkOdDz02UUz92UewvltkG/GDw/9frWvxeFhJ2k6j0Q9K
	 5ynOp0fR837/6wwxYpSgI53wBZeeLLm3nsn1y8AQfULs1W+5sZff2bTXjPxG9jR8wb
	 mxW7VQVQ/QnfomN4WL6k9sGs2sFM70rKFJp+LqUqyJtpiWok3ArR5r7SATXT7+EaiX
	 pKGq+CGN1g34g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CFFBFC4160E; Mon, 23 Dec 2024 18:32:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 23 Dec 2024 18:32:22 +0000
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
Message-ID: <bug-219495-215701-llHJu6Kvos@https.bugzilla.kernel.org/>
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

--- Comment #62 from jarkko@kernel.org ---
(In reply to jarkko from comment #61)
> (In reply to andy.liang from comment #59)
> > The binary dump and kernel log for v2 and v3 patches are uploaded. Thank
> you.
>=20
> Awesome I'll check them later on thanks.

So, v3 log looks great.

Have you tried to copy /sys/kernel/security/tpm0/binary_measurements?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
