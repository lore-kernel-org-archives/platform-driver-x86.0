Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE54C1D89FE
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 21:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732225296; cv=none; b=qdWtH28knoJJx95k/RAHSxQKqCRWP43/s/Ns6USG/YaMyjCEVcxiWumlUHfSnNjCDkKEn9CARQQlkoHhvQMBWObSHxH0tAJFe9qyzlCWKz8WhrzmgIU5v5l0yCq7Pm8uwzQlSTFOCPooerTUEsbEICRkaUY3LZuLl2+zzc+KWfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732225296; c=relaxed/simple;
	bh=bpL+n9MYzhubmpY6aQe2D1+7wrr/Etk1Qsxs8VHydQM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K2TV4I5VVsGng/0d/52GcTfqILn01tSwFdXVmYn2v4iru4/9jy8CCCo2N9CWFentklIPT6zmOBokB/SCDljrDRlgGHzkcJyXQk/Wd3yF2q1z+ug67lJrNpGPpiaPq8+B7W8DaonZO6s415XVfnvxKleCPs7NKmNZ2qVGHLJOXQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnq9ZJxQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnq9ZJxQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81841C4CED1
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 21:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732225294;
	bh=bpL+n9MYzhubmpY6aQe2D1+7wrr/Etk1Qsxs8VHydQM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nnq9ZJxQjNqo9yIX/3JKisQIdvsWT3QhyAJ7ktQiSH/EBWyeacxZ9unxfHt9eeuoB
	 GQ1NRKftBzfJE2j8wMdtEr2/ujBSp1vjacdeUPs6uUV4h2yUzDBy6NvrSOebs1CrbR
	 n+vXo+Sh/JNtaR/RDe1lAjV3gX+6atr7BPa7h12rQ7y1xSK8T8e/90x6fR9ruEgRf7
	 T1Wo5aE/hur3K3xIS8JTEzSPViqq0Kx7mxHqWCkGUrUk5f8gQPfvM0S2m3ae0Fdimz
	 MdSoHQd27CWqG9nkgiLaLIJXbdt91td/Jq4oXwKFBWdd8ZUYINB3OP3qTfABVHwlpQ
	 OYW5duSDIbJ0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 71251CAB785; Thu, 21 Nov 2024 21:41:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Thu, 21 Nov 2024 21:41:34 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219517-215701-Qv4eonZg9a@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #13 from Armin Wolf (W_Armin@gmx.de) ---
Created attachment 307261
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307261&action=3Dedit
Prototype patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
