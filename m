Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7E32E11B7
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 14:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825182; cv=none; b=oj6RSyTgM/mBhUEf77yfcg1kRgo64oNy+bPrQ/0JAPNgI95ZXl+IzXzakCgcAN5rTqoCeKJgcka/ME4pSyLZjDYnOAfdVQT6wqbuajWKznWb7ccow9vuDaTQPlGy2utk1XiATAP1UCKqQ5j2V7qDxzGT63uDJaRJJeCGgCwtgRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825182; c=relaxed/simple;
	bh=YdGFSbPfhSOTtBfs3ewUSm8gDe0JsTeAe1ufLQ1Prc0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HIlBwJyZsI58dtdnmgWpjAVkHbPmmMvgJU8GbApv3kcWN/cO4rFiHlnIgMYH9nVWOTkbR84xfWtXn55nhmLyCd3eKk+gdTfZhrl4k/dygwrfAiToMM+b6oWts2Lx2wlJ1y7+at95RM6ky3ANP+Xy1fUqu0VgrOrfpIR4xGxIdZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+97KVU/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+97KVU/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E1E1C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 14:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825182;
	bh=YdGFSbPfhSOTtBfs3ewUSm8gDe0JsTeAe1ufLQ1Prc0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=D+97KVU/5n9gFmSL/9yqXQ9t/N5cl5/Fyh/pXgaYaK4/YY7f/EvlXIiE0MAk34Hp7
	 sTc9u8tGXutNuyQeV16XEdOzM4Of/pjnQfOLAgchfeRTPlV32dW6mWbXFTi3y8Xgnk
	 H2yj5Ixx2vlsqUYGP42QTUEHE2Ho2jSZvRd7G0WrVdUFMxhuaVO/vZb2I73F5pyK28
	 aKpgldHAyXCk+Tt06wZK0KRy4mfRmLIsksWEDeuAAF5mQhQRzoCieFKy88YoaqDcTM
	 isco4Q5UXsKYLIiGz+tEbDwMluj9kNxRy2TBO/zZfKvy3Uor6YJw5i3u71H/1Yb9AJ
	 Xzyvv3xWV4HrQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 20C05C41614; Fri, 13 Jun 2025 14:33:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 14:33:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: g.molinaro@linuxmail.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220224-215701-tu9nlRFchN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #16 from g.molinaro@linuxmail.org ---
Created attachment 308248
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308248&action=3Dedit
Output of journalctl -k -b-1 after modprobe on Working Blacklisted

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
