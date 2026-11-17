Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900559;
	b=mvkDbvGMzrHFQWfU2SiieJLJfHVk7FKIeLKn8oZQcVmmjg/TH4T+QNl54zNSzq+1SPVK
	 oI8mPdFtHo7f5uw0qW+6Od82Bil6nU7WuTTnS9d0a/eMQx+YeQjh4OmCx9RVdPON92DU9
	 KsOaewu48mCNDaLEHVjaNE+JqPqL0KAikY8ogvjsNmaEoM4cztOaOO+hB0SvHN4RpceZ9
	 t7Yd9uF7JXsyyFppVB+FLHPz+9k9c9R3p9zTIMdSq/26xbfAylgfN1Wo75BHyrMYUW39U
	 Xfu+ittz3CidfTN7U9CK/dIAcXTT+Xz3X13XinU8L4nDjXE3Bovi7GGrkpqkyw1/TYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900559;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=uaM7hU632sBBGVbo6iwzuJ1fsnncdlKJTQMSMmGEga8=;
	b=KsCmO4HA4b//beiiLAEYHDIcRlRy5irzuuSP7rUfURBzb3RJBEXgpjXuUE90JPLZ4lk9
	 TwpgD/Xmt95cJiAFCyeFKtWAroRhyzhGOKcWR3IhGEeJxgxROty1j1dnaULYva/IlN/Aa
	 mMbzAryhX/Te2J5X1toZ1NQGsVqvZ5JAbXIvGr/5LFP9mfRh+qRCNOm7XEBPls7paGPr7
	 BWeIElsWeqv4o1xvi9WZq6r1nH2Zjmys8DVvUdHIwwO6C2TMcROtpnZs4pqjzl3KzN86G
	 3ekA8PdNM7PVJYNNA/4cb3ifnBOgpf4ilxutYtbBG6EObPGP5NwLIyXTf1RuWQgh9Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BpRH2TJJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9723606A31C
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 07:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BpRH2TJJ
Received: by smtp.kernel.org (Postfix) with ESMTPS id C642F1F000C5
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 07:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794900558;
	bh=uaM7hU632sBBGVbo6iwzuJ1fsnncdlKJTQMSMmGEga8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=BpRH2TJJOo9YEj6eP00K2YVklXXSZxoXCBOVJFJUB0ziP7zELTFgzHAQXWfC7cDbR
	 Vlf1DfRIkwBs14/3b07qMPkCRETXocvdaFKGgLzL78Ud+hLZ2SX/OB6k39mlEt//DA
	 dw5AoMjmHH9pCDx+GmwNuArqsG+SsgbOioLmglXrNViZXg14Y5MlB7qbd4DzilHmWq
	 zih3QDKI3eHeRimlsi8YLXEH8H2GgPVdqk5xixESaNegqmYixPYFPh8bI4P1fTHdzV
	 rZtsw8W4sQAlxZ6aPGAXSADjSI2f7t9CC5PWQ60yTiuOLjIYbFnriJ4FdQtAoMsnDU
	 UQLmTedRuo5gg==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id B6CE6240040D; Tue, 17 Nov 2026 07:29:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222275] lg_laptop: LG gram 16UD55U - kbd_backlight has no
 effect, unknown WMI scancodes on Super key
Date: Tue, 17 Nov 2026 07:29:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daxter1992@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222275-215701-SGiduJqJOX@https.bugzilla.kernel.org/>
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

--- Comment #3 from daxter1992@gmail.com ---
In case it helps:

ls /sys/bus/wmi/devices/
023B133E-49D1-4E10-B313-698220140DC2-2=20=20
74286D6E-429C-427A-B34B-B5D15D032B05-20=20
ABBC0F45-8EA1-11D1-00A0-C90629100000-13
05901221-D566-11D1-B2F0-00A0C9062910-17  911BAD44-7DF8-4FBB-9319-BABA1C4B29=
3B-4
  ABBC0F46-8EA1-11D1-00A0-C90629100000-14
05901221-D566-11D1-B2F0-00A0C9062910-21  ABBC0F20-8EA1-11D1-00A0-C906291000=
00-7
  ABBC0F47-8EA1-11D1-00A0-C90629100000-15
05901221-D566-11D1-B2F0-00A0C9062910-6   ABBC0F40-8EA1-11D1-00A0-C906291000=
00-8
  ABBC0F48-8EA1-11D1-00A0-C90629100000-16
101F83BB-30B7-DF11-8D81-0800200C9A66-18  ABBC0F41-8EA1-11D1-00A0-C906291000=
00-9
  C3A72B38-D3EF-42D3-8CBB-D5A57049F66D-0
2B4F501A-BD3C-4394-8DCF-00A7D2BC8210-5=20=20
ABBC0F42-8EA1-11D1-00A0-C90629100000-10  E4FB94F9-7F2B-4173-AD1A-CD1D950862=
48-1
37BE1AC0-C3F2-4B1F-BFBE-8FDEAF2814D6-3=20=20
ABBC0F43-8EA1-11D1-00A0-C90629100000-11
644C5791-B7B0-4123-A90B-E93876E0DAAD-19=20
ABBC0F44-8EA1-11D1-00A0-C90629100000-12

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
