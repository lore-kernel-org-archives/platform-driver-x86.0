Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711BC14F9FD
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 06:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731480606; cv=none; b=rg905n5L7phVTwkUGtt6DroAYvNu9wpOXCZRRa71Qoz1yhcpmt71wfST7+twEkUyjZK0/2BKqcIS2g5TD+0PlpiVUXAKoxbj2xV9BdMG++VmKOxzjd/+k4H4vedlLTmfu/RDP/0AKu2amv6XJ43H5EN+4i8mDN9XWMRmbHoIzEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731480606; c=relaxed/simple;
	bh=lMb3FdRP+7zPGdsGPFtmlKhVxXFY68m5Gw1vSn2KCF4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tCvRWbrVWgDMXwGCL4fxYF/ycc0coHkK9g0jlUUqLHeQ/i0ZfN07a2viuIDaZVjGuZwYf3WR0dzSv1vv5EEKK7Ok8a11THcvX08pbMP+F4C2E47qfDyKz/BViIQHlP2JLRXQjn6lPCjQDHoD7cqBxxTAXckW2Qdemizfln+FmYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9oUqqLl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9oUqqLl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6103C4CEDB
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 06:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731480605;
	bh=lMb3FdRP+7zPGdsGPFtmlKhVxXFY68m5Gw1vSn2KCF4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a9oUqqLlKw+kwvxVdKdfsAHKgCIqK8J5nx1mFI+EEsyWjSqaPiPkJyD38sWolPHQu
	 //+fwqfOlpQJUFNL9LHaVzspL0jXknXJiv+blMndNVbElYgo8tLPqUB03cUY7stWmt
	 sVn9AMPMIovn1/FdN4sHHiIdsY9AnlhNiCwlRYvTHGTBezm3JiSUXG66x+3Hv6VoWW
	 eS+zNmdUOBEDw2J3ylSNDQjlxSWHsPa+0jwYYBD9Uz4eqHpTL6Nmx9zTBq+ikYhvLB
	 CqvVbUQgENAoOfvf6WsPbQiIR4gvCYxPgFhPKhCBSEAVlRnS/6sISqEYdk8cge52ht
	 TkCT3gZulzUHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D533DCAB783; Wed, 13 Nov 2024 06:50:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Wed, 13 Nov 2024 06:50:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-1eOfi6S7tn@https.bugzilla.kernel.org/>
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

--- Comment #2 from Takashi Iwai (tiwai@suse.de) ---
(In reply to jarkko from comment #1)
> (In reply to andy.liang from comment #0)
> > Created attachment 307212 [details]
> > binary_bios_measurements file
> >=20
> > When the TPM2 ACPI table sets the Minimum Log Length size more then 4MB=
, a
> > call trace occurs during the boot time. The reason is the kmalloc limits
> the
> > maximum size to 4MB for x86 arch.
>=20
> I'm a bit lost why we need that attachment anyway. I don't have any use f=
or
> it but maybe someone else asked for it. Can you remind me on that?

https://lore.kernel.org/262eff2e-90c5-45db-81d7-30b1cc217ef4@linux.ibm.com

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
