Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEF7384CF3
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 19:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778871883; cv=none; b=IGMvyHhqmZYAiYGX1FhYNCeod9vIgXIcgpE4vByVrHDRlpJVcuk5l4tCULX390m6/LKtk9RSCx59F0JgCILCMO+VjWUiGtnvMBuz9TLn8Dfr/xfIRqWaEjZ62k50Xm9oOtlY/9nRebMk0cOGDkkxQMTZOOSmGb5lLow9NgJYCRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778871883; c=relaxed/simple;
	bh=z6LXWmwIIALFCUAjbxJprXUSQr69dzmuJDWmwXxi2zQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=Jf9UM0ZGLr3ZVvdYVHg4VQIvmPPTIdhoJ28rZZoh8ZddgQ1+2enG6v2bEVcJf97/Yu2EM9zV4FVWf2NOy+dxRV+FKplh2xjUtpeJX7DIzYpZWtjdbrLZmtSK/TGi2/7nU09Q6kJjpgRgmvHI2Iku5I9YaphDsyhwsZFu4h80GY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=d3fQc3fE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=koJ9KAZj; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="d3fQc3fE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="koJ9KAZj"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 952261D0006E;
	Fri, 15 May 2026 15:04:40 -0400 (EDT)
Received: from phl-imap-16 ([10.202.2.88])
  by phl-compute-04.internal (MEProxy); Fri, 15 May 2026 15:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1778871880; x=1778958280; bh=l1
	OoF8+e0LvjNbPMBNIH222OeYf6bjqUkfEUGhPd1ZY=; b=d3fQc3fE7sTFRRQIKv
	Y7lACAnvf67XxNxXNCWH5PZZHH1NtbcOSYsx8dLsGoiYziQGj5t90O1y7iWb1pw5
	3vOP+iw/93SvqbiGkifwAgSO3IumctPsS1dErZOoRUyfKmDSoQoL3aV0YG+OUAkl
	qB/kBxEYJwGAC/p+yiU0Jmn7RdD51zPfaibFlwPfXlUr3xmxGzsLPCSCabGBeAnX
	BIB1vCLuJwYLWFU8ieOFhtmEVjRhDOiTWuzntrYyWNj71oq2NiWVvE62qkY+EC2o
	GVb0QC4ieCD28/TlPK+odFvQPCIEoc6ichl8jMjD28tZZSkoODuilYZ3dQ3lQMZX
	Pz3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1778871880; x=1778958280; bh=l1OoF8+e0LvjNbPMBNIH222OeYf6
	bjqUkfEUGhPd1ZY=; b=koJ9KAZjRHXGwZPeKmzkmkFJYZsI3t5dwIxfj73KO67y
	7KUHrUxIQeWbYEw55uEH5uryL3OVLWngQShfGG148tSF0xBFQGcy4GoplqPoIQMr
	DcdYVr4avDgVoUgtl8rhjTNWJk5HsODufcPkoUdkCSU9SSCNclsqixRUPok/vDTV
	CoIrBtAawn1vjcfvEM7qkb4SOTYjsYs3IMWfBf3dbKPFnD/IldaCE+0sYyCH53xQ
	yxyGjPXyTj9N7RPCV0PYtF1VYUgH3pzaBxgCXQumMVBBNwaxCDWE+IaYv9eG1Woq
	RR3pgD3ZvToVoQRGwjBDafQpgCnzbVrNMSXZox98Dg==
X-ME-Sender: <xms:SG4HaoSjGlbc7OqEpwxspCFJ3HsENq0oTW8NUOzRR737VB6RCnU62A>
    <xme:SG4HagkLf6nUHnI_jQawsW0qjNwAnNHLq6OYA8z2M9Ev-bv2avikNEyvRw7aqWhez
    DLrHShLFVmHqasubDlu0qRU5yS86gv7AhNA_0fevuIsaw0Tn_TYQvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeduudelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvvefkufgtgfesthejredtre
    dttdenucfhrhhomhepsghighdrsghlohgtkhdtvddtfeesfhgrshhtmhgrihhlrdgtohhm
    necuggftrfgrthhtvghrnheptdekfeetveefieeguddvtdffhfeiudehfeeivdfhleffvd
    dtueetjeffvdelffegnecuffhomhgrihhnpehlphgtsgdrvggtnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghighdrsghlohgtkhdtvddtfe
    esfhgrshhtmhgrihhlrdgtohhmpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhp
    ohhuthdprhgtphhtthhopehisghmqdgrtghpihdquggvvhgvlheslhhishhtshdrshhouh
    hrtggvfhhorhhgvgdrnhgvthdprhgtphhtthhopehmphgvrghrshhonhdqlhgvnhhovhho
    sehsqhhuvggssgdrtggrpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgi
    ekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:SG4Hah04re4hKJF-GZErEV7FuEMmNQ9Fup5Ym75k9dNiGuMak1J4rA>
    <xmx:SG4HaoNzeCsYpohEkSdYtb6g3QKFykQkuO-TNenPNpxuk_4Ti9Is9A>
    <xmx:SG4Hap3qpz52CXHJq5ddkoSLhYmXW4DH9x-dNPEPmZyXqbCmv36dwQ>
    <xmx:SG4HanGzMlyrkKptPnMek-NGjJcFYK4UMh18dEADs-_FS_6HJSqUJw>
    <xmx:SG4Halh-r6DBc2vHiOfO-4gvCuP-uWtGoQcQfGkQl-n3Y0wW5jn_rdFz>
