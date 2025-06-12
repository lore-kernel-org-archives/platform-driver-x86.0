Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C8F2BE7D7
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jun 2025 20:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749761496; cv=none; b=sAKYoPcjQwCLLQgqQ6dpQz+LBe+kyuT8Z9dX1VnSKJeIO/5De/pPoouzL9NfZ1de+q+OZ9/apuk24sUstaJoWgOeQllb/ujI7AmSdoeOn6UE6ojGy3AHiMSJTxshIuv9QHSVZ2Asf2KIBhP/wEMnPhU1E4Fm2qg9I421Sir93dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749761496; c=relaxed/simple;
	bh=IkyC/Ctkgh8OogBqtK/QTuqscHwlpDwH/w828etjHAM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tUNpKD2AmqVbt7PlGHbV+J+y169VHegERx0FUA6zqYw2fER2+na/OhpMF3XUx9+SjQCUc967zCu4D1zpWf8syuyh3/gydLTr9i/lYt47ejmHK7pzkEI9W2awnXbxidUygtjjSWuEqDDYxVPtaVQIPPJ9Wjh3WaoCkQPWQaoCYFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbOG/PDt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbOG/PDt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AE98C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jun 2025 20:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749761495;
	bh=IkyC/Ctkgh8OogBqtK/QTuqscHwlpDwH/w828etjHAM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JbOG/PDtV7Zb0NVQXmsO3SBO8SZK+MmaE6XJ4jZNbj2+OPb9Wc/O3xLWnxFw4dgPs
	 /Dlpng9uS+wfp825LGYB5XD1Oa31lmmeYB+YBtxxyQcYawjrnix9Ga/R71QvuCVdMI
	 jp22vcTEK3DrDs/prXQQ6rjxwDgW1NDWlbpdOCDv32V45/qQr3Gwj+eyRoCTv2gIF2
	 oiCaxSPBnpPdmfqwti3eXnjYqtM2ZM92Ke1A+YZaC0sI+lhIjPWOcg0/R+Tmtl6a38
	 aZBiTi9QhEkkG+Ec/j6zXLvdNghR9oXYqvPTpNV6jV4bDC3XVdDs3Jy1aOYNpQOkOK
	 TgJzW52FpQSCA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 62835C41614; Thu, 12 Jun 2025 20:51:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Thu, 12 Jun 2025 20:51:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: g.molinaro@linuxmail.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220224-215701-8CnsWDLOlr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #3 from g.molinaro@linuxmail.org ---
Created attachment 308237
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308237&action=3Dedit
output of uname -a

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
