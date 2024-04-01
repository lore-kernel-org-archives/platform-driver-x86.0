Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0D340C15
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Apr 2024 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711981428; cv=none; b=L+WXovGB8vWhz5ADOwm+Rd15cevn+FmN8cuqZRLrBln0Hgzaptpxl5zyBzQnipURsQQdONxrM1LDu+nT2joYurZZNSyCWfI/DsYkuyb7q1aKbqqfy0V0k3bQaB1v2kg3H1Lc56l0jq+QkoGbkhVEgP09Fvu7R5aTOSUpxiVDyq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711981428; c=relaxed/simple;
	bh=ZTYWXg9qYiXpnkRVLT0g+lTf93hDIQRevrgXVP8LeEE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g6ZiTjeABtmPaRNbXwpC6qE9/3D8KYWdKuIQBYcH8brHJORjrzsMKY+c5iSwV3KwIN4Vyabu3qCxPhF501XUYGBGzRwQ+5Un67fwHp6jRQmieM089QpeEdkPi/UT5NwU1Dsbo43Ad6qsq6/G78j9LLwM0wBRip7/QqhFst+I8Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QsCYcVOm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QsCYcVOm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 602CCC433C7
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Apr 2024 14:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711981428;
	bh=ZTYWXg9qYiXpnkRVLT0g+lTf93hDIQRevrgXVP8LeEE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QsCYcVOm8kHRDvVCB1dV+KRSoUhtPnMczCWeyf3LTCC6e6m4YVJfXrrJP3/9uLtsu
	 kW5azIVKkEWOZCMI+LM8wdU2Y0hG09BWVE7/FmS31sXYD0n8+VF5Ag5ApsMQnAV3dv
	 VWUklZK5QTyp9tTd8/Rh9mC2TyONbvLMTsr2N56dy1KVPZO8GTeazQZvwFm2iisrXJ
	 wG9TB6VCvYDyFgcYeHhSbwc2NvGh+CtFKaof5EfZYFvIleF4TSNvYhb0mEpUFhvn8e
	 6L1GMw9r29Zan2hvK70aeIbA45pddq6WBd7jwPibg1qWYJuT1zcbfFDIW3iBkK/vMD
	 WS+DKaXleNoVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5072EC53BD2; Mon,  1 Apr 2024 14:23:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 01 Apr 2024 14:23:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-bIDacpPaSV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #45 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
If 6.8 is more reliable you can also try to apply the patch to 6.7 or an
earlier kernel that could more easily trigger it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
