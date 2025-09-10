Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66E48F4A
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Sep 2025 04:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757478458; cv=none; b=FTWZHBIU2xuf99PDk5j9V1eq7MYi/DCXJBRS3SAJa+qBZJZ7S2sz4y3TGFPBPH8yMTx67lyW5ynlT6ltMygZGGEs3zgLkLcrV293Qj6JH5KbDPMzHEqrVB1o5U+xViTpvY4o51FY4W+I0bZ545qtLlbW16dSa5hinpSPjpo6JCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757478458; c=relaxed/simple;
	bh=DF79gcpfzwDvBtWTTdRhjpk6MLiakEn9VjxEYxdp4TI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c+VMvgfv7MzjwRK2t4kMzDb8ZgT1IrQXrX+BnwcKUTmdWsUEArnaK+mcEaIoOAMbLwry771C9edOhoJoc3YtuoggEA66zkcnw9pL+sNW+3F10Z531kiNAHVF7JcusRCoGev5BSlNY2VzvSKcz2o7XbMSrci555uvX/l5FZE50Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8Uflecd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8Uflecd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33688C4CEFD
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Sep 2025 04:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757478458;
	bh=DF79gcpfzwDvBtWTTdRhjpk6MLiakEn9VjxEYxdp4TI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=G8UflecdsGxcfn3u8TJ79k5DmyTFO7acfiKwRDrhIPuqeuAdrgvI0/Uwi9FSi0Pa+
	 1TnWCHifPKYWpNaEf8Lj3RrzumKb4evwvq/0OYc29ja1JdFF4focT6zOFwlRKQQmEG
	 fWBmUmCLGceJdi1K4xW2YQCdnOnxlzQAIgY/ZWPfNysXtgxx/krlP5Ae4EBKR5sd/F
	 f8x59wfWs1zffcp/eSXppnggJokrwF2shOi5iAZlYst0njJT2RxabEU73ZSi50BAiX
	 6lU1Vw82Hq1AM8sWRRZ0ZRb2vRvDwf5xel0FmUYuoEV3sb2q+bzFmlCcvSRKHfWMvO
	 /3E18cFa8QCoA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 294EBC433E1; Wed, 10 Sep 2025 04:27:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 10 Sep 2025 04:27:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: petar.vidosavljevic@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218305-215701-xmoiqZZz7D@https.bugzilla.kernel.org/>
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

--- Comment #104 from Petar Vidosavljevic (petar.vidosavljevic@gmail.com) -=
--
Created attachment 308647
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308647&action=3Dedit
petar_amd-s2idle-report-2025-09-09

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
