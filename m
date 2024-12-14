Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEA3133987
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Dec 2024 10:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734173379; cv=none; b=FMP+1ybpdL0F0jhNbMLGEjnaQAV49AcF7vFsSawNXDvwRv0O6z/asv4BqmNIK7xkIZenqI63sYZMV1Ez7p3IT99HTHfzoBFtiFwaKfpdeDfKrtqPMh5bl9h6t7SHVTCs8grOMTFMWJitmQhdPNcyWjb9k6kDGNGa+cgZb61DtDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734173379; c=relaxed/simple;
	bh=Lw5kop6nMcnWZIComlisfRyMcYmOyuRAB0xNKE33y/M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mRRDrubtKNuRKJ65ERy+8GgM1vg0K5KMhmj8HhLi+HdaYG00kXdzwFFmDqFwoCKXRwUIXilC+/8Wr5eCacMsoqbTvYqX3MCx/fnsM8vAp1lovF7e6UZiZebRoSTI/NCOFe4+ur8IjfzlZscmWWmpGdY7s57hQtfSMlMfPGfCU8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3xIxNBl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3xIxNBl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F23D4C4CEE1
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Dec 2024 10:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734173379;
	bh=Lw5kop6nMcnWZIComlisfRyMcYmOyuRAB0xNKE33y/M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Q3xIxNBl2LNb562pbtE15tRXTWSicgempFZ5/GH4U3winjx22UMGW0KnS/aB7Km33
	 2C/AfgRyO2r9xgzYOOBrdOC/hIs4Ky6gujEjM7nV8X0ZG6oyCDD7O2TlLm+rhf7t7z
	 0Y0NT+rDMTNqC0R5zC2JxS3a4ImhNzKukMxZQn+TIQOaha3nGqe9R/dNmDRBEiGSRF
	 ey3DHlah7AG9qv0z+5VeJToyaIE92fN9MpEG4QYUclHzxTlc3t4ggGqDQxAAGsjKDM
	 VEPmmoOU1W7GUesF5C/t5m878E9jO0LJgDXzsQKo3ink4DV2U5a7UJ1f8QC3JWB54D
	 dZpUk3A+bcqnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EB0F0C41612; Sat, 14 Dec 2024 10:49:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Sat, 14 Dec 2024 10:49:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guilhem@lettron.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: blocked
Message-ID: <bug-219517-215701-stDbM5HJ8k@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

Guilhem Lettron (guilhem@lettron.fr) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Blocks|                            |219573


Referenced Bugs:

https://bugzilla.kernel.org/show_bug.cgi?id=3D219573
[Bug 219573] ASUS Zenbook UM5302TA function keys reversed and Fn lock broken
after kernel 6.12 update
--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
