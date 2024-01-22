Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378893EA84
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 17:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705945857; cv=none; b=Ul4yF2uoVB3q5CZYCAQteFPiMs4jMY5JPyZ82vuWwrlsLuKXQ6OFE8+pOCvZBRmAvFNhD+0IE+eDMiJJuV80ofTYP4S1DyUaErluIavDoxMUlc+MGPOAQgHZVsUqhROuZwcBDOlhkPjJDo3E6LIgaN1o2Vq8i3OglX0GkhF7YAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705945857; c=relaxed/simple;
	bh=H2ZrMzQTdu8/GBMV8WuHB1uo87KBBNJ/y8oQz5n54LM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F2+Np+sYXuMOv2OQQSvqXtwGXBTahpqUTyFi0RQvdwuS7kbhVivF3iCmuByJtWyoQSuwT5DkLDAq+H3Ux7KZMC1AjL4LROahJ8HnBG1zjQlL/rogsoHiGIjM7kyqa2mp+PzpwiuxWwyrX0bW6Z3gcMBpbJ1KXCo+Zjs/RmF9Yj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atZZ7wtv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atZZ7wtv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC754C433F1
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 17:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705945856;
	bh=H2ZrMzQTdu8/GBMV8WuHB1uo87KBBNJ/y8oQz5n54LM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=atZZ7wtvyI6Fsku3ko1fzEsILttywu7KGETbqVDQTO1DSWsR+kIfneIp0yCQBCDgW
	 06TVIH/ktzc1kqcmHVP0TDPX9KulRFNZqYmuxC6s1JTgtMvbxtPDhKN+ECRBB7X9xh
	 0+3kN4By7f9llarrBPULq4FY9bbt8qYI1uhBT065CTtoOajgcrgye90b5zvN4rzVrv
	 n6j9A92V2FzhP32OwY4jLCs7AQtXQuR7ZNqrDTRluzniBmjtpAMvIjOrhxVrjqFXru
	 hY7Cn9vqSp91sjIHHKjCNLmVnSfUR+mnZD/FL8hzllbFfwIQ4lwZWCpo3x31Xz2ISu
	 gYl1OUlu+MAlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A0285C4332E; Mon, 22 Jan 2024 17:50:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Mon, 22 Jan 2024 17:50:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: muzhi.yu1@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-sC71SIqCJ3@https.bugzilla.kernel.org/>
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

--- Comment #25 from Muzhi Yu (muzhi.yu1@gmail.com) ---
Hi guys,

Just adding my data point here. I've applied the patch and haven't seen this
bug for the evening after ~5 cycles.

BTW, are the MSR values still relevant, because I'm seeing no difference
between normal and bad states?

```
c4912a10c4912a10
1
0
ff0010c4
0
```

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
