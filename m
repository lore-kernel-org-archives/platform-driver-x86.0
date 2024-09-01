Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E654F1E517
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Sep 2024 20:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725223507; cv=none; b=Z//P/eGJN/88CzlbiT+qIY9slszLB1ftrvTBhmf3W6x8WpBJm09BdW2cqLSeXPz3hMqfvZYPOYylOQzITjaYRfAuuFP3oRrohH++/JUtq8NbyBFukl1jrGzyU63Tp1/Rcv1HyXLu8bS/SGFkDk03cdtdd/uDBLaQ7zzTbABp0Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725223507; c=relaxed/simple;
	bh=w7cKv8QHz0hXBrOf6Lkzp/X2F3QUzalH/BxsfhZLw4E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tnD77vCU9/fHGyzn13zf+XvHq8aIBg19pkRFUUbxl1n7so9P4syTC+oejsBy8RcxBfYrbJJTY5HcZC/tz4mq5PLLPV2raVuhcYwPg/KUFO/lCRPLqinzwqH9OzxbB1bDgrKp4DZeglN5vuwXC+nxrXZFrHPTu3mCGrRagdDMbwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p0AndCD0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p0AndCD0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76FA9C4CEC3
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Sep 2024 20:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725223506;
	bh=w7cKv8QHz0hXBrOf6Lkzp/X2F3QUzalH/BxsfhZLw4E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=p0AndCD0VJpRZVRRFBaGVEdm4OS1EqzFyyH3/E77iNCW3BPi92RJwE9MT4fg6yIPQ
	 uPBwI3zyg+Iiz6o/sLEBBYp4R6J/52pgOhUn37ElACI6Wmgj7p3WnRHAdLBv1Xjgzo
	 DCJzxgJtJ9xq0HU/+69qM4VlptKqxZ0brV0kcnPnVOd5wFL/wAEKrfAFKJfbeWP7l2
	 XYY3HwZQu52fhvzPAGJ3hegb+SSkX3BXwpnozAB8kkZ5Mci3FScwzROY2GlzNK/pQh
	 lOft41BDNsciA/mXahpmT7IGEkNjOrmDUTfMC2Fbw5i7p3BuSSiO9lpaJKgfGWceAp
	 ICZzrCiMfuTHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6BA81C53BC2; Sun,  1 Sep 2024 20:45:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 38082] Fan sensor/controls not working in Thinkpad Edge E220s
Date: Sun, 01 Sep 2024 20:45:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lorenzo@masellis.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-38082-215701-BMYsxlOnvs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-38082-215701@https.bugzilla.kernel.org/>
References: <bug-38082-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D38082

Lorenzo M. (lorenzo@masellis.eu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lorenzo@masellis.eu

--- Comment #4 from Lorenzo M. (lorenzo@masellis.eu) ---
I confirm the same bug on E555.

Fan speed is always reported as zero. Writing fan speed (with acpi on) is n=
ot
effective, as the fan remains at minimum speed no matter the settings. This
lead to CPU overheating and throttling.

At power up, fan runs at full speed briefly; as soon as kernel is loaded, t=
he
fan slows down to minimum speed and does not change speed any more.

With acpi=3Doff, the fan is effective.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
