Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA032459E5
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 19:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770750115; cv=none; b=sny19GZzvnRg2QRUoqIO25809rpccDOlFK9ZZmqHfLCNQoCmPQu6H6zttTnZACqAHIXjY9ufpZgdpMqXTE6N1fZKDbf7fZZzLzTcDViIv8ZZ7+xhnFqlCGnUgvOUK+JTR/9ooIVb3Ky3+pUIxyYJb3Kw/hM7urpYK6voz8bkv7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770750115; c=relaxed/simple;
	bh=NfxxZpxuxEMYkpgdXQssoKrvtmx5jFTbVbeG9LUm+ao=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i0fkO4h39N9V0eDNeFciLwZeuYlh9K5rRFColbQcOMf3nYKJchgEnoOSiaD+V/HLzIbtH9VQ5H9UNaTNl6iencqCsM/5F0acZmGNFZmiudatBD4gD4b6P1ZejusOPj+yUBwwwjjqWc1POwbaa+EsVLAZfs3xzpH4Ki7XUV/U7F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGeKcvRS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGeKcvRS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64848C19424
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 19:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770750115;
	bh=NfxxZpxuxEMYkpgdXQssoKrvtmx5jFTbVbeG9LUm+ao=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dGeKcvRSut077DaFk+QzZxkPp3YHaJaLmRkczhHo1Tr1+Cto8k9euXvk90zB0MKIr
	 4zd8o2gSuZMHie6EpZQxnyL9h1vNsyIJ5nbjZeR+m4+5+pv67lMlxYjfV1Z0Ad3COl
	 kiokgUknAO8OWZkFAGFbNO/iHApw4fN3wk9Py3ocwEDCE9S3IT03k6Dy3bW6++E7Sq
	 hiziLqdQ5Dz9/s2YiMhL/rWJml0m8PAp6QjDkF4Z8FXx1IpkaRi7fFL6SWwyO7Zg7V
	 IGw6fBvtc6jMIKlfs3YsPt77SnEzB2LLE/3iwrF7Lt0bAhBHlrtUFAEWT2knp4hz8Y
	 Eftgj3sGpyvew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 51442C3279F; Tue, 10 Feb 2026 19:01:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 19:01:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221065-215701-wyHHchKgLH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #9 from Avraham Hollander (anhollander516@gmail.com) ---
Created attachment 309343
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309343&action=3Dedit
Linux kernel configuration

This will probably only boot on an IdeaPad 5 2-in-1 14AHP9 (83DR), or simil=
ar
hardware. It also makes the assumption of a single-partition BTRFS root
filesystem with no initramfs. It also only has iwlwifi for a wireless drive=
r.

Rather than using linux-tkg's install.sh to compile the kernel, I call
"install.sh config" and then run "LLVM=3D1 make -j16". This is because even=
 with
the provided custom kernel config, some options are still overridden by the
configuration scripts, and I don't want that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
