Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBBC1BDD5
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Jun 2024 05:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717650165; cv=none; b=hkMpX4ZeTWMt7IcrhWO9Fdt1Zvl5K2K9FPq6ebKAaVqPeQEJ/hvZztsCSs8P+Ge4Gt9On8xfAdDyBvTZWkSahvfWMxIqYfIZ8bEMcOvEL2a3dOUphL8xdYXSaQHNfLLn3OlWPMb/0La+ACAwCIpVq0zdI0bGHeVGKzXqkcC2Imw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717650165; c=relaxed/simple;
	bh=A+nPb13YvEOaHXmH+BTExQ7GW00iiw+w/xpkdcUxPBM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ltu3qqeeOnri4QlGpCeO0OU2H4Q2hWDxxFEjz/Qbav8V/HSdMN///Bc0FJOedLoIRuBLqxvBKgagzvTKjFSxS7/Fo5VUuTdY5WpUpoaMSOj8qpkxuxLXvHOl4QU/TquWrS0sXVE1I6DIGNWfdEhoawVjQR/rioEwwWGZ3hBU4Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5AESc/8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5AESc/8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F423C3277B
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Jun 2024 05:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717650164;
	bh=A+nPb13YvEOaHXmH+BTExQ7GW00iiw+w/xpkdcUxPBM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=d5AESc/8jyIFplXCGviexWQKg2y/HJLx4QpLb8M6iUU9gav0YutTgbcXt/wth6Ts/
	 qYFEwc079EB5JAc1RDd9YN7Gop3vyzWvCte2FD4kI/A31sK8M4cANMYI4pgrVAG/BQ
	 4Ll2WAFpoCD8a+omYZKrXurxIRP++XgizR9+KkYSi/GqFIp/Uyqy7uFTCa4TrQuAKt
	 0vbJttzlAppSzOFmQ+Z+4vw8a1NazTpt2BCANqjTgKHa97Dob6GOrM2W11AuSecNBE
	 c2FDsNsJrl9j+JP5FeMObeQ4k8RP/lBv3HmU/ZwkoEF+b/q6eEMc7dpuc4S3OJfoz0
	 9w4oV7gEgDVWQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 75B7EC53B73; Thu,  6 Jun 2024 05:02:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 06 Jun 2024 05:02:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-218901-215701-zLJj2dA64q@https.bugzilla.kernel.org/>
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

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #306410|0                           |1
        is obsolete|                            |

--- Comment #43 from Armin Wolf (W_Armin@gmx.de) ---
Created attachment 306425
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306425&action=3Dedit
Prototype wireless kotkey driver v2


Final prototype of the wireless-hotkey driver for upstreaming.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
