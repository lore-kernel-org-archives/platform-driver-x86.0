Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08653002DD;
	Wed, 20 May 2026 05:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779255753; cv=none; b=j3/6p5+7LPY2t+W8X2CqRthkBThFN9oT1Q3pfui7XkmgZ5gJuAdEDo4NIcJqI7LgC+R6oWVPW8qWTEDc5fnaK4Yo09uPutThp2T1iDnmgvsB1AvKpgsA/xvkkwMt2klpxbqH2uMCq0N/l6VR4i2fpK/EOJlkOKM+AYWO1XH7eOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779255753; c=relaxed/simple;
	bh=I5NkBI8rKP/uFDwPPqaHjw9VjEytKi8qKjQTIUxU0gM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Du9Nk/ucvyZQJpUPRkMYXFOPTyoHqNGXtUR1eexikngbsyOCbv8mrMZPWxAZ4EDrQlJiCeTfNXxL6bYOzkk5HDqQmcBX88pIm9xKcM7jdoW8QDlS8+3antuciEBWFrOuudJ303BoDdwAtVps4SiV38K9V+lO+P4YSZRkZebmmg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=VvQQ/oVl; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="VvQQ/oVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1779255717;
	bh=I5NkBI8rKP/uFDwPPqaHjw9VjEytKi8qKjQTIUxU0gM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=VvQQ/oVl8QOAclcePqd4OoIceHqdjkDTe2WNrcrq/7XJmTZVqLTijfbaOpgI50Srq
	 5eyLQMax46X72z2Kj4FqDlvnnhDB6jqrq6SYOIQhwSi1mqkJQ6cZjdBctUA5INFP5A
	 xpndU7XZATRaB5EMagA00gUK7FwRozxsEmLV4iRk=
X-QQ-mid: zesmtpsz3t1779255710t0233ac2b
X-QQ-Originating-IP: a9YWzmyUxKQba8gUlnQgQJRTHplZ0SWcaxmIy5VMOCk=
Received: from localhost.localdomain ( [124.126.19.250])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 20 May 2026 13:41:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12711365307121190632
From: ZhaoJinming <zhaojinming@uniontech.com>
To: ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com
Cc: hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86/intel/tpmi: Fix memory leak in mem_write() error path
Date: Wed, 20 May 2026 13:41:20 +0800
Message-Id: <20260520054122.1630021-1-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <b1006ce4-f596-b2aa-421a-518fe3cfe1f0@linux.intel.com>
References: <b1006ce4-f596-b2aa-421a-518fe3cfe1f0@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NzSDQCFWCzVT5bz7VTB9dVaSOvifKaM/uBUzKrU2nM+4P+Zh/CmjqvH2
	WnuzN7BiXY+bJzPU6F2L35CRlDdDPGRgybqhq3LzXY7juU1TxVpiQH+JLvNAm6iuUgP4fsD
	y8WuzJvZihBoK+8fy5chKw0zuGtjtQo1akWI+IJwi69vJZ1m1+N2MG2xyrSSaD158r0+Iwd
	xtZTAVIaBKZRpIprDxR5RUl2GaSB+ETYzcrGVexMnuUTSmjZGB+kxxPKFHmsyj7eZdWqNxN
	pz+UjrA+O4AK+eYWrs4uLj5U9161OipWJhZDSIyq3sQfbH9Bg6QWtF4D6pV48y2XObCDvz1
	aTkrnXexbLpMwZesMrh6e8eGc+/MpTqljyrOksxDJV1nqm0UEa9ZmtRKNDRML728XNaYBun
	lInymM8VGLGkvRJIMZCl9EHDVcpGsQcYsH8oGjOqp/N2ayN6/IzAazT3cng580Bfve4DrFt
	PEg9upoo/mkGFDGajFOoKBh1t4i7A9f7NFilbDzhhi4hThwLD2X4KZBd2M+Vmq4r2EmoCMl
	AA65QoejUwcB1pkFwNSnngw+trFbji8ILOeSJv0ENR+dODmEt3fyR7mfE8tbl5mo6MAef/D
	qlHNeb3gH4BH5dbTcNYGPVLzN6xuTGuhOZnxcPlEnDbzcsWSmaCH93lT4t7vEY6iitZqlmf
	mRiEyBh4GuExWSSQNpx+Btc/sxB/61mKnV2I1FCLzuKZSdEAkS9uFz7NliJ/atFY857Ffyc
	YwV3iAgg9p4iSm4YYiMwXhwyqfnEOweA08lg29VVAdKna/SqQ43f+Jjy7DEJJL+W3KTSbiW
	65pMIuKQuBp8xPlcReY6azIakT6UrEjaS5Rc0Hs99Apx/shqH63iSDJG6ZV4adlBKIerYAr
	zJw73C/QT155oSUIkdc0mqj20hTLv7HZkCHjHa+Nsq55Mgn1yZ8fB6RwnLcwLgMB8x8kd7x
	rKWeI5OShlfijmFsh4chcFBnltYH0B4N3QJeb16OYXti5j9bXYD2/fIXBofQ8tsOwBowlh8
	qOUG4dWg==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

Hi，

Thank you for your kindness. I hope I got your point.


