Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962145F874
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Apr 2024 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712927045; cv=none; b=mj7w82Xcfsq3VNn5EKEvd/iaL8hxviuCiwcgn972ZgPmGN5C/1iee2j4fsup82MTqI4ZUqdiN4xzS1lwqZ6mFi2SmJ3/UcG+LgWNGFdUk2xlVR3iPbdSKaCqWb6u6mGLCVmky3bPWbVQ40Sc0Qj2j6l2/T0zXL4ToUBAY7M/JXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712927045; c=relaxed/simple;
	bh=iZb5wQL1WIhQ/UUcfK2jeto9xkP9wYl5x6ToEANpqZ4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MWlPrr2+EhDcqDpejDpe84FrcCd8sE0DopApduy4JAOw/+W5zayt+FQJEt+GhkXLxhew3Loob0LCk2nku+21xHDA/oYubRJB8LkIDvFlNL6x4n6W0Vus0sbcbwA6R/OrOLWkSQ2rx2RH3NfVkllvGN4h5SLayHGBv6pIrup2rZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKGEW70C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKGEW70C"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18C63C2BD10
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Apr 2024 13:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712927045;
	bh=iZb5wQL1WIhQ/UUcfK2jeto9xkP9wYl5x6ToEANpqZ4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DKGEW70CuE4raWYCdsEHHFSOvKXq+BoqbwwJKhfKv4pndV1Sabf9oq6cNQ/gXwM98
	 pQrfn7Ymn3BLeKZiApe2B7nbKo+RV+bVX3SakHsQlqdamFDLLbmx7SGmE2jz8OJQkk
	 7lNi8PsGYTIGfd1vjq2t6hthcAKQPj7dzsk53b+JoN5d/3HUVWvp0Z3il2OJpeCV6b
	 FBXpDJHE23EHsD28NkoN3JFwG4tbUKatcu2I50DhBhn+gwEn+AceLnt3xgM6JDmqwk
	 2OfHgAkqOlbiSBnv9bD14ghbJP+6JfHW6Nf/hV9h067rOFpAV1v5hh6J096tYrphZ2
	 57jsMiSe9DowA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 111D1C433DE; Fri, 12 Apr 2024 13:04:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Fri, 12 Apr 2024 13:04:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-ohlVTP09iA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #40 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
*my

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
