Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8032940D
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 17:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OiELKhOM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3BB2C433C7
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 17:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700933590;
	bh=SHqSq9ec6nFQPMHXlFqNMYbOsuxY4kFlbB1hLqPk5LY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OiELKhOMomoL42ziKE8n8hD9Ibd/uSjluZXBLlaMr45k046ePaeokfmJWxdgS7Kdd
	 cM2Ue34GgvI8l3OELG2SIgabesJJyhql3YJLJ5xjVUBCANWTjSXonl8JvOb0ZvTucj
	 VWWletV1oB4OIoHs8GCvzKZsAWLQpSJ4TVz8Dzr3uEuK0KOW+tNciNO/R/wPw2LEsT
	 iDinMRZnFUsZpuNKDyAgAQTMKbE8uQnbEP/jiz9KK5jOYiBQXB8f9JEO1ms6+okEhd
	 vQVXeHvMsnN+5WSIY9OeTzX/+K3nsezq+cXI9eTc9rGnCwqeMznDNTPi97W6e1Z0w4
	 sWAqLMPZ3GNCA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8AE52C4332E; Sat, 25 Nov 2023 17:33:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Sat, 25 Nov 2023 17:33:10 +0000
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
Message-ID: <bug-218188-215701-Ar3OLjeJew@https.bugzilla.kernel.org/>
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

--- Comment #4 from Alexis Belmonte (alexbelm48@gmail.com) ---
It seems that installing nvidia-dkms alongside the kernel that I built help=
s a
bit with the problem -- I think this makes sense since the GPU chip would h=
ave
zero power management without the proper drivers.

However, I still observe that even if my CPU temps skyrocket to 95=C2=B0C, =
my fans
still do not spin as fast as they should.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
