Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7269A31BC93
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 21:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758057601; cv=none; b=Vn9M2hBErISqc4gI+P34onyF0zHh2rwumpfUKEPaCZM1FDSMChJJBWUURDjDVVpEYv8RDjgdtr9wvKUR1ap7x7Pd1hrbXYpq3ftbEWtgBmBn5/vCECNZxrBYxwTjsil0Q1nVfdaF74sSV1JUgKzKP37GFUXdgpqKiz+mAg+Mp1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758057601; c=relaxed/simple;
	bh=qSa4z7wWxB+86sohti5olJHnm/rWwl+7l3tbO4AdCFg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IR5c0cZfXUOdus6h9KVtWzhEzA9QXGgoRzJkWjqwMsGa7oCRSQ0ksR/okFit6TL781Ufx083nlDMXHGEHgrMaWA+WDvE+QFw6zlt5xzvUMXqNqMjTKWqBLcfi/b4sCkjD3tkSOz2y+nZFVPelXIG8j7cN3/X4TJQ8iuTvjjGKR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtuW/NNu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtuW/NNu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 472B1C4CEF0
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 21:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758057601;
	bh=qSa4z7wWxB+86sohti5olJHnm/rWwl+7l3tbO4AdCFg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZtuW/NNui2vqUXiFgPwaMgSV84mIRxsr568p8PgTWLfIiiwh5QXCe8TThVGG3IwMQ
	 Cp6sXwEtmaLs1GgidrFs0CE/tG5uL6Q7aoYBbYcnSUD/1fQZ/fRveUGcYTOD1ASV16
	 4WJmEbLCOKuK/n9ZpdDr5oU3QQePMecHSToTbAkCd796CWe+zdSOCfGGDrHMm/QCB/
	 6NphxaEV3rVNJt2jBuDu7fDX5kj7nHLtVULL0J1v8W/eHUQEnZMYotsHOn6+WLhmoJ
	 mYkjCP93+Q/llR9kuGRbmAG7R57fivYI0eQwkKaDLmcHyFVM1gGYRJv+XQiRu2Ayrh
	 9Qg/lbAsNOLJA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3D14BC3279F; Tue, 16 Sep 2025 21:20:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Tue, 16 Sep 2025 21:20:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-7rFKMZwmCO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #129 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
I saw logs captured 3 times for patched and unpatched but the kernel log was
only in one of each.
So hard to know what's the pattern but you can see the following from status
register prints:

* in the patched kernel burst mode is turned off before suspend-to-idle ent=
ry
* in the unpatched kernel the input buffer is full
* in the patched kernel a "polling quirk" occurs meaning enabling EC didn't
trigger a GPE

I guess more test runs will confirm whether this is consistently the same
behavior.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
