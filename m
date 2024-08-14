Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425581B3F3E
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2024 16:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723652805; cv=none; b=gowpJaDJYaV0UlDNobEijUBUzvBu6kDg6rHZHBXmjbjxFXEzW4FZtlf03qcXEeWK7eQZSvpK/7ikiltkMIJiKGhW69X/Ecdrk0texHp/KBoHQbn2wRVkX99ED0WwMGTLuIgUttE96BYAXAZmEcgblRbX2H1OjDcoyl6cEzo4Swk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723652805; c=relaxed/simple;
	bh=+Zuswi9D7EkwN2Ne67v50olhgKM1qk4CaMXH42ueFdc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o+safS/gCiTcsHjsFuje5/0POMsmC4fhnUol1R+HCc3WvfnQY9HcSpsYML14VKZgba2iVLofQuPTd+nvumS06Oqu4XIGgn7vV7rM/PcB9T1ZbmMepCHOAvdnmcAGC+tR2fcyD3hwy1e3mntLI21+tZ9WGIaCg0zLCACmAiog2pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBseApyC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBseApyC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9952C4AF09
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2024 16:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723652804;
	bh=+Zuswi9D7EkwN2Ne67v50olhgKM1qk4CaMXH42ueFdc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VBseApyCNX2dSIxNcxclO844qjBEE1q0qs2aRwUdqxYfEBaoGFgOw/MMt1GshtdIe
	 XCdSPUX2gttq7DR3OYN1IX2bsgMaMYi0VP5LtrsN5wdvukSYfXZaGH1DJuGmhpbgYv
	 E1o6okSDoKyjWaVucoYUgVekYioYS+etM1C8arrtf5dT22JqlMG0QhXIgYoK6wfn9o
	 FSxQlGhwhr79531l5Hc80SkBVa425UWKjB2+GgldGZ68HITtGwH4JZn81iBsQaXvPO
	 cgDRkLSBBhV241kMLyHccko8i7fJ0N5nFyBF+CnMkGb6e9N/JiN/4Pyt8dJes6K//M
	 wZKrWxkkRRrDw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A8A14C53B7F; Wed, 14 Aug 2024 16:26:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] amd-pmf AMDI0102:00: ta invoke cmd init failed err:
 60005
Date: Wed, 14 Aug 2024 16:26:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: shyam-sundar.s-k@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218863-215701-Eox22y3YWi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218863-215701@https.bugzilla.kernel.org/>
References: <bug-218863-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218863

--- Comment #33 from Shyam Sundar S K (AMD) (shyam-sundar.s-k@amd.com) ---
You are correct. It is quite challenging to push OEMs for a BIOS update.
However, if the issue affects multiple products and can be reproduced on
Windows, we can build a case around it.

Please note that this process will take a considerable amount of time.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
