Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6FA1FD4
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 08:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781945094; cv=none; b=WEF4HTgcl//deWiLCVSrzGBpbHiN7IGFrDIXPPlKv+T877l3RAnjt43kNKngc0O+S1xXINatKEEpaQshqDrMCBSw1Q3rgqYQAT4qAizf4K+su3uduyfwi+3YKBi0GzacJ3Wb05Xl4ue1D1h7A+dDbaihtu03eaDiDcr74oUcanw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781945094; c=relaxed/simple;
	bh=UYZWjkGkEw9ruTAo8V+Z1/uFWiZ4vTcdvw7kph14724=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JLvgeFzDl+tHLwbJaQBL+oxOnNazXFDg0fIMmLU9KF9aBr3ySqWkJfTKAzsIdvLZqmTP3Uhrfm8IdirmilaYVvU8VzHEOzeYrsoZmwbbSUqaY4PqCzDS3xj5iu1id0v3JsLgAWSCXKxZxogGTObWDsmtUSExntjTNeZxyqdn+TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=buo9Ix8B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="buo9Ix8B"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BDB9C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781945093;
	bh=UYZWjkGkEw9ruTAo8V+Z1/uFWiZ4vTcdvw7kph14724=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=buo9Ix8BajuhSxGqwtsIF/fbq9+joHb/9e7OANf+1liecoveTRMTkQyKaQIxWH0S8
	 1pwO7p4IE1A/9sSFhXBRKf2VNH4ruYaFdDLomO07b16zo7SxhTsRI+BZl8uNM9vunv
	 677YYWFoN/LVgqFODwwrOa/Zytv6eDrazIyljfMYhgRYAfe3D5ymc7MfYhGXoNlRnm
	 D+05MFJakrcnsknw5eS+1kNOk6qPutliPR0PdcyWtVIGCsmdFa0qPsyg+ZpRR4sj/F
	 EfAWUct/57mIKl03tyq61FpDYJdUX9DzMmMlAIh3GEJDTKmAjI2U8OBhQma47xGL84
	 o8E7ptBXfvh7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 70545C4160E; Sat, 20 Jun 2026 08:44:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 08:44:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-PRqYjwlQ6N@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #28 from Milan Oravec (moravec@ukf.sk) ---
Hmmm. but why it worked fine before truing your patch and not after :) prob=
ably
coincidence, I've got GPU gang before during resume (black screen) maybe th=
at
crash broke something else.=20

I'm compiling with hibernation patch now. Thank you very much for your help!
Will report back.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
