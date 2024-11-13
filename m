Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9922F2309AE
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 05:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731477029; cv=none; b=UAFPzUUJqP0Raezv/hxbqsoc6r0ja/w+mzROpO7iCgD3NnBcjFJfhdFzLiz1OvraRlBJeFIx20cMNoj+Zq8ETIYSSUqBPt1xN873JjNAbpyyK5AmkUpRU6Xd132sJkFykE7uvt4bZw6LlIccr8nDICblKw0Ttwvv/yZrMABaYWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731477029; c=relaxed/simple;
	bh=motTLP4itG9/088WjcbsYFWfeY0z4V8x2dzKuOR9DOk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rIPq4opoxVR7kwq+3/E6NHUAGp4vPTiA5EpKsSUo0t+r7jgqZMfp4cyFVrrzDZMVx1wfEt2HqqA2J0S14tV01NMs/o8ab/JCTWz0wsa/jkmqvo3YJBpWvQgvOEpfJJYzsxYgnkY6aTcZAtk8GUo0GocV4Nn/WCv46E281Fb7Q0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqwYniZU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqwYniZU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 243B6C4CED2
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 05:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731477029;
	bh=motTLP4itG9/088WjcbsYFWfeY0z4V8x2dzKuOR9DOk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CqwYniZUqbI0NZk2K0hBx503pncT1rZioK/GlDG8JjUPut8BfefLR8PbakHeD1Dom
	 kaciMeAooE4XjF5+qcZeYfYLmo04Asox8UENj6iRpMP/YPQqTh1fOjeY8Slb2JBlE8
	 +zVs6DBOMH0qgAJh/KS28zqdGrt1q9YTIMDa51HyzBrq1PtsaVkvLfsQp54FCKhSjh
	 QoBSILUf926EWupWVChbCKBOUqglDjKO8AQCO76qLlgotj6tZLaCwlvbryBnFIfVyS
	 iLwLfS/7Pfu/QHZMVXVW6wEuu2gDeiFDWv9+Q3qSo+qz2vWw9Z3TFOYvRDsQWUCfX/
	 maXSoLYz9TB5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 177BBCAB783; Wed, 13 Nov 2024 05:50:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Wed, 13 Nov 2024 05:50:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-inPXH44wU9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #1 from jarkko@kernel.org ---
(In reply to andy.liang from comment #0)
> Created attachment 307212 [details]
> binary_bios_measurements file
>=20
> When the TPM2 ACPI table sets the Minimum Log Length size more then 4MB, a
> call trace occurs during the boot time. The reason is the kmalloc limits =
the
> maximum size to 4MB for x86 arch.

I'm a bit lost why we need that attachment anyway. I don't have any use for=
 it
but maybe someone else asked for it. Can you remind me on that?

Also please attach complete klog (dmesg output) not some randomly picked
snippets of it.

I'd also like to checkout acpidump contents.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
