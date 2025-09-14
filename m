Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B068338DDB
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Sep 2025 02:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757815430; cv=none; b=jGzzhTy91pABHWXvgH77SEnF4tu8itIa3AB/8EZEivu2UrP/Cs9jWzoVNlDgzlqeEf939+xgAIctv2t/3nGVfh82UPfQhYKm5nPk7R++S7rPPxmlWVUiwSxZyDD2xHTcu+alCBBSju91Cj04r7kjMLZXqoS4KClsHWl7okSLhVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757815430; c=relaxed/simple;
	bh=mOZMDqunyv5ivkIyeV7eAo5mkohb40e5cIRFu74e0wI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k7S/z+LlkpRxIKIwmso6VXQVI4wtk79yF7yTQ0WTri0pqh6HPeCq9HMkAtPp3mv5nRogfZtKVOs0GFqZDPR4CHJlHSR7NZmukpmNSTygmH6930wP+vuR3bP6+MWkjcsyMgatfwivpAg3QSq2x5lzrJ2tJx9fkwCcchszPY7cbzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZDmsvQy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZDmsvQy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E799C4CEFB
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Sep 2025 02:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757815430;
	bh=mOZMDqunyv5ivkIyeV7eAo5mkohb40e5cIRFu74e0wI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tZDmsvQyTyPGiqR9ho95VA5vYneybZ/WRRzkCijrWjqTdlsoBOH0rYUsIEud8V6CN
	 +OTC09WaF1mxPZNj6AK2biIJpdS4RqBVnkMHIh8tL5YfIUqXG4IRh+91kd8q2B/A5O
	 0fXVG7HCno/VUrdKE8+//gilBb+ejRVeqc/55yS3cW7c6uAZCvwH65AaDRyoNK4Pt6
	 Oa4Qg0K1vMLQ8xsWTTGORDg+mez8j2aAM/voHr4aPa6FPcyIIU2SDo5lsvnEso+QNG
	 dO0C0AQ0ITXkCCzef7vjOJpJ/hwHKoiD0h2Td5OEWYaE0PdNdCg7KWx1I1bQrWAGmm
	 5+c030gwXQzvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 25149C41612; Sun, 14 Sep 2025 02:03:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 14 Sep 2025 02:03:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: marciosr10@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218305-215701-TgrWLf77CC@https.bugzilla.kernel.org/>
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

--- Comment #118 from M=C3=A1rcio (marciosr10@gmail.com) ---
Created attachment 308672
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308672&action=3Dedit
s2idle_report HP Zbook Firefly 14 inch G10 A Mobile Workstation PC (version:
SBKPF,SBKPFV2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
