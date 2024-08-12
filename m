Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0D81EA8D
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 16:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723478594; cv=none; b=KHjDB64+Zoh/n/4Hnl98+2leyZ4R2SSKRYvX5NYbil9wU2h73xO7PLO7qx0AsWuSFb9jxrDpaEcATdWFfAv/chNfdJ6UgvxPBT3iRkWYrsQEPGhNnNUiEL5kdn6Qax0Gj7BAAuDpIEJkIaS3iFYa+2xVjcPV9h2gvTF3QFgIg4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723478594; c=relaxed/simple;
	bh=cOosRB3V96Tn7kD8ZSSR7ydWqiaAwqSY2dpCFSF0Zn0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZpmeaKxKa61C93O9wPSrqy0/SZfArRGcTS4zW1R/iTbie35N8/gr9kruI7lwA7RZPzoRa3f9cYAyc3u9KDL2o8MzZD3DRhIStdgL7IahNs04s/eRIfoPhlK40eDr/Fhe6bOnP79PU4up/Zrwun5s/dh/PcumFX3T5I6MsNqK78c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s9kEB6jr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s9kEB6jr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 659B9C4AF0F
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723478594;
	bh=cOosRB3V96Tn7kD8ZSSR7ydWqiaAwqSY2dpCFSF0Zn0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=s9kEB6jrHJhgG4vVTCs9nNGuu2CKIf/hBqT5EHwfWP9GMpJSbbx7hSQHIY/NsLEuT
	 SrOJmiPIWUdY8EvLSPO122v7Xbq/g0511LbIzAzXAwN4OCOxH/c22EAHU9Gvcmk0//
	 AqaFTUe6kcZgllV2B+SxaQwEr8pfYc6/9Me9gFCBZ1lFco8aUIpm4AnuPwLNBtJwS0
	 nPRTpdqCMyHeqUf4iFMNqMvDcXqyJOZSvZv98gnsRo+bJGb/T4HUvj4PgWE5uZRvIJ
	 HqEguccNwgntNTlwkcAaCS7I9LTSqGiS2vwPfkaJi2Cyi/Y/6RrgBI6wgQe6uksnAV
	 C+a4djFPIMAQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 60248C53B7E; Mon, 12 Aug 2024 16:03:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] amd-pmf AMDI0102:00: ta invoke cmd init failed err:
 60005
Date: Mon, 12 Aug 2024 16:03:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218863-215701-wYntw1TIrJ@https.bugzilla.kernel.org/>
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

--- Comment #30 from Artem S. Tashkinov (aros@gmx.com) ---
Shyam Sundar S K,

Have you had a chance to check out the dump?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
