Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795391066;
	b=4gVcNrioc53BdDIzm7ky1zMeWFU4aqqrklcEdLIgVnyRP0sQx2qgqA+2pm5AN6Mm1PoU
	 noQaBAdt4bh4lv34DuGbaIUnu2aIyOM9lOXnbqFpTWe99o0PPbgRC0HVJ6GCPNZ0DbnM4
	 +xV5hWHcci1N2kV/kQmMcGhd81+aGUFBswsJRnEGAAWlcaiQbccdyownM3k+79f3pNAoH
	 FImHvMLxj2zKErzQQ1uOs9JiZovotOqLjtYdJxkeaa5JM18X4EwRCsohtpMyoMhbur46E
	 HGfu3eQSkVwTn1a8Iau+WwEmaXaQfb3riraNZ2wzNFYQb4WPvdXPHJJk/FOCmj59VbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795391066;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ehoD6iN22FSTTuILrvLE59/ojDkeQ3MbAGSvUPqQK6k=;
	b=TmQw60HMq5Q5ECKhgKoGnvR/oj4+rP6xCAmWJbPcdJcJShw9/Ot5Ei/kr9K1xnnIRelc
	 8l9JeMCl6mgm8FXYdzjuiRc21ztBvJd+4rqZEBdTwk1WQovNJvDtQ6bwnIv8uF69jZGdQ
	 HhHryFLo57HphWrdpAu0S0c44ZktHU6asR5rjJLDJgNqvUgzV2Y6jWTv4z6NawlISN5Ba
	 6L3utqOXdJXDaM4+Vn/BTE5hsftICM4LRNxFCpsp98Wq+iweA/i8wL6si8gTbsWbeHBY1
	 JXD05FfvCXZJckgvGzZvV9HYUa1oP90Vqxu1NH+OiPyxeqX8ZHvFXxn8RsXhSlBfWTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=exultantmonkey.co.uk;
	spf=pass smtp.mailfrom=exultantmonkey.co.uk;
	dkim=pass header.d=exultantmonkey.co.uk header.i=@exultantmonkey.co.uk header.a=rsa-sha256 header.s=fm2 header.b=X5GJb50A;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=sCs0dVaF;
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4CC606A31D
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 23:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C4CC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exultantmonkey.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exultantmonkey.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=exultantmonkey.co.uk header.i=@exultantmonkey.co.uk header.a=rsa-sha256 header.s=fm2 header.b=X5GJb50A;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=sCs0dVaF
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 72D82EC08B2
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 18:44:24 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 22 Nov 2026 18:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	exultantmonkey.co.uk; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm2; t=
	1795391064; x=1795477464; bh=ehoD6iN22FSTTuILrvLE59/ojDkeQ3MbAGS
	vUPqQK6k=; b=X5GJb50AzdBmLAqAfa2dPALSY4dFpyhQc9j7zT/Man8s84gB2EU
	y93HXmtVP2chOJpp1JXADmtxeycALP+sjGIR5QpXwv+ioIgc0DJXkq7712LVSD1i
	kYFapAfzHAtchZJy7fYZB8ffm1WbsMHRUIiGmkFzvODe3iTdjZwub00Kh3VN4Rui
	gzWx2mU9nxfjdM4WpCRP0f11qURA2i7ER3QchCz7yYpk4Rq/37NZNy3vUi76ycKi
	LFB0T5RfP0ndN51/EiZ2FSahmMHipxqbyaY5ZpYlSWHvsliawVydMfbfZOrxgK9Y
	W8o5F1LQ0DYaHzDMQCsVXZIg+YcpBORLZvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795391064; x=1795477464; bh=ehoD6iN22FSTTuILrvLE59/ojDkeQ3MbAGS
	vUPqQK6k=; b=sCs0dVaFTWhCtFBMP7U6rz0zYiSj6A8sz2Qka1MmC3jxRgowPM0
	d8APkjUKKxT0BBXFKiCuBghIB2MIwpCNz21hrlvhjiUm0sMbQHRfc2H4tafcNUe5
	scHHeTZMDVLEio4YW0dqB+yKogMO693uem+qKJGbZ/Tld3ZwYsBhjL9AINH49GbS
	V+mEAiVVNq8QzeoNLD3YTbEECmTluiY0yW4R9hIIVpfLx+vs7odPjcdFMQKi6kjy
	Jz8x6KdOQLL29jYl3klhKfEK/UMEJdshihAIDODHotE4U4QSk23xGFoR1Nw1t3eS
	jP1r3zBcToXs4jh27MXjcdv2WK88qGKPl1Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=exultantmonkey.co.uk a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795391064; d=exultantmonkey.co.uk;
	mf=PGRhdmlkQGV4dWx0YW50bW9ua2V5LmNvLnVrPg==;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:LqmxiSNH08wbmRg+ThX1bTbLdbGI8LaNdZg68/HYaIMBqmh
	BQI89syMCoBfjnVFNqJKWLEFoYkAeucyYZwN+zRBMLa9x46LQm1Urjnw5Kw3ampn
	//c8VT9xuOpKRwO7dxer5QJN4VKta/vHuSUSCefog8V0W38zRrK03WO+y69aOKzw
	3fUxmKHXOvdMRpukOR0yQLfX0dOabN48PXYf/tmdHfrMsN5vM/s+3WmfJBAsJwiN
	kQ/LW+vhrncht6Wva8/3jD+9GtMzgrvYNwL5mgeSSqeS1JknnBKBdehwDHtaA//y
	hT/nbin/UteKz6tEb4S8my24r4N1qYRxCQDL+0w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:L1iQabQlcvo+mLEYBHzAflzrAOHFZAMKCxwd2LVsTuc=:VSdPRvXKlhy+9MQk93OseNQ2q9RuCylEGCzYHRAenLg=;
