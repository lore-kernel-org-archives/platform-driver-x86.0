Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59EB3AE6E1
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Mar 2026 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314501; cv=none; b=fppAXb0TruPOZRIZGcXgiccBmmBi98/xlaUd8mr5gjr5unoz3OlxUnYb9/lFM0KsAnAtv00Vv5+4H3tLldAcusn+tqnWzW+fB5t5z/JWwzgE5+3GtY31HI640Ds6lYMhK1jS3pulsRnySN5yxHUxhG6jHWuiJ1WFdHU3PL9GDXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314501; c=relaxed/simple;
	bh=bVkUdD+A1kKhuOx8L9gk2Hcb3D3i/EZYkNlI7a9Qod0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fXWFmh5dbGgp4i2kESePHyIC8Lz6lj7hDXcrT9r1IDj8TBhRr12ibjnGzjfFw2KDZJny7Eimq4ARV/m4iLVvawx3HdQUxmPTIm1LvcMlDDCEXTTxrQia1FA+IVorCO1ErJqGpFLxwfiRu5YuxQMZ1GfNCBKB12RM1kfBa88H/XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoI+4513; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoI+4513"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48E4AC19424
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Mar 2026 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773314501;
	bh=bVkUdD+A1kKhuOx8L9gk2Hcb3D3i/EZYkNlI7a9Qod0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZoI+4513MPgvGTN4QAJmGHTqKh4WfOmByiR9bZpLGOB5BMC+KfFZclPaUkV/iHnKC
	 oi/xO41ZKR5Am/MYdh9IIvLkBBPJU9CLaIf+dQYj5qcKKv7hL1F1wDqNEoavqkUdA+
	 Vxu9rEbgSuusx+OeK/cn+FZVFpuwgrEz9CN3vZrs41xafzpF5qd45u4BByPxi66wK5
	 2jVdLKnBM/NuqDWDM54pVsz7tAeChcMb1hjEagcqDPxhttPeJWv+CucT6eovFsSFuF
	 Q0NatvQfVkPgo8pZ+Tlhes1q+ndBvzaWBe4LeLlsTmBSDN6BAk9NAJgxhS6XKJTNIx
	 Fid9B5TqQ70Ew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 39E36C4160E; Thu, 12 Mar 2026 11:21:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 202619] thinkpad_acpi fills logfile
Date: Thu, 12 Mar 2026 11:21:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-202619-215701-hSoSb5Ki7z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-202619-215701@https.bugzilla.kernel.org/>
References: <bug-202619-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D202619

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
