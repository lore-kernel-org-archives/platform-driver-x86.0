Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0412BE7D7
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jun 2025 20:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749761436; cv=none; b=uYIplS/TnOnvtb43w5N5qp+E2k4pfo6lFS555iWTyLuR4fNRVB2z9HyzCg9o+hZut5nkxh0OdF9N8ggCtHqmuMBYYH0kaZvMBpr6BDf6vCkbEZRFdaSUyju3ON5QgfobA+r4qTJNFOcfaVvzmiz/8PiFFDsm7vuUcy3LQUPYQLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749761436; c=relaxed/simple;
	bh=sQQKZYBMDzomkI50kaugazCCmQtv9H3oe1BRaWS2Tzw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I4yEV9t+mYHHvtlUdeS2xSGbERky/jqQAaiWv0rrslU+3R7tHNgik3WGnMgjM634wcDN9jS1CVZUqhL5P7eRk3kPN07qp5Kpd5Hxz8CWzWEmwWNcGFc0Qxlg39Bh61HOr6WqYuIhHq5znpH8ujLYHScNE6qDNZCf8GBxkAD43ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vo3DUTiG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vo3DUTiG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 172EFC4CEF1
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jun 2025 20:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749761435;
	bh=sQQKZYBMDzomkI50kaugazCCmQtv9H3oe1BRaWS2Tzw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Vo3DUTiG+LVGdE8XUKMeZwsRNd9zM/Ev3P6NmzjMKYqWyLJSyZdQI/K31+9ugmI1A
	 hDCif6BX2xF5i6IfktIn2HBnHR7SPi/SIgqnxswY1cEJGJW77pYpb1EoOBfMeYq+O6
	 1arvXYMyDpkSwYPdMW1/zkvuhFKpVWwSgMzMSR/Xq3mMIJFIhysmAmGtFxUj7frK3c
	 uPGPCgUA+g8OeiG+dw7GOulcky+CaTBhdwINgFHUvEHiky+02E8qb1O19JpJQpjs/V
	 4joTWXnyPjRvEx8Oq6islXJtaQnOd+BJETiySVcD5GYxnu6dh8rSHFBA8bWnIj8F/j
	 pvr5gXbRweaNA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 10400C4160E; Thu, 12 Jun 2025 20:50:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Thu, 12 Jun 2025 20:50:34 +0000
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
Message-ID: <bug-220224-215701-VxGTejSoz7@https.bugzilla.kernel.org/>
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

--- Comment #2 from g.molinaro@linuxmail.org ---
Created attachment 308236
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308236&action=3Dedit
output of lspci -nn

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
