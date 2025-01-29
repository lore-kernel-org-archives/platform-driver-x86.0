Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D6F1DF754
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jan 2025 20:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738182135; cv=none; b=F9nE4CbBT5oUrp4z6X+eZ0uGn/Q14qzOXeLqjxed9MA+UTtEYUkW+4PY88UBPkVZUtQT/YoQ+kxFj6p3ja1+vmthhH+Knt7b6LlQG1GZ4kC3Uvcd2FJecmzeajNm8iK8t0RRMRMjvo5dPi4tZy0L4mLkTeLIWm6v3e/7prk+RGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738182135; c=relaxed/simple;
	bh=ol5Ncg0a0SJgsUR+SOfeacblxasdUU1F0edGKvm53qw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F5thNokpFRQ6lNgZusItaqLWpJErY0x1CKP/duduW4A306Nr/jgo11iXc/WM3yamNFfshDHsBGaaDjOqZqab0xJIlvlqyShtfVhujfVKOAgGTZ61zfv2qEjw/Kqjs/GJyO9SNX3bgc1fa6bQCw+rdM6sKBooflimI49sZ8CWIIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOlJ2FXI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOlJ2FXI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63614C4CED3
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jan 2025 20:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738182134;
	bh=ol5Ncg0a0SJgsUR+SOfeacblxasdUU1F0edGKvm53qw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cOlJ2FXIA4YMrmbPe6dIA5BnCstvCsBd09oLIgmvbqBrQoRnjol0ev9OlDZ68w3lV
	 SrhXhGSBs3Nfy6TgVMaiMlnIhZFYiPGN0cQ4nFA6wFB7v47B+t/8SsRNoUFlo/ilzz
	 lHwyssMcPmRx2wokrSMEOfzitYdcoE0NcioJZqT5/IEmo0ohuX0o4NAyqqSYK+Gix6
	 nyw3AP3tjPQp9w+98U4sYpa8sqmnU893oxK5g/7RAG+oZ9f+TSjytCL8O+ms6b+ms3
	 FnLo3iMrYsTfwAnb9lKVfdKhGXqZrFQocNhibeqsPZLfVePZEPzsaHynBMec3UGqmW
	 1t1E1LPmPnFmA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5A1EFC41614; Wed, 29 Jan 2025 20:22:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219733] No UI/touchscreen on HP X2 detachable 10-pxxx with
 kernel 6.12.y
Date: Wed, 29 Jan 2025 20:22:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_input-devices@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component cf_kernel_version assigned_to
 cf_regression
Message-ID: <bug-219733-215701-Sazzj0iBbj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219733-215701@https.bugzilla.kernel.org/>
References: <bug-219733-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219733

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Platform_x86                |Input Devices
     Kernel Version|                            |6.12
           Assignee|drivers_platform_x86@kernel |drivers_input-devices@kerne
                   |-bugs.osdl.org              |l-bugs.osdl.org
         Regression|No                          |Yes

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Would be great if you could bisect:

https://docs.kernel.org/admin-guide/bug-bisect.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
