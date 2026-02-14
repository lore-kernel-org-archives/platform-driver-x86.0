Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4912D8DB5
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 05:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771045318; cv=none; b=pVUKXa9RbwMH+LiSn/cn7H17MrM5EWQZ3yAupgcUTF4faZvLytygTgEmv1JQhJ/rwrwEYyjicONm9MGKFQYeDaQEtgRIDc8fSWaMy8G94Peiitg7+XUsuq/Q8i/aS+DerTzEYdY2FTZsCEsNSBM32CZllSPNIV8NPWH7RLBagDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771045318; c=relaxed/simple;
	bh=vGplhhmLGB1FoAPtsa8j5+ZmB6L4qGKzI63cOLtOilI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o+eTZLIvvWTHE4n0wAIMI10avzKmVGJ71FOa7ynPUYQi/qglwzBrcdVgD6mb19q+PLB5q/1HKgCIWN8EMMoehgto9Ae17xYym09kIFesrGqWL+qrQGowNJzHxyDGFBrK96h94/83LO68PHRxXKAo3RDGc0T3qxYIUOs5gFlnUGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFXn01QK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rFXn01QK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4EE8C19421
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 05:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771045317;
	bh=vGplhhmLGB1FoAPtsa8j5+ZmB6L4qGKzI63cOLtOilI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rFXn01QKxsBdMFOS80ggMtWqLwRWQCeRop9x52OQXlOmrE5gBkMB1Uy4+cR1i/tZX
	 P+xMFX216BBQ53Pdv8wsktslwuCh6Aul5HpGm0KY0Q9sTLLwRIGFwseZDU31/4fLoP
	 78MG4DmyxNSmvHOoCo8uWFHkRbTByE92IIjQXSu4OPEDXdtUydG90NaCvnB/wC2Mlr
	 vXrEGdfM8ANDCD2hReafmzxEEMHLSoLRfFl2+DYs+0wPLYnLE9HFCmzJ063dMQS+Hh
	 T6mCoB48ZOaYdAmmeyt7Cpwg6kwijFE34U5d3smBHSWex3KGqiniegIBVw4sbExmQE
	 pnnJVE8kN1uew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DDA31C3279F; Sat, 14 Feb 2026 05:01:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Sat, 14 Feb 2026 05:01:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: juanm4morales@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220639-215701-R0x9vGUt2g@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220639-215701@https.bugzilla.kernel.org/>
References: <bug-220639-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220639

--- Comment #8 from Juan Martin Morales (juanm4morales@gmail.com) ---
Created attachment 309375
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309375&action=3Dedit
Reproduction Script: Validates platform_profile effectiveness under sustain=
ed,
fixed-scene load (CPU+GPU+Fans)

Reproduction Script: Validates platform_profile effectiveness under sustain=
ed,
fixed-scene load (CPU+GPU+Fans)
Metrics: Logs CPU Package Power (RAPL), GPU Power (NVIDIA), and Fan RPMs
(hwmon).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
