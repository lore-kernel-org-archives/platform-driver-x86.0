Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0F51C701F
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Oct 2025 14:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759759322; cv=none; b=FazTv4CoUMPYNj6dXFONpf+jnJ30XghHd4c2ibcZ5Qxaz+7ehKc/+BhSXoep1qX00Dl+re5V89jNqVHMCSqeHz7/444AfosI2PExoe53UPNdbVnVwkG8actjh04NdTBFeyEfwCrh9Z7zkckBKxEN9dvmX0vHGnD5maUuD905xvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759759322; c=relaxed/simple;
	bh=VNU+GRwfmFQkcoAZgXJpAhJ/+bnOcNgMQJnFujFZMzo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AxbfJT97pqgvKKGT8MMjgEik2YzO8jR8bsUVTpAwxGdfrQVyefmm2gp8EKMZLBXrRnrDJznfxaOxQFRhVeTZ9t5xVauYzq6sCqNk3y7l+ruXFIye+zHxJvLM9NLB6IHVdEz3rkrdzgVDWXicenfxi/I5PaLCrzS8drvu9zPdtqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFZZZMAW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFZZZMAW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3DF9C4CEF5
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Oct 2025 14:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759759322;
	bh=VNU+GRwfmFQkcoAZgXJpAhJ/+bnOcNgMQJnFujFZMzo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SFZZZMAWqDt2wnR0lzBbyoLFNQGGUjdEWL2PzjxYyXjdj2ekgrJ2xNzGHKn6e+rVY
	 Otaucg+HuDjY8J/wqNALFZQVkxwlvU5stgq+TvW8/VQlB0jCK90oM/NevqT1FidwDf
	 2TnfPGV0dwZxSOP/+Z6mo6cxvzJDsw4v5VXPcNL8ZCabO8Nd2+47ooXlzoLsM7jH5M
	 XPVdKJb94pv1vRxGduGa3Iu9GqHLuA48+WuynmsohZ033uJzjkOScnwskl8c7zFIwl
	 gl/CEC514+ZIRXRXhQb2wvnkISwTqNN4+8ybKw2G/4+5Hs/2PNguOu8Rv+WmqS0o0Z
	 2ppD3AlEpCtjw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EDEAEC53BC5; Mon,  6 Oct 2025 14:02:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 06 Oct 2025 14:02:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: petar.vidosavljevic@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218305-215701-ARRd1pGVcq@https.bugzilla.kernel.org/>
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

--- Comment #134 from Petar Vidosavljevic (petar.vidosavljevic@gmail.com) -=
--
Created attachment 308756
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308756&action=3Dedit
petar_amd-s2idle-report-2025-10-06-with-patch

I noticed the 544Mhz issue on October 5th and I'm running the patched kernel
(quirk).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
