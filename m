Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD602EB874
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 16:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886864; cv=none; b=UbdrchX2WFmFwVAjUZl9orBm4qAWYK6xgVJcPYxzZmuiakIN9PSfqCgk0kBj9bU/v7K1BItpWHMSALq/d3AzXNg3n5jsUhKes7aY4ogU1UhvKxOxJcPiig6VbbVeLOae1Sp8EK8MCZe4rkvXpnImftV39IUP2a89siPvASfPBtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886864; c=relaxed/simple;
	bh=98ZEntlAouROWdMP8IHgq/hCtcy6y6bfr75+0/ElLIQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZSfc67ePSY47qWNbjwyX0Ps0bCICsDVuUxWWJC9VzUsca4ukIXKlITLP6eYJ+9zC1/EumCOFUca4pNji/C8UqS15B2Xh9l5kTicfRnAZ7wlZ6StQXyaa3VNZUweW0IXajDTYSJoZi0zH14KLDjK9w+IIBastZgncHUXkgdhXqLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAb0xIFW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAb0xIFW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F0E9C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886864;
	bh=98ZEntlAouROWdMP8IHgq/hCtcy6y6bfr75+0/ElLIQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KAb0xIFW9STQSgZnjnAD5bdMyIMezugaLovL/srlvZsTeea1gPzCIUAb7nTzdzfVn
	 lqPvw0REMRi7vK0A69mLCNBYGvApIZVqSIVG9VM+ICYGAvkfDTurFYLwHLoWK76hxw
	 40JLyPJJ3CotfADraDfZky9daDvSzlEtzoMlumQAbC0F+oT2X+5yCKtFHrW8B3RpUs
	 X8HJrWia1xNSc/QGbzFFJodCCeV3QVCFNImIkkyAmGJzis59XoZbRMT5UYI0Gh6IBr
	 Ep6UfPPDTgOm2hjda3fFJ2nfdqPCLkac4w4pAvHEmhHALkRshY19/IYZTxCv8Dbtno
	 9ReXdccdNeTqQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 75C44C4160E; Mon, 30 Mar 2026 16:07:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Mon, 30 Mar 2026 16:07:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: juanm4morales@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220639-215701-MBhFLlRCNV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220639-215701@https.bugzilla.kernel.org/>
References: <bug-220639-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220639

Juan Martin Morales (juanm4morales@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
