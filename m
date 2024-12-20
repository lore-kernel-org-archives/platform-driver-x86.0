Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015581C1F08
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 22:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734734900; cv=none; b=n7OI6NpwdfWcqrNf98FkK00V9dMim4Nz/7sgbDoLU0BYu7TBF5W4cr1eosWNPPKDNwOieoLEFEnsq/LhFtW6G3R3nMJ7tRQNTSDeFNDfKfYwZW2B9X4TLIQ1ow7zJKx5LyXXWykNcVoSrPXtb+r54RrV/qDtuQ8hugHl1GpTw3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734734900; c=relaxed/simple;
	bh=xZ7HXYE0Hw9uFqGtI50vFxlhe+S7GybV0J4WwTPqaqk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O34nAz6jWXIQoRrSd7zHKv4H53PiqIDhn/egiInkEVH+gUO8C4+fQKAjJjMf8gtJM1ZEuSH0EtlreqNExivvOpvcGr0LDdMEpwtr8fm8lgD/od7I29EdzYrXKAj3zLVJQ8BeTOOrAMOqt6pxk8VV2YojVRqdKrEQZUj5+frUGvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxwimDO5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxwimDO5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 943EEC4CED4
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 22:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734734897;
	bh=xZ7HXYE0Hw9uFqGtI50vFxlhe+S7GybV0J4WwTPqaqk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DxwimDO5kRBriPwqimV9l0P4R1RJbPSCGICd9eT3kZ6OT4WhCWT6Avr6K2VRhMeCT
	 naoj8PBNNiYCxizx2L91mv+xRCfWxg0wgOJrxiPQ2u6cC7fhxhdokfzp8AQR2vpV7W
	 Oa/CwC7pyTHKpcob0844QK7d5Ad64OVCsRs1ts1jeGHOe/Sk804tmE621LEzv4rCuq
	 +C+9N+opSafLYF7qTbA7urt0aJW9eJjr+3Ejaav7o9nkoqV1eJT7xpNpaScLSCMH2h
	 VgflehWwGvBqdpACHYplJ/Twu5JW5+l/j6exQGe4NMqHaP0ohqHWjTfAYPAeoZLWnC
	 ju8hRLAQg2FVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 837FAC41613; Fri, 20 Dec 2024 22:48:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 20 Dec 2024 22:48:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-219495-215701-HoiexRVu15@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

jarkko@kernel.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #307378|0                           |1
        is obsolete|                            |

--- Comment #42 from jarkko@kernel.org ---
Created attachment 307380
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307380&action=3Dedit
tpm: Map the ACPI provided event log [compiled tested only]

Only compile-tested version (test at your own risk).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
