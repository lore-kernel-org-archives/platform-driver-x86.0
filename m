Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6F338A9B7
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 19:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770751736; cv=none; b=ccazR2Pi1RElBQBffBldV+NXDd8W3FxGeSFmwsCBTpZDOVzpcxWZJ+ipXWqRmUoUz5AK3NPHlnbxjNqd6u56s3laKsHkU5yp/lr5YCiRhOiVyziOo+M1neAbdaiV1rW7uwyJu4ubFtdLldN3ZY+sALq2PnbroMVQc2c4uIruZDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770751736; c=relaxed/simple;
	bh=X8HcXhBmM/9RdgnKsASlBZEW1s8oKbQheGHWFFr5Fnk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HbncuEkqTOl0vSlWz1bbRM1PNjoIcxSmvN+wVxQU3KyKt+Rf2zr7k6faxImtoMffGJnddA4oAdc2UhSfs7KxVFR9CiBtyS5wADMK8a5j+ZpeystJ+q7SbUIVF9uB94zCxxtn4/9qp0PNjajNjdyOYNteCJjNk45XA3pP0jHBg88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhHYr4Cr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhHYr4Cr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADCF1C19421
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 19:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770751735;
	bh=X8HcXhBmM/9RdgnKsASlBZEW1s8oKbQheGHWFFr5Fnk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NhHYr4CrC08i1B5Flcfob31vdMvbe/2Kq4kLp2R3jqQZlHVzrOYW4MJd4GzdIS4NT
	 BfcMR9HPKBt9MbcrunU3BuFG6R56IvmFEd/TAlUmE293UZrl9OKQaEPssUnd+16DHA
	 R/5lzunmg+dGz72bDoNgzupu+EDCmvBZ/YUEpNB4DgB8mbTr+vfWS2KTAynz3FgD7n
	 swpGlgnCHziPjT9W+P0yrhgRehVCZRHrUtCAKwlTT794Cmr/9wukWXkTpMC0fCcMSg
	 SGD09/yON97eLaQITqhpjIU3DXmQlgHEbvQVDt07yWNIzsNt/x/FTV95aQx4kPIBuK
	 Vz/oQQgX7R+GA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9AF9EC3279F; Tue, 10 Feb 2026 19:28:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 19:28:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-zGZhFl8wrd@https.bugzilla.kernel.org/>
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

--- Comment #13 from Avraham Hollander (anhollander516@gmail.com) ---
Ok, I am 100% sure now that writing an appropriate value to charge_types
doesn't stop the driver from complaining when charge_types is read.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
