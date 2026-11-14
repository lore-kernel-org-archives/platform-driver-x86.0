Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637108;
	b=RiXiK/KMgbYvQI9fAyaDRK1ogrPKjM7uVqv9PDVWaCJKSF0RKYRHazGtI9b1U3+9Wygt
	 ngaCy0jPgEC5v9GVUfjKZTu4p+2IYCSu002F/PMVwa6dhGEM+/WPBXq69zbYamym8bwco
	 VWpP8qkgvKmB7TyERleNmP9/kZ54YJ05swsUCU8hWTtXk8K4E6CHmzPdd7x5/GbRJbQgL
	 Vtihh975DhYeWKZkECsZbB3aNY+991ooP1UBWosMioluW+r5Uir3P4buHfFa4lKoCnDWy
	 P8yTN814RajgJqKZt4YeyHztISdNSmdSHuEIabLcjW0tUthcJ+nJ8FfKfPwLnKPECjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ptwvPDqNFlRv3U0ViuxKW6/gMdMwdZJqd9nuA2EiDQI=;
	b=IH5J88U8C43ehMJ8n6vYSiwiiNX070lEvm6ArAbdtyedxp+f0cuhXASwsziXvP78nXJ2
	 wWrAV1xrsTRDldSdq1ZDlxgMpd1rqo7WHbZ9Xf2DUlHxk/DuHZP7Q8CXIh1JXKAPv8HYJ
	 BXG/HbRM4arersniI+GGFKsb2Q4Zp97aWfgGOl2i7dcdmFRV4o/h2J8x5mDag4LYL0m5j
	 1l+ulpAPABQoNv+GIfS7UkZYm9QcJe0pb3hA322ZrrNomIb4LMJJU+dPow2YMGMR+a87K
	 zleKC/KGY1Z7yGxsYzIOU8+v0tq9tjEUm05mORXIGgla05+AwNzP2mrr9lnwQFZhE2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VYHFUH3o;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911D160A260A
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 06:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 911D160A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VYHFUH3o
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37198ed3727so3140898eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 22:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637107; x=1795241907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ptwvPDqNFlRv3U0ViuxKW6/gMdMwdZJqd9nuA2EiDQI=;
        b=VYHFUH3oBsRXzu8T22/BrwippvTw/pL+vdWIZ92OxWtyEua02Tt/yu+Cl1RnOTFEyq
         CREGJgh/Ro3Z9HuiS+NIpnyKr4bGUloo47W9QiQwvOQMZ3I0Ff0VkxibWq0Xk7FGrQTe
         EiTujSV8Ujxdz3lRLN60qz/xnLIK6ps/cnHweQQv+uVf06cDrjrASMPcd+D/YMwzgOhX
         uCM59Yu3ZUofmbjyhKAiydX1bQ0Ooe42G6bYL3OeQQqOu0opSll06HFMurRuTIFRpTOL
         jkFndZLQnMlscpytTmFzPpRkMRNpSpzrv3Twls16n42EjmhfXdKSWiODeZHx8VWonXZk
         OPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637107; x=1795241907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ptwvPDqNFlRv3U0ViuxKW6/gMdMwdZJqd9nuA2EiDQI=;
        b=DwKJTkk+dTfS4bDi5Q8QNOTKdEvy6ppZvMRZcMfJVMQzb9/Ad2JDNEXKdRBJP6tjaD
         ghWyTfeVQ+FTWIjrGByH3xLOYPYDjjmmRSxN52BZURpjoAqk+CX7Hn2lMhvZQXS8rhju
         Z+IWc0DugVuKtADMMNGPER+z3I7an/yAJK50TRBzvBhN7HPHHAcOthfyd7pw9QlHDcRF
         TWURsFs1OyYdFNCS3jIi6Yx7+KWCb4Oj1TOld2My4+VIpFK/Nbpn0wsiqBwyrUZ4PQyN
         Qzr2kTl9QsGZEavS8w0JpD9iUy49s7sZTvDm2Mh5Lp2VwWvCPdFlBH6MOmK4wn8rZ2Qi
         Xfig==
X-Gm-Message-State: APuU4Z/dR2E4XiuInizWoc7Cvnkdqi9YM0+Rw0XsoeVUSyQpMm9V3I+1
	HMiyij/j6h6TWswsYYOloew6GJn6Sgqx3XKY7gOqEHfY/4cJ7yVsU4za
