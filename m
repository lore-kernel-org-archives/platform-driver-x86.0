Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15F13AA500
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jul 2026 06:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784268768; cv=none; b=YKy/JdVuImW0aOtE1FefkUlhVh9SevlEA01pBlLJhis7069SyNsZfgdblsGYo35oi/ZkL043+4SDz5ravRx63y0UMXrh7btkRSyxTUs+vG2ng0R9vc6ed/ognGvQwevSEmedy7/BOIYZLtL6fPgAaTXen64EqkeRTwlq6poW/Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784268768; c=relaxed/simple;
	bh=YTtZPXNTEWRtEorazWUqmXt1rj2In7+BHTv0OEJvd9k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WJxtYSpPg53Pxfe3jEy/8UMdMN0EQwEHqgb2NaVzC+G11BwomgVnQcEdJU6nUkRpirxNgQX1TN7gQTrOsYfnrZf9IeqbA+/wfTVCsKOx8ti+VwkT6XPS0inb6KfbYCRBTaWrEdCCaWv3clI5FWfbueDkoVOW/qsk3UoRSyY6lK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pf3BS5dm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pf3BS5dm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54CC1C2BCB9
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jul 2026 06:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784268768;
	bh=YTtZPXNTEWRtEorazWUqmXt1rj2In7+BHTv0OEJvd9k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Pf3BS5dmjsIQGw6jbvCISkwDf0k0hXECJ08Td8IJOCMPJ5Gk/0hQvHJzHs7ABABlk
	 CggK9b4DPx1XgfMwcSxLPCyEWCi80dzNpKJh34IWE+dIFQ4UyCR/20uoMMzZNTSfhS
	 TWMEIyoMgBp3Zccmg8V/sDb/SvU/iOHotd7ZtpMUOBNt2fErCW3VLJW6SMMeLyMDwg
	 YfW5NP9BsFz77hOmENw1TucxYgc36BpI7fiSeiT9nGMsAdmFYo8tAfQT357zGxAbCh
	 hhU5YtBCuwDLDqJxMvV5xKc7AFP3Y0pow9Jw/2mf0j+Zj2GkXAiHKJ9/y8spHZdaPC
	 01WFNqJR5KOhQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2F038C433E1; Fri, 17 Jul 2026 06:12:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221755] amd_pmc: ThinkPad T14 Gen 2 AMD machine type 20XL
 missing from s2idle quirk list - intermittent ~10s resume from s2idle
Date: Fri, 17 Jul 2026 06:12:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ywc8891@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221755-215701-jxUbvj4kpv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221755-215701@https.bugzilla.kernel.org/>
References: <bug-221755-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221755

--- Comment #3 from ywc8891@gmail.com ---
Patch submitted to the mailing list as requested:
https://lore.kernel.org/platform-driver-x86/20260717060744.1252065-2-ywc889=
1@gmail.com/

(sent 2026-07-17 via git send-email to platform-driver-x86@vger.kernel.org,
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, Shyam-sundar.S-k@amd.c=
om,
mario.limonciello@amd.com, linux-kernel@vger.kernel.org)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