Feedback-ID: i35d941ae:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 368292CC0083; Fri, 15 May 2026 15:04:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 15 May 2026 23:04:15 +0400
From: big.block0203@fastmail.com
To: platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca, ibm-acpi-devel@lists.sourceforge.net
Message-Id: <260665ef-2862-4331-b61d-aacf1297ac90@app.fastmail.com>
Subject: Unclaimed LEN0100 / LEN0111 / LEN0112 ACPI devices on ThinkPad X1 Carbon Gen
 13
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On a ThinkPad X1 Carbon Gen 13 (Intel Core Ultra 7 258V / Lunar Lake)
running kernel 7.0.6-200.fc44.x86_64, three Lenovo-private ACPI
devices under the EC are declared present-and-functional (_STA = 0xf)
but have no driver bound and no public identification I could find:

    LEN0100:00  status=15  path=\_SB_.PC00.LPCB.EC__.ITSD
    LEN0111:00  status=15  path=\_SB_.PC00.LPCB.EC__.LSSD
    LEN0112:00  status=15  path=\_SB_.PC00.LPCB.EC__.LISD

For context, the full LEN* / INT33D3 picture on this system:

    LEN0071:00  status=?   driver=i8042 kbd   TrackPoint keyboard
    LEN009F:00  status=0   driver=NONE        disabled by firmware
    LEN0100:00  status=15  driver=NONE        <-- asking about
    LEN0111:00  status=15  driver=NONE        <-- asking about
    LEN0112:00  status=15  driver=NONE        <-- asking about
    LEN0130:00  status=15  driver=NONE        Fn / Function Keys
                                              per Lenovo Windows name
    LEN0140:00  status=0   driver=NONE        disabled by firmware
    LEN0268:00  status=15  driver=NONE        ThinkPad HKEY; matched
                                              by thinkpad_acpi via the
                                              ACPI bus, hence no
                                              physical_node/driver link
    LEN0310:00  status=?   driver=i8042 aux   TrackPoint pointing dev
    INT33D3:00  status=15  driver=NONE        _cid PNP0C60, laptop/
                                              slate mode indicator

driver= column is from physical_node/driver. thinkpad_acpi (loaded and
functional on this system, hotkeys work) doesn't create a platform
binding for LEN0268, so it shows NONE there.

Context for the question:

  * The laptop has what appears to be an ambient light sensor element
    in the top bezel next to the camera. No ACPI0008 device exists
    anywhere in the namespace, and /sys/bus/iio/devices/ is empty.
  * No INT3472 / IPU6 sensor-power stack on this SKU; the camera is
    a UVC device on USB (Chicony 04f2:b7e0, driver uvcvideo).
  * Earlier feedback from Jonathan Cameron on linux-iio confirmed
    that INT33D3's _cid PNP0C60 makes it the laptop/slate mode
    indicator, not an ALS, so the missing-ALS question redirected
    here.
  * The ACPI object names ITSD, LSSD, LISD are suggestive (Intel
    Thermal Sensor Descriptor? Lid/Light Sensor? Lid State Detect?)
    but I don't want to guess from names alone. The same
    LEN0100/0111 IDs appear in ALSA-info dumps on older ThinkPads
    (X1 Carbon Gen 8, T14 Gen 1, T15 Gen 1), so they aren't new to
    this generation.

Are any of LEN0100, LEN0111, or LEN0112 recognised IDs internally?
In particular, is one of them an ambient light sensor or related
device that should be bridged into IIO, or are they all internal EC
bookkeeping that userspace isn't expected to see?

Thanks,
bigblock
