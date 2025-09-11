Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D906320A09
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 12:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757593258; cv=none; b=PHaXrWJU8suzBVcC8u2CncmTf8OPThhbyXMtN1m0sBqnjeLU8KPTS7GVQC+z7+cqzdD8TxT0b3Az+GvcvzN48sgm3ETPAhD6ccf/GXE7ODzZqmLAINRsoT0K8sYFlKbgO9nsXq0zfAxQkV2tz+oxhNW9tOMVMBPbVSQPGsbHuO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757593258; c=relaxed/simple;
	bh=6VbgYPQekhiFC3+pnjGQXJZAWFqXJhu/4IhoIj2rKNA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=j9Vc3+ITTfiHb5eqIRcP/nhEnPHmP1ZJEMDZp8jpnVHFCDyQujRLMD7vBpD46nIMzl43RBAQFrgNWFh+ZPC/eonqQIV5dGN2lmn43yahgttGrSHg66VkUkfx1YDvm1b9knwZ8bPDj6PikUmoc7GR9Zg47ZPs/0P9FE2SDgItufQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwrCyrxq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwrCyrxq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3ECCAC4CEF1
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 12:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757593258;
	bh=6VbgYPQekhiFC3+pnjGQXJZAWFqXJhu/4IhoIj2rKNA=;
	h=From:To:Subject:Date:From;
	b=CwrCyrxqzBkHH3fgTqZyCrxfeMKxmtvdtWxmpeI8y/7rGyv8OVyS3IanvCxmG0pYo
	 HNUBXF3LHvLHmnzymHisIPWTjrk7LBHTVYJxuOm+af+C8IKViMfRD+8wUhgZhgGmqo
	 ZYnC7dVRUJNo5RA3gP45bbZ/ksikBTuqTJ9WF1pNuGcQtlVzEFTyE3ic88HRTcfT24
	 l1fxule2KKnwauXL5UzhcoQzPqlMx1yjs7sYpybbaMmLKSWiEeD9hQxdBs7af5Oot5
	 t+z5TKo+ZI3+CcjVqA8nlVKgXgI/U4Dtuyn1EIHRW3maUoUnpLr5F85tYu3eYVMa/X
	 lkKSHqmZe8tlg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 351A9C41614; Thu, 11 Sep 2025 12:20:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220566] New: Lenovo Ideapad laptops wrongly assign "Cut"
 intstead of "Selective_screenshot" to the corresponding hardware key
Date: Thu, 11 Sep 2025 12:20:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomashnyk@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220566-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220566

            Bug ID: 220566
           Summary: Lenovo Ideapad laptops wrongly assign "Cut" intstead
                    of "Selective_screenshot" to the corresponding
                    hardware key
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: tomashnyk@gmail.com
        Regression: No

Created attachment 308661
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308661&action=3Dedit
The key in question

Lenovo ideapad laptops have a key (picture attached) that as per official
Lenovo documentation
(https://support.lenovo.com/au/en/documentation/SG10220/ref_hotkey_icons?la=
nguage=3Den
) is supposed to mean this:

"Opens the Snipping tool. (Windows operating systems)"

Right now, as per line 1331 (
https://github.com/torvalds/linux/blob/master/drivers/platform/x86/lenovo/i=
deapad-laptop.c#L1331C1-L1332C1
) of linux/blob/master/drivers/platform/x86/lenovo/ideapad-laptop.c:

        { KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },

"Cut" is assigned (i.e. action usually triggered by CTRL+X).

I think your key is actually supposed to be Selective_screenshot (
https://github.com/torvalds/linux/blob/7aac71907bdea16e2754a782b9d9155449a9=
d49d/include/uapi/linux/input-event-codes.h#L675
) and is mislabeled.

Therefore the appropriate line should be:

        { KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },

(note that on other Lenovo Laptops like for example some Thinkpads, this is
already used, even though the physical icon on the screenshot looks a bit
differently, see for example here:
https://download.lenovo.com//pccbbs/pubs/x1_extreme_p1_2nd_ug/html_en/index=
.html#t=3Den%2FUse_the_keyboard_shortcuts_(topic)_T0000709565.html&rhsearch=
=3Dkeyboard&rhhlterm=3Dkeyboard&rhsyns=3D%20
"Open the Snipping Tool program.")

It makes sense - this key is produced by pressing "FN+PRINT_SCREEN", so usi=
ng
"Cut" for it is odd.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
