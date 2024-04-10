Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A388B372
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 00:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712709271; cv=none; b=M8mJblCyO6Q66iShVixO19FKQafN0IunDTPTHt2TuY0JvrWfp3q+DLEH0c/Ffs8nJBLjHmrbajQGMm/EbhSPwIyohGUfV7BHfRsoSCybR4jGl1hFVmVd25InSVyBF3UQF6qG2lAZgCq+nq0j7c3QCbNkLm9tjSwgJx9vCPto50Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712709271; c=relaxed/simple;
	bh=xHVMY7Z2sdSSAg34uGZ9xSNmGSyfnzzLs75e7BT4OO0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gzCtBVkXVxRkllD527knElsgifHVWsdNfHb2eIVJH3Aii2JnAYV4AkSZKUVoIoLYmRQerHj4MA9f7XFTCzJ6O7zq55g9H3Q+Aes0Nd1jx1baPp6D45HE1dOGzFpYYQt/x4sFiGo+bgWbCG4C84xs7Xnh9w4Ckeb42ZzyKezduQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1PyhS7Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1PyhS7Y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AA84C433F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 00:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712709270;
	bh=xHVMY7Z2sdSSAg34uGZ9xSNmGSyfnzzLs75e7BT4OO0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=p1PyhS7YPdyWokiuzvirQEwNFJ0vRoHnyuFaTO1ZGJsyNXrFMNPSZe9t9Ppqrx8rK
	 AZ3QiaJXVOkOKIi7esd6f6Q3DnL1rmA9W8FZGhMQcufYrutfFF3zArJnm2HhRC7v8J
	 P666T9i0tioBZcw9DBbuyd2q1i9BxSo4ezf6HrVvKtziSc6dW/98+zLR45ChTiaM6c
	 ghYMFDagS3aWl1aUiUJhmM8Gd6ltgHG2vPktUgC1rjOYhLh6gplJnDvCy//cPhfYi8
	 geNb5RqOda1rPC/gucs0iv6XUDcYULnu6YC4kv+Fc2302sjFyn3Csi+f72YMX9nIuR
	 Fc8RRPAdjnduw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 499BDC4332E; Wed, 10 Apr 2024 00:34:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Wed, 10 Apr 2024 00:34:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lmulling@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218696-215701-jkY9M5LmoK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

--- Comment #5 from Lucas M=C3=BClling (lmulling@proton.me) ---
Sorry for the delay. There is not much to it, just a spam of 6032 events.

This is what i did, from fresh boot:
1) compile the kernel, platform profile is set to performance;
2) while compiling, open firefox and play a youtube video (not sure yet if =
it
makes a difference but i make the video full screen);
3) wait, around 7 minutes later something will start sending 6032 events.

```
[2024-04-10 00:13:58.298415463 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:07.484752635 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:07.485231335 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:09.492703646 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:09.496085280 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:13.494644855 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:13.495007198 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:15.507129202 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:15.512095283 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:17.501617237 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:17.501900099 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:19.509051274 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:19.509091294 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:21.516889210 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:21.517488948 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:23.523683770 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:23.524109599 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:25.583080826 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:25.583109462 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:27.527613254 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:27.527908129 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:29.535477241 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:29.535499800 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:31.540738828 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:31.541415602 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:33.552122248 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:33.560068158 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:35.553146491 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:35.553583007 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:37.557097763 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:37.557146513 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:39.562525644 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:39.564082014 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:41.566964137 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:41.567355884 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:43.566109338 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:43.566135249 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:45.581597610 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:45.585073601 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:47.589012720 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:47.589059445 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:49.603594786 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:49.603671054 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:51.600073750 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:51.600105738 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:53.614342503 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:53.614732853 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:55.624071913 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:55.624097685 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:57.629782098 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:57.634214023 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:59.646579638 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:20:59.648146344 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:01.658537791 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:01.658923182 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:03.675633489 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:03.675656467 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:05.673374855 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:05.673739503 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:07.687322542 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:07.690965526 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:09.738533290 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:09.742130528 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:11.707979999 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:11.708743936 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:13.720025107 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:13.720450378 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:15.730913064 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:15.731321573 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:17.735085667 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:17.737068425 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:19.752476099 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:19.752846683 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:21.762457920 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:21.765068842 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:23.765390748 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:23.765787314 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:25.782965057 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:25.782993412 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:27.796879285 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:27.797280650 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:29.798304102 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:29.798331059 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:31.805232507 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:31.805252551 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:33.814409640 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:33.815183388 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:35.833073472 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:35.833105948 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:37.814734228 UTC] ibm/hotkey LEN0268:00 00000080 00006032
[2024-04-10 00:21:37.814759510 UTC] ibm/hotkey LEN0268:00 00000080 00006032
```

The first event is me pressing Fn + H. I'm reading the events using netlink=
 so
i can add timestamps, i did double check and acpi_listen shows the same thi=
ng.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
