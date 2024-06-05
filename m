Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA7D1946CB
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Jun 2024 08:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717577057; cv=none; b=gJ9SBHyqeK7/NxyubMdTBo8YYfdJFf2xyt4g3cOxUATZaHsVw2NBJvHBCuRjoG7qfaC1s7dSyDhmm+oHcunc9QPtVYgZcL9/pOPDsHl1TsNgBEk8iS8khfhh8uOzIEoL9XALRUeXPRC3DEpHY8eQbPtvydHOLr+UcWOLSuvc4Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717577057; c=relaxed/simple;
	bh=tmchWnqaSUSmbXLopNpSFUsdH8usAolJgQSTZxLekyM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P6afjrfNOF8OqvvE1bF1m75lN1ThwJ5uHrUiPjBTqTixPcroJy25hzf8hzkTor3QUd1g/McoZxQIbhsrrk0o94znnGR2Y5M89mYvxGrq5An1SDHoyzcmGoPyBJ4Zo9GIQaAILLrrAP7yaI74CX6ZsZR+Uxxkm0x0VIH2bf5/gCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBGXmQTp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBGXmQTp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E8CAC3277B
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Jun 2024 08:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717577057;
	bh=tmchWnqaSUSmbXLopNpSFUsdH8usAolJgQSTZxLekyM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HBGXmQTpO9GoZrtMqD7AaXxjXmrvfGpylOvNWeGHUpQRRD53mudY4WD/bCOqK64L+
	 G6F8NgJXj8DL5O+50AqooeP4zeRr9GerWGLHkLNi6rIIk5gfRl4ogKmLloeSQ7GqbJ
	 mi1rR7m3v62WbS+w8YElDcrJ0fe8UIooY6iLmu7k9PQn5ucRlHdfBVrIpZ9dk4puMJ
	 FRRwlGnDZ/OASCXabbpSaUu83mraRYv4C6G6Az9DbzFSjf0+6KKtUcU9eh+rN03KDG
	 xdBnj46mi/Hh7zMghl8UE+ad6a5FwXUkH5XYaSsk62F37MLSmn6O80DW/QNLTjn5uI
	 PXqju12K3bSgg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5792DC53B73; Wed,  5 Jun 2024 08:44:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Wed, 05 Jun 2024 08:44:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-z9iw882mKV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #41 from Agathe Boutmy (agathe@boutmy.com) ---
(In reply to Armin Wolf from comment #40)
> Created attachment 306410 [details]
> Prototype wireless kotkey driver
>=20
> If this rfkill button does not work out-of-the-box with the new lg-laptop
> driver, then please test this kernel module.

It seems to work great with this module inserted!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
