Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCBB13BAFA
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 18:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709748485; cv=none; b=bH0eteSDbEpvogoU+O1j2NRCaNQYvNjZZbd3Mnx/BbE0kngJJ/xhyE7YNZYVLtr6a/v7pNDfn1Ln8gfAcO8sjiIfws/2ZMblosoqAGOmcJE4KQOac7DnhcP4/xPYlqDhCk4Pn9cYoKrDxTNAkuNP0p5X6CdR3rE5mGtjVdDBUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709748485; c=relaxed/simple;
	bh=K3v0xAh2KWFpOI6NkqTUsXLNw/6RU+8EZDeXCIkijxk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pWFp/GqQULklSbx86HDKPzwPkB+Umkai6+2FhAIe1l587Jez7DKf0zxiaAX+4FneQWqawWs/5MuYz92TKhYNAx4Bq3p/izT1YdwxJ+ArEnns9PwCTzcIDrAGoddRm/v4ZKUeXis4lLnNcfstJbOjyRXRVkG4uwb9tX5h/KonppE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bw811ZBf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bw811ZBf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 023A7C433F1
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 18:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709748485;
	bh=K3v0xAh2KWFpOI6NkqTUsXLNw/6RU+8EZDeXCIkijxk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Bw811ZBf+BMQ5VYV+OQmnxqiS1sdOlnZOm0FedX7FAtCM1GwTXjqmw8e8sqUaxosg
	 pPwrx80OA24HGfwfLEy3ogzipHn0OA8m4GWpTSUmzdRQ1eAgVGeNsMvoq4hrfM5TTF
	 IKUTOgIbn/w8Q0UYMQuX5Cxcud5naEz9jGKM3Llwq4IETgomY5CI+JdGP5M2H/epYw
	 P7IjslLc+zwiIqwJIAJ+6pMv84hvIkOdMCP2g5ozbuhC2lXOHIxQTNmRj5qKZBOBIh
	 Wl4r/zJ3ixiWnOEpDDHji2E/HCWaisxl2PrNn0vtbyfTJfQ/v1+xFJDc2o2o/lRL2G
	 TkuhBuCQn219w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E28A8C4332E; Wed,  6 Mar 2024 18:08:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 06 Mar 2024 18:08:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-om4kfi48mM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #37 from Armin Wolf (W_Armin@gmx.de) ---
Could it be that the Windows equivalent of the amd-pmf driver does restore
all/some coefficients after suspend/resume?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
