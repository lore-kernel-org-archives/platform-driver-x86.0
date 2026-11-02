Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793614863;
	b=hC3edbWQ9n+/UoQVWJR0pNUhP79PAOTxtFvHDZM1+XdSZt5N1rz7vW52P5iFU3b9Vg/S
	 Rv78OvtKtbU+iAYDKHwZx2HcXRqwzUBnUm9w7XXhqD1Ama6GPK+br8ybB9OOGu/ELZeNR
	 WkTCdHBvlA0xACvYGxf8zAnFkkHFLIci4CGCMyM9D2NiUHkyErUBJKRjlF76Q4Ix7CI6i
	 lCpk/UBwLThD7Pre40j3SrJgc16JBg+K0uATzNa8SBdV6U+rmDP2fkoULkW3lf4PzQOcK
	 dFvcWSo0vHq0jVhOwZ7Yz0h+RG+TXLDBowSihYTEKY39WXh1fwRtN6knh2KS1CxI+uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614863;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=nbz16AhhbRpk/9p/3SHx5nlnIkYqKhkvSV2/seDdc9Y=;
	b=auvVq9EB3LPFMVGfnzx87qGzrlsnG4OTVUmowGm1Jy17HqvPRLhg6pRe9PNRIcN2T1aj
	 zvQin1RXsSfVE3DewWXOFb4DbS2BTX3CYDBtkWDn0fBtoiD3EMfF03L5Y8XhDeq9ZBOZV
	 6ykEVOvZWK1kd7HZfUm7BOsA15T+RkYfyMYRpmBfH+EKLn1rcARY19nZHAEtRi7r+2d8m
	 RxT2OLajr9bIkA22LnjST93WAooU0yXscKCtjPrmZR9miS3larINbZ57V0L7UF8YVvnUP
	 P7s7A3u6IMrGreb5yAVJ9k+quxvEmx0tSJ4ox5YebNTKvrps21lR1iEp6MWa48HAoDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kYPGxeUO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DA9606A324
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Mon,  2 Nov 2026 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kYPGxeUO
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9A76513C0
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 10:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793614863; cv=none; b=bnX6gK1UBQqYVeXeuj9s67NP0n3SoZqOCV9BbiOnjF80B0aKmdqXcCClG+mOqZ0gnY5diF3yGCudNi0QHYBuQBE7Ub08uWyWtO/mdIncmPllxZDqGpsqWygrXj1BtFCj6IZNlPHjM6DIdfhMB6ahG5I38ypnTwEjuRG/HBF/MTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793614863; c=relaxed/simple;
	bh=BKRUxBq0eN8t66ycGCPGWpuDfBySrgPrM14Iy3iQ3ww=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LYE+62ijdLMtdFbW2un78K5ukWejQntSQlnnJ1ru2YT0QI/vmb6wZRuftRDJUYTyev+a2QtsILAvypiB2tfaFdwaCP+ujIujbppK00pCpYRujEooyJrNWlGFqRGKRKTNO0l52GuOumcJ+JNcKwwpCFiHHyQ4KsreHUcudO1MizQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYPGxeUO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6A46C2BCFB
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 10:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793614862;
	bh=BKRUxBq0eN8t66ycGCPGWpuDfBySrgPrM14Iy3iQ3ww=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kYPGxeUOCPB/g4t0cwKdSdtyXEc09bgd3f3tp5t3BrdJGp5jw6LgHP30vcCY23msO
	 ZiSFGnQb17XITNoHs+2vXSPMi9Us91N/nCh3x5DBP1CakxBk73jZ+MpfKkQDaBvwMG
	 bxLQNJNMLUvMPxXSL8Ubcscw+EEZ7jtA9ohQw7rZn9+Yo14mCK5pT5e5dEXJ8GV60c
	 SzQG5lySU1z6OdkLPfD0+XTfSYXN64avJ9DTkHkOHvfbEn0/xmBuH2ab8E5Ad+iWUS
	 VT2mIIXld0yD7ovn5oNMp3boDaRkhOWjoMvQALHdDCdU8DSZfTHYElBEevBeT81wSL
	 UxT7OuGIbkUyw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7ADA0C41612; Mon,  2 Nov 2026 10:21:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Mon, 02 Nov 2026 10:21:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: helian.caumeil@clever.cloud
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-222161-215701-n7Mt9cokcv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222161-215701@https.bugzilla.kernel.org/>
References: <bug-222161-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222161

--- Comment #13 from helian.caumeil@clever.cloud ---
Created attachment 311361
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311361&action=3Dedit
acpidump

Here is my acpidump.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
