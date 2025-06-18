Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDFD1C5D77
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 21:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750282564; cv=none; b=t/3OXVSKjogZk1FZMvZ41rHe5kfnhzLMWiH3Gy17Hhr0VWqMeDHa+tM2qGsUcdKN7m5nGFO5WEAMx95cS65LOAS0ZA4Ay7t/pZqFZgCKV/GANjKGKE8uj+I/s8Mg6A4jyh1N663Ry4qiUymR+OCCxUIXY1TdgOpsuAzYqD035+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750282564; c=relaxed/simple;
	bh=Cer22zZIdRVeuIupNyzxMsWEu+U8rxBv9GFEQfjJG+M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ICIgkSRqzyKKArjwcsQolU8ZpJNEpzo9Cqyon01j1IabcmqwhCcLsW0Oll5irAzA4BdRiNTtdKytm4Z6pV3fPPNgjtjLFsutwT+vvXaSJzwTw+8XcOsS2bXy7WHD93LFrAY2tsBQ8Ip07uZL5gmtckskoNRia0dhmwKGmQS6nhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pBEI9Rvs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pBEI9Rvs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACB72C4CEED
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 21:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750282563;
	bh=Cer22zZIdRVeuIupNyzxMsWEu+U8rxBv9GFEQfjJG+M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pBEI9Rvsw8Yn3D7xKRnTxNnGdo23BMifc/iOb0jI/+J70YVXsclKdeQbxx4w1BabT
	 D7XR9MDLu0Twx/utFHHE3PPfLeWWVSBvMRETl3uOSIKKM81uMNeQ1cTXsnKCln5YxP
	 nCCZ5Vv/6sDEPBiIVD4OQ250O8MPc1EDtb8OQokkWMF3q9i/BGRep7mcG7UJHxM3lo
	 C2zQHtQ8G1MOJqwrevyKe/VPrtE75UFSXOPf79bB00EzXrUydeHmXFEbMMAbF+iVrP
	 y5iMcQ6YAwpJlz9DlAEVrxWqEgwe9pWXOOtHr08q9c5W70wO8iOsR91dwvhECn3pre
	 zHwD/TONH3Rgg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 96965C3279F; Wed, 18 Jun 2025 21:36:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Wed, 18 Jun 2025 21:36:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dimich.dmb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220246-215701-qU5RORlXc3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

--- Comment #11 from Dmytro Bagrii (dimich.dmb@gmail.com) ---
Created attachment 308288
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308288&action=3Dedit
acpidump

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
