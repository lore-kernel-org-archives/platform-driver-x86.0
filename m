Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845653AE6EE
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 20:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783715423; cv=none; b=ISUVN4fDt9vvTnOUFQ4jmxI9JgLk64uPgxSjXl/3/W3jIw/5ism8dl77oQvl+aBnU7Wpaj1VbUR9F0h6UgS6rL9eT7MEak8Yz21gMq56+65alr0zQH/xOPkx0BnuAHQ0NsE/aOJXh2s9xIWUik4OjBtRtvyKGSBadcFU6V/Y73A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783715423; c=relaxed/simple;
	bh=yWmIEAxGP6Y1WyTYkxqLbw684neBgJNHoXDszuXHDc8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h0UTebE/pNMv8PR/5BCXZ50KO+sYeMqFKHKtdAYfP1gmqoEbXwkeeybYVAtwwnBDiMU0QeVpzqhqro6nsYMcW3WzvcRRr4QzJd3uf5NdwS4VxgIs7pSGJXBExwufUJoIA3YsA8NeJePSQsMloblEWpT+8AzAj9FIw/lbiWeRdkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KN3QHrsB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KN3QHrsB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41F62C2BCC9
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 20:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783715423;
	bh=yWmIEAxGP6Y1WyTYkxqLbw684neBgJNHoXDszuXHDc8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KN3QHrsBZM4BcWX6ar+aLvXOa2GbWWTCcPo8CWBZPTkEl0VyJyPCrxU8PFgwkGm7J
	 uBvyqlAraRm+jd9wUikBXwAiIeu/OFxDEgJV8hvYFgY+jKFIGgWkulGy1ajoQSYS0A
	 BP0+Lh87zJjwfg4IUatmW07PxMe2tJg3B8jVh6qxz4I+Td+n7CunGP0ek87767R4y5
	 DVtnuRMpb7F05Ud9IkpbPTFS1lNtJ0V7iEutxCJI4+ZaHPG4+hDR1ls+1b6naxMY1z
	 /wy/v8J31Kx2otJzh4DeNRCdhiGwdajiynrhoq2L1iuDbjiKei2D5ANJSqbXirkHtQ
	 PsRbmySDUGihw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 21A56C433E1; Fri, 10 Jul 2026 20:30:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Fri, 10 Jul 2026 20:30:20 +0000
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
Message-ID: <bug-221065-215701-Pqiasm3U5V@https.bugzilla.kernel.org/>
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

--- Comment #99 from Avraham Hollander (anhollander516@gmail.com) ---
Hmm. I'm still getting a little bit of spam from ucsi_acpi. I got the same
"ucsi_acpi USBC000:00: GET_CONNECTOR_STATUS failed (-5)" as well as "ucsi_a=
cpi
USBC000:00: unknown error 0." I did re-enable the ucsi_acpi driver though. =
I'm
inclined to just disable it. I don't think it really provides anything for =
me
other than knowing which port the charger is plugged into. Charger state is
already handled by ACPI_AC.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
