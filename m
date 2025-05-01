Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A3E155A4E
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 12:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746102568; cv=none; b=RyFkmtxBDg528ZQshR/xjqq7ST7/9BJ/VluessowNUBriflqWzbqSAxEV7vxpeH6tj/aBPOPhddwdKthi8o3xv/PMs9g/43o+PXxdYYNdB2ueWI31y/vtQv0GQWssKp7yAboW44GUl8m2LbdlmAs7j7Glr+bHEzjhieEjKhtoc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746102568; c=relaxed/simple;
	bh=7JottNvimBghrhQ+ZEK231aaFV2TQJkgbgmcwp3nfS4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VRfstl6cB5qSKf2tOqV9Ln0y4AYRRCJBpt2seimHvXv3BdeUV+0tYqX5QV3hXXG7PTWScKY8/KHVA2vROs5pFwjcrfGC5U3DKhKilzrjr+4d0FyzQE97q2oo/auTtlbhOIN6WV5hueA7qmiV8CCHxz6EOMEaoDmY5m72MJEy21k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dg0j+eme; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dg0j+eme"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 039DAC4CEED
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 12:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746102568;
	bh=7JottNvimBghrhQ+ZEK231aaFV2TQJkgbgmcwp3nfS4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Dg0j+emevTup7D9w7Bclgv/9ix1U7HwLP2vpHDdHqjL+BbZFs+VHZV/l8/5evjYno
	 AOv7RSvAU9e2VZxBs/H38qksA6typREqVuLZzIkgdJDJU1P7G0+m33DukZS0FTDeEH
	 IvgCawBUEa4vz0liPmr2io2jNmm2yRJT8jqI+fzrnm8JiKU+gmqvI0ZDuJUeF8FQSd
	 YXGUOwAU5hPK0/00rCNu+5bdABXrt9GNjiE1S5GQXdeRBmlj/1LGKOffk4FLc9KQCk
	 d8ffk32N0pRjqEnpu6axvS8SCVcaglwHMNZuigwySmXNsldJ/jomnUbOTWb+n1QdKn
	 U2ZfhDa5aoZKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E7036C3279F; Thu,  1 May 2025 12:29:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219786] asus-wmi: WLAN is permanently soft-blocked on S5406SA,
 but can still connect to networks
Date: Thu, 01 May 2025 12:29:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-219786-215701-SlPVjJmuna@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219786-215701@https.bugzilla.kernel.org/>
References: <bug-219786-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219786

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #308064|0                           |1
        is obsolete|                            |

--- Comment #10 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Created attachment 308065
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308065&action=3Dedit
[PATCH] platform/x86: asus-wmi: Fix wlan_ctrl_by_user detection

New version of the patch which I hope will fix things. Note only the commit
message has changed, if you've already started a build with the old patch t=
hat
is fine. I just wanted to make sure that anyone reading the commit message,=
 for
an explanation of the fix, will be reading the fixed version.

If you are seeing this problem, please give this patch a try. See your
distributions documentation for how to build a local kernel with a patch
applied.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
