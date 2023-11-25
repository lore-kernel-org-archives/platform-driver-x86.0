Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C06263BD
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 13:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+dtaCBg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21C25C433C7
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 13:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700919642;
	bh=ce7hA6hfRX6uIa1BOQsTi1ncAjpzvlTsvNPwJBWgjRo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C+dtaCBg5zhivXxbKsFa4hWX4P4RsSzmcJg1EGwekAAANEwq54TAxYbcoFFH26eSt
	 fEY4B3chash+OYs2f3TqwR7H9svGaV+wocniImaAYWxACJK17D/IjRb5EkUf4M+84z
	 IQQJB2yDsf7tHYT29I9gIOxKRrRJzhnLGZmnRhnLSLBb1wf+Zg3Bq7ShBcgL0NNnkN
	 sZBHsEortS1SwMK0XsTvh8GVxQ1cdDO6wBM8fLrZEQ6Ezx0dx6xo33NhCb43dbuPln
	 yqmiPTlX5rbtE9UjRJEvVzUew7Qevg0xItBpbZouZePBAdem+mG5VA0ZMKhQuHXleY
	 6T1wtkEpU0w4A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0476CC4332E; Sat, 25 Nov 2023 13:40:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Sat, 25 Nov 2023 13:40:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexbelm48@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-218188-215701-vN7czJKFX5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218188-215701@https.bugzilla.kernel.org/>
References: <bug-218188-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218188

Alexis Belmonte (alexbelm48@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.6.2-arch1-1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
