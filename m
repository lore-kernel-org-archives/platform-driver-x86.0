Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC341FECA8
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Dec 2024 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733147292; cv=none; b=Sc2w+EV3aSZTnd6XSKRT0kx5ylydNYFhqSvt/UOxwdIcDOryNGljTWRub30a3okML6QrTN6T4A6oFKN9hwxzYId03Iy8XgNlsMwJVIAIIjriK2ctw80FaiygqhdnYGQYR3jqedHns2DnHfK6BAHRY0rBNw9ZVvfiGQh5cykv31I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733147292; c=relaxed/simple;
	bh=DE2Qe1M3X27vz53S9X1uIsju8l8rBUAqAj0g1BSAVpU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ANNy854fV+n4PYKUMobumuFPuT+mtfI6Kh3LPjZWSbi/W42JckCv/VsJfWrR+iM/XmOuAIb+0pTDrJKFTv8xXh8HJyHf4QqIMDcVtwnbV0ZHrCUXYdoim6bSgEGSGVloINW5K/NNIx1sf3EfhYiPkNbXo6I/jPG7tHVbDB6AzvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDCTPPJB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDCTPPJB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2854C4CED1
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Dec 2024 13:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733147292;
	bh=DE2Qe1M3X27vz53S9X1uIsju8l8rBUAqAj0g1BSAVpU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pDCTPPJBhIxI2Rw97uRf7Sxy2yy5SG7aIJMqIjjOEeTpxzYvt9V7StW/onCoHFXv+
	 L66XKXcIgb234xhiAeuPJ+AHylKc8KELg4AQbOva80c+u4mJ1onhkaKtyYRsvoR6P6
	 Jlyu6nZ2nbsdouJDEoXFtCyJFjriZ1RfL2xIYezmU7SPvYkS2ANvyBXxpdeYTfxB1T
	 pwIm9ax1gNfmgr869fSnqw7ZKjIF2BzFOuJ8bjn2iYwz8trQAHHldLubAJnjn8zUEh
	 WuWiqfBzfA7FBI8P6KMKn9IEWwbS3vpUQSxnPS8LrWaXA/PexgA6zUn7QiVoLcfRfX
	 H0SNMLVqmjZQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9B3BDC53BC5; Mon,  2 Dec 2024 13:48:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 02 Dec 2024 13:48:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-vgRNtmSGMq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #15 from Takashi Iwai (tiwai@suse.de) ---
Jarkko, any progress on this?
As Stefan suggested, just capping the max size to 96kB would work?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
