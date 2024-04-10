Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB4616E865
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712762566; cv=none; b=jJv+l89sir/oHBujK4e0Cl3JGShDeB92/z9c9HYfHhG8Y4p9ZzIghXK+iA1XmxuFI4UoRFxCWevq6GbETWLC9zpuaF2hgmUmQ43F6y1Mb5bSE7/cxzczmMmGeNQ4J3ceZohdELK2eeswYYlGE2sXOVCIgAA3cROxz7ylzNu/OlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712762566; c=relaxed/simple;
	bh=i31CRQQ4Rvbnx848SZRMoFAjg3QLNFdQqmvhhw2OKNs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gIjZSVwndy9cJGZQ1mPsGSbbGXiekKU3M1t6/0fQABrXY9skosqboiPchGVsDccON4tg6x4gTNMkefjKqIAnJ9lH0NCNSOD+DixkiH9re+zQcRwjpMaJdgrEAnWP43eJJawd1+e+Ma9CASv5RSRxW/B/mrK8C8/L/b6/YnZqQPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClvPEUkJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClvPEUkJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C883C433F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 15:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712762565;
	bh=i31CRQQ4Rvbnx848SZRMoFAjg3QLNFdQqmvhhw2OKNs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ClvPEUkJRh/a44A1bAp6zwhJwq6W7NDByzHFkk8Dy/J0nuQsufF+xYujf/fQJalaK
	 DM3KdpD9n78HXS86cD929aopPb1KKi1Jw+NygwibqyFSY+rOiPO41TwCE4V894KfUR
	 TQNFkzTyON7okAPIa+eppbbQPVHewshMfUfJOa9PzdeIgS8CDoZHVev9b/+TQf+drb
	 S1bIJsiOobrIB5aTKzuDLG65KRY4Oz6MNiH6EbRhnj/H3nP7KyMo1rhxPdGM7aBeWS
	 dMQT8HfetNX7zGwi8qTTfLGZOfPa4YD8P7UUcpf7sm51hGdUD0xVqFooZ4+0GX5KXR
	 N3RxcGvpH+ifg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 88D30C4332E; Wed, 10 Apr 2024 15:22:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 15:22:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: al0uette@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-fX0szDaU6K@https.bugzilla.kernel.org/>
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

--- Comment #38 from al0uette@outlook.com ---
On 6.9.0-rc1 it works perfectly fine now. Thank you Mario and Hans

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
