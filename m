Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479288;
	b=sUluSBirT4MtnF88e3yj12Xsykt2E11sBdSDqDJC8c1YC6P+5UtAf1gtmVV7SAuP0ngs
	 SQSTGitjWE/+ZtCmBR5BkB8KJtyAt/Y/v1OrJk6RLNvk8pSoxKyPaSzKBAKC3RPwRrFnR
	 3/hZVybnXiHnajHeNqPRAl3Mbmk9+Sp8GF5B46/XzsdUt4YLxCS2AOOhT/VBTyd5cku0a
	 /BARISTizxZWr2nx7YqYPb9QnXB1Y5CbL6tw+bMl1Z3PiOLZP448sOATl4e1TDvfhNlm1
	 V7C821ZHfTGPpXsmmbSdYPOIwauijiPfkOOYjSnxxa2zBnACqVIkWvZedDqjuQixseg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479288;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=QHXRW4qiKMuvsiWno2p3IcwB8t4qljGaR/DnUR9jgFU=;
	b=2QOCvtByYIbvJMJ9ndBhtdBBU6cYstMEmFTeVsVA8L3GD+fInEiuxCij4n4xRWnvFeU1
	 IK0NAQqwdWUjU2uDtjUQtulfsW3y/p1fLfx36lVXM7fthJapefUjhnbHzi/OFwiYnFMuI
	 zJtxZcf8bRamdHxEpvMBR23yC52HBFtsm8m6MPwosc5iwXkPNUnRghOn9vScZdYMbfNnP
	 xCiHBOrV8PRhs1nm0iC3rIyd+Ad7+8fW8crIP8lBnhTlOaZ1TJoEkkz4SVzErVUhnMm33
	 mzw7FrTa503vV8w9gyyKUGM98Ks8ah5wMqfgHXrLgrQMqRQeDzik9pezIAXIyLD+woQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hBbBsEWI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71F9606A32A
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hBbBsEWI
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6B901F000CA
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795479287;
	bh=QHXRW4qiKMuvsiWno2p3IcwB8t4qljGaR/DnUR9jgFU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=hBbBsEWI9cuB21f23Htkrj4y7oPBKiFyQm9ydPvuN5Rh04hnSTnQ6Sfkfs3jkpyva
	 TZIKi/y2CPW7EJEavMmc0NDmdCF3HYaIMLJxJyOwBUtnZ0sMXqnm/dsBIOuNYaqHCL
	 ClwzUhMQrUjNtglu3aV7SF7wyKAYmH1wP3rqD+qRwyBbw4gRJTQQqVyZdmNVna+POp
	 Btz7X/Wg2O1yXKfyPSoPsWY07iUdcP1H6cgJZbGwd8of4jpBMdWRU11GQII3nDivAv
	 chp7O4QSRZtwva7wMcg+og+NNwZL8wHd1rDbyfkT59o3jvQ/Nx5iNwT/EqQn4bphA1
	 9rnhgit7wNzOQ==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id D3C0F240040C; Tue, 24 Nov 2026 00:14:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222323] acer-wmi: WMID set_function_mode(devices=0xFFFF) powers
 off the Atheros AR3012 Bluetooth controller on Acer Extensa 2511G before
 ath3k can upload firmware
Date: Tue, 24 Nov 2026 00:14:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arthurstarkit@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222323-215701-Cq8gKnksUC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222323-215701@https.bugzilla.kernel.org/>
References: <bug-222323-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222323

--- Comment #1 from Artur Sultanov (arthurstarkit@gmail.com) ---
Re-posting the beginning of the report - the first line was lost during
submission:

acer-wmi: WMID set_function_mode(devices=3D0xFFFF) powers off the Atheros A=
R3012
Bluetooth controller on Acer Extensa 2511G before ath3k can upload firmware

Key evidence, one boot (journalctl -b -1 -k -o short-precise):

  [   5.402775] usb 2-5: New USB device found, idVendor=3D0489, idProduct=
=3De095,
bcdDevice=3D 0.01
  [  21.799794] acer_wmi: Function bitmap for Communication Button: 0x1
  [  21.856170] usb 2-5: USB disconnect, device number 2

Delta between the acer_wmi message and the USB disconnect: 0.08 / 0.16 / 0.=
19 /
2.1 ms across four boots (table in the description).

Same machine with acer_wmi blacklisted (dmesg-current-boot.txt in the
attachment):

  [  21.994836] usb 2-5: USB disconnect, device number 2   <- ath3k uploads
firmware (DFU reset)
  [  21.995820] usbcore: registered new interface driver ath3k
  [  27.864877] usb 2-5: New USB device found, idVendor=3D0489, idProduct=
=3De095,
bcdDevice=3D 0.02
  -> hci0 present, rfkill has "hci0: Bluetooth", controller usable

Triggering call is acer_wmi_enable_rf_button() from acer_wmi_init():
wmid3_set_function_mode() with .commun_devices =3D .devices =3D 0xFFFF, alt=
hough
the
DMI type 0xAA bitmap parsed by the same driver is 0x1 (WLAN only).

Attachment contents: broken/working dmesg, DSDT, acpidump, dmidecode,
lsusb -v (0489:e095), lspci, rfkill, lsmod, kernel .config.
I can test patches on this machine.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
