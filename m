Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E2172627
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780600799; cv=none; b=qGCxie2t2ejNJ+1E2eZL4Kv2uJ4d5R23W0M8JAQhgzjS2IPTUj0AhjqwfUJG22UasnDNUOipJ76eB0snsUnv2XuWwkwaxJcmXfyZ8B8Z2jposz+8P4M4HpZ8I/W02bI2JYfGifZrh8InBwWjf0kMpkv6eZY5XJPTWzN8IjtO+uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780600799; c=relaxed/simple;
	bh=DxEnZ7njPT+OSgKqIOcOUcXlQLIkexxH5XW0AX6otyk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CO7v/U/7qwkvhf/HSe+8jEdSujBCIbD9Fx+/AK5KmZoJzcoxMbqbUU2yPs9jZCsjnjVEL6gE5b6hGIuQJbXCtc9wGDlDAsxFan8wCUb5hwt4KDubwA64wasq9MJQzgkoF8IRHH7Aa5Fnetjz3Oh04gLzQrLWmKjWEJIsWjLyqGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGHQF7AK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGHQF7AK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37274C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 19:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780600799;
	bh=DxEnZ7njPT+OSgKqIOcOUcXlQLIkexxH5XW0AX6otyk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iGHQF7AKC/flkK6qKpGVF0QlNWN7xBFl4OaDGs1PjvX6ASs5qx1v5xfzanaBiaDCP
	 mdm0ccv8oiYbkGZeHGVC8ZxvTNH04doyzDLhHwiJxb6SH3yKRHIHYTKJEBDydkU2md
	 pMvyXSw4sQtdOYoVtwnygui9QHyz2Kxzs6auC6BldUUmKbcIKTF3fevpu2SmUs38Zj
	 9ZCOhRpsA3TBrER2/cr8+AsimdMWzSi5EgjXu1BlZOn2cWHolL/9wYbY9X3JpGc6ME
	 F9nc8hlzAYgRmZLccCAHSzLjMDUyPPd2E+2HSuMtS9PgenXYdSxdnUrYffICEkoYPz
	 dlrj+63lzgOUw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 14DB3C41613; Thu,  4 Jun 2026 19:19:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Thu, 04 Jun 2026 19:19:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221583-215701-gYAnVbtqCO@https.bugzilla.kernel.org/>
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

--- Comment #7 from Rong Zhang (i@rong.moe) ---
Created attachment 310266
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310266&action=3Dedit
DSDT patch

Hi George,

Thanks for debugging. Based on the information, software control should be
possible by overriding the device's DSDT with appropriate ACPI methods prop=
erly
implemented, which is (unfortunately) not upstreamable.

But as the first step, please try writing to the address via /dev/mem and s=
ee
if the keyboard backlight brightness changes (replace 0xXX with the values =
you
found):

  sudo busybox devmem 0xFE00D42A 8 0xXX

Writing to EC registers could be dangerous, so please be cautious.

I copied and pasted some code from my device's DSDT to create a DSDT patch =
for
your device. If writing to the address works, you may use it to provide the
required ACPI method to ideapad-laptop. I'm not an expert in writing ASL and
didn't test it at all, so there is a chance that things could go wrong. Be
cautious.

See
https://www.kernel.org/doc/html/latest/admin-guide/acpi/initrd_table_overri=
de.html
and https://wiki.archlinux.org/title/DSDT for detailed instructions on
overriding DSDT.

I'd recommend overriding it using GRUB2. See also
https://www.gnu.org/software/grub/manual/grub/html_node/acpi.html
If it ain't work, try GRUB_EARLY_INITRD_LINUX_CUSTOM. See
https://www.gnu.org/software/grub/manual/grub/html_node/Simple-configuratio=
n.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
