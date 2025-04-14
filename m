Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE7717D2
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Apr 2025 02:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744599085; cv=none; b=bWvF26y0CtmaFZ75bhXcfSonekfYyzn3Fvow+wvDAyJ2SEm9k2aUodMUdAnpbY5kBRxC7EENerqbnHioywcXmfbEQxgNEJtB2Kz+4MR60f1aFnKT7C1mBUu+BTLkdEApDxQljQ7uDGhuv/ysIgHU5wXmwOfZx9OsXw/8nGjSuKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744599085; c=relaxed/simple;
	bh=bY8MO84fnxEolh18XQ708NseiG/nOUGm/kP36qNTlxc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=co0GpsliRRjXuepxTc/ne0x3xxPfKNT2PaP1jIqen+iCnP4a92RnvK1DILgLiC553h4LD1lBaNHVwXNNXUDoFJx9lJILJ9FEHNnPYn0TD0tTTi7bBl9ei/DHamYHLT84zxGPPpm/BLzC/E0sST8PngZzf+7YWKlGY9vLelhO3zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUeqkUbg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUeqkUbg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41BC9C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Apr 2025 02:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744599085;
	bh=bY8MO84fnxEolh18XQ708NseiG/nOUGm/kP36qNTlxc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aUeqkUbgpHHPyYNO3aggOk+sZwzGJLOctwn8xTx4g8VfSmwu1iH2vK/gCxRRqYRPB
	 /XUnrBpdJ5BvcXwgjUI1PjhdlvbQOF/JuPDkFZtyF9UqJySzbZyztpF5nHbSUbMUWg
	 pFKgn+1dhknKALs/BRYv5YpWANk6nDMpGYtoY0Er4aXjbTNppo2JZhg0hjQmIn1Ppa
	 Ibg/vk2D4r7SmRUafOrUk4nWAO0lz6JrmJwV9qRrNF8PeMqOnnYNwOrENM0gaOwkOx
	 7jueIBOmvy5NqoooEqo1ISibA/8OrmwPSzJ0QnUoe0MhO/M+en2Vu+wULGD64/N/fW
	 ptMMzOqOwKO2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3649EC41613; Mon, 14 Apr 2025 02:51:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Mon, 14 Apr 2025 02:51:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: quantcon11@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-5U5sPnBvno@https.bugzilla.kernel.org/>
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

stonetek (quantcon11@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |quantcon11@gmail.com

--- Comment #345 from stonetek (quantcon11@gmail.com) ---
(In reply to Denis Pauk from comment #344)
> Previously i had checked build with steps like, clone
> git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git, checkout =
v6.3
>  * apply patch from #327, add "DMI_MATCH_ASUS_WMI_BOARD("MAXIMUS VIII GEN=
E",
> &acpi_board_ILPC_MUTEX)," to asus_wmi_info_table, build new kernel with
> instructions from
> https://github.com/asus-wmi-boards-sensors/asus-board-dsdt?tab=3Dreadme-o=
v-
> file#kernel-build

Could you please rebase on a more recent kernel? Thanks for your effort

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
