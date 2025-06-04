Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00173171A1
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 18:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749061768; cv=none; b=ZfWHS5mUJntEV2YIwgkoykiPQkuToRzLaJLQ6FTN/5T+PH82e66daiJAl1/FDDl5e1KeT2K0EuPFSGaw/dkoJfyY8caGDy06vph1RoCZ4eu/kLhME7FY/4HfuiuLXIS/ZJZ3UsWNSWbYKjUwaSThVvL672ZR5xL5j0zkLWdWfV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749061768; c=relaxed/simple;
	bh=fo2NryaN4vFLtPl1c2aQrlul8H4YY+rFVFLWX2btGEc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vFjnjC59b+M9X1ArPucROOku+HEa4Obu72YA4AExzCL9a5BK5QTn4MrY3M4H4zN1wkX0l8Z+NiFq0JE85L52+Ab8NfHpeYcXKJJIEqg1CwWSbcGG9Gz8LOvJ+2dqQ+hQAUpnOYnncVL0JlLFRdfv+MDcC4d35TPYXszl8l0vesQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1DqoZ7e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1DqoZ7e"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EF65C4CEE4
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 18:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749061767;
	bh=fo2NryaN4vFLtPl1c2aQrlul8H4YY+rFVFLWX2btGEc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=M1DqoZ7ej7rgjJ0K5SCs8e4Dsl0q1i6F/QRaWI5rZZCn+u1Xu+fzfw/Uq8XY9UkRo
	 7ZhyYOxgm+LqANSLGhwMmLRUAezB+fV7yQHNDINTbbjYfxJcYOJeCMmSFKXtI+QmOe
	 C8bsCdPayha20eLwpW6b9qF3BvZMl+S8pxk8oK7EiGwg1VvYy5jUxAx4FC/qPCRLFA
	 SedN57HDUzfIJtXZe508hKIPr+BL6SrCR9ZnOURwvi//+EjEvjAnsjn/5/CDiuh9Ea
	 Qqb+KZGg+NbGzGB/NKJ6DiVv/10Cy7McdWF0vQXldTQfakw7gWDOSN92kXud/OyF/J
	 XAJX2aeIjHfzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4AC52C41612; Wed,  4 Jun 2025 18:29:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 04 Jun 2025 18:29:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ein4rth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220116-215701-XeHhb7Yny3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #16 from raoul (ein4rth@gmail.com) ---
Created attachment 308205
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308205&action=3Dedit
report with 60s cycles

Sure, here's a report for 60s duration per cycle, 5s wait, 5 cycles

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
