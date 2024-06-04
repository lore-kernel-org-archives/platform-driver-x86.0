Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248FC13D50E
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 15:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717513801; cv=none; b=VQ8TuesySPnfTUAQUv8LY9qTC6ul8oLhB2/foe9GgdKoElkZZCyHMPI+dZ4zxVJd/lxUYkqnMqCWs7yQurcRmYzQV8yjziPwTkUax5e22KrimJTs9ZQh7/gvcHHLmVPuIA2FmdpB5KuCn8g0ZC5ghGR+AkdZnYaoqI3bdxp4OFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717513801; c=relaxed/simple;
	bh=JkUSeiFunRxHOTWfDcGmh9AFt8gR05QkmrOrw39y61w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mDab/ryfBq8Kqlxb1OXDkSNvwAP6H6fyKpxW8ntVXrHHQLfgRVKyQUtu4M4wJZj8eHMtcthrtR4osHxd7JGFX4caqWyzxv+U3Yo6RbYhjdnIHaXncAV73tvY6cJaAURz60y1zt8+XWP0HBoeBksjwF/+d3NXt3WcoXUpd7duijI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lncSVRAT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lncSVRAT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDA15C4AF08
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 15:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717513800;
	bh=JkUSeiFunRxHOTWfDcGmh9AFt8gR05QkmrOrw39y61w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lncSVRATwax7b/lGsO9wFR0KLoSiXRxgooS6UPaLTA35KO/gdpQVQm5sak6fMFtEh
	 B36YB2JHTsE6l/LkJjK+cQxzTP5sdzpo/3OLabEOObakBmnUi3BP8596228btavZw4
	 zlBdyf4eNkUHWPY0iAVM8FDDOG3goDhWWKRY3kfXjaRbhu3OJJkgJO9W+ggsVf1s7W
	 jUJ3cxHVw3xpxodXoN9GXQIfGAZzkJvv8ugDu3zTn0VI5ggINVXOfyQ9uugT2R07eu
	 z9e5VIGUM4xiSxEnf8Ljc+56Nj9aQ5sHD/gdeBVI2y1aoUSsrBDIaxwMkByygGCnS2
	 BCpaw0IhIO98A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B32E5C53B73; Tue,  4 Jun 2024 15:10:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 04 Jun 2024 15:10:00 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-QMO50PYM3o@https.bugzilla.kernel.org/>
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

--- Comment #38 from Armin Wolf (W_Armin@gmx.de) ---
Ok, in this case i will prepare the necessary patches for upstreaming lg-la=
ptop
support for your device.

Does you device have an airplane mode/rfkill button?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
