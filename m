Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2049B4F215
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 15:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717341969; cv=none; b=esWqSoK9HfMKGRBjSQyCgPssFyw+09sSwgmgPEXKE+UMOhoEoKSaNA6h1SObgToJej6SM37706vhOAWbUVIRC2QCZgC8E+7PSRRx8naOUWM2J5PkxiJZRa29b9e6V1JbfM+xflnY8RmHFKfyzkh5C1P9AqnSf0EqP+yYFB4NVJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717341969; c=relaxed/simple;
	bh=1nzdy+rIgntnrOrenkPO7wBSFdgg234J6SBtTuXOj24=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kzeUhxfyux8kAZI/oOKDeWygMbot0oFossF4EFxrk02hDHYaT8sc6CSZiSsoeiJVsIxubs4nMpwBdIGIctmzSNb1idDAiHr2Rxock1xD/dDZGkDXaEq2Igswmbe/tfp4+rbWz00xZpRj75/Mb9V9FxE1AH0Cnm6T7Zt2oRlioNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESJOZDHp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESJOZDHp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AD6BC2BBFC
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717341968;
	bh=1nzdy+rIgntnrOrenkPO7wBSFdgg234J6SBtTuXOj24=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ESJOZDHpIXPA0X1EkP7tgiwMMcqTDKcPHdYWxSlHg8eLAE052GAlYbw+4vHeqfK1n
	 0R4YgpWKsbaxXV4fULZjYTqKqYzRB6MeMGblhRc6T3hn4FahRlxaOJqGe9frAzylea
	 1l8HBL84OWh/eZ4YlLPTclZTV+el2rGISgB0zOVox5RM6AsD9HOHCiVMQBXs6D6Oth
	 nvTCY+nd/j2Cd0OvafI9Mz3V8a/mcInj/+kIUxW+8kBxCV5GKQAWwAjXTgcru2QqOh
	 90vNeW/Sde+Y9pM2W5Fmg/sZo2hiZ94ZONkWQtKT2Gx0osolBLRvu/z9nSPyOEjNOc
	 WJMNDt0MXFv5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 772E4C53B73; Sun,  2 Jun 2024 15:26:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 15:26:08 +0000
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
Message-ID: <bug-218901-215701-P85qTSxkyJ@https.bugzilla.kernel.org/>
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

--- Comment #18 from Agathe Boutmy (agathe@boutmy.com) ---
usb_charge works properly!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