X-Gm-Gg: AYBFou13sQ0bhF6Z8JQMUT3KXk4UEy+oWvAYVNCKSiVY+sQyYFVVSDStCZdsBQIlMgk
	qBXD3M1LLH+xO7VzUbHBoNM4ooTrlJ9Z+ftV3yTZkpTxetXOFIAhQ5oJWiYqTwGVEWxxRTNaEoo
	cSGae3VpZLf+w2FnZHtRKNzO8iIvPgnwneOpSeGUR0C1HMdvPGFioYOFW/lFlPW6GP/MQNmj1p6
	NRxT8xMAp7i8PjTAeLg8/g9UwsSwTClD3qhk14lIrOL0U6C/0MO9mHPJmXCyRmRusd/0kLMnqAC
	BHWx2G50u+CosdOg6bijI8RS5U4lveu4WVEDKaLno/sUSQc8Dobdzrw4IY2YFTloIaK/+tLbFcE
	HleUWWzfhi6UmWh1cbcjgX6wbzwHBzsa+hsAU51bUToNar1E+nKPvshE2HIJyq9i9eRLKstGcoo
	o+gF4cA80P9qz/AuSqMfrPsdFQ7oTwjLFW2DDgf/pgxutWN3Q6ynQPGLPKrIoahTfel01A6ApDL
	tgXYCdseVG9+SEIT9xfYRgEGJ59t4jEwOHRlmdjkhKx1cHKNufa2j+koBnku9XzwIZkSiyk7H0B
	063Vc8eeTSBpfkylBGByDuNipF/MSHoMsZRnDBStkHDzOoZGsKJEFPTKRB5Ubjb0umCHirVvX0q
	HQct8JLJoLVD+52fl7O2ALy7w6SZVfDx3d19iG/eGtBUUjS6kabCmLUyyPvTt2PUvDzDWJMMH+p
	viFBY=
X-Received: by 2002:a05:7300:c7c4:b0:377:3984:5cb with SMTP id 5a478bee46e88-377e15ef441mr6684159eec.17.1794637106611;
        Fri, 13 Nov 2026 22:18:26 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm13200536eec.15.2026.11.13.22.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:18:25 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] platform/x86: dell: dcdbas: Validate the WSMT buffer description
Date: Fri, 13 Nov 2026 22:17:57 -0800
Message-ID: <e2f8ce920d1fe503bf8b506f3cea2a0b72187261.1794633178.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633178.git.rosenp@gmail.com>
References: <cover.1794633178.git.rosenp@gmail.com>
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

dcdbas_check_wsmt() takes the address and size of the firmware SMI
buffer from an SMBIOS OEM string or from an EPS table in the BIOS area,
and sets

	smi_buf.size = remap_size - 8;
	max_smi_data_buf_size = smi_buf.size;

without checking that remap_size is larger than the 8 byte semaphore.
An OEM string such as "30[addr;0]" or an EPS table with
num_of_4k_pages == 0 makes the size wrap to almost 2^64, and smi_data
reads and writes can then access memory well past the mapping.

check_eps_table() also accepts a table with length 0, since the
checksum of zero bytes is zero, and then trusts the rest of it.

Reject buffers of 8 bytes or less, and EPS tables shorter than
struct smm_eps_table.

Fixes: 12c956c4f32e ("firmware: dcdbas: Add support for WSMT ACPI table")
Fixes: 47a94c551a74 ("platform/x86: dcdbas: Check SMBIOS for protected buffer address")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index d5a93aca9c93..af4c1d2fe497 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -540,6 +540,9 @@ static inline struct smm_eps_table *check_eps_table(u8 *addr)
 	if (strncmp(eps->smm_comm_buff_anchor, SMM_EPS_SIG, 4) != 0)
 		return NULL;
 
+	if (eps->length < sizeof(*eps))
+		return NULL;
+
 	if (checksum(addr, eps->length) != 0)
 		return NULL;
 
@@ -600,6 +603,12 @@ static int dcdbas_check_wsmt(void)
 		dev_warn(&dcdbas_pdev->dev, "found WSMT, but buffer address is above 4GB\n");
 		return -EINVAL;
 	}
+	/* The first 8 bytes are a semaphore, so there must be room after them */
+	if (remap_size <= 8) {
+		dev_warn(&dcdbas_pdev->dev, "found WSMT, but buffer size %llu is too small\n",
+			 remap_size);
+		return -EINVAL;
+	}
 	/*
 	 * Limit remap size to MAX_SMI_DATA_BUF_SIZE + 8 (since the first 8
 	 * bytes are used for a semaphore, not the data buffer itself).
-- 
2.56.0

