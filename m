Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52A3277C88
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 21:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770759748; cv=none; b=SN2umeNdMj1TgOZKa3KFcSbQXhHzqiHUiGwumgD4hHVauqwNUuoZ7knX+OqFfmDjLqcBB09R83lUGVIw/IYa2mSNOMpUWYLt7ak2QeFm05edt7IsALbGwrt/t6jkpAISSSwQ3RTRuwbqexxzgTI74AusH6RWpaimZSSkjPIHbDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770759748; c=relaxed/simple;
	bh=WyF3CdoZ9NfaGUXiI+j1O5B1SvSQci/wjKDXWSs01vQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R+W27+rrX6/ypkGLwxNjlvOsQscancqCDnLIhqro68pwBfnJ5BBdeJOXCri4lgH1A3qeK7z38+EIZzTVGNlOJ5M/GBtlgqtfv9/eC9qdLwNGtOngO6rxIo8HR25Mm6XbYtc/9T+4StcxqwERrs1QVT5z6FA+l/KopXTKlUj8+xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZVO9YiVB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVO9YiVB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72321C116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 21:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770759748;
	bh=WyF3CdoZ9NfaGUXiI+j1O5B1SvSQci/wjKDXWSs01vQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZVO9YiVBHjSUEORpmcTMC7KO2Ll/PFjwwM2sD2Rf0/qjsjAcovRQ0+r3DSnlPV5Ay
	 RFvBhtnMJnLU5JwNV6e431hXlY2SYhaXHiTQL+2bmsh1F5oGyvuTk10H+9dWMRiBUW
	 k+Qa0ZwBN2SzmGR02o4SaQ+ZcEe68tW1Mp7j+ciw4reFNnvxPcisU9rmCer95Pxku4
	 QY1zOx76Vj9hM6h08I558DBJ3Fn58pfHJZki7+GT45Fh6P/pN7wqd8MC/2bXcCfijB
	 dL1BjiPfmt8NzF/SuAQgB0BuUHdznX/HvYhbwd/BQEKCmN7D7JDlxiWpPhUPbbzTBH
	 6uhn+nq3r7oAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 60FA0C433E1; Tue, 10 Feb 2026 21:42:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 21:42:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-L3X3qzILLF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #19 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to Armin Wolf from comment #16)
> Also, do receive a notification when pluggin in your charger? If yes, how
> long does it take for said notification to arrive?

Usually it only takes a second, but sometimes it takes a little longer. Oft=
en
times when unplugging the charger too. It took around 6 seconds when the er=
rors
showed up just now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
