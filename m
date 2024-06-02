Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF4D12B7D
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 16:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717347567; cv=none; b=u/zyD5rby+KmtFKtu351/4ymntfcSjewIdDrD/wbIEMmCcBF2R+4C71ZmMrpgRTpR5bzfjqized66jqdp3JJ7NAu8pADbwxalDJC2pgvJOZy96gp5LOVKJzqdZZpbPS7gwwZkHcFINgoKwi/ZK3jLBnkk8sQm5XwcaKOJ0N7q0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717347567; c=relaxed/simple;
	bh=R6CKIoarHyn8FohI2H6Wz0w8d/aX9ZIjHji7pLqusi0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fItgvQZq7ErcxO2KwauycIpopF9aOP7w27z4Ol0KiBfAkOWUJn/x14uzS6bxyg8HtDgB7u3CfmLv7K4mllbCE3qV8dMAyBL6NM768smpsQm62reAoqJndK+TnoH1V97cxeSaTJ07d6FolH3xlafExWa4cVs2aRbP9Hg3Vf7yvw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8Ol3D3w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8Ol3D3w"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5882CC2BBFC
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 16:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717347567;
	bh=R6CKIoarHyn8FohI2H6Wz0w8d/aX9ZIjHji7pLqusi0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=V8Ol3D3woxNxAzs/UTgXT6hbflI6Fb8orS4Tut3V0Ovtdcfzc1/S/9Jo0JRm9U+X3
	 MSiaMIMna7LVwq3VDGudJwxUDDrjBOvMWXB33Cnm/Ub/IKlqHK6JoDh2JDWsapHetK
	 gW+dQC2/ws2/gDacEvQceo9MNo82nyVeCWVtrhA7KTbpwjPRypZcMPNo63DslrFKwk
	 BG5eYMeOyNaQQpq7BPsxcpW3orPN9y5ZmbHjRfX7yD7HVrlFfdJJxmvDXBoSh3QuD8
	 9ZShhvFe/QgggOqSaQFY00LDUiCReYPlt5g1TL/5vSw6sez8jHersHAL5BEAi+fCqC
	 Akead5Kz+FJug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4E250C433E5; Sun,  2 Jun 2024 16:59:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 16:59:27 +0000
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
Message-ID: <bug-218901-215701-ECPvxDF0Vj@https.bugzilla.kernel.org/>
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

--- Comment #24 from Armin Wolf (W_Armin@gmx.de) ---
Oh no, seems like we need to do a bit more reverse-engineering

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
