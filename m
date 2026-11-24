Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795543389;
	b=szU6JRw3Thpx0temfUwKJ3gKusgHWFRRwEhcQU2kUyEU5c0fSyRjcuBFx3WhkNnFfDg1
	 Z8EJnKj1U6lvHjGgRbWcgGzG4EroPKHLXqzuMQRB3eJPS9eSoGkNrvLTVAL84DqACLOPo
	 NunM1peaAGAiCvaFxHO4TGmLI9HlcwIFx8kPhhZ7SxeWmO/woBYCkOejHGwrcOoUKyrIB
	 toGujIc/mdDfJdOC8LDxhKJkv4QVYhdVzv2vpnXwQMXvw+vvC4qc39YqJYgZGcrdFOAnC
	 XvoRccsZWMh7dPwiMoJmtbdG62xpasB89OGY8VZ8VxuABJy4ewP8DIFEIPBWf3AY9Yg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543389;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=dz9+ADitlgzsDNxkxrOPLbIYSXSNRs/g5s6tyi3QL/o=;
	b=Wnr9ALDPV5VGN8g4dSMXs1igx5oLt/y5Bft6z8Ly/iCIuCIJKx5GL/qQRKKcnUVAoP0S
	 EEx0g8F3lZlV9V956JbE0qQ2T7nr3ioMMJGGbDzAcSsXD6ZO13KhBHZ25lEHEsl3aOGwU
	 D715P+4uylxAwUhfremL7lBqyZ+7SOglwQP/VxOcVtkX5NX3LXe/kL6mfQ+/iiHJ/VGxE
	 7C5okDrR2GeeJ+WsKVGvnP6tdRLnFSBgAKxmHPrpSjyxStfOWUpgHkgQmlqAQGoeCzbSN
	 mJkWc+8BziMNgFpgQdWPHCkRmzuoEKd3cC0S5eCEhUo/RQXnf7/6mkYfo5EpDvyT6yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=cXs6Ucuz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C98606A31E;
	Tue, 24 Nov 2026 18:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C98606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=cXs6Ucuz
ARC-Seal: i=1; a=rsa-sha256; t=1795543376; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NNFBFMo/ThAZEubmvkR+AYAyokT/nxT7TA9MvODY/V4u9EpCn2ZYY0/mIdPZNe22AX9DwPGnXOcwjWlCXN+0GB957DJU94z9PKXBkvve8Qk5K1XutHvGjSdd8aKu13eerYQ9vEP82gn6KgQ8N6vBIzizJpvhhF8Chubb8pDocaU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795543376; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dz9+ADitlgzsDNxkxrOPLbIYSXSNRs/g5s6tyi3QL/o=; 
	b=X9vY875rdy1DiMmZdSfQ/kWSYkGy8y85nxw5cJgh5Nx4ypu0eSs+hHcHR4JX4osKwWgRxmlL69ZmxrfXgPURvbr5IrRifnOl/5bBowdeZG+p5mrE4dpyoUijqgE0LEzpjGmN7MVNANtaqC1bxriECYRvsz6HCWBCrGo7ilLnO4o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=cXs6UcuzCkevhdrLgRv0Wt0InGaLqACynNkxUm8D4dnq7aJcpRi1QacWapDVoa30cOKtfyOG5W7M/mzQit2AlO3bHsYBVw1c72I2DX+ZcANwfcq2Q4pY8Z3968H3QP83IiRebf44H8RCZY3HvilKUbzbzg3JH0WvCICpRRoai89UwQGU6ZaiqqJGIAZ+rtc8ZE3k+mf703G7bNyVEeGSai3SdHm9I5o41LdzO8GizqVFQuSHSuhqmgDtxVJ0E8TSwL9qs7DBPHuc9icnzlICDH4Rnpc10dDu5HfZ8P6dLLobWBGute3PIZweQDFvZK0H/nOm8/mYv1XGZ5GnDDtLqg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=dz9+ADitlgzsDNxkxrOPLbIYSXSNRs/g5s6tyi3QL/o=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179554337431539.146940877737165;
	Tue, 24 Nov 2026 10:02:54 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH v2 0/5] platform/x86: lenovo-wmi-other: Refine
 firmware_attributes interface
Date: Wed, 25 Nov 2026 02:02:38 +0800
Message-Id: <20261125-lwmi-no-singleton-v2-0-37611a7b2fc4@rong.moe>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0JmbU2nQhVX3sOwgDqFMdCaFlFDu
 LsFty5f8v77M0QKTBHO2QyBJo7sXQK1y8B0tWtJ8C0xKCPJnDAX/Wtg4byI7NqeRu9EfbBlXuC
 xrAsJafcIZPm9Na/Vj+OzuZMZ19BqdBxHHz7b6YSrB0oqjYjln/6EQgrdSG2NbQpU+hK8a/eDJ
 6iWZfkC8qVn+sMAAAA=
X-Change-ID: 2c0ec814-lwmi-no-singleton-a3f945179a50
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

The driver declares `.no_singleton = true' but stores device-specific
data to statically allocated tunable_attr_01 variables. This violates
the requirements of a no_singleton driver (even though no device in wild
ever has more than one such WMI device).

The series moves tunable_attr_01.device to the firmware_attributes
device's drvdata and introduces a tunable_attr_01_ctx array to struct
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
Changes in v2:
- Swap device_id and feature_id in tunable_attr_01 (thanks Mark Pearson)
- Rephrase the commit message of PATCH 4 (ditto)
- Link to v1: https://patch.msgid.link/20261119-lwmi-no-singleton-v1-0-6b06fcfb5126@rong.moe

---
Rong Zhang (5):
      platform/x86: lenovo-wmi-other: Retrieve private data from firmware_attributes device
      platform/x86: lenovo-wmi-other: Eliminate attribute-specific callbacks
      platform/x86: lenovo-wmi-other: Factor out tunable_attr_01 definition into a macro
      platform/x86: lenovo-wmi-other: Constify tunable_attr_01 variables
      platform/x86: lenovo-wmi-other: Hide unsupported attributes using is_visible() callback

 drivers/platform/x86/lenovo/wmi-other.c | 566 +++++++++++++++-----------------
 1 file changed, 259 insertions(+), 307 deletions(-)
---
base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
change-id: 2c0ec814-lwmi-no-singleton-a3f945179a50

Thanks,
Rong

