Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6994D3002DC
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2025 08:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760602467; cv=none; b=H5TfS0npoZzUef1JMgqqozhENqMb/drPsA7sS0BVW/t1ocEDyDA4Z/7bhBu75W23nU2xbIplBZk3iRgDbCQbO0W2heB40iCsfJ1NmwnMkX/Eat4hsOoVjxWRXhme3uhBjQERc8u2IAcdgS5T+ivP3ssb4I7NT7X5vSYRksCEgEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760602467; c=relaxed/simple;
	bh=b3kpISjnHnpo2kmKMpDsEifavzaoqsPdZMcU1+FWhB0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gwa46ZhvnIC/uaoVtD8c4ktetBVKmoLldUa9J33OX/7uoBTiTUFCOYL3s8bvula5OlQ4mUIBiNQpqBxVcPKtFJjgsTwvYzbKDahz2g/yY2NCCEh+xM9uid3rs70XEiWceouGZUG6+a7hMaGxlU9W6fhJ4jTP2Pu19JO3aGvn+sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXTjk+IM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXTjk+IM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECAD5C116C6
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2025 08:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760602467;
	bh=b3kpISjnHnpo2kmKMpDsEifavzaoqsPdZMcU1+FWhB0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tXTjk+IMDf83+UTirWiFyYd5FrKuZqINLKOsUi06VKQJ8rGVzDFFOPSoV1pp0OrWG
	 OktWXN2tP/Dm0scWFCLtbw3Kd5kvTJOMUUGrTmPlSstg5YGdK5SH8HUlg0SY+udbSY
	 GYzdLjNhQDNC2+A2jgLDsbF0kgK+bEqUuzAU9He9NEZBGbQ6plRLqdqmsFI4WiNrW6
	 ffAbEeJjl5LzZxed3B4FEHp5KeNE6dOoOAaLEAGXqkDS65SP9zLr/dbxgSeTVUEAll
	 e5TDXYN+N4WdhFGkMqagJLRdL8hpZunOEaznzUzAklQp9K3elzHJhhHQyNMIcwrWid
	 IbqwkH9XG0R6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E3EF4C53BC9; Thu, 16 Oct 2025 08:14:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220670] Accelerometer missing on cold boot (Lenovo Yoga 7
 16AKP10, Ryzen AI 7 350)
Date: Thu, 16 Oct 2025 08:14:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: novatitas366@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220670-215701-1H1JcHQ8Y3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220670-215701@https.bugzilla.kernel.org/>
References: <bug-220670-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220670

--- Comment #1 from Titas (novatitas366@gmail.com) ---
Created attachment 308815
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308815&action=3Dedit
dmesg After Windows 11 Boot

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
