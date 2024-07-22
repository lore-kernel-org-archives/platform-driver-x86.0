Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3023328E7
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jul 2024 05:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721625029; cv=none; b=FNHFKp2JecMGV16fvfgStpubbSkZyQE86i6e0Uh/hLFa32NtPZ/RYNv0f9TjcNqihHkCTAdXjYwj+A/LhV8Ji6JjwFpQZIWXCK/az+DdJ4Q8kUV+CGhVXpeQyGHGF6euIrcQsEVzzelXYGs0DcSTEa+3+H9vFFli+n/fwX0rvLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721625029; c=relaxed/simple;
	bh=mz6Lh3yZJbuka6d8EQmoiDxZf6AgYfPj5y0t25qjo3g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RXl3aGSYZsvKX+n6CjS6FLTjsKBg+5+CC4y481c2yBbcfzQ9HLqyvE9W/B+I62xowey1Zuf5hDTwVVhPEZ72Y8PA4b1lMXjjV+xSo0995X4/OYS1sVNGBtj/1i7yEc7gqt8A6t/oFQlXgmeuPZSIrVoOQi8lxlnnziKS4xvhuyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bopMYX8b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bopMYX8b"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D6F9C116B1
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jul 2024 05:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721625028;
	bh=mz6Lh3yZJbuka6d8EQmoiDxZf6AgYfPj5y0t25qjo3g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bopMYX8bD31BGooIW/uhNr5qgmWDY4yx9n1I2Qmd7o8pyYQSgTf4qt9rUNQukPUbo
	 QiEdJWYbo8hMD8UJNrCk7LWOxNScqPtj2+sUQXa6hA12m5i8aa3WdnybZR1ogy7TBo
	 abLP2NIlCdQBZq3ukPFCk5iMLlRUe0colufhBwxDEzdor6Yi5CwKWnmkNLUEgN2Uqe
	 TJN2vlU5WzV0LeJp2xiMAAA2oVhvt2i211kLFN03oxPfNs/sLFS2Tj5HFbgt9DJLPf
	 +ZJD7J9IWP+4x9/VC8uHfn88FEy6U7Fi6yoE+a+pNWv2DGn0/q+l5gkdr+fiMHPG55
	 EVmZCRI323J/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 87D80C433E5; Mon, 22 Jul 2024 05:10:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] amd-pmf AMDI0102:00: ta invoke cmd init failed err:
 60005
Date: Mon, 22 Jul 2024 05:10:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: shyam-sundar.s-k@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218863-215701-ZX6Y2z3XZV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218863-215701@https.bugzilla.kernel.org/>
References: <bug-218863-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218863

--- Comment #24 from Shyam Sundar S K (AMD) (shyam-sundar.s-k@amd.com) ---
I see that extra debug logs, unfortunately that does not provide any hints =
on
why you are seeing the TEE error.

Can you please dump the policy binary and send the debug output? basically,=
 I
am looking at:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/platform/x86/amd/pmf/tee-if.c?h=3Dv6.10#n463

for this to happen, you will need to enable CONFIG_AMD_PMF_DEBUG.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