X-ME-Sender: <xms:V34Da5s9_oZ5QcV2QooIaozUVBA6pRccFQvO_qBC5MnIYAQzkPtX1g>
    <xme:V34Daxh45qgVHNq0XBLzuPHPBb8nBLJKyJ9_v9UPElmeZdxhCDk2HY6FqQjv4Ww8I
    yJmTJhkI7mgQIjJN-1GgRhpz_oevKpjURXx9WU1L3uf8zKP1HiD5Dyi>
X-ME-Received: <xmr:V34Day9wsxMzI-K7PtQXL-AP82GLV1uIghR4eC7GGs9uaKfgJYP8hHoLDGnqxu5Fg5iDm1k>
X-ME-Proxy-Cause: dmFkZTFVxStWS0xLnyER3sBe3Iu351hUn2jjwGKTsp+qI3a2HH2s9BMh/3Qb1LYqV3qsvz
    k7dPS8Q09XYVJc0FWZ2mF5qdzKkVJGqmu6+emkzzJ3hUhZATkvVS5VQ4DpMrr5uZ48UOfb
    k/KQAzCxf8rEIQeHwxHhY2/6HhwfeAYOkEzcrFUk+oCRzJbuDaKc3GEnUqPqOKc7Kajwe5
    KwoF4miF3WB3BOzptcsmaQAAH9bK0naTqSDfSTkUn9s4kRBkqfZfNgAdxWVcPCzunYISPO
    9AwZ1fLIw3/GMBxhjKK8fD6fWAITlJfEzHH7PfoZfuw13XC2nXD9qrPPLjUKCDiCnzeGQu
    0RAdvaeIuJRzEocHQE9VmbW7g9U2wZAg5nFyAY0Ns+E87cN5xfsWHJcIsxXvpKaCYOPjMS
    35o//jRKYWaAkAMtc1Kc/5bSb/Y9Amu2BnW4dwoZz23UGVB/KzwXsWr+f2xo3Sjbn2I7tb
    WtZKMrt6cN0j+QwITqicWL2IJRMyZEBmpwl90XibOdZGHryDcdeQ8KBQ4/FJIezfOkKDQn
    MQjv3jBemN7DbqDZAaT6XtZ9I2ncp+oF9LOU6b6LSPgd+epE6ebpij14bjCfTVnwmFEfji
    //p/KFyWw6mY0IZaC8uXppX8ciwoOkkJsYpDgvZNfA7qPv5h55IqhF39zHoQ
X-ME-Proxy: <xmx:V34Da8sbbjwyV4-6mGvGhE9-0l8dfp6iAJzOVvAbBLtsNmhuYBRoSA>
    <xmx:V34Da-rFPHmVMvgBAq3etll-tR_UQtD5R8Hi3A0pbA0Xe_CQkVTpbQ>
    <xmx:V34Da4p-IHlN_e_BZhKs_qwtB9LB_mwX1Y7aSRDnZnfKqvnUkm0P3g>
    <xmx:V34Da1YtgZpTNrjqCAJ0TWWJ0O0NLdbaXwV5sJ06qURH4D-3yRm5kQ>
    <xmx:WH4Da1RqOWVgJ3lcprqEza0qgqve-Wx8AzS3U_MCysBrHlrBL8Z2iToL>
Feedback-ID: i8d5147ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Nov 2026 18:44:22 -0500 (EST)
From: David William Richmond Davies-Jones <david@exultantmonkey.co.uk>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Krishna Chomal <krishna.chomal108@gmail.com>,
	Julien ROBIN <julien.robin28@free.fr>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David William Richmond Davies-Jones <david@exultantmonkey.co.uk>
Subject: [PATCH v2 0/2] platform/x86: hp-wmi: Fix cTGP and power limits on OMEN 15-en1xxx (88D2)
Date: Sun, 22 Nov 2026 23:43:49 +0000
Message-ID: <20261122234351.278694-1-david@exultantmonkey.co.uk>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the OMEN 15-en1xxx (board 88D2) the GPU stays at its 80 W default in
every platform profile because the board is handled by the Omen profile
path, which never enables cTGP on thermal policy v1 firmware.

Patch 2 moves the board to hp_wmi_feature_boards[] so it uses the
Victus S path, which sets cTGP and Dynamic Boost per profile and enables
fan control. On this firmware the power-limit refresh that path does on
power source changes sets the CPU limits to 0 W, so patch 1 adds a
per-board flag to skip it.

Other AMD boards in hp_wmi_feature_boards[] may have the same
SET_POWER_LIMITS handler. Only 88D2 has been tested, so the flag is set
for it alone.

Changes in v2:
- Drop the omen_ctgp_boards[] list and the extra cTGP call. Move 88D2
  from omen_thermal_profile_boards[] to hp_wmi_feature_boards[] and
  reuse the existing Victus S path instead (suggested in review).
- Dynamic Boost (PPAB) now follows the profile.
- Manual fan control and fan table support are enabled as a result.
- New patch 1: skip the power limit refresh on AC changes, which set
  0 W CPU limits on this board.
- Rebased on pdx86/fixes.

v1: https://lore.kernel.org/platform-driver-x86/20261030005724.84507-1-david@exultantmonkey.co.uk/

David William Richmond Davies-Jones (2):
  platform/x86: hp-wmi: Allow boards to skip the power limit refresh
  platform/x86: hp-wmi: Move OMEN 15-en1xxx (board 88D2) to feature
    board list

 drivers/platform/x86/hp/hp-wmi.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

-- 
2.56.1

