Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7932B176238
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 21:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779053544; cv=none; b=jC6nhzs+ypfOGpXps7HudwqoqEx2s7XS1zR5Wj1+FmIYef9V0vDLEhvvfcEK35O5ZuB/wOmcHvrOIHiKYoKXUBUAy0YXqpfv5HGLMStCnUcl6c/RDlujlYiJPy0qGhzI2cCemwwdgmaTfPizvtuAWv01/YzzhohN/QCarbaXgt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779053544; c=relaxed/simple;
	bh=EW/C9lyyj4B8Kq2tCXK2JJ5L8QnajyjaZ8QUxXc6fpE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lqHbjbnLyPzdJpeJ+odRFhqVmRQnSfUuzO3SezVo/cpfb68PQXAiJuUcAFRt0Myhj63TKFIXH9qXMLjMRQsuZlLoUkP3MeMUhOMUBCnl/+uLoJoPV6P6k4hYRkixtA1jfY9m9g7HZSKS8/dqquul4ZtUemNResvCjOfylsTpMvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyQYuqN1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyQYuqN1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E236C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 21:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779053544;
	bh=EW/C9lyyj4B8Kq2tCXK2JJ5L8QnajyjaZ8QUxXc6fpE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CyQYuqN1XENOGaKlfLoVLwWu81yrvY9ivvdM4t6LM4QUgtYAk02JXNzhaE9qi5LL4
	 +q6X9ItSUn8MIIp298MTtn0O+K3TTFHjWNglEXrd9NcwinzYlSam6+HOZ4u5gEcq/x
	 f39yr8BGsTwq2n1ybaxNAYttZVueBuyXh3DUCtOvzSB93lbseAR74STy/qaXpeVZUp
	 Dru0et0tGLdZQaoKjE/pNey4UDLb3j7hNdXIInBlOtzuZRFtxUpG4czjzf35+gDdRr
	 wEnF1LGt1smBtmQxxGi3azJKI//IY90aum9uCCMgUmlTliqOBP3zgLL1IuK2w3vJa2
	 3o3w4Nmu4uC7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4626DC433E1; Sun, 17 May 2026 21:32:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sun, 17 May 2026 21:32:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: rickk1166@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221065-215701-dCw6pG6Psy@https.bugzilla.kernel.org/>
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

--- Comment #86 from Rick (rickk1166@gmail.com) ---
Created attachment 310145
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310145&action=3Dedit
dmesg output during pauses

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
