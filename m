Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793553049;
	b=phGmIMwhQi2NCLWXp6QO6sMH5dhgBX6jwH1h1DNXMcROK4uvPPhcJytrdRvoCQ/L1A0p
	 vvItimqSYOxbBeIzC22vbKCDkVZaDECphxddxp1eM7vXpn/jsYSefG6guH0TFocQhWnEg
	 H9GfoSZ/o5KhaNr0/EXp4ojSd51CzdyIwMPlOMtE3ct8SvM7lQz4RI+LrbWtsgXKpyFmR
	 r8QxlgJq7GRolnndVdWDzd/DjljWUqsLLVU1KEJfcYnBW3D2vFhT9pOAPLnHNQzdM1Q/m
	 BOe5Yqlj71vHUNkyKKaLIKqmmQTmbIyyQT5+0f3FPG6wxfACvpT0JaEYHUZymPVd2Xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553049;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=bKGrtMrwtDg460arJRZWT5s7wop0eLLTLTf67JACulU=;
	b=eQpZaKATrRZy0sRTC2iV94GQ2RtUUrVzM6++3F6JN95m3wvvX1/klSI/pMJqD+JTVGhQ
	 gPbXlzxwYYwsu1CUpPCSSobODaWpU7DrcEOpys2g9SHo9Er8vfUJtW20ebbApsRDJUOWo
	 y6/05Mltul3r1nIX55P6bhI/ol7R0zNuNm02cuS+VyMf3OiCSBAFlCzxf/SUYPjpDGVhf
	 abLTDY0JitXRbmL+KZRXCMo2kXl/ByQISzdUXjaKRVkUhyvqCJyE0ACpsuYi4880DAHvo
	 mmduhdEu4QW5yt8rvgmaWWwxJn0I2TKGifTBgYRTx0gbOYqLkZ/cOGZkr7YY6Jwtyaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RQYG8mVL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDC2606A324
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Sun,  1 Nov 2026 17:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RQYG8mVL
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392236513C0
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 17:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793553049; cv=none; b=GajxxKXs7iEH4ntZKcWwKoyepPTqIEGMzVmF3Wt75FpW7KVRPH4vIpRS13tA98+oWznIObG3x79ShjRxCmSVOX5KI6mUhFhU7O5FUs0yIFQQVlaTdFqkxK1UgRnJEvjOA64YEYFw9biW3McjdTGQ+TUBEvlqXGkRvm1qdkaPINc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793553049; c=relaxed/simple;
	bh=bKGrtMrwtDg460arJRZWT5s7wop0eLLTLTf67JACulU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GRvWGRJ+VEdnxTSF8WBjpzsFRy2VGMRw5/RA8Y2/GlYjLeFiA2/db29j+0pDk0DnbAMRhBVYmKqfQX0UZ1I2mxWU1U01sZo1elAmHLAbFs6gcARfSC9NYe77LOrjTTe2c1aYpNmJnEyGdPz6vlN1QkpmczBQABwo8K5Qb9xqKjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQYG8mVL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92FB6C2BCFC
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 17:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793553048;
	bh=bKGrtMrwtDg460arJRZWT5s7wop0eLLTLTf67JACulU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RQYG8mVLGbx+EewCUUUFh6bZWkZZzvwrIo43kj3/cLL+8wSdwySdNiEU/X9FUPXcV
	 CwocXxvrTbHzXkzRKdpn3Iwp39FDXwWSGCdwwM4Q+B88kYA5QJmII2FoXVisGGwGI3
	 7sB7vJNkJP5Y1ujJuABueSr+O/fw9z/H0PlKGQgK0mO5IcaedOfcjAoifBJWDhj2mi
	 xWpwUHa/3Qv1ml7DOq6NIynmeC/XuL1Q7J3r6b5VnaFdP/qJV6+Ly9hghC96hCQkXz
	 9FkCY2qWbxpeP7l6u+MfXpYy/AQNQnmUdsuquCqi1B6Ks9BrhFEkbDTg+1tMDOLrkI
	 sfVRuoYM2Gdfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5AFACC4160E; Sun,  1 Nov 2026 17:10:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Sun, 01 Nov 2026 17:10:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222161-215701-sYto2bcc3E@https.bugzilla.kernel.org/>
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

--- Comment #10 from Armin Wolf (W_Armin@gmx.de) ---
If the patch somehow fixes the problem, then personally i would apply it ei=
ther
way. Are you OK with that, Helian?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
