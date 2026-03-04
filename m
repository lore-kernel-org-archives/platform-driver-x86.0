Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4F3358387
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772648736; cv=none; b=C4i817VFxyXXzXRupGvCJ1l6iGhBHtyXilChGFF3FK5itj77VWsc/VIAeRqQr/a7OaqejBS8N+h3jBp7jaVdFy/VWa1ep2pZu7Qk1Po35rcjA1jbMR4jNbh8A+sZQAVZWvo37Lb08uRpQ0gjoWBBaP7BGFaxxmv5wqRK/RNsVb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772648736; c=relaxed/simple;
	bh=JK5lIdLba8VHzZZLr8FatBGL6Pg4SFPfO2CdW+dqpZw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VDz7M3kMFdj/k2f64K5hinscl9UX5jzDWrteGA0mfwWtGvCwet77wvIC/cO/Q4SpRDyJh7CZZLdZo9vG7rC+SKYf0VeQ/xYobwhKo5Dydcc3jpFFal26hdF+An3r2ad49IQGe0CNokWzTqKr1TmW8kTjCF8SvAx9wzpx38WrB0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMnCQvy6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMnCQvy6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0693C2BC86
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 18:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772648735;
	bh=JK5lIdLba8VHzZZLr8FatBGL6Pg4SFPfO2CdW+dqpZw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bMnCQvy6/jZ7JIanFBftI+ZvjaL9I2A4m+acxlqMHRO4uvN4Xq6D3FZuT23gtoiY4
	 nOMymAPqOSBJlgv5r4RQjdaOu/Xdd983kdA+oBwzbIruz48xIxXEIvdnE7+LRQvGS8
	 sDSBob/99yatxKqnRig5pXvbQKryAWIKOukan50ikf0k2MGehXxNaE3QqHYkN9hxBw
	 2JBzjMwyWj4yFvmxDG7E9RpjD7bbKmaiHlFQhXkm1YeMe/LYOTPCJqe9TxJ/5dJh1s
	 8bJYwvHCb+1TZSvryaUG4GSETGimwL0gTJKrgC/H5r6Im+bxLIcBnPt2rtyC8TVbRB
	 JYxSn7Kvi6jEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 90480C433E1; Wed,  4 Mar 2026 18:25:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 04 Mar 2026 18:25:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-9fTnQ7rzqo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #48 from Rong Zhang (i@rong.moe) ---
(In reply to fililip from comment #47)
> Created attachment 309511 [details]
> acpidump from 83HN

Thanks. I found some time looking into it. It has exactly the same issues a=
nd
broken patterns as 83DR.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
