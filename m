Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B933EE555
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Sep 2025 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759158254; cv=none; b=CbQcFiRJV/X4L1vYm11F/vhhoyofdsDZxaI87DK3zzt5jYJvCRTrKlgGsZIXjRZOgf82bLh0wHkbbFWfM3wgpxhzdHRkx0nRizYJ6TU8gsOq88pqMnR/h8jdVEedJ0o0ZTa0dlFpJBoLCHaNdLPIbw5Qplis1B7eMNTIsNri5FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759158254; c=relaxed/simple;
	bh=nckWmLf+SozRxZ8/021D6VGvBEBReTnpzR1k447Piuo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W3AMaz/Idxj5dMSin4qpNXTrPXguALX3bDMkuuy5DuX3FGvpn8pY5GqvA4SAwRhCVHVyZMFZB6Gms1gmJHF9xq1LUvcA3qtD+c/q0GFtjdbgQR8PXG4vJNJbi882It4dmEofGuA0sqhVX6mRt09LMKclbfD6OEtwhmEp4kinBtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAUHD9mx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAUHD9mx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50125C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Sep 2025 15:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759158253;
	bh=nckWmLf+SozRxZ8/021D6VGvBEBReTnpzR1k447Piuo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iAUHD9mx1/cWwWujuhkYo+JJMAJ7zePjMfNOlvDVkkyJCZhO5dydclp4JNZlkS4u2
	 1TpXUQRdK/qCT4lHVAXnUC3C9J9uLozm6d7gmL7rfZeskgqExh6K4C+PSXpNfsh17T
	 II0P9IMZLxB5ieWlxTqWJqAvlUdW0TLI1mslgn/60GxLX3GvaxiVIa2Khwz088kjNh
	 7HqyjVPt1AhpHXH0NuyFR/mDpC1AfHmc/KHPP1VIST9yVn5gUeaOyPN0CdQotggbvu
	 XeacIYy02udRUtUMHndxMSN1WiVewxEK+sjUDJxDRQJ0zjPnqElDxPRR0BoBoEBYDg
	 swQgqYTXRBbMA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 48448C41613; Mon, 29 Sep 2025 15:04:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 29 Sep 2025 15:04:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mail@lukehmcc.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-4lMHBfhfpw@https.bugzilla.kernel.org/>
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

Luke McCarthy (mail@lukehmcc.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mail@lukehmcc.com

--- Comment #133 from Luke McCarthy (mail@lukehmcc.com) ---
(In reply to Mario Limonciello (AMD) from comment #119)
> Created attachment 308674 [details]
> updated patch with two quirks for HP systems

I have been having this issue for the past 6 months on my HP Elitebook 865 =
G10
(7840u) on the latest BIOS. This patch has fixed the issue for me and I no
longer can reproduce the CPU frequency getting stuck when waking from sleep.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
