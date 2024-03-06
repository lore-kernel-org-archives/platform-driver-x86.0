Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8BD13E7D4
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 18:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709748592; cv=none; b=iJq7tO34LiqzSzmsUYqQQmjm5cPFRpm3d8P8jwlJcvwasBxJAS7ek9aqjHyCA2HCpn8MdUgHMrATpRG5xrI4g7oAD/xeIXUpf+PD8uCrdOEedUMJRNGim/fNiORjY+Uk/kIMPG/9ssDNZHoi4ZXJWl8LWdxqlbR1jHzmitncsgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709748592; c=relaxed/simple;
	bh=3rRHK/23G3fSYKgZH6HAWGJox1KnY24TJSO1ZhKfxrA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EaiG8dNn4diowxzm+4MYa7rzMMbvPOKey+H5lkyQM1Yz4vIdDQhP+r+oaDp23JgNI6WRMKJ3vq5glwPbQq973y58E4zLkn0iOu4bv0L4wjAIqYXrpP/gKMkSsWUDWJ6g5E9FisibNcLdueeSMQDS9elIvx7L6tO49bKfYAv68AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qyi0r8m0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qyi0r8m0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F62EC43399
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 18:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709748591;
	bh=3rRHK/23G3fSYKgZH6HAWGJox1KnY24TJSO1ZhKfxrA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qyi0r8m00MLZAcuXpF7Mwo3Q3ll+66Q0uqtmV4G6npIism2N5J9buaw/xE/v7Prru
	 eCOh2up9P9JVokMUUgurjKORmn9vWwY4VFB0q9kkahVX79y92VF3XFTWMm/cY+leBN
	 q0QikjtSMz/oC5Q8+ng8f67BOXBNFsqy4rGwRSd51BzKllUon1UuyIVEhCthnn1CTg
	 lDR3olS2bOwNex9IiV5kXAMKcgc+vW7vi+IckOaEGx/igIO+IldB1fWiLPPKzmn60b
	 jVx011kVzKCENipD1TM+nYT7TUy70fpwUN1yoALWX4ZXE9GFePcaoH0f38H0fQ83yu
	 lkLoJ84+y/mjw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 88316C4332E; Wed,  6 Mar 2024 18:09:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 06 Mar 2024 18:09:51 +0000
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
Message-ID: <bug-218305-215701-bJn6fkYx10@https.bugzilla.kernel.org/>
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

--- Comment #38 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
The Windows equivalent of the amd-pmf driver on this HP system uses the
features in kernel 6.8 that I've been asking Artem to test.

Once I know whether the issue happens on kernel 6.8 and whether changing the
profile manually helps it we can decide on whether to do anything.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
