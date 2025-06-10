Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EB723C505
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2025 18:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749580581; cv=none; b=k18QqwMaFn79ftiiWXToGmVlnRLh2f8Sh2KfnO0DxoUnMbTr0aci6Ng7YMvTtHYsGAZNm1sPMnpv+g2bYajymjNlABrdUE5xjBU8fUp8nQkifEN6UPd09/n2Ex5f83q1dxzO6WqlnYI52vQI+iO+BTS/cG5peJsDzj9597gvOiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749580581; c=relaxed/simple;
	bh=/4jPen3SuIFZQ12qOrLc+cf357j11opwWXRoreRRyl4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SQrAe3Smp3bIuF2Vrg47hBHbXHi7goHl8XhXOqsTW7sedJr+VJtDK4zikPSfh7gXQ9obwmIbic2GFDcIK7M3A7WcHcD/Q4ALyz5JMX2sV+dFP8dXYwC05QRBk0zoPSEa49DwkBXJBoPbE6djhH2bqsQmJLFY80qOxC4Srpb9Uqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NeFDlRu/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NeFDlRu/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07EFBC4CEED
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2025 18:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749580580;
	bh=/4jPen3SuIFZQ12qOrLc+cf357j11opwWXRoreRRyl4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NeFDlRu/dUTZPhrAbRejVV0LO3akgPMwpnzSKBCl5thwE02owxMavvBbsh2MYy/wW
	 Ycrm4laiQgrtwvPAP+W/7SQIsdJVFxH3vhePBSub/0oH5wHswPUes4lVOTOhFqMYZ5
	 8PO6sCGQjtZm8rIZWav4nA8xPEW7yjE5YA4iEHA/GlHNjfDU7PTDgVL5tW2+R9+rFN
	 eWbxqfR8dxCNfFMIPAXq7HyNAh5bTomfczJeA19gfxefZX3Aej08D6fcJ6YYieRc4N
	 3A/zBSjLSmvFR6Dmf94uq0kHokO2uUF2C50+mpactk1OIqCs0vmA6HU7f3F0GXdufK
	 yj335zPDoMGpQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EC843C433E1; Tue, 10 Jun 2025 18:36:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218771] Lenovo Thinkbook - turning off after closing lid or
 (dis)connecting charger
Date: Tue, 10 Jun 2025 18:36:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pawel.radziszewski@pw.edu.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218771-215701-RODpVlILAa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218771-215701@https.bugzilla.kernel.org/>
References: <bug-218771-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218771

--- Comment #14 from PMR (pawel.radziszewski@pw.edu.pl) ---
Sorry, the change has not been included though.

There is a IDEAPAD_EC_TIMEOUT definition (which confused me),
but
schedule();
has not been replaced by=20
usleep_range(IDEAPAD_EC_POLL_MIN_US, IDEAPAD_EC_POLL_MAX_US);

Sorry once again; I will be monitoring repository updates and will report t=
he
behavior after the patch inclusion.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
