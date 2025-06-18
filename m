Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666771B78F3
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 21:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750282231; cv=none; b=OOS72bmRXwPhpbvpiLEg8tb0KvNwWT0sQwFYzwIHnbroaoAOcAPHKa/wIr0QY9xzrjvlAlaphDHyaGQJoLfoZjL81ZcYKh8AvqsJeVvfZiUZgiMT+kod/UJOy7CM9d7NQdjGeDUiUBISwOK8p+pYrJbq93BUStHBqbpCyMuv48U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750282231; c=relaxed/simple;
	bh=wRe9+Fv6vbOcxl/va7wPrPLUi/aZRFHoZ39q2jqAlFM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=naA9ygFhflYoda+usc7jTD+MpYG0H+DkrZmgS2dVBSDmiT/R+jAZlB9peDkHjMKXSlSy9Q0XWde+zKczqt57tXxEdCghZswPs4gYFHo1iTaxziXMFUahVZPIiOFMMkbSGrjAppMDXjnI6/b4IDELnAp5ZLn6NbFHKlfqiRPjNz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrQw3fk2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrQw3fk2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5380C4CEE7
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 21:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750282230;
	bh=wRe9+Fv6vbOcxl/va7wPrPLUi/aZRFHoZ39q2jqAlFM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PrQw3fk2EzxuMS58BbrqD1aDOvqpgFtp7iGTKFhdo+bIZFfPSiiBDF3WOOEiuBAvE
	 yz8Mm+9SCRDCDZHINyUhHVGeX3f6/xwg1h/MDGb9j8ItZVWjQNNIcfW2m21OCL40eq
	 sJ0gJwdv796o2oeWRM0p2mOE1BMehhzhW8Rs0kaz87JACBX50NJfdxH0LW7GjwmCe2
	 lj9W6iHpliepI8DuP6Va+eGsYDn7d3GpHQu4Fe90jm3NNnsxWriIVJtNP7FPP0upuS
	 EN4pilx1R/waook6lRlFWTjqJy31+wI8c1qC+pKxZ8DImnFlwdEhqf5yY3tGY13XLd
	 IAlMb+y+BjEoA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D3A86C3279F; Wed, 18 Jun 2025 21:30:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Wed, 18 Jun 2025 21:30:30 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220246-215701-FESMs8yUIt@https.bugzilla.kernel.org/>
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

--- Comment #10 from Armin Wolf (W_Armin@gmx.de) ---
Could you please share the output of "acpidump"?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
