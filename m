Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053D417B401
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731501790; cv=none; b=WNYX678BN03udzKeZiC1alJi9ofrniWKoFJgD4/7PVBT2uM3Ykw61L6dvs8kmJXQToiRO0um9sU3zwYaT7VjXQE0DI5mcloXlMjg0Hha3CrasOV6kulUUmCF+br1n7JmwnalTwTUXvKQ/KiKukvmiukCCZMNfXJkeOw9TVlfbpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731501790; c=relaxed/simple;
	bh=bC80h0y5p3cRRyJoEfwQPkF/SVU23SThHEadASRB5ws=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s+WT45I1icmAlcp88jXuEHBcvnKXfYZnxUWFw8DHGVk+bGYX0hqwcQL4yG558ZgLp9TYgh/MIBgM3xHcvWq5FMfs81R0k8k4zuQ51VC/L0KyiCWPmu83O8eYuueGGKhOEUOMd3zYdcGtR8JfNms7BJ97OOMnAJmv/qxtDqMj7+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFgqqBFF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFgqqBFF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86BA1C4CED5
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 12:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731501789;
	bh=bC80h0y5p3cRRyJoEfwQPkF/SVU23SThHEadASRB5ws=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NFgqqBFFlfdBgJzbw4k2xeagYw8H4okzOxf8QuKv2/KI7ALvQWrLVuPAXMaJLY0hc
	 +K+7CrhVz9zzm1YTuhkVkK0Owj657QAd/kyIHsrU4AWdQkmVvuRm5FLMc/1adP0TMr
	 35OZnbqAMfdm3ODU93GOaNnU1RMRBRSpc4VSaEiNEFoZLRodygQsH6Bxum27BqHX7j
	 DVarrAqF8YwSev7lShdu2zRSZuL3JLnEVeNvnvADHlfqMbQN2k3t96I+FP75gNl8Uf
	 /MQK4hDIrpl/u0ru5bjYsYpekQHaDA3ZIil2YqTa09eNlI6PSB8CI8LhzZcEGdteVO
	 1lnlAeDMr6YFw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 70794CAB781; Wed, 13 Nov 2024 12:43:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Wed, 13 Nov 2024 12:43:09 +0000
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
Message-ID: <bug-219495-215701-gKf5OhseAE@https.bugzilla.kernel.org/>
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

--- Comment #5 from jarkko@kernel.org ---
(In reply to Takashi Iwai from comment #2)
> (In reply to jarkko from comment #1)
> > (In reply to andy.liang from comment #0)
> > > Created attachment 307212 [details]
> > > binary_bios_measurements file
> > >=20
> > > When the TPM2 ACPI table sets the Minimum Log Length size more then 4=
MB,
> a
> > > call trace occurs during the boot time. The reason is the kmalloc lim=
its
> > the
> > > maximum size to 4MB for x86 arch.
> >=20
> > I'm a bit lost why we need that attachment anyway. I don't have any use=
 for
> > it but maybe someone else asked for it. Can you remind me on that?
>=20
> https://lore.kernel.org/262eff2e-90c5-45db-81d7-30b1cc217ef4@linux.ibm.com

Thanks for the attachments I'll check them up later.

So, I'd expected binary_bios_measurements not to exist as the allocation fi=
les
but overlooked the fact that it is still useful to check what kind of data =
it
has :-)
So you got this via applying your workaround? It is useful because it looks
like somewhat legit data and not corrupted.

You parsed it with tpm2_eventlog? Did it complain any errors? Can you attac=
h it
as binary complete unparsed?

And dmesg is with or without the workaround? Just checking (have not opened=
 it
yet).

Also apparently the attachment is parsed. What is the size of that file?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
