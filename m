Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717764;
	b=XrdkJGIGgEozZr4ElEvWmQ7Fl0NclPhEDX1RHWXkd7Y4IC/qvybYb+vsjbyctovyKBUJ
	 /LQr3mouhvn9pYt/4aZX7pUS0A8qB5uI2zDlZW6YLw6YgCMbxxEs89Wa59x+5OUx8Ri2t
	 w+vo0hPxdZu4ECQLCk7oLMByk30DeXJiJ0Q4o8gIpT5imesT+WxhCLMLVprc0bHZaNT0B
	 LMDfGKjyxn1udaTenIQpUWCtSo5+G/lD+oMIwaFvBkAKoOhCnfx7FScImobJOaaNI65v4
	 TFGcMfAyXiDWDJGkokKf2n6mNrogdSUOfsVtVRslumXm+Zqy7+T/5RvqdOroCFn+HCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717764;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=2SoeMdP2KFrJQi3uS85yyktUOP87UIbrW8ky+5U0dzA=;
	b=Sx8eQVLoofHVAUqMpRQOGk9J/zVnCK0/93bkjNschnK3WyVFeEds2CiJ/ZZiXesmh22+
	 J1aDR12lBM+ks6ByEo5XjGdN4wfBTaegsx/6prxnaLcH/K9FlqcdxJrW+ikWXV2Zswh+7
	 kNhl2HDvY0jNwKU7HfyOmpbQUlIAo1JuMjlvPrGtYHx3dfim6D/jDErMw0AfztZ7lb0Ir
	 Qm3oknMSLK0YI4grT5qvjIvTRjq6Zb2m0Wb8J5eCbNMaOc7/xB4ZbA2Zi3Y5H2FbXdN5S
	 b6FXNSXDP9nBfE+3MU9PfA/byKZuHykBNjDdWT67qEWAE7NKMMFhth8gymD6b6EFi+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FCzPMX8K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2578606A794
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Tue,  3 Nov 2026 14:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FCzPMX8K
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781E56513C0
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793717764; cv=none; b=L/aK7a4kqFuuEA3lxNlzFlswgpA3arOVt0ak1bqcUxPdDnFcQqVW6ypIQHYSstvdM/uGGdGAxD/cjA3GmGW0Fbc6CjfN2fYWBy5xapLcw1FKCLVlvsochFeAJZDanVSdzclXnt/cHks+CGVGT6ywU+mf846oK4CQKJBaYQKrqTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793717764; c=relaxed/simple;
	bh=cQyVwhGuCJJZr6moQSpXOvNdR/7vcLI+UUNf4ZaAyOE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SavdGGo7P3UIy3/I+p97bYujX4FG4nrbBJRbQXS6QjvfbgL3C9u8LpL0nQiVuZT7sun6Qgw3ldVzIj6a6pZVXIFOAzqoOydABFWvPFU2X8/YhGo+ysMU+xscg3Y2LLchGpkhP/wZSlUX3ZJ8MQGakFl6Jl0cYIQY5jBNLOvovoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCzPMX8K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89658C2BCFC
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 14:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793717763;
	bh=cQyVwhGuCJJZr6moQSpXOvNdR/7vcLI+UUNf4ZaAyOE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FCzPMX8K6pWZ/gDzzPVU5nLD+iKA9bErYo2JRWecyBtwRGy+WgBNrotREhAe9JlBz
	 0J4w1/qOvQBN4yOtf0MkqMvpWOwUyvNLcgG9nsqp9YjJoiZCxsng2V4iB5WhOsk2Jv
	 +CJXVIDcLkVCkgWt0SsbtMPLCyGlTV8CIbgleB63cokq1xrQ1USnPDCKbpWmcgZ7KP
	 SSeR4sLQlLxqaMKsIyXuUnEGNyfWsuNjsxFyaDxSk4orEZvPY47YxQszSQ92MDNH81
	 Tm29hWM9Mmn7GcgKri5aoV1Gj60pY6mylm3/pb12EcTDEpOmKPNRffWn/LxuNALGCW
	 bavfdYxuQZnAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 57FEBC4160E; Tue,  3 Nov 2026 14:56:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Tue, 03 Nov 2026 14:56:03 +0000
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
Message-ID: <bug-222161-215701-g48XDDb7CO@https.bugzilla.kernel.org/>
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

--- Comment #14 from Armin Wolf (W_Armin@gmx.de) ---
Created attachment 311375
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311375&action=3Dedit
Modified patch

I modified your patch a tiny bit, can you take a look and tell me if you ar=
e OK
with the changes? If yes then i can send the patch upstream.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
