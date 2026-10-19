Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422316;
	b=S8cdWcqUxuJY376jDznpXaV77VqA2xA6tC3+h9BX1kOCSgmSU04+gPGYbvbHf4l+rPY8
	 DeFhLlK5QHMG/JiZUbAe2KOQrki/wNvKMlabJ1lW2VpzsBz1S/HB145TPAXjOD3KfwWjU
	 G40e1LW2e3ptSkHjbBkOcyYs2COBH5CyWgyTpPSaANqFr0EHMWY1gbRH1//zpHpEjzV1/
	 +ajOwHzu1r2Xd9PYUmz7bjUOQJgz1T55hwiDXqi0CcUmsNzl2tN0GMvyHrc9bHeLvmean
	 eZVEaoB4kgObMhnYOqmnDuHqYMHbkhD7onEAKE84xkDSWr/i4fcbfCm1CKQh+uagg8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422316;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=Wi8+H/G5z2Klnggdqj6icJPrOMSRqT84gK35GtwV0ME=;
	b=5jlsQjXC7/xGIzvSyShQsOfzWE8WkdcX36/HeTxOIWumqdMehi8seeRdoQ19/N5QBLXG
	 cPr1UjxGbaXtR7toX12c+6LuvW4zV/752DrfH23O6Hg0P+0fqhQfwLQvmEjmKWAn1NBjK
	 AVMdvf+ZhiVePfTtMtXgovopG1PzPTJwN7Vz8Ttz/NzGwOLTn7RKkjkI6zNZnBB8uauDQ
	 n0qK+QSYvRfn4xQOYwJlMQVSC+D+tKlRAdgypjiWSsVWwddIbJSIolbhb9qWP2neLEt9u
	 fZOOAWpIsxnA9+mF+FZzPHBTloUcZMeghN8aTQC6nAChORYjvRuREjuDzf7WhyeAzVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=Tom32fIo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556C0607F4BF;
	Mon, 19 Oct 2026 15:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 556C0607F4BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=Tom32fIo
ARC-Seal: i=1; a=rsa-sha256; t=1792422228; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gQjSOO6PoPF33zl5P5DXL6CeYlL/NjQHwh5+LsFm7tZPsQkWrwMVyw86HAZRqkzul2j0G08uQLDQOsayYiyXTW7URDyna2nnnqtO02YwVdYybRKFN+qq6WHNxpHSe59ICDRZK3tO7tlF+uSs+VcZVnpzEFVZBgrkMlAC4LQTnzQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792422228; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Wi8+H/G5z2Klnggdqj6icJPrOMSRqT84gK35GtwV0ME=; 
	b=jxUBk/Ou/PYmfZBeWH7ge5mqgRRV/mmBtoS5lRzJQvYuq6I806F6JZ+EDCmuabRyl7j94G3NZE/3QkOKYiAh8bFKaPeYbMbrtsUn4Qx+uHmx7H406zYvGRvKSMGfEsYRKW9zUIA9XyIcewVedi4UGDS5ZBr6nrI+RPUKG9nNRm4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792422227;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Wi8+H/G5z2Klnggdqj6icJPrOMSRqT84gK35GtwV0ME=;
	b=Tom32fIogiWB2BQqkSzHQOiZfN9+6ElEN+D8CnTzrDhXKCH+UJJiB2A6K1fk1qy1
	gPjU4P69NoMQ48dk5pN02FOCoWDSqTZvP6ep+Ecmhg76vHP/o/HOD8o7EW3DBCW8Qce
	R7oSe+cz0VQ7b0+ZDXfsTBXxMQFsftdQbda67kHRCzOKTh7jWW9x5j/GdQCvf53crOp
	pFjkdSLugBBXlOSGfj7FD3FG5LZQ5GzINhZc8Fk8fEfhBM9u6zmYWDIw8Ajy1hg4cKT
	kJCKB43NI4+AzMzkBAdArU3ZQfl/oqP6ic9CPWg4caRyjcnNTCen+1GIPaAeOps2NBH
	U9pSAPI6Kg==
Received: by smtp.zohomail.com with SMTPS id 1792422219113783.2114368613321;
	Mon, 19 Oct 2026 08:03:39 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 19 Oct 2026 23:02:34 +0800
Subject: [PATCH v5 12/12] MAINTAINERS: Add myself as a LENOVO drivers
 co-maintainer
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
Message-Id: <20261019-lwmi-wmi-new-api-v5-12-71557d28d058@rong.moe>
References: <20261019-lwmi-wmi-new-api-v5-0-71557d28d058@rong.moe>
In-Reply-To: <20261019-lwmi-wmi-new-api-v5-0-71557d28d058@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, 
 Navon John Lukose <navonjohnlukose@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-6be7c
X-ZohoMailClient: External

I regularly review patches and resolve bug reports posted on the pdx86
mailing list or the kernel Bugzilla to improve LENOVO drivers (including
lenovo-wmi-* and ideapad-laptop) along with Derek J. Clark and Mark
Pearson. I've been submitting patches to add new features and fix issues
on my devices, too.

Add myself as a LENOVO drivers co-maintainer to reflect this.

Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Link: https://msgid.link/782FE636-A06A-4E12-9563-786374805947@gmail.com
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5cd3..8b47944f02a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14805,6 +14805,7 @@ F:	drivers/usb/misc/legousbtower.c
 LENOVO drivers
 M:	Mark Pearson <mpearson-lenovo@squebb.ca>
 M:	Derek J. Clark <derekjohn.clark@gmail.com>
+M:	Rong Zhang <i@rong.moe>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst

-- 
2.55.0

