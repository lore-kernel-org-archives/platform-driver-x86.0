Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0013C3439
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842431; cv=none; b=bea0GuyMKwjc3xO3Y7hKuvvnZlkndlzGeRf0+cHK3v14YLeIUfXruquPBxS5eOEWkmcp7+b/1YzjOwwBdaANVpHFj+pDaPmm/4vIvk2CeOu/EWFCeGhouG3vRYY4/Np9hynC6RmqofTnqZFb4MPBveEVHiS42RDA7E8buxUEvoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842431; c=relaxed/simple;
	bh=gAxDEV3cDkXjJnfInoSfjkSYHZP5qXeV4SNY+aCNmhI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W2IfSX7FzeFzpZJ+T8E19WqZSVjHXADElUoM4LzjgP50YjPhJRkmO8U+uks+Op43Mv7W3HaOXGaFQOMr7899Kz4ZooiplK4QWUKXk2zAxDrxRaNrPiWAu1FEYiO7//spxCMVvSiEp5cBLPZIEIRiOC4fMS244IwVtfCmute5wH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYwsxbOi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYwsxbOi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11630C2BCB7
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 10:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778842431;
	bh=gAxDEV3cDkXjJnfInoSfjkSYHZP5qXeV4SNY+aCNmhI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UYwsxbOiKHqYBdU+NN4m1PnFCE799DhT0cD5NfS6dxLNOviMEhTXaHSwA4sUVdihG
	 y7BWh/Y8kLF+A2U7/WeTVS7hn+R5PT/wx7pZvOA96eEa9lUhEke1TuofLJdWUTOdBW
	 p+IbLQ1jjiCXWM+yQbQWTK9I39MEHn/ZgmLIW+1WhDaKJXtNtqr5EbAMYzmDSn2WK/
	 gapmssNetFByISkbZEsql0RRyBNvOqqxdOuA5pI1cZcFb8iJyibmK6Gpi1c+ckMI2c
	 CMTfBjPvF+gtq1fByGm5u2nTu6FgNfOISmitq9KloVMb/Rl7fUoVGC9lzPMH4nSV+1
	 g4nrDljtWBHhQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 08098C4160E; Fri, 15 May 2026 10:53:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221523] [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control not
 available (no PWM)
Date: Fri, 15 May 2026 10:53:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sivasli-ahmet@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-221523-215701-Gh40IsXGY4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221523-215701@https.bugzilla.kernel.org/>
References: <bug-221523-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221523

Ahmet =C3=96zt (sivasli-ahmet@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |Linux 6.17.0-23-generic

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
