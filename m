Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FC0D30A
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 17:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ursCBdUP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88BB9C433C7
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 17:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700931626;
	bh=X2vR0kwOyg28WIQmseZTrYqkxmQ4XrfOUlzk2y6aSJg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ursCBdUP6L6U6SmLWBQ2w+H3UL67PWrjty/SwoZGejf1fEIPhnpGFHO/8a6e/jFBj
	 cfkmh8JY6sCbBPUaSrVx64wsg+MSrARmfNWtIi9YkXMen4BiunLTPiPWbopsrABQh1
	 ifZDAFJ5gQefVYsxkMYG2jQKj/qqqR7/NdGVT4lBLNeTGJVQq+MdFZIEg27ZhEAacR
	 97pRPcma2/nV/4O5aNbIgp03VMS7ZRejpiou0veAD0XwTkZPHr7YC8YbNLd7e+1LmX
	 wLFteF6d9MmtMFYIsuvtqa/f2H8Dwd6n3QRHeqLzPw4oa2tVFhXQzWIbc/6udZkicD
	 mfz6HO9ya3Fmw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6C1A0C4332E; Sat, 25 Nov 2023 17:00:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Sat, 25 Nov 2023 17:00:26 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218188-215701-Vp6AFcwuH8@https.bugzilla.kernel.org/>
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

--- Comment #3 from Alexis Belmonte (alexbelm48@gmail.com) ---
I still have the same error printed out when manually inserting hp_wmi_sens=
ors
-- I also noticed that wmi_bus complains about WQ00 not being there:

# dmesg|grep wmi
[    2.074660] wmi_bus wmi_bus-PNP0C14:00: WQ00 data block query control me=
thod
not found
[   30.175458] hp-wmi-sensors: probe of 8F1F6435-9F42-42C8-BADC-0E9424F20C9A
failed with error -61

I can confirm that the situation did not change, I made sure that I didn't =
do
something wrong by executing the following command to clean, build & install
the kernel:

$ make -j64 clean && make -j64 all modules bzImage && sudo make -j64
modules_install && sudo cp -v arch/x86_64/boot/bzImage /boot/vmlinuz-linux-=
next
&& sudo mkinitcpio -p linux-next && sudo grub-mkconfig -o /boot/grub/grub.c=
fg

For your information, I integrated next-20231124 in my working source tree;=
 let
me know if you want me to test this on the mainline codebase instead.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
