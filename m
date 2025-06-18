Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B4321ADCB
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 22:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750284248; cv=none; b=n6WgRCqScKm283tReN6DoAfq08e0cdi5xo6wtKlkgjgDkxoZkb4DZHW8JksG8ZpOYUWy1/leUPuWV3+v07qWPrxEmga0CeM7q8Pa40TZc3bvWdPgyyJvKxkjHzfYAcT5Er8GCfYDk3ttrEPE2Luwgjm49a1866lIC3LI3ezV620=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750284248; c=relaxed/simple;
	bh=HWSCASKxz2OxP8theWmvOc2lvbCV2VKpf72GJs6ENxU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ONRD+8oAEbslt9owUBqjQD3HqLXsz1qLXzNs3nU5UrvlI+fbhLt9p0e8eFo3NwCe6K6fOIpSdQQXVixlxtJV9iQA92RTMk1VeY1t/50ZD650Jk6sWLUCK/GiwKHKM53ecJX29z2yBhTiNYFYGloohBpbA8cSKUIAu3ztSuvee0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7cVdWMc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7cVdWMc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC922C4CEEE
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 22:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750284247;
	bh=HWSCASKxz2OxP8theWmvOc2lvbCV2VKpf72GJs6ENxU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Q7cVdWMcHfLHrEgxfKsvPQWR5sLw1l7nQ4SefTAmSFzB05TBGs6UlGsI4CfDHXE/I
	 Fuma25orZm5YJNiTHuEA3OQUUWEglJ41XIybviLj1VkwLW5VBG9jzkdZYxq8zOgnwe
	 OC7iPIUshO3bwmc6OUicTnJCvVlGKtjR50LlqeDRk3FprfUfW53KiuyTGPfaQNrneE
	 u8K8/7HBRYFC8d1O0g5dXPxtxlsmKv4Pe2cpR54iYoJFAKCn6HMhocF5HAr/axdarZ
	 v35dYPwn8TV8YE77CARbU/2FAzqKDTJeox+JRs1du4xHNv9TXEOCISBppcpFgP9R2I
	 PmfkGJrRrbfNA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 97371C3279F; Wed, 18 Jun 2025 22:04:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Wed, 18 Jun 2025 22:04:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dimich.dmb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220246-215701-ExVIszphNd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

--- Comment #15 from Dmytro Bagrii (dimich.dmb@gmail.com) ---
(In reply to Armin Wolf from comment #14)
> Does the WMI event work under Windows?

Sorry, can't test this. I have no Windows installed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
