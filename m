Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513C54B4897
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 23:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788996373; cv=none; b=P71tZg1Qv94b7cooeTNZ9jg1+LeXsaTMU9r9fcmwopfKHHa8rofLR7kIS/U9HdqBDGziLd+nBq/tJ0f+B1FKFxw7wDqi5yC0HtS30ADhwSw8+jZ7+egH/WaIlVzys+Sape7blNiCF/0RIg3nS5AxjV3WCt9nRFa0lun0QeEmT7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788996373; c=relaxed/simple;
	bh=DIxFfbzEe09jO0sym+BZccR3bVBOUoBV2qlLOdCW7k0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=daQwh58GkT5J7pl6nOXD/hxpRTXZXI8HPyfoQSryzFK2oKNjboM8pfMYeXSbgc4cINLseNmMhoNobLlYFf9U7gziyE2HInrIGlCE8D7rAEW1MCgXnYoyLA9cZXSUlHOlSzbDcKz5OPpSfQjT1zWwDPN6eb0FK03cpxtGmXl3QhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jpk4sC0e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jpk4sC0e"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96C67C2BCF5
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 23:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788996372;
	bh=DIxFfbzEe09jO0sym+BZccR3bVBOUoBV2qlLOdCW7k0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Jpk4sC0eT/D1Pzg4VCp5HWpKsOhx2Lw6wnXhy5bpo1PO/as0/qxUXZKqocgd6SJuf
	 pa0GkhH32EnEaFRT8MFeTSuSjWX8v4cYdU8VzCnuJxoGZg4D78Pxd0W6Nm7bpe4rDG
	 12Jfu306UL+978iXyOM+iuwZKFVuemrPjC2Rl4IbFz4eEVUsjc7zjZ03e3GsxWBcx6
	 44sK9u8feyKui6R5XggVgeIo/k4mSAJUwVEls/3P5X82TB7h8d/32tZHnhv1iQ6aZg
	 kgWLBpw1VJxZRHW6HlDlikKzyDXDGuC2TADKkRKuzJBz2jFJ0MVIlzKwxlem/vuehe
	 JTouvFtU1bNcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6CDBEC3279F; Wed,  9 Sep 2026 23:26:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221993] [ideapad-laptop] Missing driver support for IDEA2008 /
 Ambient Light Sensor on Yoga Slim 7 14AKP9
Date: Wed, 09 Sep 2026 23:26:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dadodasyra.pro@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-221993-215701-aNkQIXB4BC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221993-215701@https.bugzilla.kernel.org/>
References: <bug-221993-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221993

dadodasyra.pro@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #1 from dadodasyra.pro@gmail.com ---
Ok maybe the device just doesn't have any sensor..

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
