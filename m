Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EABD3F8C2
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Apr 2024 13:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711977600; cv=none; b=EnRKAnFKDJZvcreYBxMfx6Sxl046+8O9IKeqZJUezVnNQ3F8hEKPPodfoyfmGLZoPIsHfZgHDZfJyQ3SlKCp2f3Acik7d6bqcX9UBb5CTrfmqlhSmuqhPtL8bW9JgqMzIcnkFY4GxpYhsg6GQcPL4cj4dL77VWaSilwSliDnUsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711977600; c=relaxed/simple;
	bh=Rh/NY75PuIPU9BWDTA1gkN+AsHnM9MuctHe5fG3Zdp0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WPSmwxKdThhjDyuxz7apn3JeijTDskVOk65TmVBRn9WLLt6t1scW6lY1OH4eRLZAybKMB5B5uSrNtx08X7qNKm++2EeIfdPU7frHwfWcLGZh8b6GkhzMEXs93yCJrhqUIMSLUbuLkjTQ/i4H6Q6C7Z5u0o3z1+tN0XssHuLsigA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZeBd8LDC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZeBd8LDC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9295CC43390
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Apr 2024 13:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711977599;
	bh=Rh/NY75PuIPU9BWDTA1gkN+AsHnM9MuctHe5fG3Zdp0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZeBd8LDC8i3rvQAF0EjAAsddWgfdBonHWFYy93HBhpzBZJBMIEYg2r6o+lx5VK/Em
	 37WJVpm+iDH8R+patYxiL0bCKMlcr2hYic6PA5rfno7BGOg7Os9ForKftT4Udqhkl4
	 MiEzfySJa1K6QWm3kNIV6AU2N4tnN21u4MwITOatKO+MEz565cC+L4efAHrdKYxEZj
	 XVl3LPjNdco7IdxQ56NOqIR4lJ3X7oEtaAjfWiopn9ymiY4bV7lpvZOlzd3B+76fwD
	 G3x8rCePsYZukzQqFpPaXKAr23CalRrDtqZtGW/e7OPO9q8DnRpDLSOmnpuOe8x6df
	 DEDxK1DNU6z8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 790FBC53BD7; Mon,  1 Apr 2024 13:19:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 01 Apr 2024 13:19:58 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218305-215701-CrUrceKbE7@https.bugzilla.kernel.org/>
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

--- Comment #41 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Created attachment 306075
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306075&action=3Dedit
possible patch (v1)

> It randomely gets stuck at 544MHz.

Are you sure it's random?  From the above discussions I believe it is trigg=
ered
specifically from an event sent by the EC when changing the power adapter w=
hile
suspended.

> with the latest Kernel (6.8.2-arch2-1)=20

Thanks.  I've been waiting for feedback with kernel 6.8.  And you have
CONFIG_AMD_PMF set?

> I just wanted to know if the fix is not official yet...

There is no fix or workaround right now, like I said above this "looks" lik=
e a
bug caused by HP's EC or BIOS.

Assuming you tested with amd-pmf in place and it really is the same root ca=
use
described above (only by power adapter) I was thinking about it and this so=
unds
like it could be a race condition. I do have an idea for a workaround.  Can=
 you
see if this patch helps?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
