Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD588296BB6
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348876; cv=none; b=f032HfrnzLnRC8DeN1zA8XppxII7Atoki56sUdgSixPkcZcMLcPkEai/j2QyoqPeOjVv2GNvX/mZIhSehS2F0fTqnnKOf3iTtaS5Cy2p5ZPlHzcX9SGRMqoA4U3MNMC7/dVnz+JlD4m3TE8S+/MFUMEOPD/gPQBg1x1ylc7ooew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348876; c=relaxed/simple;
	bh=vm5qNaWCaWIQ5fBbvrSYyAWgOYkK/mj7UdKlt6xJKDg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hVd4jrs1LwfQeA9dSqs4yvzcGX6vaR0awMrr8H+l/TD61lDrbbggvd08NK1MNHyNTxuwDeZGpqyjEsYoe3lAHGA2+MTYCuDtKu8DwNgbEJGXQJT2hhcJRAzwYSF1xmWPVTIZCaPL4niafObrpKWIJEHzPTfZW4xjyjld/x8rj/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHvt/wr6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHvt/wr6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7222DC19424
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 10:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774348876;
	bh=vm5qNaWCaWIQ5fBbvrSYyAWgOYkK/mj7UdKlt6xJKDg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oHvt/wr6D8y8R/PYvo1H0Vj+L2LD87FDp2mU6ZIlkhFzVAezYN7H43sZrEGHvZ5Ta
	 Uw3G+y1jBAapQfv0hLgtLgJxM8MXyaD55yRe5oslwMDcS7JsXaYBhbarEaWq/OTGI+
	 IT4+zo2xEjomtDNADkl9Y+4BkbQlfO3xXcRG21Qdzi7XIaYBzb8fWM5ZUD7OP8ynHc
	 8go9oI1hniMWinq7nIeaOgY8DwhSEkDBuNLJp/6G3Kj2Y4jvxTx597uH8+kXr/Gspa
	 62nZ0mFA1LK8akySyB2n3FjEHDU4ME178GFk2HbBdCSdZixi6quZ7/VBqKUs56cpWs
	 pf6ytGHJfljYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 64645C433E1; Tue, 24 Mar 2026 10:41:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 24 Mar 2026 10:41:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jeffrey@waelti.dev
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-221065-215701-NoCt3uZjfB@https.bugzilla.kernel.org/>
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

jeffrey@waelti.dev changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jeffrey@waelti.dev

--- Comment #52 from jeffrey@waelti.dev ---
Created attachment 309756
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309756&action=3Dedit
14AKP10 acpidump

I'm seeing the same behaviour on my Lenovo Yoga 7 2-in-1 14AKP10, I've added
the ACPI dump in case this can help to diagnose the issue further.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
