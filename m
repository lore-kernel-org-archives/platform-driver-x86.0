Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF6B3290CA
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 07:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772176061; cv=none; b=l7AYMQAVwugnQyfwdhaOrXmihclMKGiw93E0KAaNNQyA6ujCBVcG2FcIhnGGqA30fLBnWUE4RtRy7PnZpuT8awz6BYCb+GTn6agZS1FP8++ciisJ3KrhdQmjf5Q7DClOOX9ppL7uMbev9rS/aceZ/HMlPDZtupmFT3Qv8ip4JMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772176061; c=relaxed/simple;
	bh=9oVyi2qFQ19bskcMMmhGiFGizJn+xRXN6IJYk6hbugA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FrK5UYRn7udUojBHyeDd9TXq/V7rvgkAj5d193CZmG5HuvyVDhELkV40DI7InBNadriyMRqcltQNwN+Jp21T5D2aaRdj2jLkuVQ9qzjtfVW+pvNRSUjkJCT8RDlSYAKzGuciOM6UffkvP+4ln10OQOon7BQiFy3Oc7VaFOjpJ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lD6gxAOO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lD6gxAOO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4386AC116C6
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 07:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772176061;
	bh=9oVyi2qFQ19bskcMMmhGiFGizJn+xRXN6IJYk6hbugA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lD6gxAOOvhzrN2AMaFPHTXd4ljcP404XXGvJqcYAqO4d1mTbUr4dRgKb6sJH/pEqf
	 8ar6ecNj7b9Wl6d68U7QsZZs99hVSpnv6ikafkpXS9XmsjLq3+hO9P8m7v3iY0buvv
	 xHKUmIro/6RWp8iBL0llfUHvaP7rGTqXXJ7J4BsTDQsqMTaNNcDBc6vWqqRSb2T8i/
	 rS6Idc2vbnkJAsjG68SpYwNdXpceuLp1f54LKmDKpyCjYuT4dnjPwmZ2nnkE1ItnX5
	 VM3APaXXsNs3nodxEe79uSkTGNKg9jvB4pfWDOJgkwY9ho0XIjmsA4i1xP9koq1gZr
	 UQpq8Iq7sabLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3CAC4C41613; Fri, 27 Feb 2026 07:07:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Fri, 27 Feb 2026 07:07:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220639-215701-tOoc0kKD1S@https.bugzilla.kernel.org/>
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

--- Comment #16 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Hi Enderlava,

Thanks for the detailed report and EC dump.

Since this bug specifically tracks support for board 8BAB (OMEN 16-wf0xxx),=
 and
your system uses board 8C76 (OMEN 16-wf1xxx), please open a new Bugzilla en=
try
so the two boards can be tracked independently.

In the new report, please include:
- A clear description of what is not working
- Errors from dmesg
- Hardware details (dmidecode)
- EC dump (xxd /sys/kernel/debug/ec/ec0/io)
- If possible, the OMEN Gaming Hub logs from Windows:
=20
C:\Users\<USERNAME>\AppData\Local\Packages\AD2F1837.OMENCommandCenter_v10z8=
vjag6ke6\LocalCache\Local\HPOMEN\HPOMENBG_<timestamp>.log

Once filed, I will take a look.

Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
