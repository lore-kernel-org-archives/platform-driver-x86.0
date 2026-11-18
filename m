Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795028448;
	b=fnjAwhF1NQ5RNuKGB/ALAv0vCHp6msORAcRfQfs4nERSP53aI0JarJkChUmhYzcOyugV
	 RrlZ6RsmKXc5lVGwMaJHlcHGQxllBQOuBNvmjJ3gDkj8RFr+0jJYq8dvSlbcgclDjbrzg
	 5UgKF6AJ2ecUV2P8HlMdhN9FwvnsMd6FJbJdlt8yaTRh+A+mVBPyCSCRqL5PQ1+3QndHy
	 dms6Og+QtDl+fgJ4CjdnY6x1/HlDUZ332QHtNQzHq6xVJuPQQVAKxtgeIAIlk5NniWlP2
	 vfCeaMQgVYPr6EFPWP41Z0XJ86RRke87e5gpdtab/3bEVCrlMLv6wsOc2oWi19/hxSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028448;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=CiwIV9xoh89iJC9E8ziLzlqU3QJaE1orFVy7Jgr/CN8=;
	b=YoEQ6bSWIY07r9OAX+dXOjuYyRRJ+l6OV0T2jTDhdNuAx0CLYvi2I5qaIN7NCmH8ePZJ
	 8ZGDptcRCHmu5jdDyW920Qzi8qQol68s23I1vieNnM4ktS/zogPMl1e+5TA44RLU48KM0
	 34etA17DtPbDZDXVtuNFld14QXZcMVusoO+1tXcnuUU34f8Lre5B08GPmVHr5XWhoyrzn
	 OpC+UZbs79SiV55xFirM37FbgGMlkCZgt1R1UfeesaBI7WEE5+0xk402LIaA4GRziT3gP
	 8NNDGGJA+m9BvBdJgrUqySX/Pamu6BnZ7VW9SC7x4o3kS8JapyLG4cmlVlzr23Fch1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=BmGr8ekB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76102606A320;
	Wed, 18 Nov 2026 19:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76102606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=BmGr8ekB
ARC-Seal: i=1; a=rsa-sha256; t=1795028436; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iY8ARmmkGAgQ/e1z7jSw4FxUH4PFRQX0tShPQnYKcpKKGYaILaenyQFViJ6vT3UPvDW2mcw1oZ1JNKKS7IB5XANKrc6kC5gxCgqLkwMfHOk5fKOS6wTo/tZfuob9VF+yawSmRNj9SBvoboeEVvo+emlr6jk2UiK1miWIIDlvSrw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795028436; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CiwIV9xoh89iJC9E8ziLzlqU3QJaE1orFVy7Jgr/CN8=; 
	b=iaMOvppYqILYzSYQPBahU/KPB1jtVLgFanVRb+d2ACFIN2jdSrYk6rhLq9tYWYuuinsAMmCmttzL0VoZ1IYNDd6sFTgvWLLKLjl3cDEaaJ3xDjBqGrW9H3fRmqBQHV24SkkMJLKwPT5iWmlKDf9kIErpP4ENIvd4XmAg0vg+CVY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=BmGr8ekBxVFTmoyBbHZQlWY83tBmzxdlPRDBay9wpy8OXvx6UahjRdEofAqODhV87mMNUDSZ/WKhuyEDRNdUSMmNGGPmBpod3MfnYJkV4N/y6EqHqr9UVXLxy9LHkxWmw9pY/cXU5dTlZj8W45quok6+l4pIqaFXSgGU5Pu+QEzdWqxUv6iWy6A0Qo4wUGR60YXemqyBAedsKc4YRolT4UPgC9B8T4IGW6nwu/lboZ9luYG7BqEGY9CYkrAUZ0OfDh7utlJLdTLHDDsiReUunL9OVEExySvAqTfiu2gJQ0LmmHuj9UYmCmc0SNERSty4PZ2yRi7wTzJ5OCwna3gL4w==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=CiwIV9xoh89iJC9E8ziLzlqU3QJaE1orFVy7Jgr/CN8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795028434736607.6230374627213;
	Wed, 18 Nov 2026 11:00:34 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH 0/5] platform/x86: lenovo-wmi-other: Refine
 firmware_attributes interface
Date: Thu, 19 Nov 2026 02:58:43 +0800
Message-Id: <20261119-lwmi-no-singleton-v1-0-6b06fcfb5126@rong.moe>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw6DMAwA0asgr7FE+KiFq1RdhGCoK3CqmAIS4
 u4NdPkWMzsoBSaFJtkh0MLKXiJMmoB7WRkIuYuG3GXk7qbEcZ0YxaOyDCPNXtAWfV1W5lbbKoP
 YfQL1vF3Px/Nv/bZvcvM5guP4AepMbNV1AAAA
X-Change-ID: 2c0ec814-lwmi-no-singleton-a3f945179a50
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Alok Tiwari <alok.a.tiwari@oracle.com>, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

The driver declares `.no_singleton = true' but stores device-specific
data to statically allocated tunable_attr_01 variables. This makes the
driver depend on the frigile fact that no device in wild has more than
one LENOVO_OTHER_MODE WMI devices.

The series moves tunable_attr_01.device to the firmware_attributes
device's drvdata and introcdces a tunable_attr_01_ctx array to struct
to store c[dv]_mode_id. In this manner, all statically allocated
variables relevant to our firmware_attributes interface are constified.

This also eliminates all attribute-specific callbacks by moving their
data into a newly-introduced container struct capdata01_attr, so that
all remaining attribute callbacks becomes generic and are shared among
different attributes, which shrinks the module size by 42.7%.

To further follow the common practice of sysfs attributes, all attribute
groups are now created and removed at once using sysfs_create_groups()
and sysfs_remove_groups() by providing an is_visible() callback.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Rong Zhang (5):
      platform/x86: lenovo-wmi-other: Retrieve private data from firmware_attributes device
      platform/x86: lenovo-wmi-other: Eliminate attribute-specific callbacks
      platform/x86: lenovo-wmi-other: Factor out tunable_attr_01 definition into a macro
      platform/x86: lenovo-wmi-other: Properly implement no_singleton driver
      platform/x86: lenovo-wmi-other: Hide unsupported attributes using is_visible() callback

 drivers/platform/x86/lenovo/wmi-other.c | 566 +++++++++++++++-----------------
 1 file changed, 259 insertions(+), 307 deletions(-)
---
base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
change-id: 2c0ec814-lwmi-no-singleton-a3f945179a50

Thanks,
Rong

