Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC5F31D375
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Mar 2026 07:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772348975; cv=none; b=as3WL252llJR486iwr1SBAbebM6pU41VM0ledUN69sAsEoxAAKhLXvanM8nFeFYe4Zpqs2wZk3ftAMY7zjmd62lQrkXqUCMRajP7txegsh3aU+e56bkNbPHmO1zAs1x79K8VW8nyFz2hW28CRkpi7cX7cyghQbuht0xdSU2sOsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772348975; c=relaxed/simple;
	bh=MTDR0P4NxzmMyX0QNtqvC77d+XdoYYB1tglsZ0KXd5w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HGpL+mL3QzKFzSUs0+33mBX5Ov3U60xAzTB0NXOddUCuS/czIljMdQU57PqwCN10C8+RhxvlzcouruQk3j37QTWOOhIb16uVvg1ji08VwBO+KgouOuuLZNAqZF08x0JPeMqXdDn2spanyx3IVZVPeaOL56s5xJHitUcC3JuI6Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SL2anHlP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SL2anHlP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36309C116C6
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Mar 2026 07:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772348975;
	bh=MTDR0P4NxzmMyX0QNtqvC77d+XdoYYB1tglsZ0KXd5w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SL2anHlPV9IDZ3eDujPa4tXLvjPzyAtm+GfDWmaz5R9lhxJDnnhYlaKCbLmCd6k2C
	 VU+xZLEesI8ldIfhhbBUGAIfthVgW+wF6PaIxIOLHz5zxW4TwwPSyn5dDHHpXaEELR
	 G9YUA3d6p/geTxHnQp/2HtaJbhXgTw6dKGMJG1+hjeaOOxiM1zWwobPjmRZ4Q8vr7L
	 soGvsK146tLtp9LjqvtT2/poQotWDeO4KTrALjDNwUwxdhCUvF/jmB+nY//D39rjUb
	 3inSuc4smiwVBwAyzHIB5w0vE4w5V4bkdw41TJRp7Mhqr0Q74GOtu/51nLXbjYW7ld
	 XgHRr/e7nbOPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 256B3C3279F; Sun,  1 Mar 2026 07:09:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjExNTBdIFtCVUddIGhwLXdtaTogT01FTiAxNi1rMHh4?=
 =?UTF-8?B?eCAoYm9hcmQgOEE0RCkg4oCTIHZlcmlmaWNhdGlvbiBvZiBwbGF0Zm9ybV9w?=
 =?UTF-8?B?cm9maWxlIGFuZCBFQyByZWdpc3RlciBiZWhhdmlvcg==?=
Date: Sun, 01 Mar 2026 07:09:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: qwqgong@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221150-215701-In0d7i4Q6d@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221150-215701@https.bugzilla.kernel.org/>
References: <bug-221150-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221150

--- Comment #7 from wudd_maya (qwqgong@gmail.com) ---
(In reply to Krishna Chomal from comment #6)
> Glad to hear everything is working as intended.
>=20
> I will send this patch to the LKML soon, could you please share your full
> name and email ID which you would like to be shown in the patch's
> Reported-by and Tested-by tags?

Hi Krishna,

That's great news! Please use the following information for the tags:

Name: Qinfeng Wu
Email: qwqgong@gmail.com

Thank you for your amazing work on this patch. I'm glad I could contribute =
to
the testing process for the 8A4D board!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
