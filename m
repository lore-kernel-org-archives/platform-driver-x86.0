Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C50328DB
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 18:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717353703; cv=none; b=R28lXX8aRf95SLudz2D8eV/+O3Y1sjYhgLHUnW0ZVqU0QBAHO9jWc4rtiBBjcGS7tg5dF4EKwabcwZ9wAnHCQJG/LQAr4Yky2qI4EXGQmHMq7XMQ/QOsKAcUbkYJ3Q93gzmpUPU85EiYJxYFvP4hH8PepLx+6rxyQDbR6thVdLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717353703; c=relaxed/simple;
	bh=5CC2HPXxLntiUVAoznFUYYPGhNb3ttDgZaAYB4xEHVg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rDEZ8cnMRmyOgtiS/bVCrpsT4js/ZiKUwflZJ85/0QfjQpf02QabpPC3J3ZHZXB38zQI8sTaS0XMQk0fRHyEAivF8545Wce+pNMS5DJsTF3iLnzVIjoMKnGRDBRZKQAcOoMIafnFCaYjZmOnwdXu7H2Nv1Nil10i7FzLlM/qhVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBMxT+59; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBMxT+59"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A29F7C2BBFC
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 18:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717353702;
	bh=5CC2HPXxLntiUVAoznFUYYPGhNb3ttDgZaAYB4xEHVg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KBMxT+59a0LhkF1zjVBRNRbjhug8f7JHrrChgXJOiN9TdGk3LZkz6WVShuFE8ho4Z
	 /nloIKJjWj8LecsZRVcJ1tVozLVmotD03iSWs1qkNOcADsK7kLVEyKv+qoDSR9STxl
	 iS56fVO0OFSCU/UJ5ci73ZxybmBx9GcE81HhxxCL7a9UcdzJ0w5Ou3/wOLEE9I9Nd8
	 lBsx1c0fkbctzCKktvf6ZBkSPe1ngdtHGvTOTUj6/53NSaEf2hsc1tDZEHwcJFCu1W
	 OzjycXa+zZlgR3dlxuUQh0SCjMJNvmWoB2Cxjc/o/tzBxcT6mHAe1tAGu6TAmC9pTd
	 GtksMp70Wl+ow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8AC7DC53B73; Sun,  2 Jun 2024 18:41:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 18:41:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-PGj1jPduta@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #27 from Agathe Boutmy (agathe@boutmy.com) ---
