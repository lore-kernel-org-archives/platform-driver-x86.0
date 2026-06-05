Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64531400E19
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 18:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780685911; cv=none; b=Q22SEHerF+kcPsFutYmMooHFwwtiuarhkDVd0n84mWmuSBMXTxtYmcXnRO1ucX3VdG8c6ZrTZ/TUgRRxzUtMWS2qAFLlgrSJUzearWKfSWRz9LoSkJCDGj0Fr8JU7wYvREox5M2EuJ6NcR/X5IAIhdRerpUaomrM//9c8Ta0/vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780685911; c=relaxed/simple;
	bh=qXHDq6wAS9dc3NrBxBsJpf3rGg6Pbv/LJD692Hvo4QM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bROSILJftM8/x959S6+p/3/IxTiiXzuE4Mnv9mD+46JLfVFrr5SHDUwW8Sy9wn4tSRqqqhn/GdGrgi9kNf5s0A30am+ZGZO6iSru+qxt7nTqKCWzvmL1OoX/mmZYlGt5PdZ8fFmLWAiBeQ8l25NSxY43uy7Ypg9sqJ/VP9ur+CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1k6iBIZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1k6iBIZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C98CEC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 18:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780685910;
	bh=qXHDq6wAS9dc3NrBxBsJpf3rGg6Pbv/LJD692Hvo4QM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=M1k6iBIZ/9Q3i1esEz5TT6mB7npUwLxBKBAusZ+ywG28gNPHulBPQviohhMv+m292
	 nWtME1jKEwYmZOf5klIjt8YpipfHTUJ08+Vj8ZL8g1polHyj7InO4WuBG4xJh6FOYU
	 J9X1IiyUZDMoSmENssqIJBLKdMfUOY5GujZU5siHyLdjqpt91/AMF0WZHE/Zc+ggYw
	 lCe9c95/vvsTECfVXHeLK4O1fWV6WuiIkIvZ+OZQ4sVOzjo3e+1JOmRObybAX/DvXl
	 S+3gR4ZOtG/6CfHBA0ZkV88BXktiP3yrugiwCp1NHhRX/oktAb43uAC4ZtHEfCi+t9
	 lLoFtlxrDCuUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A50F1C3279F; Fri,  5 Jun 2026 18:58:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 18:58:30 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-zJQTsh3Ijj@https.bugzilla.kernel.org/>
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

--- Comment #24 from George (george.stafilidis@proton.me) ---
                            Method (KBLC, 1, Serialized)
                            {
                                Name (ICMD, Zero)
                                Name (IDTL, Zero)
                                Name (IDTH, Zero)
                                Name (RETD, Zero)
                                ICMD =3D (Arg0 & 0x0F)
                                IDTL =3D (Arg0 & 0xFFF0)
                                IDTL >>=3D 0x04
                                IDTH =3D (Arg0 & 0xFFFF0000)
                                IDTH >>=3D 0x10
                                RETD |=3D One
                                Switch (ToInteger (ICMD))
                                {
                                    Case (One)
                                    {
                                        Local0 =3D 0x02
                                        RETD |=3D Local0
                                    }
                                    Case (0x02)
                                    {
                                        Switch (ToInteger (IDTL))
                                        {
                                            Case (One)
                                            {
                                                Local0 =3D KLEN
                                                RETD |=3D Local0
                                            }
                                            Case (0x02)
                                            {
                                                Local0 =3D KLEN
                                                RETD |=3D Local0
                                            }
                                        }
                                    }
                                    Case (0x03)
                                    {
                                        Switch (ToInteger (IDTL))
                                        {
                                            Case (One)
                                            {
                                                Local0 =3D (IDTH & 0x03)
                                                KLEN =3D Local0
                                                RETD |=3D Local0
                                            }
                                            Case (0x02)
                                            {
                                                KLEN =3D IDTH
                                                RETD |=3D KLEN
                                            }
                                        }
                                    }
                                }
                                Return (ToInteger (RETD))
                            }

i think this is what you asking me to share with you. I think it is this
because I took a screenshot of what it did. The OSD notification when i app=
lied
this version did not show up at all and only two options were showing in Qu=
ick
Settings: Off and High but both options were working when I clicked them (b=
ut
no osd). I think this is where Qwen got confused.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
