Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A42D346A15
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 06:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780209843; cv=none; b=lOXiaIMHjPwp3+3xC8uWN+qbuxn1hBd40o9D6ZN9LhEqgLJlvrIcXT2aDV4C2y/hVXkZ7sEutyEHm0rdtkHzDJ3/18O4Vh9sUIA5559StGh5Kv6QttE2JEV3E3Wmj2+AE8RZFebMtBxOMTZMVgP2GpsEzHD/WvHI/b5N0owXlzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780209843; c=relaxed/simple;
	bh=VDgb2VjrqlR3A81AOeKH/tS6fBDQIR83oyq0DFWY1s0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CZ0ytY6tNI3kpED0Jxxa3S9UNPwHrD73dX8W4e7bTgVBHoLGh1pCbFS7qoHNdr5YAHm7YTBSGrHHvXiIioAd2HnmrNvbGrCAXpjmx2Ue0N5TbrffiPTd05ZIo8M/eklX7x5fIJ5z1ymFbSZAUs/JcFDT774NDCK5Hu2Ppv1e8mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GB2RotLU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GB2RotLU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 042EFC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 06:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780209843;
	bh=VDgb2VjrqlR3A81AOeKH/tS6fBDQIR83oyq0DFWY1s0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GB2RotLUwkcwTZgz34OJl+inDuNNf0Gd08z8X6An5PvumxM8MJLduAYg8MzTDhDu6
	 1pfI52xiPdqz4YlkPmL/bX81todvtvLwVyXkRqXr0c724oJoHiCj/LSEzOGJ8t8C6L
	 gNngjQLelf85YmojHcpt08SMRKG+lf08OUGrv8EcYAbmx2OakEuv69BrVwJs8naHiz
	 lo0/gq58BGSAEvDMO4DvAtdN+Lp7/xHZiDdiqJUfpubU+a2iRj55U7xsNsJOK1qUAO
	 6halu30M2ZozNZr/O67x8hWYtb7coSnpesW8HRO3M2Q1PhirPv89gfzioyCiO3ICsG
	 Rfb4torV5fjUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ED45AC41612; Sun, 31 May 2026 06:44:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 31 May 2026 06:44:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-ShxdhLv9vG@https.bugzilla.kernel.org/>
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

--- Comment #61 from Armin Wolf (W_Armin@gmx.de) ---
Use the attached driver and try again.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
