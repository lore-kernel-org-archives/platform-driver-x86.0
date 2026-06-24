Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A3935B644
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 06:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282271; cv=none; b=Ie80Chkzmd40Gg4FvcxbKYPlq29pwjCgWexKJBXJdd3T2TzcCsuS0iMI0B8oXD1HMzhAEih21KqzxaSSDDfwTKn/1fDUgKDbmpODimohQJpDcs/uBEg50MDcZWFTkkHCkFhb6FHM3SYGgpQzmy3L4bx3neBRCOtFVZ8+GPXb/7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282271; c=relaxed/simple;
	bh=Fw76DAGqPgaRVqehOYzoFoKDgzOBY65w7yyyOR58MtU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lxr+EiIGeIkBNRRiuzyVgMqP3cdBJV8eALB7QPpJaC2HFRehZ9axbbSknlMb9ln1QCRNmxiht2sS2mVltcp0fycalFEgmwlG3H3LX7lynmoch0+PqP6CUb3RI0qsmED160D6nFC526wcQfC/aQtCn3zNxy5QBZfx3xhjX+rXqFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmyxWhGs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmyxWhGs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 376FEC2BCB7
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 06:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782282271;
	bh=Fw76DAGqPgaRVqehOYzoFoKDgzOBY65w7yyyOR58MtU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UmyxWhGsNr9fv9q4NGNja4od5vdOBiPSFTXxYyCNPpkI0tIK2sxRnM+Swc6S6Idpy
	 i+lrURAIhKeyvjvNzmr2S7WAOZKhB/KrdrJaswS+tJmsxr0dBKISo7xthpc2rdXnvA
	 cdrVGT3gSQdJIQxz+I4oeZhKeKnfbWPLhEq0oSBlsSBsqh3Vw8DA65CyBnqbC5asRg
	 zAVzf/6KFlnAyU5+ge+IP4a6AWdnE4RofRQ9vdLJ3aB+bWYTN3LEP/r3WkOcNrv4/w
	 LBELv4aC/41bbwWAIuCPK0Khfspl5WT+BvVpEezCzX9pQU91+shisCyHQMfMVZ1gx1
	 yGsG9AJn/eP1g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 232DBC41613; Wed, 24 Jun 2026 06:24:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Wed, 24 Jun 2026 06:24:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221569-215701-2X8m9Dx9Rn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #54 from Milan Oravec (moravec@ukf.sk) ---
Created attachment 310362
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310362&action=3Dedit
dmesg with hp_wmi debug patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
