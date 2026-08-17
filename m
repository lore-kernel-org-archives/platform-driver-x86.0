Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F702D9EFF
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 22:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787004109; cv=none; b=AVa7E+TGk61qY70SOS0s0W/vTnfVNGuP2Iuiu1hlW1VatTC/oGAsawMcmTLEITG3aJ1OFISZzIr5UYtpZjBQVoBFqNKUF2YgayKfDvw80uyB1ibyfNgq8Yk9GOKj2bfLTPorp3K8uVHBk/oT4aIH4Z77Zf/cTFQ80H7xXnPBTtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787004109; c=relaxed/simple;
	bh=adzDbumRAmJp3+bP1RnzDlQN/2f3WcMoOptsIT3/1W0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qTQx4D5GHj01qT12rv06fpi4v/nauw6ZfvQKRZifbv/zj/jemc/RFNg+cInRVM7f2Ma3z56Nf1fHhfYF4Ijser1Z1FZkS5Jcc9UG8NHKuRUFezCjZV1gq7b0YeSeF1+vOhLNFFcaZZujr/T31HIW3sttagS7V5SNuG7aR159soM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGMy71or; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGMy71or"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD178C2BCFD
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 22:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787004108;
	bh=adzDbumRAmJp3+bP1RnzDlQN/2f3WcMoOptsIT3/1W0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nGMy71orYDXc5mATnJC5HUB/s26jYISLaJf5Hk4jGwRBHHMc6hYUzYnrZkixo7YhM
	 DpZT8atZUb/BWBqeOwb5akNKJ26cshsBBqjVcSdWqQ0tdjkwsma5OjYIZeWSPqsOwE
	 hCDmti1bRcZI4IcAtVNqxCSsecQDtaeEI4tjTHKDaPtV2tmLCWCgntk5ZDktJD6BTR
	 8w7MlLEDmy7Y+9Mm9+nuoDDifBWTcHMquS1l1ZrJUcfXr3oDxUwc3iSkfD+z2phxWm
	 qzLAXHR+ma4JsT8zvmTeIFUSG+eSmH6y1WjJHT3oDY5cVINxSchfJ+zYld+bC+HcOA
	 Cbq0Lr0P3Lasg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CCAB7C53BC7; Mon, 17 Aug 2026 22:01:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 17 Aug 2026 22:01:48 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-zFAoF1hqMR@https.bugzilla.kernel.org/>
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

--- Comment #101 from fililip (team@nitrosubs.live) ---
I see the patches have made it to linux-next. Is there any chance of a back=
port
for 7.2?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
