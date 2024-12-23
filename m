Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C361192B81
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 11:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734951904; cv=none; b=vEod8MGTHAk5w6NQSzukNkSi+xSlGYB1k/I2kIEq95hbquhDepmudPiBWQ5pEcegC0VQJmAP+6ryCSyYHkzccppG3Ce/yQm4zcP+zt/HD7oqSGhxI+fELmOUsS2qTfiMf+Kv8O3GvgsLxdYlFaSmN08Ix0niy5HsAcgfetAvtyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734951904; c=relaxed/simple;
	bh=kh5knpCO1VSh7yJwCM79OpjuUFc56hAw97cb5n7S6cA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=adXXmRbQZ+MlmH0dZ+6xgfjyk5vYFgNTLjDRlMYTyy8DN/4QMrqfg15uPlvcdwbQYBPaZfOc+adgnV03lNCmd8HfgydLggrYYCHqeXA9UYmq4skWfCoZ/DlI+40Uqr6XxGxyrYYgnmbI/yy73rEnlwHfHCqNtc5I1OxvbgiwhbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvrUnMSx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvrUnMSx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A401C4CED6
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 11:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734951903;
	bh=kh5knpCO1VSh7yJwCM79OpjuUFc56hAw97cb5n7S6cA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bvrUnMSx2NSpDJceLs9PdCLi/tAb6E5veBzFnQ02qLHeI9UxlF2rvoLWnmjXq7cQ/
	 qSMenOd0jgKmsIBnEQUtdZApsAIXLEDSEvrLEuRhMibHybTfuAgwPf920UijQWr4lf
	 k7thBnz/5LqqIxn1CFRBpOU+fo09Sf8+h334gJky+IZDkfBwRXfMQaAxTOVgcPSmrj
	 3ELHf3g7kkEuj5JLloy6Xkx6VCgc52TagSC73KuZUMz9egllBl0yBkzg4U1nXRQM9t
	 WRce14+/qLS3kxY3Q1gifU2kbh5QohcPN7ACp9wcAH3rw5iIIzsSDZVpYGbj6LbB2j
	 j+8UCIzFgUqkw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 78D71C41613; Mon, 23 Dec 2024 11:05:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 23 Dec 2024 11:05:03 +0000
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
Message-ID: <bug-219495-215701-4ieTTksyyg@https.bugzilla.kernel.org/>
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

--- Comment #60 from jarkko@kernel.org ---
(In reply to andy.liang from comment #54)
> (In reply to jarkko from comment #51)
> > (In reply to jarkko from comment #31)
> > > OK, I somehow managed to miss it as it had different naming convention
> > sorry.
> > >=20
> > > Anywhow, I see this:
> > >=20
> > > [   10.693310][    T1] tpm_tis STM0925:00: 2.0 TPM (device-id 0x3, re=
v-id
> > 0)
> > > [   10.848132][    T1] ------------[ cut here ]------------
> > > [   10.853559][    T1] WARNING: CPU: 59 PID: 1 at mm/page_alloc.c:4727
> > > __alloc_pages_noprof+0x2ca/0x330
> > > [   10.862827][    T1] Modules linked in:
> > > [   10.866671][    T1] CPU: 59 UID: 0 PID: 1 Comm: swapper/0 Not tain=
ted
> > > 6.12.0-lp155.2.g52785e2-default #1 openSUSE Tumbleweed (unreleased)
> > > 588cd98293a7c9eba9013378d807364c088c9375
> > > [   10.882741][    T1] Hardware name: HPE ProLiant DL320 Gen12/ProLia=
nt
> > > DL320 Gen12, BIOS 1.20 10/28/2024
> > > [   10.892170][    T1] RIP: 0010:__alloc_pages_noprof+0x2ca/0x330
> > > [   10.898103][    T1] Code: 24 08 e9 4a fe ff ff e8 34 36 fa ff e9 8=
8 fe
> > ff
> > > ff 83 fe 0a 0f 86 b3 fd ff ff 80 3d 01 e7 ce 01 00 75 09 c6 05 f8 e6 =
ce
> 01
> > > 01 <0f> 0b 45 31 ff e9 e5 fe ff ff f7 c2 00 00 08 00 75 42 89 d9 80 e1
> > > [   10.917750][    T1] RSP: 0000:ffffb7cf40077980 EFLAGS: 00010246
> > > [   10.923777][    T1] RAX: 0000000000000000 RBX: 0000000000040cc0 RC=
X:
> > > 0000000000000000
> > > [   10.931727][    T1] RDX: 0000000000000000 RSI: 000000000000000c RD=
I:
> > > 0000000000040cc0
> > > [   10.939678][    T1] RBP: 000000000000000c R08: ffffffffbb6fdc67 R0=
9:
> > > 0000000000000000
> > > [   10.947626][    T1] R10: ffffb7cf40077ac8 R11: 0000000000000000 R1=
2:
> > > 0000000000000000
> > > [   10.955560][    T1] R13: 00000000ffffffff R14: 0000000000000cc0 R1=
5:
> > > ffff9a5c051cc000
> > > [   10.963507][    T1] FS:  0000000000000000(0000)
> > GS:ffff9a6348780000(0000)
> > > knlGS:0000000000000000
> > > [   10.972405][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
> > > [   10.978944][    T1] CR2: 0000000000000000 CR3: 0000000184638001 CR=
4:
> > > 0000000000f70ef0
> > > [   10.986891][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR=
2:
> > > 0000000000000000
> > > [   10.994837][    T1] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR=
7:
> > > 0000000000000400
> > > [   11.002770][    T1] PKRU: 55555554
> > > [   11.006256][    T1] Call Trace:
> > > [   11.009479][    T1]  <TASK>
> > > [   11.012352][    T1]  ? __alloc_pages_noprof+0x2ca/0x330
> > >=20
> > >=20
> > > RSI=3D0x0c, which maps to the parameter 'order' in __alloc_pages_nopr=
of(),
> > > which allocates=20
> > > 4096*2**0xc =3D 16777216 =3D 16 MiB of memory. This means that memory
> consumed
> > > by the log is in the range 8 MiB < N <=3D 16 MiB.
> >=20
> > I don't understand why ESI=3D0x0c while TPM2 table has size 0x800000, w=
hich
> > maps to the order 0x0b as 4096 * 2**0x0b =3D 0x800000.
> >=20
> > It looks like as if TPM2 table and this transcript are either from
> different
> > machines or different BIOS versions. I'm not sure how to otherwise expl=
ain
> > that difference.
> >=20
> > For 0x0c, the last line in that TPM2 dump screenshot should start: 0000=
0001
> > not 00008000.
>=20
> Sorry about that. The machine I had in November is different from the one=
 in
> December. I uploaded a new dmesg with Kernel 6.12.6. Thank you.=20
> https://bugzilla.kernel.org/attachment.cgi?id=3D307386

OK thanks for responding! I just needed confirmation that I'm not interpret=
ing
the log incorrectly :-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
