Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D5D230983
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 08:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732179567; cv=none; b=CHTUEjK/LfKedtwuErjb1AfEBgGN2IJd2k0JdxLZN81whgC2UB7tTtiAX0TIDkX7vdDWXvWsISBJNOIChUD04yTTjSvzmZ+2mfdtSA3Uc1Z2hFo757nt+S0+kIIR8SEtY9hJOpOTkL2pnVZOJaARlgAwfvMESi+23fYkoQ3cn14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732179567; c=relaxed/simple;
	bh=ijiEbrZnMaq91QHGzKYkftX+GbIy/I4Dxzq2js3clpA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LiGijfptwB/XCz/buW9xXJdAc851f13R27VGqsGmXnlCUh2JNAA0W7sIlIKD/GY4NaBx5MiPWqD78ynU4iY5UGVOAtGMklz0pXQ3cyn3E+ASx2xbKVw24NQfrJB7QBF9hs3z0KZCaLF1dSwfg+8bBszPEA4Jrjf5r0RNT8TaS9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKIFo8Mh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKIFo8Mh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C3B5C4CED0
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 08:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732179566;
	bh=ijiEbrZnMaq91QHGzKYkftX+GbIy/I4Dxzq2js3clpA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oKIFo8MhiRWEiD7CvKnZRNvn/xrgsROj0EUZ+7MWRlzJ24oKtlIxxnGXhqDPfd6Br
	 pf1BEq1yl6oXFEoU40qmrCAazjF5UuAuCOwPFcblvhZvkiBrGHX9KzmBbYYXpN+RYT
	 pc97MpD6KMGiH6hC4SeUBgkwqlKtNEDlexZEILBEJLbOgQQndMlHxihSeSA9uYq5a5
	 ojTVTrp6Y+NUlOB/JJ6+jAmjvR2oyhUAWrMNhC4MPUsnEr1+PyNOsL7DCKTNJH7UhG
	 BUIyojm9H6C4y3BYJZ2a6Wiv4D+4pJZbNp+sC8T4LTR5FBIfpH1mAdsra4FW4UMcwe
	 GOriYRlbZDITQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 77FCACAB783; Thu, 21 Nov 2024 08:59:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Thu, 21 Nov 2024 08:59:26 +0000
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
Message-ID: <bug-219517-215701-L8Dqlyjf8X@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #4 from Armin Wolf (W_Armin@gmx.de) ---
I see, the kewly added platform profile support fails to initialize and thus
the whole driver fails to load.

Can you share the output of "acpidump"?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
