Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108C91CB32D
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723023629; cv=none; b=FtJMJbuznhA3vSKuCd/GxHrOhD4mTHMJFhuAB3/5PlkRJZDNawGxuJvbN5Ln+BUF18ce+1gka3j/18+3rWv4678gsKqk0kVW6Zn0+zrud8hU7PtQ2ppNEkOO7vuDtY004wsPch2BOnO/c0F5XzmMUnP09VDwT05WB7Zu7mWbziI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723023629; c=relaxed/simple;
	bh=NEgL0Bahu4BZA6HW2jmY2H4Uq4qMrpJDmPE4MAxBWpQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fyo8Qdq3YeKrE/a6xltSzCVyqeLUN+2CG83E2Zr9OOoY2DS1lJ6QQ7okgjw87c90AEx/iuIEZfnA9/VBOdcMMU12P61HrbsyEHlV4cO3l1clHJTU12SY4NL1tr1+XpM0HQFUxceQYLmVXaENNwSeT/lzi+PvkpJryNnOmpA5Gek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8g/4ekt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8g/4ekt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 949CBC32782
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 09:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723023628;
	bh=NEgL0Bahu4BZA6HW2jmY2H4Uq4qMrpJDmPE4MAxBWpQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Z8g/4ektTTj1bg06tpsU1FFm/yCW9mcuIbFiI0gBlW+qbbQt4ALPc1FAcsEorTbyB
	 wb0LjgrAlWZzhwKyuQ+m8MlUiPZd1JA5hCfbl+c2SvetmClqBSTUvP5dfKHQ2WEvsU
	 gWimIWEInkadwCLSee+dWjcN7qcF4gILmA6uoeC54Tnxl6A2BwIALmlKLJCBGbUFD1
	 LyjAy/FK6L7GaQZUjs+3ZVpPng1NGv2dAkF/kg4bmnrsYhwNgZsvQ1DeHfT54B2ePV
	 talmXQnhyowWwdvsEaVnrNeIaTLMkQbtwvAtPegOG22IWo2VD8ueskyXhY8DWWPeiJ
	 XtUViJKSArzaw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7DE38C53B73; Wed,  7 Aug 2024 09:40:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] amd-pmf AMDI0102:00: ta invoke cmd init failed err:
 60005
Date: Wed, 07 Aug 2024 09:40:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: blunted.tip@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218863-215701-M6ABleAzTV@https.bugzilla.kernel.org/>
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

--- Comment #28 from blunted.tip@proton.me ---
Created attachment 306679
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306679&action=3Dedit
elitebook 845 7840U policy binary dump, 6672 bytes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
