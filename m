Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C4913CF9C
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Jul 2025 03:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751771269; cv=none; b=bUc5elmWl4m6zAbniho1dI7T77+OzLooMwi2kU/3mcaSJ8duy3iuyVSaAV3FGsJYa5mMWUdXlZ2Yh5RMCPO2MYoynH/Eo3IS7yvuh32+RYfWje5qOHXPoxfTM0lizSSVkGTUaFXTqGtKgVN2xxqK9Ir21J3NtaoeIP3POJ3jZzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751771269; c=relaxed/simple;
	bh=tLZlAf+LV3+iG3Lmu6hn2ZT9rekix/DPKZVC23fhm6Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F29AjtjspXT2iI4SvRd0BqeHhfZlZezFuQV8ruAOpWkvs7O18wZXtDWfNUwkXKYhtjHdzS26XVSaljCEVjfJqfycWjEpEcZclFuqnBqaywgUVYO2PDnPtDhw3H9VBNcJIB4W8vRlovyvoS0r4O1zCr08OEwouOBzHl9gVcMQ4q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvuOEYK7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvuOEYK7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1C25C4CEF0
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Jul 2025 03:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751771268;
	bh=tLZlAf+LV3+iG3Lmu6hn2ZT9rekix/DPKZVC23fhm6Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jvuOEYK7U3SGOkAhF7Qjd2FPeTbx70FdBkX8meLl3w1xoIzVIGz6UPvxW0ODZaYPz
	 WRjlLJqfxl2IiYxZ65qMFJ3gtxBAN+VaK3/tHnuV0F+U+nd7vNtkeu67dBsI/XeYos
	 EC0LMJ7Ne8syjKVC7d3bhqYAbpTSyHdV7dJapymF6+Ms33kcQ6A+u4iaCqUCpcNN/s
	 08I56n1UJ0+Coqy2V/AiMVdKcgfdhrwCvylS6BQbWT5s5qydXmeUNd45ppxGtRJqvZ
	 FxguvKuH60C+JDdy6QqOQ+2qzy1wpRQd6pNeuSbvzcyx2XY4Bh8VYE9I64U79hccim
	 AFA2UMa8MoKHA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D9CFBC4160E; Sun,  6 Jul 2025 03:07:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Sun, 06 Jul 2025 03:07:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dimich.dmb@gmail.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-220246-215701-2EITXGIxzO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

Dmytro Bagrii (dimich.dmb@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |CLOSED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
