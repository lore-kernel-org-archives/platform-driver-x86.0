Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D771DDC3
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Apr 2025 18:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744656945; cv=none; b=qRQ25vtCb5uFoGRtBmIemz+mrON2IFFsjOAzYySdLjnNvDQDoqzaazJGUCgz16WFyJEZ2iCjYoFM02Ielt1F7HNJAFeV/vswD8mIFHJ28sILV1OWGTgweho/bPzsRFNagHP0bpkIj/rjpHR7jlVsoSop7X1QB1U1ExOlJ0CAtvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744656945; c=relaxed/simple;
	bh=jv0lb2w5Y14cMCa+SLFO36ht9UF75rnB928VxYN/In0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U1Jy/vomcicpfQnjeunKRFd9PMjYBYFx4QziZAcw4bfJvkHm1bbfEjYRkWtZYtnNjB5dwB8W4A0x66XqlDDf3JRiwedHInLk9DRuJ8pmc86eyLrH07RxG3WbBKrI4jgphesG+8fy3oNUYKEj0r8+/lNKM0CZumpIkJBo1T6/2zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s21qCRrv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s21qCRrv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7539EC4CEEE
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Apr 2025 18:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744656944;
	bh=jv0lb2w5Y14cMCa+SLFO36ht9UF75rnB928VxYN/In0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=s21qCRrvobgYpmSXgKWOnyOo5VdWSh19xMh4HLD4Su2pL5vmWh8TThm8ov/nzRvA2
	 De1MO88/g2mYNjmVuvO2vC4ThU6OVh4mzM5Cog7yVcj6vUphhzd12bTdbXU5iZwVq7
	 zpJD54llm7GOsEvxc7M5m6FkHENyzc6ZBB7gAkprCWrowBK+pCU9CWNRe48APuskHj
	 zzC+l42UpeI13UTYO4oNQ5//5+Du7+eoqVMJ5BiRrng+I+pWPmJzPxCxPNWGiV2MIc
	 g+EroGcYZ3k2LGopplu0ruRMKguPqXFqEI+UGoKZqtGuyFPO73lX1yvDiIqpTb1r2r
	 tJtaCHprpO0xA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6CDBCC4160E; Mon, 14 Apr 2025 18:55:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Mon, 14 Apr 2025 18:55:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-6UYJqjoH06@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #304223|0                           |1
        is obsolete|                            |

--- Comment #346 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 307964
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307964&action=3Dedit
Asus WMI for nct6775 v6.14 base (2025.04.14)

(In reply to stonetek from comment #345)
> (In reply to Denis Pauk from comment #344)
> > Previously i had checked build with steps like, clone
> > git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git, checkout
> v6.3
> >  * apply patch from #327, add "DMI_MATCH_ASUS_WMI_BOARD("MAXIMUS VIII
> GENE",
> > &acpi_board_ILPC_MUTEX)," to asus_wmi_info_table, build new kernel with
> > instructions from
> > https://github.com/asus-wmi-boards-sensors/asus-board-dsdt?tab=3Dreadme=
-ov-
> > file#kernel-build
>=20
> Could you please rebase on a more recent kernel? Thanks for your effort


Thank you!

Updated patch rebased over v6.14 kernel release, only build is tested.

Additionally code has support for
G15CE,
Pro WS TRX50-SAGE WIFI,
Pro WS WRX90E-SAGE SE.

If you have such boards, please share result of testing.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
