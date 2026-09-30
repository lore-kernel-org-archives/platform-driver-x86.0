Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470B120E334
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 00:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790729601; cv=none; b=V18f0D/1iwLHK4QW28exgY1Ll5nfPP6FMFPgzjFIFHwxF0GWzOQ2Tah1tyWHjBLy/kUV5nU2vNkawZ0cTfO3snn/U3MnH7aublQo9IkCZ+Dpvg56NpdrfefCGQk5r9OZ+ks3oiWtp6P5GUWTSYNbyvWVP7nHTQCm7C6Btev7/ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790729601; c=relaxed/simple;
	bh=jk1Ny0VCMzTTXzDlF26rJaSfO7VZBlXFIdx86B6fcUs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hc0Kgtb6E5XnHuYJdaXRga9u3BpfkfCwDjq6bLq+ASP3c5eELwOnWoqUBNnVe/k+Ceva1g2T4y11Tk/+RP+BOSllYopWgM+6H5IsPUYlKdAXrXAnzMqtHdyFhVSKSpL3YDKt5OQS71xOOZHcg+1nbbmRXgW+idsNzXORMk90sgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vK8eSdR1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vK8eSdR1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D455CC2BCF6
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 00:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790729600;
	bh=jk1Ny0VCMzTTXzDlF26rJaSfO7VZBlXFIdx86B6fcUs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vK8eSdR1WtHdRvz6boHot80dPne11TJr66HUVM+IDCpRgh6ZYOE2cp17PXNm4jpPg
	 mkQB2Pi9000l8BFzqWwDpDv7us037JTpUewo++kWdpPMrYDL3XS/1LXOFssfZH934Y
	 ycD5v5SjT3FAClXXIvOoI4/CPNF0W5qzJjKW+apjB7/pOUrOI6JOUdvw4t34wfv+jc
	 FqFNwMNNRUCuW3AwM5MbPGzywgeLDRdwylgeGdBlLMwPVzW6CAfexBknuGfV2jXH6A
	 OBl4RCOz0dvlZ2Y+htFNcbHoTcDeN7SG+evdavc+JnJNjG7ydFNMyM+ouCkJL+hmF9
	 c3zBW7258nu1Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B1149C4160E; Wed, 30 Sep 2026 00:53:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222062] redmi-wmi: display-switch key (F7) dropped on Redmi
 Book Pro 16 2024 - firmware sends payload 0x00000101, keymap only has
 0x00010101
Date: Wed, 30 Sep 2026 00:53:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: uselessfire@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-222062-215701-ByFw8jbEaw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222062-215701@https.bugzilla.kernel.org/>
References: <bug-222062-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222062

--- Comment #1 from uselessfire@gmail.com ---
Created attachment 310971
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310971&action=3Dedit
acpidump, Redmi Book Pro 16 2024 (TM2309), BIOS RMAMT6B0P0B0B, xz

Full acpidump (acpidump -o, all 46 tables) from the reporting machine: Xiao=
mi
Redmi Book Pro 16 2024, DMI XIAOMI / TM2309, BIOS RMAMT6B0P0B0B (06/10/2025=
),
xz-compressed.

Also relevant to bitland-mifs-wmi: the MIFS WMI method is \_SB.PC00.WMID.WM=
AA
(SSDT20); the EC mode register QFAN and the QFAN -> ODVP1 mapping (NTDP) ar=
e in
the DSDT.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
