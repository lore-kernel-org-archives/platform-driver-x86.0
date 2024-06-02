Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A11B4F883
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 15:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717342624; cv=none; b=bS9evh83jD4dRkm0F6BbVgJAyj5SX3+RkCPqLXuyGZSrLqTz7P626eaass3mpDL9IQNM8m5tnRYbRVKco5kMAwkw84ZwaK+0kKIFDJMEV/tAwxMDMDPPmR+INEUU1Mk0aVQs7VoUu9Ioivkxk25OmUSPF136h+W+IE8Jv+960GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717342624; c=relaxed/simple;
	bh=EgKDQVkSQSnlJNLtGakSNwAjOBaBdBbsc7ifG3Do2pM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WM5/h3qJfMgUmMrBjFYeZ34Vclso5oOtGCrHOjjysc7pTfK7UkAKT5EqZqZpeRIrpMs1UVwUZ04ftmw6lD6obuxCaAQFWUMupehcG6PfIcgfFY3FBc70RDRICNgT0btaNUqOLfi+jZ7dIvverCNOFOF7ma0yEOMhF8g14MmCKVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/XZv7VH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/XZv7VH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BB6DC4AF08
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717342623;
	bh=EgKDQVkSQSnlJNLtGakSNwAjOBaBdBbsc7ifG3Do2pM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t/XZv7VHdfaYpH06fxtWfOguKskm0LhJNnE7K5xaiNUWp+tnL9IMUFXliduEOAOJe
	 IpbxgPrq2n1GNjoye/i5sf38QUnlNGHNf27cInsTUG2w8+JKi2CnPSJSH6J/nPmOuy
	 B/jVmuCoVlooixOuZgvnVN+ujQOb1FjNHoMD5YiR00COaJO+jvaNuasZSueFdhWeui
	 u27O9wz3JJ0EOOJOQG6I5PnGDssdx2zd4JtZ0bKWljVMDWix4eJUb/A0YGCnFvVbvR
	 RiVOX1HIb7JDdEBgk+vy6b0XfOwNYw8pD0nEk+OlTrA3MJsG2db7CxRw0R1z1yZLNC
	 PS/bxb90gP/wQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 87186C433E5; Sun,  2 Jun 2024 15:37:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 15:37:03 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218901-215701-sosjJYIMXN@https.bugzilla.kernel.org/>
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

--- Comment #19 from Armin Wolf (W_Armin@gmx.de) ---
Created attachment 306403
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306403&action=3Dedit
Prototype kernel module v3

This should fix the missing /sys/devices/platform/lg-laptop/ directory. Can=
 you
test again please?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
