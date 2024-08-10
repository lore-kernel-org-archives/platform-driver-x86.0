Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D726158536
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Aug 2024 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723300212; cv=none; b=IDvMZMrWTPW+viV0Tn4ItKilYqK7IfL5BtKDaLXpKOieBBaLqfDQYamDU9rjAttq7dlwkZuYyaYHGv9XELZVdwhk8gongh5RyoKIT6rfLDfjcvj2MoBXP08jMuXq+o7Ke+q9ydl3VWKWqsOwBUYuJNe2EZYe3XQJmkIBK1MQ3+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723300212; c=relaxed/simple;
	bh=BfQcwmgqDuAqZiHAt+2+WzZ2t3YK6VQGA71SkaeNPGo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dScKtVYgYUs6nL16dCjcxWh54vyMinWXXPRSxTA37fWBU4Gnyk7miohYcfTsukNZtCXVEWEqS6VtliANsanL8UiP+DpekIHLutBukr+ELKNf3akrx7hhxSYfWmPJ198lrWlZEcCLqlbKq9ugIzCzzAahaIklZ0PNCjVa0s6qk3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkmHu+s+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkmHu+s+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B055EC4AF14
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Aug 2024 14:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723300211;
	bh=BfQcwmgqDuAqZiHAt+2+WzZ2t3YK6VQGA71SkaeNPGo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qkmHu+s+/8HebEThYmy8eYDavipS8x5/IdiCMhNIA+Fae6Eo397LsZAHpG8d0pe8V
	 pUyySAv/RyLRFkGQROzOcWPHVdlRKLp26lfvdae9F7nsk3yhAK6lNEjpX0iJ9/ScuO
	 FXW36LzpUkmTGOeSuH4Pdl/mDFPZv60wW2jMTcXQ/rhlPcvXtMoLuNYwNzN9OObxw/
	 38Riq6BhS/LD3cxsCEZxxBU8ITpQPAVVx7Nhj5jlYF1FK3BH6GmGXQIjpI09/je3d6
	 3Kg0cRDHA5+Lkc3iDKIJiROjL7Wa6UEaLtIgoSAt6LjY4deWPPhnYWbne3JiRi8mfi
	 +hRCuA1wRpEJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AA768C53B73; Sat, 10 Aug 2024 14:30:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Sat, 10 Aug 2024 14:30:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: attila@fulop.one
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-YEZ76fh8C9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

Attila (attila@fulop.one) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |attila@fulop.one

--- Comment #336 from Attila (attila@fulop.one) ---
Hello,

I've this board :=20

# grep -e ''  -n /sys/class/dmi/id/board_{name,vendor}
/sys/class/dmi/id/board_name:1:G15CF
/sys/class/dmi/id/board_vendor:1:ASUSTeK COMPUTER INC.

# dmidecode -t baseboard
Base Board Information
        Manufacturer: ASUSTeK COMPUTER INC.
        Product Name: G15CF

Can you please add my board to the supported motherboard list?

BTW, I added "acpi_enforce_resources=3Dlax" to GRUB_CMDLINE_LINUX and after
modprobe nct6775 I can see a new section in the output of sensors command w=
ith
the following details:
nct6798-isa-0290
Adapter: ISA adapter

output of dmesg:
[ 3469.171468] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
[ 3469.171488] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\RMTW.SHWM) (20230628/utaddress-204)
[ 3469.171504] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\HWM) (20230628/utaddress-204)
[ 3469.171513] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?
[ 3469.171515] ACPI: OSL: Resource conflict: System may be unstable or beha=
ve
erratically

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
