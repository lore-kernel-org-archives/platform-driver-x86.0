Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C20145B09
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717514345; cv=none; b=YbEaNDZcQ0FYK/tR+rHBjGRWsqZ1folZ1/fLbgfDD5IxF3zx0hiJ9E6dIAU5HLdz8NFKXVHjuJCL6AVRjo9rmlF7rz9SVZA7zz3V6Bj/93iEUxUT7Jkq4dQeqOmQYmJlKHD7q65Tt5ufuAN3naJ7/ARNDNR2ub5HVahZ0aYOMFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717514345; c=relaxed/simple;
	bh=tQRKLofAdMxMyIhu1ypTjff9kfm6br28P3/jjxloIWo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tBfJzdjAOz8XhatwwtozJs1/W5LGYP39V5j63EnEAmJpi0pcZqEkgM6VwxiMSNlKH60kgPEIXp4pJ5FJx0fimWUIfj5IpsgEB0vH1qY6+NKPEu1m+wPk47nO9kBv/n1sUraBsv2CJC4aWyJdvdyLe+nevIld9UYrzvdrW19XX50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XfJq2X/I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XfJq2X/I"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA630C4AF0A
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 15:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717514344;
	bh=tQRKLofAdMxMyIhu1ypTjff9kfm6br28P3/jjxloIWo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XfJq2X/I1LAsmx6Qsz/PwVeo5EXw35H1V8lyndnMtRCucPHgNSV0G5h2/x/ssUpyl
	 FQy0ro0mXrSo7HlJEoycM4nGLF1fCYFqeWUWrJfhDdB4ZWYbHIG9lSH7fIMYndgXsj
	 sbY+5WvGaJTXEjxcak/SBiZ/gTLk8T3ItLU5gtQNfccq1HG2w5JcJwsq0Ig9is2lrs
	 E/5IxX9RTv4cjaFdcXt4IkxDbdt6sk6m7D2FddPD2REP9ihcrVX4KTPaKSrH8ORiu3
	 KZhf7huyvo3rU3dKjVEY/MnooGnejEibzMHO+0FnAnMDoHz6AzQNzPXqPzOMY/bNGg
	 NCw3hG2ofBM6g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A67E4C53B50; Tue,  4 Jun 2024 15:19:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 04 Jun 2024 15:19:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218901-215701-X8i2l6c8E8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #39 from Agathe Boutmy (agathe@boutmy.com) ---
Created attachment 306409
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306409&action=3Dedit
Function key row

It does, on FN-F6, I've added a picture for reference.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
