Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7632119644B
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 14:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731940395; cv=none; b=IaWwYsVJzzU9VGQP5JqDHveMcGnlwRJM1UvmWhuFZelxGOCxV81Ib5KgluqemdCc4aMbmnwpdCW6bGECZraWcgmTDYpndp7vkGE/fG9bXKBsTSfDIk75O6v0ySlJoxNFiYV9RSD+wo6D6+cEtYmnebY5hfgzZZQIhe6bwxlYbx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731940395; c=relaxed/simple;
	bh=8hTn9WQRZ2l+m3Dc+p0QRoBOvJC3wo4CNtc/yHBn1VM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ql3jF/LfW7J5UqLnG54GFnVLAmgbkVCSKScF+qicoOEpdFAQCwczSF7x/UKSHW2olN+2QcQYC08Ttvh9Qi2eQWuXHSjDk9FMzZPsVa86ZpcA4FTjs+gbXtpChDoltXPZ0W5g96rnQBZDeOabQ6uGwluQ9SaPQfqaZVYjkcwF9kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFyhvG83; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFyhvG83"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E564AC4CED6
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 14:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731940394;
	bh=8hTn9WQRZ2l+m3Dc+p0QRoBOvJC3wo4CNtc/yHBn1VM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WFyhvG83z71Xn2ef5B07ldDFoFqHXur83NGo86VdzwUFEKnWkxp9j96Gz+9WiQmUU
	 D75v25HvTfLPsxKuDZ3h/hviMge1k5J0EVY8Il/mnl2UPoiEnkoTh9z6+xQO+h2X+T
	 2Y15wMoqLBi0dXHAtwnTarQ+sjHOVtE5ws174It/6l/WgxtDamI0TtGpdgcuXMGoQM
	 swmb6lw9eWKUDwsIXINiBdYj7meXMmg4Hn5WggMR3T/LYeCmEDWk3rctUSEkiJNX7Q
	 kfT4bivQsfmkqvpDeCvWCXPYFPorLmaYL1QjmH5OnKIjrWoBd6VbKsLB64C/YZT/CL
	 x/hSmyuvin8eQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D85D6CAB784; Mon, 18 Nov 2024 14:33:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 18 Nov 2024 14:33:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stefanb@linux.ibm.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-zRuCn8Mfdh@https.bugzilla.kernel.org/>
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

--- Comment #11 from Stefan Berger (stefanb@linux.ibm.com) ---
Binary log is 69k. Presumably this is the biggest log we saw so far since i=
t's
the first to fail. Cap acceptable log sizes at 96kb?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
