Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35DD3C7E15
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 20:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617544; cv=none; b=WINt5honNOzVSWyGEmCxtuE77cujC8YMZAmTjQwQMWc5x/qK3vqVYJBUavXjzs8w45oOeiHZM3P9SmKrstdMXQc1LTqB0JvXX6+4Txwf5X2bJIWw0SxTGjfnZwcaE4/NtSA1lOCwr7+lrIWKLFu0pdNG33DApRP18bpcChdL1iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617544; c=relaxed/simple;
	bh=9R8XEThc7ql8lCBy6jVYAs3QKv1PjiR8sGptXY4huHU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OMeZtjBaztomLUdUtxoqoTl7kvaqaRMQrPYkLfR5falJYowwbSOudwLlM7LwbN8d2IlhD2cKunQp+8ciejEXBmSbCEXCoyQx1tOFTxe7jC1F5ZSnfwTZRzlZsoY+DNxKEdf72qrr60kRcp8tLlysMeZ/F7p1yAZJD4R9bB3k8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFUBL6Yu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFUBL6Yu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9311C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 20:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617543;
	bh=9R8XEThc7ql8lCBy6jVYAs3QKv1PjiR8sGptXY4huHU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZFUBL6YuUcoM10X6nhYsJeBgxSAJi/ws5JY9I5LFvujKleWp+/Hhq0Ec1iflaoXKC
	 rFgNODmYuC1XsDbcQpw+JJEPtgE8vcXlE9imXnStJbFPCbSUP9vN2k8ZMLRiCJq5EQ
	 jP5eIrNxBAbUS67OmN21DvtEttNI0DxE7WJIFTJmQZumwrjFeR6Q+6k2MtZS0X0u95
	 bOB1kzWUMyPlahq/rK++ePShbQ2ttXByX3bRMsPps07SxFAUj5mrW3qeGGlm31gZfe
	 ByFQKZIuzvxpfqcTkKSlOLuRzLWBd9IZDDEHC3qNsSayguinGN0VlkSA/h4VYQX30v
	 Gdm3/efsQEAQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D0713C433E1; Tue, 12 May 2026 20:25:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221430] nvidia_wmi_ec_backlight: brightness writes silently
 dropped on HP OMEN 16 (2025)
Date: Tue, 12 May 2026 20:25:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: floquimaurice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.description
Message-ID: <bug-221430-215701-Ej2RPnMW8v@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221430-215701@https.bugzilla.kernel.org/>
References: <bug-221430-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221430

floquimaurice@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #310098|dmesg debug                 |dmesg with drm.debug=3D0xe
        description|                            |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
