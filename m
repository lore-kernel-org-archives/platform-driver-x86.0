Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1A016BE20
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Dec 2024 06:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734070979; cv=none; b=BnlVnccTuYO+oUH85wRZg8bVUwMa+1vQ2s6ZXBnRgwhqaoqwu8FcBPj4Jx4gnGcd/h5efihMXXKlKgexANhCLpo1MzlYzo56kw04obe87EixojHiz66dxV10PoXOyLuxr5cALYehtlEylBivVf2xrdcTaby86OJd9BGz0iTAnkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734070979; c=relaxed/simple;
	bh=RypreGBneDw7zEFqAxp6N4/byVvys2ybNq58DIKLcuA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=poPtjhdVjlWhtE0EVexx6hcnE4zxIEtZ9LctOw35Ekbgu/W35VzZxCpIMGn6QmSV8P+vZ/T33LfOrU8L/RGiqhupFlQcvSL1ZpcuiKNAQCk+EHsQpKLE0JPx7JOuxpP2pO6aA7ShIp7bEbtfobbsM28ElvKKy8h6/8y2qjejWE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qv/eqKpw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qv/eqKpw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 098EBC4CED1
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Dec 2024 06:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734070979;
	bh=RypreGBneDw7zEFqAxp6N4/byVvys2ybNq58DIKLcuA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qv/eqKpwQbvjbZSqw9kNuAEQmCMW8lnsFuYX5TnK/v0OScTjKcGogztXN0ZGr1J6N
	 R+AFrWkE7vod+iFiUwE01eCDbhMzsZfr/a0dGujmbnETqvGvRh5U2FZKStbuqA80F9
	 NW94gdyZpPVZGNed2d6Ute0qYtG9ie/98bOANkrik1xoMpInzKw8Ta7V49UbWmEAzG
	 9vAHRFJvso3P/xbbvYgV74LAUt2HYsJIFHcCKijND5dtxF450COFjuQa2N6A3HhACw
	 jHlIcA5uJ1d0OqqXEKTGyGKrX68UkrUPHi17eU8LXi/s8emTzkyWfDDNr3Pizrd1N4
	 gnKrVTLXKQnMw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EE2C0C4160E; Fri, 13 Dec 2024 06:22:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 13 Dec 2024 06:22:58 +0000
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
Message-ID: <bug-219495-215701-PrqnAPXhKb@https.bugzilla.kernel.org/>
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

--- Comment #24 from andy.liang@hpe.com ---
Created attachment 307354
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307354&action=3Dedit
ACPI TPM2 DUMP with fix

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
