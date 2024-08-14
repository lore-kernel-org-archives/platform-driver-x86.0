Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2046394
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2024 03:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723607281; cv=none; b=SF/zTYeVqBIRU4ByG9DO0n5SaCs6imUpRkc9TpOw2M7nn68zcIroTu6TKLOHbygIuZcUOLwJ1TWawI8Cl2vhFtf+txdceSOCMg6UrQQtp3E4O+Zs6/H6kTPM966QDVhXeT0gguzpxqTice6QvOwAxS6UCu+61e3J9hMgnT3d1QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723607281; c=relaxed/simple;
	bh=zmwF8qobxar7jg0XyMpZraLPXxRi2dwW+3TYti0MlmM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B2Q1j0paAOOIUOX7f0mmx9aoqLNymnFXIbJOQ9kK1H7cO8KhcTp8pEykvGgxNbvC8ebXoD9rcc4LBJ/NZWSxuUrTXCF43dkI1EDintAsO33ZCkrDEJCya1b63iViSJq1kevRyMXj0tfkyB8Ql2r4VfUS7saMO+8lc5ZuJu1Ov6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKZtAd+o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKZtAd+o"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 563F3C4AF09
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2024 03:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723607281;
	bh=zmwF8qobxar7jg0XyMpZraLPXxRi2dwW+3TYti0MlmM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FKZtAd+o+IV+3NYpxLfVUApq7UAIhiIQpaBiqqZslXUd4PW73Kwr7WL7p+LtvmZKX
	 o7f36jpfftYX9tq4X7ab4VMAx4zIkPlQBBOP+KR392iQd/6VZ0F3/pLFeYcb03u0iB
	 GO5dmLYPoK5Vq+aEDgkU2IRQhuZq+VpzR0Xerzn9Jvj9bESms2VVlz64XY9lgbfgqd
	 VcF4HZZAV0kJ1e4uECKuFpKnyEGN3vJBcLZXZoxq9M6KAD/8d6Map87DEMZd6HJbxS
	 IEMPFa9JBHsSXQve5OFPhhZXv+WeI5gNR7YxjaIOB2jcdO2EJRz6mPvH/kSFCLOGGA
	 IBZKIlc8cNoIA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4A98AC53B7E; Wed, 14 Aug 2024 03:48:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] amd-pmf AMDI0102:00: ta invoke cmd init failed err:
 60005
Date: Wed, 14 Aug 2024 03:48:01 +0000
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
Message-ID: <bug-218863-215701-o8RpK512va@https.bugzilla.kernel.org/>
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

--- Comment #31 from Shyam Sundar S K (AMD) (shyam-sundar.s-k@amd.com) ---
I apologize for the delay. Upon reviewing the dump, my preliminary analysis
indicates that the critical security metadata required for the ASP to decry=
pt
is missing. I am currently checking an in-house HP laptop to determine if t=
his
issue is present on other devices as well.

If the problem is widespread, I will collaborate with the BIOS team to depl=
oy a
solution. If it is not, you will need to contact HP to obtain an updated BI=
OS.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
