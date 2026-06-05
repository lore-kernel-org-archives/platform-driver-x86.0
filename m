Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21CC293458
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 18:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683432; cv=none; b=gS6d5yIRcJExcAaEuf7B8RPbeAVUhs5EZxyi3KvvH66a9d7vzGbQfC7f1uceIk/K1ztMDcengGG7XzAKha2fSxHvwoaugts7wq3xw/WcJGdG/eHJ8tIDQ4oNsw9aPFRItjDnnopvkb7TWa7nkv4PNzOx9p90g8r3VoIw5kRlx8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683432; c=relaxed/simple;
	bh=CF9afXv4iwZt0E5xPBQj1ZjKcL0er/86VpSIDBNDqsU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X/DDQhwEMqYplUT7cCYaE7spFa59KvjzsW91sGaXT4XduWBDmlq2bjLkl+EmPe09cjAjvFUXKJOtFAaolPV8/zWDP3lLqIlwSzIOb9nMM++fFItJbY8WLOijD23AWzYRp0vaqdCEdeu62a3TB2Ucj/5kdMN3hC6oxURhkibebNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYMlqkwN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYMlqkwN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8492FC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 18:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780683431;
	bh=CF9afXv4iwZt0E5xPBQj1ZjKcL0er/86VpSIDBNDqsU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gYMlqkwNnmsGRdEE/R2s7rZuHByprV3N520u+L1Ob2rl7Za3WAWVwFMdBemaQpC8G
	 X+pY16qdqxfrkSgrYIbJp8uloj0eVT07yN5849oroDTSE+KnX9LYn7jOKeLSxRZ93n
	 fFaLiqR97Dk5shxQianJgb15/jAzitgTR8Bkkj+TIfOL0ouWnEDcUnlGa93Pwqw0vl
	 mTXwdfOx1ZVemMc0EfHPYJhpNImkmhnIdr57yNdNyr3dNbV31+AdS4c3nLigs+HD2l
	 v6CwMNDSyBDpbSQuqR/nNfeL00R6gftfvyXRDZ2tWRwaNnvubjBZYDlX3gfRL3778l
	 ikHr3R+BzTiuQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 63266C3279F; Fri,  5 Jun 2026 18:17:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 18:17:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221583-215701-pBIWZ7UFMb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #18 from George (george.stafilidis@proton.me) ---
Created attachment 310272
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310272&action=3Dedit
dump_off

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