(In reply to Armin Wolf from comment #25)
> Does dmesg report any debug messages like "Type: XX Eventcode: 0xXX"?
>=20
> If yes, then please send me the output of dmesg after pressing the FN-key=
s.
> Should the wifi issue happen again, please send me the dmesg output too.

Yes, here they are:

FN key pressed: [ 8437.457099] lg_laptop: Type: 1    Eventcode: 0x30010000
FN key released: [ 8469.382650] lg_laptop: Type: 1    Eventcode: 0x30010001=
 //
also happens when pressing and after releasing FN-F1..4 (twice when releasi=
ng
since 2 keys are being released I guess)
FN-F1: [ 8491.979548] lg_laptop: Type: 1    Eventcode: 0xf070002
FN-F2: [ 8545.037702] lg_laptop: Type: 1    Eventcode: 0x9000087
FN-F3: [ 8561.170853] lg_laptop: Type: 1    Eventcode: 0x9000086
FN-F4: [ 8642.087767] lg_laptop: Type: 1    Eventcode: 0x10300100

FN-F5 has a different behaviour than the previous four: Here is the full li=
st
of code sent when pressing them:
[ 8737.235169] lg_laptop: Type: 1    Eventcode: 0x30010000 // here only fn =
is
pressed
[ 8739.068108] lg_laptop: event guid 2
[ 8739.068163] lg_laptop: Type: 1    Eventcode: 0x30010001 // fn held and F5
pressed
[ 8739.091282] lg_laptop: event guid 2
[ 8739.091331] lg_laptop: Type: 1    Eventcode: 0x30020000
[ 8739.117827] lg_laptop: event guid 2
[ 8739.117872] lg_laptop: Type: 1    Eventcode: 0x30020001
[ 8739.145947] lg_laptop: event guid 0
[ 8739.146019] lg_laptop: Type: 1    Eventcode: 0x74
[ 8739.231070] lg_laptop: event guid 2
[ 8739.231127] lg_laptop: Type: 1    Eventcode: 0x30010001 //both key relea=
sed
[ 8740.811039] lg_laptop: event guid 2
[ 8740.811101] lg_laptop: Type: 1    Eventcode: 0x30010001

FN-F6: [ 8938.295301] lg_laptop: Type: 1    Eventcode: 0xf000002 //behaves =
like
F1..F4

FN-F7 doesn't seem to have a unique code, here's what I get (it does what i=
t's
supposed to though):
[ 9016.134096] lg_laptop: event guid 2
[ 9016.134153] lg_laptop: Type: 1    Eventcode: 0x30010000
[ 9017.160755] lg_laptop: event guid 2
[ 9017.160813] lg_laptop: Type: 1    Eventcode: 0x30010001
[ 9017.183855] lg_laptop: event guid 2
[ 9017.183905] lg_laptop: Type: 1    Eventcode: 0x30020000
[ 9017.210594] lg_laptop: event guid 2
[ 9017.210644] lg_laptop: Type: 1    Eventcode: 0x30020001
[ 9017.260458] lg_laptop: event guid 2
[ 9017.260507] lg_laptop: Type: 1    Eventcode: 0x30010001
[ 9017.537250] lg_laptop: event guid 2
[ 9017.537335] lg_laptop: Type: 1    Eventcode: 0x30010001

FN-F8, the keyboard brightness control key seems to be the one starting a l=
oop
of disconnecting the wifi and activating bluetooth, pressing it once leads =
to
having to deactivate the module if I want to return to a stable state, here=
's
the output:

[ 9104.362389] lg_laptop: Type: 1    Eventcode: 0x30010000
[ 9106.929029] lg_laptop: event guid 2
[ 9106.929083] lg_laptop: Type: 1    Eventcode: 0x30010001
[ 9106.952201] lg_laptop: event guid 2
[ 9106.955362] lg_laptop: Type: 1    Eventcode: 0x10000000
[ 9107.059296] lg_laptop: event guid 2
[ 9107.059390] lg_laptop: Type: 1    Eventcode: 0x30010001
[ 9107.799205] ACPI: \_SB_.XINI: notify: 192
[ 9107.821281] wlp0s20f3: deauthenticating from 68:3f:7d:36:0b:15 by local
choice (Reason: 3=3DDEAUTH_LEAVING)
[ 9108.098842] lg_laptop: event guid 2
[ 9108.098888] lg_laptop: Type: 1    Eventcode: 0x30010001
[ 9108.815812] ACPI: \_SB_.XINI: notify: 192
[ 9108.829467] iwlwifi 0000:00:14.3: WRT: Invalid buffer destination
[ 9108.985519] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0=
 for
RT uCode
[ 9108.985633] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[ 9108.985651] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[ 9108.985658] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[ 9108.985666] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[ 9108.986425] iwlwifi 0000:00:14.3: RFIm is deactivated, reason =3D 4
[ 9112.617854] wlp0s20f3: authenticate with 68:3f:7d:36:0b:15 (local
address=3De4:c7:67:24:ee:74)
[ 9112.618541] wlp0s20f3: send auth to 68:3f:7d:36:0b:15 (try 1/3)
[ 9112.648263] wlp0s20f3: authenticated
[ 9112.648833] wlp0s20f3: associate with 68:3f:7d:36:0b:15 (try 1/3)
[ 9112.652551] wlp0s20f3: RX AssocResp from 68:3f:7d:36:0b:15 (capab=3D0x15=
11
status=3D0 aid=3D74)
[ 9112.655106] wlp0s20f3: associated
[ 9112.668475] wlp0s20f3: Limiting TX power to 23 (23 - 0) dBm as advertise=
d by
68:3f:7d:36:0b:15
[ 9114.722923] lg_laptop: event guid 2
[ 9114.722982] lg_laptop: Type: 1    Eventcode: 0x30010000
[ 9114.899608] ACPI: \_SB_.XINI: notify: 192

My understanding of what happens looking at dmesg in follow mode is that it
sends the even once when pressing FN-F8 and then any keyboard use after that
sends the event again (fn key or not) which means any input results in the
network connecting or disconnecting.
It doesn't turn airplane mode on though.

FN-F9: [ 9658.815309] lg_laptop: Type: 1    Eventcode: 0xf020000

FN-F10..12 same behaviour as FN-F7 which makes me think this is handled
somewhere which would make sense since it's not a functionnality exclusive =
to
the LG Gram.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
