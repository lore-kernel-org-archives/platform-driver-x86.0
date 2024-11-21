Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E4F1CD1EC
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 09:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732180181; cv=none; b=alBXW7f8G80j5n3FgBwmG7DOOnXTQR7T5MjyAp0mvIkUOR1ORxmIMrfuNvT0Bl0AoauPCOBC+2/MugYPVcLlKyOWBO5dzjNHOe9rVaR752bsftX376P0JqMoMm0UEpI1M2kr/yPAWPaSGmGhs8XvNmNI9ITKEGOKxVPyQTU9BdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732180181; c=relaxed/simple;
	bh=FFkfz2IIK3eTxKvsMn+0bU4sSpdg3KLnrjEIyXI5/bM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UsB7Nihh4NnJMXPrf/9B47+Hl4BFolkakHuz566cUfvffxdGdX5wnFja/9rd1k7uelxKfiHKBjDBgJwE42N9EN/cJMPEUlO8qHrx2TF3erEgIn4A4LBR5eUfqNfS+sJDkhfNBFaqeboHqTx5bNqCZMCSHCBDg+p+8D36c9mle5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kI/hoQ3W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kI/hoQ3W"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16EE5C4CECE
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 09:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732180180;
	bh=FFkfz2IIK3eTxKvsMn+0bU4sSpdg3KLnrjEIyXI5/bM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kI/hoQ3WpOlNnIbEfQ3i/gf3owi+EoNbb3peme5/Nld8mHB+EY8bLikcIu3J9GmlO
	 /3FU5PWYhADMG38xHkqMhT20ZWRMt9ExMLLhKCEC/18ZFdBSE5a5xdcDSrhKPk/l4F
	 z4JxbW1GdngU+Fafr9cztUKCzYRV9VcggEWL9XPSirFHECa5HG62CpLEuTebgNxIFf
	 UW16eLXwgWgXRkDAOQbbPzyUKxMN+HYAy8iMhFueORz/as/OCQxxb2duEZra4SnzKj
	 9udOfvJr7Wg6V5yE/OkYYluIIJTKKAgIhoxT1NdQMwhg9uCced18TcEnHVIxHlCR9b
	 XiGqC657VxfyQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 08586C53BBF; Thu, 21 Nov 2024 09:09:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Thu, 21 Nov 2024 09:09:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: auslands-kv@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219517-215701-LJ8dEnbymL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #7 from Michael (auslands-kv@gmx.de) ---
I did acpidumps on 6.12-rc7 (with the regression) and on an older kernel 6.=
9.12
(with no issue). Interestingly the dump is not identical. Not sure, if that=
 is
to be expected or not. See the two attachments. And here is the diff:

=E2=9D=AF diff acpidump_6.*
47639c47639
<     0000: 50 48 41 54 0D 06 00 00 01 2A 5F 41 53 55 53 5F  PHAT.....*_ASU=
S_
---
>     0000: 50 48 41 54 0D 06 00 00 01 C0 5F 41 53 55 53 5F  PHAT......_ASU=
S_
47708,47709c47708,47709
<     0450: 45 00 45 00 43 00 33 00 29 00 00 00 01 48 FD FB  E.E.C.3.)....H=
..
<     0460: A7 01 00 00 00 F1 B7 8E 98 01 00 00 00 2D 00 00  .............-=
..
---
>     0450: 45 00 45 00 43 00 33 00 29 00 00 00 01 1F 3D AA  E.E.C.3.).....=
=3D.
>     0460: A7 01 00 00 00 17 76 4B 99 01 00 00 00 2E 00 00  ......vK......=
..

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
