Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398892FFF8D
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Feb 2026 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770192020; cv=none; b=mSpwGr8vjBt26h5e+7DiFYMlyYOp2JQpXV3bH65re+mpkqIJw2DG3mlQmYbln9ag/idqXMU/BpGppYtxUp7Vo+0inYVp/pOwX06naFo6afyuEaSe0sq4BqMNX0J9BtOBv/apoG+UcNw6PExP5UcfWUMwM4Hbc6ogsTun+GC0B+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770192020; c=relaxed/simple;
	bh=wY8o8vUX/4aZOQ1fuDJIORty7o4wAJZZrF8X1Wqlkho=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:Cc:To; b=E55RTvzVjA+qnMINrPOSqdA4yd0IYPzyGFdkhgeZDpmTUvn/MmsoNrXuFgF8r2dMQWdNJR+AsTOrCHyMnXn7bKuXLlyMP5V4PANErXylw3raFF6z279hNt2Xd19hFlMD+ZbcpLSxxrP/uGxXTrMrIiFprZO+hzE2y1MhxU7ZhYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+TBWzXG; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+TBWzXG"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5664393d409so186378e0c.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Feb 2026 00:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770192019; x=1770796819; darn=vger.kernel.org;
        h=to:cc:from:subject:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7hTFiQB5ECd3IeX/j37IC/El/I2ptaa19zR2+88zAk=;
        b=S+TBWzXGu8ROLT2us7cIAc/WFeCYxjNGuxqhZGKNqNXoBiwki1w2f7i/Irp6Bpwdsx
         F9Sy5+gD6K6/YgNlCW5GTi/xJ6nHKGM19q7JBV+8WCtelhfMDUmE3hb8/rZSVv29KQoY
         E2orCL5HkeIoA/8I0pIbguPbhoIs8lsUFSdZA8z6YC6nKeKd5ZuK/OnJxZ1J+xQY5EAq
         D+4T0kPD8Oew4iiMLYmDZA7oawlEo/e1qgAU3EmKPkywSDj9E/u92TcHW15oWnmsQO8a
         YH18F3ZO5rmLvVGjuNdT4p+ddq4fuxxIEBYCBHRNAV4qAR4Tuffpp52QyESF1JCNnUT9
         xtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770192019; x=1770796819;
        h=to:cc:from:subject:message-id:date:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7hTFiQB5ECd3IeX/j37IC/El/I2ptaa19zR2+88zAk=;
        b=UFprZPJ7MbxVYCpeLrfHOLFjB67Oh4uRBT3laZEYqziN03OLeueaJZpNwX25BztMfl
         Ym4bfDAaGDWzJ96neJcbEmgygM325N3mcKoIrM1C5qZyUFkRPq8u7QANkYKUNrJdpNhH
         RbXFVnpNNNFS6w10sJ5xd6wXLfEwzgtXWOEW11fo5Bvb9spOz8zOhOpl9tpcbEKDp7h5
         X5TRgLsiB3dFzFXMSGR9864AS3Lm5RbniB4QWJ8CzsrXA5Ged0+t9HygJMdKMbU47nGY
         ejJ22hVtbGonsceNMZ1IXpI6GMBU28cVlBbgVpC8MCzDW74c0b2eCnpHXDd5wEmJh+3V
         DnCw==
X-Gm-Message-State: AOJu0YxkOwXeTDToPbC1P8DkKlRPIaCGTpVJu5cqlFKH4p8zaoOAs6+m
	iGF3fDH/KXcYZN9k2cfhUZm5rPgd6sOVicxtBLh8vxcmMeaxpyuphjbZ
X-Gm-Gg: AZuq6aJjqBucugPpXQDQtBH6wbJd1ncLj9kYr/MVAkvci2BGH/XGWEgwnshhtmechQw
	i3ghgSdWXIdIE+aVqPWOoijo+VoU24+Uy2prXEUNrEa4/kEPMmfAD/6vzWUU8mMdS7bStaXpa/Q
	ZobFIgV9e8tbmnhpQPpe8ATm29mBPyff+TUcUSKnrMW/zOVSdZC2DGYGML4kkEoPmY9/d01qIzP
	nx2yAwxU5wcw0rZ4TxWNFrwiZpAHBK8T9QQEa1OLC9Lrq0GNZloZZZiZGaPLeKreCYShhlvvMd+
	QzQE7Y0TKuTpDIk2bFBG4BZxBaluuAZzQPqxJhm+z2cOzr06ZPT/SDtu64PuLxf0XHEERX7BaZr
	KJaf+7eyXNcXp7c0wE/S4ztNr6LGRppsY8TJoayKzmXUkpIu1on7ntFpQRfNJXa3KTu3h2DYbU6
	ts5A==
X-Received: by 2002:a05:6122:8c19:b0:566:3c6d:b597 with SMTP id 71dfb90a1353d-566e80b7164mr646927e0c.11.1770192018849;
        Wed, 04 Feb 2026 00:00:18 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-566e80f5205sm1045494e0c.7.2026.02.04.00.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 00:00:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 03:00:12 -0500
Message-Id: <DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com>
Subject: Report: lenovo_wmi_other FW attributes always read 0
From: "Kurt Borja" <kuurtb@gmail.com>
Cc: <platform-driver-x86@vger.kernel.org>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Armin
 Wolf" <W_Armin@gmx.de>, "Mark Pearson" <mpearson-lenovo@squebb.ca>
X-Mailer: aerc 0.21.0-0-g5549850facc2

Hi all,

In my system (83KY Legion 7 16IAX1) the current_value of any of the
firmware attributes exposed by this driver always reads 0

	$ ls /sys/class/firmware-attributes/lenovo-wmi-other-0/attributes/
	ppt_pl1_spl  ppt_pl2_sppt  ppt_pl3_fppt

	$ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attributes/*/curre=
nt_value
	0
	0
	0

After investigating my acpidump [1] I found that the argument passed to
the WMI method Arg2 is matched as a whole integer instead of individual
bytes (L: 49203)

	If ((ToInteger (Arg2) =3D=3D 0x01010000))
	{
		Return (^^PC00.LPCB.EC0.F5E0) /* \_SB_.PC00.LPCB.EC0_.F5E0 */
	}

	If ((ToInteger (Arg2) =3D=3D 0x01020000))
	{
		Return (^^PC00.LPCB.EC0.CCP1) /* \_SB_.PC00.LPCB.EC0_.CCP1 */
	}

	If ((ToInteger (Arg2) =3D=3D 0x01030000))
	{
		/* This case (CPU FPPT) is actually just zero... */
		Return (Zero)
	}

...and the driver always sets the second byte of Arg2 to the current
profile (mode), which is never zero!

	attribute_id =3D
		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
	-->	FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);

So it never actually matches the attribute and falls back to zero :/

This is however, not the case for all tunables. As you can see in the
acpidump, just bellow the block above, these are matched depending on
the current mode (second byte)


	If ((ToInteger (Arg2) =3D=3D 0x01080100))
	{
		...
	}

	If ((ToInteger (Arg2) =3D=3D 0x01080200))
	{
		...
	}

	If ((ToInteger (Arg2) =3D=3D 0x01080300))
	{
		...
	}

	If ((ToInteger (Arg2) =3D=3D 0x0108FF00))
	{
		...
	}

The fix should be easy for this device but I don't know how other
compatible models handle this argument. Hopefully we can find a solution
that works for everyone?

Thanks for looking into it!

[1] https://lore.kernel.org/platform-driver-x86/DFPEEI5LNJXZ.2E32AHA8VUJW3@=
gmail.com/2-acpidump.txt

--=20
Thanks,
 ~ Kurt
