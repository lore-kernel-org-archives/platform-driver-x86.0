Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9648B4085D
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Aug 2024 18:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724266461; cv=none; b=Nt72fu3upiCas9PFBE0kuEyKl0KfkqJw5GcjUqaJKmSCri+sZDxEQh3JGxIJHeuLC6Uq2Q5MJ3OFpeyfGTg4inWoD8hlnBLKU0WXbmEFDfFRklILCTfJ9qyvPKdTA2d8kx8ZIPBIudw8KbRM5Qw8c1BRJnFJ2z+dpakYkxTdRB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724266461; c=relaxed/simple;
	bh=AL+CJfW1oFMDmMuubCyhtaHR+FbzRG9wFNCpQzmWVmE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=exc4Vv8QD1M5+q39aocj6hwRK6Ml/Gcz2bVdq51wMGPFkjuZyBEoa2jXHjeftGktHS7Re4Q3ptrm8dLPVJc48G4nMjiS7Dww1jaEwimhmV3snStrK3S0OeAeYGeOBEG93t4SZyRJw0knIlMcAnGOJ7R7l5wYHn2oXXVsDlnWtwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DX/Ea2kg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DX/Ea2kg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31FE4C32781
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Aug 2024 18:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724266461;
	bh=AL+CJfW1oFMDmMuubCyhtaHR+FbzRG9wFNCpQzmWVmE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DX/Ea2kgPozIKYhGY2i24RCIpgQLVyWUkGDqlGGslcY1Fvb7uiyhACoJXmetbeqS5
	 vIvjegkM9dAzDRfcSOMgQ0JN4XWdLi3gQ9eIYNCc+Lsq6fDuiknYmL4Pn3XvF8CHgy
	 nE9lXwoe2zoiixwg2zboCk/auSJ49pg8WeOYDmCqSHY3/LROBnUsYxrVN/2fHqc6x8
	 S1Zh/piG6CpoWUnAJerlLVAxmx3n9tj+ajkW2AtDa1q08ickfFMs1CoJkOZh5ASM4O
	 IDM4H+J+/qk+yje3dPkzMdEKkvVXMO9z+XeIGFxNN87PLDMJmsZHFHK92pgNdo85+2
	 ArpPgbzkvbQsw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 22DCBC53BB7; Wed, 21 Aug 2024 18:54:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 217511] HP Pavilion x2 12-b020nr - Charging over USB-C not
 working
Date: Wed, 21 Aug 2024 18:54:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-217511-215701-OlsgHVTTTe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217511-215701@https.bugzilla.kernel.org/>
References: <bug-217511-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217511

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |Platform_x86
           Assignee|drivers_usb@kernel-bugs.ker |drivers_platform_x86@kernel
                   |nel.org                     |-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
