Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC38B509F1E
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 10:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555546; cv=none; b=dHVwaKvmFpauoQurHH40eS/+JwrQiliDQKMwCXX2d3yGq7y715eUDqWw8JKz+KHJ2uYOJB19/WIU0htcWPnv5uRqQrT4nUrVi2k5v1Vqd8pvp6KddnmFc1iavMlPHRJtxHcwsoAtTvuyoUk+SCR4mlQ9Yoq0OnHIjlb3QWb2YlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555546; c=relaxed/simple;
	bh=fWZQy3K3YTSKPDYmVfUG+toTexV/xOdYpk0fC8tUhRg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EAJ5j97JF1YhSOltPGFywALvs1RdVzBRQ6veYPVCqriyHuDYJuhG+p+BW+ODY+7AglIjCmYd7RRgXklRDtsp0M39P1Qzk0+FwYbPD48Lxe/aqW6Fb+J6Ue3SQxj2mts6QxwCFviWWtpY6EWAFJ4re6G92JHjUPy15h0MBkjyxac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7Dlhf7c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7Dlhf7c"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 477B4C2BCB9
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 10:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789555545;
	bh=fWZQy3K3YTSKPDYmVfUG+toTexV/xOdYpk0fC8tUhRg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=b7Dlhf7cJ6RJ8h6amZSm0Vzrxbqc2Bj1ogIm6Qj6QxE++G7pnXfdWXBK2BsGMnu56
	 EGs7k8divuVKcc1jplG84YHqsr3boj8YDh2ePY2juAfMNd4BicmC3oHMw3gVsv3dHb
	 BexvHY/8GDFcDJK9WPzC1X+SjdoN+JW6rt4a7jzQL6iGa4rbxupFt2oTfjF3Zsed63
	 Gs7gNzZlMgJu6JAYSlSA8Y+V5PxM3B6qtlqxXRn31WlDgOzpeZVUYdptUcaKzVpfO2
	 CIb2S86jE8jQ4KL1wSUIH1gCHFNXAiebuWoZMKTZjCRKBh5Lo30KGAIVDp2rp/6lzF
	 Xmv2COZ+Bcx1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 21D0EC3279F; Wed, 16 Sep 2026 10:45:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222019] acer-wmi: no device matching for Acer Aspire A715-79G -
 EC automatic fan control inactive at boot
Date: Wed, 16 Sep 2026 10:45:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: muhammedanaspaika@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-222019-215701-hiCnyBvMpa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222019-215701@https.bugzilla.kernel.org/>
References: <bug-222019-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222019

Muhammed Anas (muhammedanaspaika@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|acer-wmi: no device         |acer-wmi: no device
                   |matching for Acer Aspire    |matching for Acer Aspire
                   |A715-79G =E2=80=94 EC automatic fan |A715-79G - EC auto=
matic fan
                   |control inactive on boot    |control inactive at boot

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
