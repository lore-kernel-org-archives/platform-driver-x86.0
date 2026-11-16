Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873317;
	b=Bj53PXS7F0t/Dupwjzv30g30LxlkbNOw5tJKoBvIHnxSsoyZNfrwvlDeS02sAIRaZaIm
	 FVOa2Q6SFAkoG7z/PRmmcRVlPBnufnRlp11V6nEjNrsCS4wTUcIfivvI7PdY85jUMwCKG
	 vjQorEb8Klb86njVi3oSY4rCrkwy251Ycamvzb7mkRUHoToH4tjs2kvvG4NYy3Mt7ErRu
	 u7FUQva+em/vPUS3FpP+7t+U71t466hfYsRQlnZPp9d9rOXDXwK0RxfG0viC8mGOOyxEM
	 Ych3C2Nkq4TUyPqPTvcVQtX+Pdyb22coDXvkHzLtp3Kv1g6gMZgN5wUvDKrm7RZcuBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2QLASSGa3v9K7rXAHspKjve668de311Ix/B5wkH5KLQ=;
	b=gpbPGqY6rheCSHJVDqh5yJ15lAi/wyIS63+4JtQza+uvo3sRaBafIt3P0jTvxriOQYoQ
	 NFGWidcUkfcmhop+il4AnH6s9fnGyZdGnQcXo8QGzQKdD3L25oGiWZdJo66OjOCYhhIS8
	 Lhdv5d0cVsORq9KzzB23Ow6dUmJZcGQfwUktQafotUS6zbuxzKNc0Cpimo+0nqaeET9Po
	 avgqJxkVpbCJDoe4HOoBMPPWibcPjB/3bVuuAE9m9D6niMLAndeAzraGcJzGjiLPWyDs8
	 /uRX2onnL0wR8WxIALQ0X1mAKwWoUd1XewqOSrV8ln4Z/E7TLTkn/cOrxmNpDbmPq6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s3uxLKAS;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7550606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7550606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s3uxLKAS
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3791619605cso7538760eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873316; x=1795478116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2QLASSGa3v9K7rXAHspKjve668de311Ix/B5wkH5KLQ=;
        b=s3uxLKAS4ZURlQ1CqLkGYrcOcBmhdPRAx5mGHYlXMSMPNojy2WMDgQOOO+oFItH3Tn
         k5GDMxTVc2p+UoIRPYb8ikYg1bggiN1Z4XSnPvMFBV4gJ2i/7QgNwhrtN6pBoaB+CTS1
         2TbhLFNHQNgp5JnjGU1DnpNB/NrsPQC21XRt6PyK13LKzgdPHKaLOkZ53IsbMkNsQ2cS
         CPnb0wXfVRqGgvFmPXiaq4lqs9B5CMShMGEfphEvMeHb+nWFC71OHU6/AC88Cemw3SgC
         nCgYqvAetZFNrQacBciY6gJORE51fViYlZS3iVz6aR2jsxGsygiiudfs1d0muK2JCBSC
         K4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873316; x=1795478116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2QLASSGa3v9K7rXAHspKjve668de311Ix/B5wkH5KLQ=;
        b=EJLdl+Jh7Mblo+ALeKaVONyDT3UiF8XBMqK+cPedhMZsPzQZ7/vJQ9QZTb10w0YuPE
         mL87enj74ekqc3UXb1pA4ypiK8tldKaJ1mpOxfoHEgH6yoYRHyAJXo1X9mvyn4W8+cKq
         QE6s7O8qP5Z08JOv3cffBY1rFJ9+X//5QSD9Hg5l1oQeCHIO5Ould6t5y3ofuyFjqxqh
         D2CZu5jGS+YziXnO0V/5G+oPbBKChqL5Ag15T1TZ44fElu5Gopn30vY0rvsahOlEUGBQ
         qGmUl3ImqtZ+6fN1gVEBDx5cYv4LPfwyvK0Gm3D5B+atMDbbwqPDxNDbA1I35J7EQN7m
         aNSw==
