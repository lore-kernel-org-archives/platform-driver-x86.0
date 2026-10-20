Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792540281;
	b=MUkMitIryhLyhvjmOrP/PIiHuzzg55t9pGTtwpSddOU8IW9qraNV7Fy+Qu35E3aV3pGC
	 vauE+2fM4CkcIG/j7lJlho8MJ5fTvhfP3xaZDjoFQDRPCNNPCIdUyZrRAFugQOC/2MmK/
	 K0hprazX64pWFxzJMHDWHfi06yWGi2np5KpltEw4aEwAS/RlL2VWV+9Y4FNIgllgVRLqh
	 wJm3SG3fDEcNfABDdr+UkV0WZn+v1UsK1OKBu5XaxChqZzMLRsdcMY52spyC8t6hzRiJk
	 QdM7198DwPcNG5ZCscMZ5fmNh+k4xjdD6gZ+K+lT7neNW5PZHk8DLzvf27+YB1AaSRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540281;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=lCB8MRdlFFbdX92QGE7GIKfl98zKQOHqoZJdaOVbitY=;
	b=QzyAhIgLYia+gmHM0SXWL7Zn57dp78CIUxB8oZOjHEe3T4uH+dHtS+zLST3j+RMud6ms
	 bjvA25Ihma60WfqAK60pBsaQhIWLWRUps5UKFBl5c3XVsF1TqO05hb2Wq1FZB3U1FTPjN
	 y5kkIPzTmcJRmkSDgwJaY54zrPLTKMBPmQcWiBi5STcUX2odlSPjIjUYgLJTyof0BrBKN
	 jbPRM3YuC69TJ6SrVolrltaPLThiKC6lG3AYfHQFkbMTkOFKviZqo0WsBrhRpclJo9pfy
	 jUfQ01Q57lFEaV+wPFJrxIeaFBMZ7yodf0lx3O8CHk+N4lT55fTZdRiiN0N8HnfNB8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b="qbExUnD/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49EC3606A31C
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Tue, 20 Oct 2026 23:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qbExUnD/
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249BE25771
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 23:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792540281; cv=none; b=DPSI/GGwJOJ8QBdG/lASxpMrgGF+SqVZtiL5YgZ2Q07F6cS0ir7RpkIhJH7TIjBQG+hH5XKG86vKxflaqvEwQibOnkz3RqqvDYagCpClfhaYpSokA8uiX6BJr2FnEZC5kp9E0sTgH6MsUCAk8YgfoRNlNa6Enbxpzir/SWtflg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792540281; c=relaxed/simple;
	bh=lCB8MRdlFFbdX92QGE7GIKfl98zKQOHqoZJdaOVbitY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qS+q4CHT3FiWMePaWQO5ZWaTaaxCXCh39XOgcbo4sa25QgvrPlydqstE3VncEynuv2kL+Ll+RZsENXOkWYzZjBY+ndC4sNqnFSq1Sqsb95GCP/NRz8cdrTi0eQ+o5Gp+3FVWzQJowCgCr2aByPxyhPsO2rT58oebvt1M0PP65pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbExUnD/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EADD4C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 23:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792540281;
	bh=lCB8MRdlFFbdX92QGE7GIKfl98zKQOHqoZJdaOVbitY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qbExUnD/StlmOHZNGtf9kB+KfApClb2hxUBkJn+aN5MP5YS1gLWLVucPXHYDy7mcY
	 gaBaUzgduLhWeNmIMr7lgEboO19PmLzhqjKjLfc3+bfHAbI2JMzVIqj30nY3M/f6B9
	 PQrJHc7WCwqB4S9nv8WIfH/Ra6r54ElH+wV2R9gzy0wNWZNAvsJwco0GKFERuaQtZo
	 Q3klDDpVIv19PdCBhVkolxeehX2WrFL4hFsho9gU2OgTzTaGzMq/GvNrWcJdOUZRh5
	 o8X3kcT2iL3ta7yey0SpJ1B/bkaWIktRmnjX6rgkva4Oi+QrVfe3GqeEtiBtUyeb4/
	 0nWeysyU/0h5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D7685C3279F; Tue, 20 Oct 2026 23:51:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Tue, 20 Oct 2026 23:51:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222161-215701-sn11sUpb2S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222161-215701@https.bugzilla.kernel.org/>
References: <bug-222161-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222161

--- Comment #6 from Armin Wolf (W_Armin@gmx.de) ---
Alright, i said something false. The docs state:

"Some hardware send events when a key is repeated. These events have a valu=
e of
2."

So for some reason your keyboard auto-repeats the super key.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
