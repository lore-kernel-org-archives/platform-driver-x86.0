Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969584;
	b=CYZEDkgyju3RsmAnWCvHYaQn/K33z+kTBJOF1WU5t9+hQ9IX++4KAotAG27nJGCObCwN
	 3DxpiW3hm3RXcncVymvZO/FQxAfoQC+eDUh1yESfY0PFosjA1U8KiQl76Ug21UDW9IMtE
	 ddvnOGOSYeTfICOfAdbbAiFllDVhAwkGx4ZnnudfTPce5lTGrA4S+eHE4/PPwk6jSjVqU
	 yh0lL5ohS7f7kudC+oPbBKWSy9ooFCJBPX+sb7lJt13aSd4Hz6kHDeeLV+jqoB/JYQ23K
	 E6cSDLBiXYKgyTrm40UAop9SaJH0qZt/KZjLzpoSRGCFjhyMdYtjOFkZ7KhU4HwLGKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969584;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=pCMS7eODQm764CdOV0y1lq7PyFloXopEf3FWWeoZ814=;
	b=shX/7eLlR9ZyuA/+ZheXT0ue3X0xkiCPGhCaOsZTp+q+IjINdeGvjdWf0MHEDQrP5Flq
	 cSuOHq6G0SUZ/VgqkUBGPHNdIZ8zaBQgeXhKuwP58bMSMEHgXubrHiZv/WWYF/HictoUD
	 dfpmuHCrxMZ9WZ3Hxi2MAckkf4s4ish7GwJM+g16g21Wt6UrrXvEfW15QA9XLo2D3dzxD
	 WhXlBY1CUy0V9SN6UJgUO+dk3ppG+cL5IoRxdnYRqLRKkACVn4fwnSUADfmeBu1gzdk02
	 unI9szODxUVP7asLstomLGJLCVmAtc7Pkr0/kKyBoRq5GnE+zNmQe+lZt+0Ic263IuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eEhkOYsZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC41606A326
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 12:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eEhkOYsZ
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3AEF61F0089F
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 12:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969584;
	bh=pCMS7eODQm764CdOV0y1lq7PyFloXopEf3FWWeoZ814=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=eEhkOYsZysRmdK6uIMigXzFk14zC2AnlU6CAcoC2C1rqolS7hwME79n3nowUZfYok
	 5hxNRl4zbM2fd9gCct0vqxLDF/dUdPxI5u6waF9m8ytJ72hbSLlva3y+ouoBXydcYg
	 /O/dE5WhzBWRHo24XPC4esxCZzwEfsqiA2q/PEvW0MzvyaSxB2/yq4YutKa6zcTCCb
	 lxl0dPS0YaGGYKheft0CKnx2ka9z1NK+S5ZRUIRX6j63Vo08cLDGVpuyRTJKabYT91
	 A/PmfbPb8DQu9tQw8XOZMUyt46qjw1nGLAQWFiJi3OGiAgqqkV2MXF69S0B/yzs7OP
	 Zi6wl+g7o9nYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2F0D3C41613; Fri,  6 Nov 2026 12:53:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222240] acer_wmi: Nitro ANV15-52 fails platform_profile
 read/write on newer BIOS versions
Date: Fri, 06 Nov 2026 12:53:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nghiant@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222240-215701-oN4yNgjP34@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222240-215701@https.bugzilla.kernel.org/>
References: <bug-222240-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222240

--- Comment #1 from Nguyen Tri Nghia (nghiant@mailbox.org) ---
This only occur for the newer BIOS version 1.53.

```
/sys/class/dmi/id/sys_vendor:Acer
/sys/class/dmi/id/product_name:Nitro ANV15-52
/sys/class/dmi/id/product_family:Acer Nitro V 15
/sys/class/dmi/id/board_name:Sportage_RTH
/sys/class/dmi/id/bios_version:V1.53
/sys/class/dmi/id/bios_date:02/24/2026
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
