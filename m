Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71981A2C23
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 May 2024 04:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715142026; cv=none; b=JwWI3kLfCyV8Jo6PJDLHStuusy28So3Go5S8fxyvF8k847FDI43smIsipf7tdsGUqPBVVJQk194+/oDPHX4pqlk/1jjaQ1ycO0qZyMTk9dpchEi3jzjcnvLwiDVbCc06HV6rLCnSMArcyOc+fkAgk/spzOlpP18tllLX3q7CJ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715142026; c=relaxed/simple;
	bh=Pz5dJBXgIVIlLVv1TfohczxRYYdGZB6ThaeoD8Z9tHw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OsuLR5k6bZJGbQNxLuFrZRQYCiodgXj7uibr2oGTTNFodMgsJvAx5yTCyAom9YyOWw8Txz2L+Ejql4U12fUNCBrQ9R3oPpwSNouGZLrcZVGRiJrgxffDZ3mKcYUJ1/FI/glYlBQzwKDKHbV3cujNJ6ggBpLfGc9kg985ETXhvyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sEHpubtz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sEHpubtz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA0E0C113CC
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 May 2024 04:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715142026;
	bh=Pz5dJBXgIVIlLVv1TfohczxRYYdGZB6ThaeoD8Z9tHw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sEHpubtzkgi6n79xRmb9Jq97/koSzQtkZlijdTDErKzztqh4TCpl/DN2j/IN3saBO
	 riqT3xeoXTxrP+waQofAehAv075ZlN+Eua55GlAVwb/cxRNQqNPCQy96y43s5tckl/
	 HdSlcQ40fhv/w4mPqbJW4Qr0gUZwmp+LhBYcFYCdniw5ZBAnO+fqyJZ0vY5hziunaT
	 44gDejwYr/oE3eYaf7AZ49YWdcyzJyWmysqzsuN0YG3A3IC/Lqsfo1goyUPzazcnGZ
	 R3NparKEnp4Mi2fuvJdr3+Os9N7R0oAzrJrH5/bg493uU/BfMcgFF2p8Ziwy9zx6/4
	 AMt+6Ck01ZkbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 988A6C0422D; Wed,  8 May 2024 04:20:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Wed, 08 May 2024 04:20:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lmulling@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218696-215701-BJi1xohnA2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

--- Comment #8 from Lucas M=C3=BClling (lmulling@proton.me) ---
Hi, Any update? Did they manage to reproduce it?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
