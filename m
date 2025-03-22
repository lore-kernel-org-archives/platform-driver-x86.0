Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE2922612
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Mar 2025 07:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742628684; cv=none; b=IpaPO4Xlxz9qFS34BcrfiRWdDKsh4cuY+UpDiDfuXb4ZMrZdvMBrYY/BTyfo8E1iaPEayKP3C+a4BdAR8Y4An/U3mj8FEtlaW4cp3kuJJ0xb1mfE5cwKMrUjTJ2Tyv7WyX8PKuzN0dahgY2pZ3HcJIHHd6yb2f92jIt/yk3Vlk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742628684; c=relaxed/simple;
	bh=jDS/7a4nveAo1IevibTfNQAQ0yd3pLZroqsHJk2o1m8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ir//ZnFC53NcQt/YfjS7IZf2zPSQnfWpODaRr26bMJwamBF+elwW9BqgeceqADZYX2CUZmzdypOworaOvMuXpEgwFnX40vQOKtKjntzFakAXvQvECeVGZpgmJ2AU0hWtaZWpjc/3Q9dtXP3rZMgNaGiMrYncLv6lnrXLTu/KIjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0QMPqcA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0QMPqcA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C4D8C4CEE7
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Mar 2025 07:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742628684;
	bh=jDS/7a4nveAo1IevibTfNQAQ0yd3pLZroqsHJk2o1m8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=T0QMPqcAiGfyP88W3YHnGU8NbGVlHYo6wh0/JzTjXEFvoHArbFc6LyUaVhh0bS6vE
	 COVHItRsiV0b+8P51bh4HrUco6MpFIUZMu8TAJG+rHzVpxTyIr95pQnZLlVh/w7ywX
	 gql1X28Hcs1lOIdIhd2uQf7p6QYtxYX0FPbUYiofdG2f1FasMvchoQnpIa6bkB/El4
	 D7Ie42rvZZOFqsAdew74T/BPud5XRnjFTR4zj0LD4foyiyovbDMYDnF4kLUGytDZkB
	 T9gLpq6MnZibQCUqCKSlKqE/VNobN9Ba+9NBEEiR6R02Q1QBb1CKdnEHNFjk4MRiB+
	 0bo+bkVqTbNHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 44CECC433E1; Sat, 22 Mar 2025 07:31:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Sat, 22 Mar 2025 07:31:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: masterwishx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219904-215701-hr1tB5c9qr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219904-215701@https.bugzilla.kernel.org/>
References: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

masterwishx@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |masterwishx@gmail.com

--- Comment #4 from masterwishx@gmail.com ---
Confirm sane issue in Unraid 7.0 and Ubuntu 24.04 on Asus PRIME B760M-A D4-=
CSM
as we discussed in Unraid forum.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
