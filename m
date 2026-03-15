Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1559F202F70
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 21:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773608843; cv=none; b=Pw6XFL89TVDN5exrfm/5zZN8TYORLKXuhyKmDC2X4WJ6i3IZjNC8ORG+KJQyoXL35czcKwS4c05YcdWa5VZetY0py0R486SmZioAI4Y9mN+HZvG4zMtHx6zcNr466BPsKRRiVT5YCn8Bs7Lfmcb7YeEMjtXBRk3+LKZJkzI0a2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773608843; c=relaxed/simple;
	bh=Q0VP1gkk1tIVmpZDtWlyEV1H6B+p69cbpjTjpHZhZqA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sFNWjRi6Ah+XAsI0WPFFseohhAx5x81s5doK2VBoHrIFXznVyjGO5FpTIQ3pPLVgiKKm0+7LiHJDc4F5XzPMQELiDaECQS/INZjYB7FpPIvHbRqa3dAIng/sbd3nlmRd4aGVY0X7VnmfnZqgxhVF00fUjHqD0fdQBEVFfibQdJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZKUqO5q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZKUqO5q"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB623C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 21:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773608842;
	bh=Q0VP1gkk1tIVmpZDtWlyEV1H6B+p69cbpjTjpHZhZqA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oZKUqO5qh46tjJreCQqCmY0jRVJOaRfnttfdgjdXHC9QjtTEKsjz/D8xakx/T1rrJ
	 OUDcKC/c02DMBiAM3YQJjlcVvCqsws/vsVTg/pomXXgmNzoKLVlE0b6fNbvkmCB8Ee
	 mL3bBPptUu1rFgdHGJURkZrBzvacGCYJ1S4gJOjvt4kT5W4vlfnCNs85TxEr4uQbi6
	 skNHfbOlOJhffihfVUeqhL5qS+azjif/f1UeOrB0dmRKNYv7dQcdCBrBb3bM8NGmKX
	 jYkMKUgxAXqteFDAlzEDj31Sg0qP8rdlsuY4QFTZwASJ1gx8aCqmHhtZDpbrPhW4Mb
	 6n5ii4+JEkGzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9AA54C3279F; Sun, 15 Mar 2026 21:07:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221238] lg-laptop: Spurious ACK and dropped keystrokes caused
 by ACPI method calls conflicting with i8042 driver
Date: Sun, 15 Mar 2026 21:07:22 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alfonso.garcia.frey@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221238-215701-mof3ggIuuc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221238-215701@https.bugzilla.kernel.org/>
References: <bug-221238-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221238

--- Comment #5 from Alfonso GARCIA FREY (alfonso.garcia.frey@gmail.com) ---
Tested battery_care_limit on kernel 5.15.0-171 with the stock lg-laptop mod=
ule:

  # cat /sys/devices/platform/lg-laptop/battery_care_limit
  100
  # echo 80 > /sys/devices/platform/lg-laptop/battery_care_limit
  # cat /sys/devices/platform/lg-laptop/battery_care_limit
  80
  # echo 100 > /sys/devices/platform/lg-laptop/battery_care_limit
  # cat /sys/devices/platform/lg-laptop/battery_care_limit
  100

It looks like it works correctly for both values (80 and 100).

I also acknowledge that my original report incorrectly stated the driver us=
es
"raw inb()/outb()" =E2=80=94 it actually uses acpi_evaluate_object() for
WMAB/WMBB/GGOV. The reference to battery_hook_register() is also incorrect =
for
5.15. Apologies for the inaccuracies.

The spurious ACK messages and key drops do still occur with the stock module
loaded and stop when the module is blacklisted (17 spurious ACKs per boot on
5.15, 114 on 6.8).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
You are watching the assignee of the bug.=
