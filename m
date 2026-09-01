Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE61349C4C4
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 18:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287297; cv=none; b=SaDM+NixLOUiyk/fd4ucNAutTooAhNtzRmRmL9aB1JtFfUr2C3rbclx7Xd0SWzpJFJdmzAu6p7VTWssagS6Tvdv6peP630JtOQP1Q5gLXJRnBIghbS5FtUWVPMVUB7yFCNy8+XvlO5BncGSIvYSIZs3QSlPmVxTkh8PBCZnrvDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287297; c=relaxed/simple;
	bh=h1Zgr03BycATT1NyB2dQnRebiLa5/QB61OxcvRSCjKc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ud/bjgDsloJM6MdDV+b26MejR7cXkIld9aEpvp2b52zxc+/gx98CixGL5/CDwqDs3kEB4XzHQQ4Kw0+nQq4nMtvioz6ES1iDTAwpdLvgE8lYFQte9tX0oflJeIu4IqTc+7w5P8tessAUsv7CbRyE7EdESmCWGJxVt58ZC7jFuvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=KCd8YuZu; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="KCd8YuZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788287283; x=1788546483;
	bh=CLDb88AnKEaJ3a37+zNEZC/o+q1YjkVDRyLkUtKKm70=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KCd8YuZu0Sv6YUCTHyFJKzZ36jqjWyZKaPBoS0uKCy/mfleCKlYzu1pNOyD+mIAsJ
	 sZJT5Trb8EbV6oL+CsAf+1VQbdYaDPiA5HE+QDNCUAeaFPYEAl+qPF8qJ2BaBHcgbP
	 4TtS1wYPR9A3NPw3aJSJ1ZpwQN0uKZYuSSyIVrHJEcpsbluvifasP+ha8uejd4ya/I
	 V1TQXZKKYnNVZCdlJLJ4z6+F85XDjTrwYepRgx91tW0N+3dHDPBGg7sqZcTc1DpJBq
	 hXAnSnLXnvxzfena2oryknJBUqk57spH/E5Na1IV8DZtdlHidPh+fUtkZkOB5baYSN
	 8qKQk2drUTAHg==
Date: Tue, 01 Sep 2026 17:58:50 +0000
To: Hans de Goede <hansg@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: int3472: the vendor GPIO type table, and four values that differ
Message-ID: <20260901175842.47669-1-lsa.uz@pm.me>
In-Reply-To: <20260831180837.69000-1-lsa.uz@pm.me>
References: <20260831180837.69000-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: db76af1fc13371a7bdb29ab22c03cd6bfe670e7c
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hans, thank you - your two anchors let me find the bug, and it was mine.

You wrote that 0x12 =3D HANDSHAKE came from Intel directly, and pointed at
dmanresa's independent mapping of 0x10 to AVDD. Neither fits the table I
sent, so I went back to the binary. The table I posted is short by two
entries.

My first pass ran strings(1) with a minimum length of three, which
silently dropped every name shorter than that. Two were dropped, both
sitting between PrivateLED and Avdd:

  0001f370: 4544 0000 4146 0000 494f 0000 4176 6464   ED..AF..IO..Avdd
                      ^^^^        ^^^^
                      0x0e AF     0x0f IO

Everything above 0x0d was therefore reported two slots low. Corrected,
the table runs 0x00..0x15:

  0x00 Reset       0x01 Enable       0x02 Strobe       0x03 Torch
  0x04 Flash       0x05 LedRear      0x06 LedFront     0x07 Power0
  0x08 Power1      0x09 Standby      0x0a WriteProtect 0x0b PowerEn
  0x0c Mclk        0x0d PrivateLED   0x0e AF           0x0f IO
  0x10 Avdd        0x11 Core         0x12 Handshake    0x13 HDMI_INT_IO
  0x14 HDMIDetect  0x15 Reserved

Every disagreement I reported disappears:

  value   int3472.h        vendor, corrected
  0x01    POWERDOWN        Enable          - same pin, as you explained
  0x10    DOVDD            Avdd
  0x12    HANDSHAKE        Handshake       - agrees
  0x13    HOTPLUG_DETECT   HDMI_INT_IO     - agrees, same function

So the answer to the question I asked is that the kernel was right at
every disputed value and my table was wrong. Sorry for the noise.

One thing survives, and it is the reason I am writing rather than just
withdrawing. You said the 0x10 dovdd mapping was a guess - that you knew
it controlled a regulator, did not know which, and picked dovdd because
avdd was already taken by 0x0b. Intel's own table calls 0x10 Avdd. That
is a second, independent vote for dmanresa's reading, arrived at from a
different artifact.

It does not settle what 0x0b should be called. If 0x10 is avdd, then
0x0b - which the vendor calls PowerEn, and which the kernel calls
POWER_ENABLE, not a rail name at all - may never have needed a rail
name. Your point that drivers bulk-enable everything still decides
whether any of this is worth changing.

The indexing is still positional inference: nothing in the binary takes
the address of these strings, so I am reading an array of logging text
and assuming its order is the enum's order. What makes me believe it now
is that three values established independently of this binary - Intel's
0x12, dmanresa's 0x10, and the kernel's 0x13 - all land at once under a
single two-slot correction. That is a much better argument than the one
I made the first time.

Sergey Lebedev

