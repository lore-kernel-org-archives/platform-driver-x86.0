Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A38228CB0
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292014; cv=none; b=bXTtOeyNLyQOl4lyNu/aESMSLRXv4idB+XEGgJHREg9DKXcHDcvdRlAUuedZ254qbK51bml2jCw3CHVgke9ouOtBNRC7vAg5wuN2Hw0FSY1dyYv3zQT6DS0UoqvLi8ZqFzkDn6bkx/LtC4vpxcOLeNzee4oWJBOSC1ysQxmoC4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292014; c=relaxed/simple;
	bh=s4AeIJRBsAmEoSD1gvK1AOfhmeHhtsWyq5VrailO1+E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GGHmHlpOJSKMcaXiyeVgAxNg9jZG4+Lu04g9qKrxhxDxYUR5MlIpN35zzT6lRZwKKHQKyj/qzEz4AdLvS39d+WRXTGg1UfFcXb7NtdGJtFXCayyDLoZ3FrFdhYa/TfP6R+OH0jHgYpojOFZVVcyYArO82otaW2gkCH+36uvehlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ti6KDAnz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ti6KDAnz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E8E2C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 15:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779292014;
	bh=s4AeIJRBsAmEoSD1gvK1AOfhmeHhtsWyq5VrailO1+E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ti6KDAnz+ozlb+7Vd3+jesTY8X7eizIuBxUzmGo/c2HT3GXmKjmCn+8Ar1oVeRTww
	 bZvcPawU15rfvCEHffAz6tkHgaavKrFWnzKU4nRZ74PaoNOwZQbVOyzxi7rLTJT/Xt
	 liWol16yWF4HlEAaBuvRldkDtAlkaxVKjLl6jG/TrD4dQVMc9WAL70tnbwYhN8sXbL
	 WLmDE8Uyu6ZHKIR0hHndAFgSCb/s5XEYA1Jk9deANy4fJ8cVBSq4N+Gn/O0BF0uKBK
	 w6R+tDlN0KFH9nEvgrLziDGBdPZubWvZ93Jc9ORFOvebWuA+WSmU7nkkWQnODlHp0o
	 iURnvgd4zJs0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 15350C433E1; Wed, 20 May 2026 15:46:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 20 May 2026 15:46:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221065-215701-nLMaX38vX3@https.bugzilla.kernel.org/>
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

--- Comment #92 from Rong Zhang (i@rong.moe) ---
Created attachment 310169
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310169&action=3Dedit
[PATCH 2/2] ACPI: battery: Merge consecutive battery notifications

Hi all,

Please test if the series (this attachment and the previous one) fixes the
issue.

Note that the series requires v7.1-rc or newer.

Thanks,
Rong

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
