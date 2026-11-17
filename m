Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879631;
	b=TbM+WtDxENBu1ty9pNcH5+r9pnEuG/pgVTiWOPfFskCwmSpd4uA2hhI14w/EF6BWSMG+
	 JhSYxmvK0F1ItUSSGJjJ22n5G4TKdF2DRyI4zhhpvHsr8tCibPapcbyyOs3bYuX4BDYBL
	 tIcoHyBFfFf3XIrPJ0FeMoe7hif1A2Vs0FkoZWfoakLlI3eY6TirW1lH5MsvPpL8HyIGT
	 rYXvUCe5c2kzaI7XtsdUWefPrIIhWLw1osuPKxzJOAPaX7BEJihv11YAOLIEhxzSqHjCl
	 U0mpXlbAvHGN0+x28CGE0ravHrb4iojK2prSzCjhfbzc0QWciT9lKKyEnC+65/G96pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879631;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=Odn+VNa1+ephz5ka8ClXShvP8J7sQrZNpkyqbc8ORBc=;
	b=eZvxO0u6y+iEN4Vem4eqQ3/Cdbgvbg+XHlEmCb9WUdTdirYzfeY6i6Sv3cS7H7TwNN4t
	 OxAIMb0PjgNQ0nwjki7aPyy7uMyP7cx9Ps/Aa/8jntZ2ZSF2QCh+JRg3K8dB2dqqpXdIw
	 NK0RtS01EMj98sxMBielqM3U0QS623QoztXYzGEPOyaqO4FqwiDkHvsEBHiwV6B68SYGi
	 2R4jAwEtj7w09A1d1oCphj5NM9FKBd2rWPsrCBp1u9SJwvzKjLECb2FX6RZTrTKpSHCrX
	 fKA8e4KoiyAd3mPfQQ/Kg5NauD0eqX7CVg9sw5D/0IzMHNAfw6ucjdoe8IxtPgWNJ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BFfqUv2t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2691F606A323
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 01:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BFfqUv2t
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABDAA1F000CA
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 01:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794879630;
	bh=Odn+VNa1+ephz5ka8ClXShvP8J7sQrZNpkyqbc8ORBc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=BFfqUv2thjrOrX5tB7G/w5g+J4er7eANC4RKAwSrCh0GW/J6QsSf3jGx6EDrY3gl2
	 Ml8xPUMaieXKMlYIEaM9AZYzYxkWzsZunEuIzvdADiX0WOgdVD12ZA7VrLPXoTHLM1
	 ndXeSUzcD/K4oSigx5SuFOL3uJkQ49VSWVEmIV0tJQfrk43E0uDXAv95IIQ1bgnYom
	 ujr/xYQ3r+g0sfml5TxlMOldb/1nJjnaFCnHOzCnfs2h1pqPdgL9X4YxaCiuNEu6Z0
	 FQNmogBsCZZ/QpbSGtfU6oyfGHQUuRhD4njKrTXVE5J6p7Cppc9Jq2+5tF/y/ldDbU
	 sZP+udHg8gsZg==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id A21DD240040F; Tue, 17 Nov 2026 01:40:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222275] lg_laptop: LG gram 16UD55U - kbd_backlight has no
 effect, unknown WMI scancodes on Super key
Date: Tue, 17 Nov 2026 01:40:30 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222275-215701-x7y767bCak@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222275-215701@https.bugzilla.kernel.org/>
References: <bug-222275-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222275

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |W_Armin@gmx.de

--- Comment #1 from Armin Wolf (W_Armin@gmx.de) ---
Take a look at
https://lore.kernel.org/platform-driver-x86/20261103180750.228116-1-W_Armin=
@gmx.de

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
