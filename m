Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F52F1F8925
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jan 2025 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737108173; cv=none; b=EBomxmgDWjiu/UkWcGCQ0+v6FnHySMw47CswFIU957kdzxREl2tzD83IX0hzk7AyKlqR+YUTxB8pNReRQ8vQtncUFsUNl70k1JuzKM8ltOQ/RLnUSVgSI0gmRpzfWb1YAtCq0fmJ7BMH4Z8apbV8wH+M+IF+DPcW4ygo+pP+3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737108173; c=relaxed/simple;
	bh=9OQ4Nv17fqWIrm3H/8uNbFdIvap/XGCf71xTSiRfZNY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sprzBSpT0Mi3PTSdzGcU8PaWWoiuQIwHDdg00fKZuLvzDkpG9UuOmAOv4o1oSONPxwlzt4nUl+XFuhaRNHOA43T6nrrrMTGVAZlfqQDPZ1XZBTl6Pi/8b3qs6IdEEpXun4wn3Rm7JtZ0tzY6Rlt6MFvzkn2V/POIYy1Vh12vHis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNjR7ejb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNjR7ejb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 042F5C4CEDF
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jan 2025 10:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737108173;
	bh=9OQ4Nv17fqWIrm3H/8uNbFdIvap/XGCf71xTSiRfZNY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZNjR7ejbgdVsmPO+CIA/YnK+gWSuT9S2dPQdxSw7MAlJJVG6BI62YrtBoe3+DZxCY
	 oCWzP1sdyz4Wcv4adEGB/VkA0KhSYiSssdSI7SAgNrAY52Oz3D22qC/dyV5O30/yeJ
	 DcxYGfKuZFM1pkQgd1ENQN13TSg+r5sdiL/xk3fuHsVp1y0Ek2DegELT9GzMZXAhWE
	 dZtMHubtK8iIX7PrqlduCngMuLQfgHuOghdhMJ/eauo0E+k8XGzj1/SmhVX0JZbGF1
	 Wz7S2Z8YojWkTW/myoIerx4TC3Lwb2D4b7RoIz2Sl8pUXHOnlQEiz5/NvGQlwSuq/r
	 UFDHDBZ9xDfcQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E8239C41612; Fri, 17 Jan 2025 10:02:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 17 Jan 2025 10:02:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-XT3bvpg8Cj@https.bugzilla.kernel.org/>
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

--- Comment #72 from Takashi Iwai (tiwai@suse.de) ---
At best, test with the recent upstream kernel.  I provided the test kernels=
 for
SLE15-SPx just to complement.

In case you have no openSUSE Tumbleweed but only SLE15-SP6/7 on  with the
latest 6your machine, I'm building another test kernel from the recent
upstream.
It'll appear later at
=20
https://download.opensuse.org/repositories/home:/tiwai:/bsc1232421-v4/backp=
ort/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
