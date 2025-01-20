Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E26236D
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jan 2025 04:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737347060; cv=none; b=VJeSDCS2gk1YMi0MU9jrZtJ/RqA0h9/SojLTnNtoKbAg/E10mEN8GXVdocOxf9+8pmOiKenWbNtbUnV6fIhOeSZrdjy6t3Og3KJ7DBEZ8xhpaqG/vDWJCz583GEz68dq0VfAPedPLJBD6rWaoBZkoTJlKrrbaIXzLeZhbiuvzek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737347060; c=relaxed/simple;
	bh=xKL5kWYiHHaXwF2r5J6/Z/RXNM9qL5oi1jAhZL7SBFk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=skSOuXuCWSpI5Fe9/IGSwS826zC5Thxul46mriQqIstwLWaBfJmIQGsW58dvlETKSL1OVWZvGawu+yfAyg1un75fjJvU+tCwYdzImJV7a19IrV9mDF1jR2uKOA91Tw+tKVmQTfOVaZW8KRFQDFm1BdszWks7y0h2tTekdV+6/MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o9jwAMWk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o9jwAMWk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F377EC4CEDD
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jan 2025 04:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737347060;
	bh=xKL5kWYiHHaXwF2r5J6/Z/RXNM9qL5oi1jAhZL7SBFk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o9jwAMWk5WXeztoCrOKSAF1gwqGcDfknu3ODq6ICIYXP4t1s0PunnryTfJbNk+E2W
	 fl6TEuH+kunA/dFRi4INvKfw/OrAMmSQnppxKQCKoKvwhRUSk42Y4OE92xuSM466Al
	 CdMsmefYPmjlnGZiCStbSaUux1Mks8Alac3GF8xq17au2GPwoxMxo8AnHies9j544p
	 4Bzm574urlFDqKts5G9tdv/999fBt9zLJvRY7aWCQ3r9vMnXBAe6fwuB1xlwspcWVM
	 VVb6KE2/x5h4CeDe4OP/mw8Okmik252iPb27Hw3Urqhe0xl9D18ByBSfggIK2IwTdw
	 UsYIdDljzYRfw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E3B00C41612; Mon, 20 Jan 2025 04:24:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 20 Jan 2025 04:24:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219495-215701-2flkDhOxK8@https.bugzilla.kernel.org/>
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

--- Comment #73 from andy.liang@hpe.com ---
Created attachment 307507
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307507&action=3Dedit
v10-patch-6.12.9-lp155.1-binary_bios_measurements

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
