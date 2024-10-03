Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8300015B11E
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727956010; cv=none; b=gAfdlI1hu/K5JE79eQ38A/P/YfOCl6qnEhse9HIohuHu1g4hGKjj6OvbvPo8/9M/wxD0Dsgwlyi0sLYa5vaHeG0JWQcL3J9s2RKXJRozZcnDyXgFJPt+/olIWnk5HTzGuLjkZ+RtmYx5NPIxgrf5BqfSnDjj1Tl1P7Vtt0mnA7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727956010; c=relaxed/simple;
	bh=77WZH43knqCGtJ7KBEU0W6U7nuGRYn0J1tT2TSYmPK4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NXBFAH2mN+cDmXQittaarASAnJwY+e1N+lU+6hg/w7EPEf3GlHITnLxPdOHjGHAT8EacHyLKhR4UzPnBl7n75KJoBpOyyXgx6OgevqzeG4nl86+fuz6k/v4NDUUDHj6kBisMTZQyZ86KLLFVniN0XGAtzPv3tyTKUL3m+WarOKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qi+2tdAQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qi+2tdAQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F22B9C4CECE
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 11:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727956010;
	bh=77WZH43knqCGtJ7KBEU0W6U7nuGRYn0J1tT2TSYmPK4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qi+2tdAQIopinbBLZZ1h7GOTdc9U+jruGTu/DDsiq1S/ajCuSNqI0v5aLeqMvVWSY
	 n9Sy3Beu3iOzRh+yJKbYj6HQysoeDCNAnRdBkx/hjAaorg4+IVKgbJHLH9vWK/r4uu
	 2QJEDg3m9nDN/uuxCJYD/CRfzc9WYEVP+Iewacfz2JhlcmViB4wyTSFASrhTqS06U9
	 5VrPQRAq+EfDXTSSk5H44+zAjxc5JLOq9R/3KsAdU2OLRmznmxflxzjw5pX5k3adu5
	 VuidVrDURrvZVQzMtNLeWfayy3HBNwIvTFkPU8+0zt15XaR4T3GavKVp/wVzJ65fRo
	 rBpW35lVSVf7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E2E50C53BBF; Thu,  3 Oct 2024 11:46:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219346] [BISECTED] Disable ACPI PM Timer breaks suspend on all
 Amber Lake machines
Date: Thu, 03 Oct 2024 11:46:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219346-215701-Q54qBlO1yt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219346-215701@https.bugzilla.kernel.org/>
References: <bug-219346-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219346

--- Comment #3 from Todd Brandt (todd.e.brandt@intel.com) ---
I will do a build with your patch and try it, also please note that this is=
sue
causes a full hang, pressing the keyboard immediately after S2idle, S3, or =
S4
doesn't bring it back.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
