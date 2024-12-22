Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9512CA9
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 02:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734836394; cv=none; b=Pyw68MIz/2Qs3SRut3v+LOekoiyJ3PyQfZHRY1/mdIqjDQS2BpfJ6twH3zGXNmyHasgbFTkEEtM1Pbqy99OiWbncQski5Su3guTvw4KKzbBuFpm5b/8/uC31GlOYiv9TwxrpjFCdPUutTJnSXHFAiuxK0mAKc8XNJliVWxQ1S2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734836394; c=relaxed/simple;
	bh=fqC4SzO1rJ2CUOsUzEwD6hI42kegse5k8djT4TfaQH8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=emjNzTiFMK7OG/1aEB3weuSqMkofDAxs6M5yZW08y2jJ77XOMHGbsHYRmsRJ6U8hjpEcMgN5jerGi9XxL+auqERRigNVa1nNdLRby+GHE8Vqp2xwp1lsVQELl+5OUr2PxkiriI5Mqx9pYaibpr1LtwBiFW/CQUtfQg7A5Q93yQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KheDjXQT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KheDjXQT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1492FC4CEDE
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 02:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734836394;
	bh=fqC4SzO1rJ2CUOsUzEwD6hI42kegse5k8djT4TfaQH8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KheDjXQTKp3s8d8yUfdVqcQ3HjjUAcSVFZuSqQFYvulivctNIZFcE5NvqpHiFlbVl
	 RWm8Npdp0jcKGpWr24htSFm2vAvm9CfxOkeNWtJDl4gs97b1ZuZpu92IgIuhu7HvXt
	 AirhjdIR01BKGv0uxUciBWs1QE2TJFGGOmKtb1onn9u0YyOXLBeLFbI/AUoxA3Lr9E
	 yySaoiAT1CKGRFZavIUCyp3wufGk1EzNcg0qjo2HAIC6TigQnOP6vxNYh+IWN6SwVA
	 P5hD51zOaoMzYPJEyE8kijNilxlW7jFhY5WSXbedJv0r9P5ibWzB0JwIhAhusdKGa6
	 GVfcga855HxJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0AA9DC41616; Sun, 22 Dec 2024 02:59:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 22 Dec 2024 02:59:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jameshogge@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-veF9Hko0Sb@https.bugzilla.kernel.org/>
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

James Hogge (jameshogge@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jameshogge@gmail.com

--- Comment #76 from James Hogge (jameshogge@gmail.com) ---
Just want to add that I have exactly the same issue on a Lenovo Thinkpad P1=
6v
with a Ryzen 7840HS. Without fail, if I close the lid, wait until the lapto=
p is
sleeping, unplug the charger, and open the lid again, the CPU will be locked
between 400-544MHz.

Reinserting the charger does not fix the issue but subsequently disconnecti=
ng
it does.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
