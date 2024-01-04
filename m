Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5836D2CCBC
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jan 2024 23:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsBJKUdf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1D70C433CB
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jan 2024 23:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704409271;
	bh=JbslpjOmxCGajTX2gJPtMmZ4Kj4wTYe64AUIrJdklQQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MsBJKUdfVdGI0XAImHW6H77Cag0DXKqJzuZvLQtvW33OwGhqYrnZEgbztOMcdoWe+
	 Yv7YeYYGmo/9iaFruzV/EIuSmSvYCoEZ3/XGxVHItSXaoYdcphQd3bMZy6fCzUoWbz
	 52uajxYoRiphtfjM1+vIuNzH4e4n18djw+vu7Iikj9eh6v4yBNjJKBQeT/KlQeqjU0
	 V6nbNvO84J3JZo/u++4u2PZ7JS2arbh2RWkRAYYwll1wYE9/bL2LPn5w7vn78x48fy
	 D56tNk54r1TH7+O30OaEqeZGzlUxSYSgV3l1NTxm5W5B5hP9o27qPkpubuhIcCvOdu
	 +R2l9zP/hMMew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C2903C53BC6; Thu,  4 Jan 2024 23:01:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Thu, 04 Jan 2024 23:01:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: zemerdon@hotmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-m2ROcCBxLs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

zemerdon@hotmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #305675|0                           |1
        is obsolete|                            |

--- Comment #334 from zemerdon@hotmail.com ---
Created attachment 305676
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305676&action=3Dedit
no T_SENSOR for ASUS WS X299 SAGE/10 DSDT.aml DSDT.dsl

Product Name: WS X299 SAGE/10G
Version: Rev 1.xx

Good morning,

I have a single thermistor attached to the T_SENSOR on the motherboard which
shows up in the BIOS no problem.  Is there a way to get this to show up in
lm-sensors or possibly provide information to help development to add this
sensor ?

I have also added "GRUB_CMDLINE_LINUX=3D"acpi_enforce_resources=3Dlax" with=
 no
changes.

Not sure if this is the right place for this, if it isn't could someone ple=
ase
direct me to the right place.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