X-Gm-Message-State: APuU4Z9PdyQ/42LTIo+kcUDIPcuYPFKyC1BerOnWqnevQTxf75hF/rpg
	2YacNBoy2XX89pllRcl9/16iImmuayoN9IiqSSYVYldZRrPGtovrKLpH
X-Gm-Gg: AZFdTZfOWKbek3CBLuilNxpl6ZTv3yx5FrcPiTQXcMDm1dNSlFAWfJ5H+fJXdr/Kk4T
	GULd/7Tyfk/2bIpc3Awj1rZHSgVyq9sZQIvTR2md10w1LDDBm0w+5g+Ztddw7s7Qll2TpaN8Yrd
	GB0SPk0G1fz1CdCVog0aXz633Tr1jUdERCqBO4zbGWkmKhVbc6C52aBcn6nLozkKuOJNnMLrwfw
	5yTuMyk8cWKI2i278gTSmxbOh0rPYqQWNmc5zSlD1sxl94F0aignQWapi9nbf+bmkGGndrG1jle
	oquGsm4aiQ0zcpuODiYH7aRPK716EkFvOs3JmtoPu9zV/vHvoA1fkNes8/S0lEKt/O4BYuttNwY
	NcvY5FAaNXPiZUP3f8aRnxYbqZnowhxR6VYaMEk1mbjy+47ToQn7guIQx+bi2hc13RaKQYjTVwE
	cWPTFm4ZtBaFUpdOxg8nHkYxkssDM+UtKDqinBVQUWJvX9+3jb9rX4A1iVjhcdBZ+CJVrfK/aVq
	yQk2nCt9yhAEJhCXwAkPIwWiozTcUdY1MskPIrgRZjmzfFZ/r3bwKoRZ31nfbmR1Ijw/xMaAHhs
	Ask70MKsebMOFfpTFHhLZbnnDgEq9koMKDPS0r3CcALNgCkvLozUVaXEemeshfAJtbKP9m7GdwL
	cs9PnHzSlOmBDiZSx9dp7WenRyK6yBsWGQooC7xLjxT9x58wvmWBwKTdgmH7EzCOu2bvnwTm7Ru
	n/sA==
X-Received: by 2002:a05:693c:2a16:b0:369:fa21:ba0b with SMTP id 5a478bee46e88-3796721cfc1mr11376542eec.33.1794873316110;
        Mon, 16 Nov 2026 15:55:16 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:15 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 01/16] platform/x86: dell-smbios: Only allow unprivileged reads of whitelisted tokens
Date: Mon, 16 Nov 2026 15:54:45 -0800
Message-ID: <114887eb4f9312c7a17f79e3b7a720626482dd75.1794871007.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794871007.git.rosenp@gmail.com>
References: <cover.1794871007.git.rosenp@gmail.com>
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

The WSMT tokens are whitelisted without a capability so that userspace
can find out whether WMI has to be used instead of SMM. The whitelist
check does not look at the call class though, so the entry applies to
CLASS_TOKEN_WRITE as well as CLASS_TOKEN_READ.

/dev/wmi/dell-smbios is mode 0444 and the ioctl only needs a read-only
open, so any local user can write an arbitrary value to the WSMT token
location and change the BIOS setting.

Only let capability-free whitelist entries match token reads. Writes
fall through to the call whitelist, which requires CAP_SYS_ADMIN.

Fixes: 1f8543a5d602 ("platform/x86: dell-smbios: Add filtering support")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index c8e93c12c445..d98e1fb1deef 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -255,6 +255,10 @@ int dell_smbios_call_filter(struct device *d,
 			if (t < token_whitelist[i].min ||
 			    t > token_whitelist[i].max)
 				continue;
+			/* tokens needing no capability may only be read */
+			if (!token_whitelist[i].need_capability &&
+			    buffer->cmd_class != CLASS_TOKEN_READ)
+				continue;
 			if (!token_whitelist[i].need_capability ||
 			    capable(token_whitelist[i].need_capability)) {
 				dev_dbg(d, "whitelisted token: %x\n", t);
-- 
2.56.1

