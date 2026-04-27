Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F1630C368
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 12:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292462; cv=none; b=e8/wiXEDsY/gqd0yRUthPlD/65ihw7xEel+UDd60b5gTMHTPbU5s3AK7ik1HPYlVgwXiuMzhtengscqqwioZuiQvPuYlf8k5lP4+yib5GJp5wRNTYtn13CR3AtEzFGRXXnpkG/d4+qwH4AwIFLXUEK1GnhM2RjU5HEN76m37iI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292462; c=relaxed/simple;
	bh=mbR5LLVVXObO7wJpg+kIoz7adP8CvQFlBpXld9FBLmc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fPtRRvuwjfuw34SPLcoLUweaBoHC9wM8AMRWflNfx9B8N7q9zaMRjfJZiDuZeFHA95aJdpAZ0FG3xCNNfVmomj+b360yjvOgTV5aHM31JswlsxcQeMAoivQB4MPwR1czhhpz8wbEDm+FOxbp05Fpddua0PXPC4X/8iFbbtlbZPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QTf82R06; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QTf82R06"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F382C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 12:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777292461;
	bh=mbR5LLVVXObO7wJpg+kIoz7adP8CvQFlBpXld9FBLmc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QTf82R06wApCZK9lKEqFo2GMWJUQpyYpVnoQB+EDYkA2g03rfLgbrqIhjJ/kNhW5n
	 R6stIqS+jI7dF9tVWDt/tMvy3G3Imzjbj5fhARI0HK3dER1ZhciWbzEkUdT7xbvwdG
	 1SGobcFuD/zsI/zKK/nn+RBzcPB60aP+RgSXe5RVUWOJ2/GMWjsc5x/Bn8KR9gDcQS
	 Oi+FHKI4YT+jNVKnfoHIgbIVC1/QdknA2UO0iynBXo2BUMK3x77TlnwaMYAD9pxPGM
	 NF4q4ljz6HvJgF8LbghdYnbDLcb0tdQqaS2zyh1yOgxwMdsgFC/q8cn5IYlPQUAKNz
	 wTKyQ72tPl7iQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 98B1DC53BC7; Mon, 27 Apr 2026 12:21:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 27 Apr 2026 12:21:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-NQgTGJ9oEB@https.bugzilla.kernel.org/>
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

--- Comment #69 from Rong Zhang (i@rong.moe) ---
(In reply to Hans de Goede from comment #68)
> @Rong Zhang wrote: "If you really care about that, you can simply blackli=
st
> usci_acpi as it also returns garbage due to the FW bug".
>=20
> Would it be an idea to add a DMI id deny quirk-list to usci_acpi for this
> and simply make that driver refuse to load for the known to be broken
> ideapad models from this bug ?

Sure. I will find some time to check all acpidumps here for fragile USCI AC=
PI
methods and send a patch accordingly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
