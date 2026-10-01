Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED154BD10E
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Oct 2026 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861861; cv=none; b=RDtqCISJAqN8izXGeau8CMQhi+O8Pr5n7kK97Au5ukWCUnWruUbOHi06VJ4tQ6fuzxSU+sAv0VzbE4eIV/HaCSF5lpu9+GzH0jKnsHRybV3gWUwWPoGYhD2jZU0VOFdsPbW7VSi2NFQh5Hp+gs+QTZZtIBVHFvgHkCGoB1zSU/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861861; c=relaxed/simple;
	bh=kZai7cDOlZ0+l6zlb8MOoVY8sOR0vPM3UXr16XTNIpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YdlBykeQa/QJPkXwuWNJPjmooVrQ2EwSzWSp+LB4iMxyCPblVXlJrx/BCnwH2/OEk8lWQkQ5MWLk0TQPIH7/mZ8N4Yg/HfYl3JZ7+fzbZd7uBNW8PqDlWJFavB7EjlRCiBGBbus1gcq/y4+Y3a9xIcvvo8mdjM0MPvtsygp5YLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2/Sdgrr; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2/Sdgrr"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba91so3152318a91.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Oct 2026 06:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790861857; x=1791466657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Byus0DODj6fofwroehsBhvXhreRXoniXBi5MxJoOlL0=;
        b=U2/SdgrrYmurfY3l8SGcgO07WYtuf+WHUF2IpJUeDYWVktnCu5PMgBuHV5p69GFBcw
         gbq1Vj9iext+9TBETpcqXY+vwdEpLxF5vEJ1T6ie/ULGbDTZsTmnfvydjmyRly2gFDCo
         pbr/SiI15kg7sEN1Fsnu6ay1XIJ6Z8V5o/Ey5VyYrBCwii7qZKQCHb1U7aTQJxLuKOtv
         ufJDS4cHIRzgszhi5L4PNQTdjZSoXoknpWWKY0PYMJoXBkQTJsFgd8fptmTsOwmc2iD4
         MK3O8WeJ71pRO06dWARbjDZORK0IXfxrFB7u5YI5VPNEyuNvf7ZR8gmZbpQOotfvdTp3
         ZVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861857; x=1791466657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Byus0DODj6fofwroehsBhvXhreRXoniXBi5MxJoOlL0=;
        b=AET3m7LVV5ZFKpx4ykPB3fUUEUjuVHjSevBuiA4duBLpdZT+4VQj/S127f7Ea6t1Wv
         zldbXEQQH8lvyGTfFRUN3WpKrJ9qCDt5VyXuYhfT92UZ7G5aH9a26PUXkJhq7c0WDA+C
         tLRx1WRfpnDCgnkMKJBiDYzQwqvIthc9U24mkl8cARN/gHxWMj4mFbH2Zz/s89CxtXlK
         I02v8RQNWiEI4Lcb8L2dHNdvtmzI5dbFPRxLbiip0tzQRWDzFdKp2ZS0zn3Za7Vbj4X6
         Ggn7b25AB3vOLB8THuT17TT2ieDT8TQB0v7sr4Y1xOg3+/RqKH4lrLhzsObvsIBiFIkB
         ycyg==
X-Forwarded-Encrypted: i=1; AKwUvBwhB0aO92eCZ72DjC51xKX292Hwya8bEBrKzjRXHoinsGDJ8CmtwH6cD2OmtZo8Cb3L3IVZ4Z1B3vI33A/f3jaOaVwA@vger.kernel.org
X-Gm-Message-State: AFq9FYLm1nmi+cZ/4DJo3P/DizEy4b8rNO9ykp3r+9JpHWAxofyIJjQh
	XHEoFkhtNIKOkdjbHwZxu7W3VezUqP/rqTZrryV/ECNq0Pth7O6kirjv
X-Gm-Gg: AYBFou1vbcDw5b+4KAbtiurwueQhax2v9WUYr63og6WAuJMyAVzeMp3fjHtbFHFSzJ/
	kzvA8wQXCY011eRN8D1NB4a05ceYl303VPhzNdIusUkElT2urk6R9ej5Zsupe86XavmkmR2Iemq
	pHUYVNI4D/zV8X5NebGrplPuv4aETre7/VRsQnvAnYRofKAndahQaZyQ2QSIXvTyX54JC5kabcl
	VAStvUyEsq/TLATIx89iS+NtIvhOcef0mHaYOpgI1hhAlXoD6oRDmzGptuSfoPtlkpyMVZxEu3r
	Ph9lidllVyaJpb1A5LK940rfiBTi1E92ib5MbwURvwbQF5IODM4fgo7f+mbUuDQ3uV9Bs/d3S2R
	v8u47ddVqHiDpoQvMKmib6ljHy7lC9N6lYVif0/PQyUnCXuHqLPFirzkJLrNQ+NsPvjneCBjfxQ
	dWmJErePkbgDB6hdPdnAaRean+Mc66Vlvtam4FSzMRJsn4+ZD5Mk6DI2Q4Z+1yDk/Zwaom3W8=
X-Received: by 2002:a17:90b:3849:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3a4d0f02250mr4016440a91.9.1790861856840;
        Thu, 01 Oct 2026 06:37:36 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46b6bc6sm4715737a91.6.2026.10.01.06.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:37:36 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v9 3/5] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Thu,  1 Oct 2026 21:37:03 +0800
Message-ID: <20261001133705.69244-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001133705.69244-1-qby140326@gmail.com>
References: <20261001133705.69244-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing Redmibook mic-mute hotkey definitions to the shared
sparse keymap table:
- 0x00002101 (Fn-lock disabled state)
- 0x00012101 (Fn-lock enabled state)

Reported-by: Nika Krasnova <nika@nikableh.moe>
Link:
https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a6978d14b975..93a519b96189 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -636,6 +636,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 1, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
-- 
2.55.0

