Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FBE4C0404
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854606; cv=none; b=gKKyo/FLIHmptpGgR9t0Wbzk2/CkRQoRuZh9P/woOs+U/wCfZmOS7EsJrVSxEleEslrZ3qxVYRahhxmOReeRgBrXf6+uwdFcftSVwh6j+dauPF5yH0kh2u+iPUYmqG3Y6JPJbpUw40zYpPowgAIS9HNKTya8/pp1cbdhUhxQ2Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854606; c=relaxed/simple;
	bh=NzuVq/w7C8F8yq8Sk9Lb0kpmuAUTsBd2XPTp9Yy9qLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOwUIr6RPB7NRP+9Yzd/paRFyEtNw+ySGn5CsigOeuzIxesqJqLL278g0nb1It7c1LZSTIK9vv1BQn8CqpcVB9ZfX0ZYTxVjVRBBXnzfrJEXt2neZVCDaKZhQ+49tNwu/pl020mOs1f5TLk2pFGMMkO5eIn0dbeSryz/JOzco9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlFQjG0I; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlFQjG0I"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482dbc9a00bso912984f8f.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 11:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854600; x=1788459400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxaRY2y7dV8T3x7pQ4bDaHXO+vK0Rukz1PaECXgpyiI=;
        b=GlFQjG0IjQTIwK93gnMGdQqdstULK8Whoa0BCiwqvDFNIB5g8XioKdUp3xpiNhruv1
         ucQbkRAak+5IIdkQLLR2FerQzITIHlxAggGgqstMSxCV8wEzstREbvmlOWGTpZv1ek3o
         kF++0KAKx6OUseBntLRctLJY0uyvRpFzFIjz5b5sEGAGElp3rVfbvht67OJ1SOAqA6G8
         iDU4L5mx0Ttgg6PMoB44FlmmPqLl+B20nHLUrwoCngQvy0WU8vLqxYoj8c1KBYpzzann
         ckum+9qgTuHIQUtm5BGrciT+T2lCPFNi5feski/dQdalChHZ9oNdrA5zstmX3KguQCwN
         pkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854600; x=1788459400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxaRY2y7dV8T3x7pQ4bDaHXO+vK0Rukz1PaECXgpyiI=;
        b=DVG1OX5O3Z/lDAlgdqvmnNNK1f+uxJj0UytSuvS+N/UlrwjxV86vkbJjxWKZazVr0M
         FbfruZ1EcVZ3pUsys3t1Mc1Cg4qkR2yPl3/Y2NlaJyprx05hWme/oIdBXSagSEmUW7HQ
         15CMWBM0X95613yb8hEHPGZ9X8FznuuyOrfBIHMHnizeAw/36aAGP7MO/xGF58RQ8fiP
         Ijm5PnoBpLzrodTi5rlWN6wM03ZSo0mr94q5ATNfC6iMjxhjxvdbgP5MG1nkrH41KmUX
         hPWcnHdQjnT7ZvK80spOHrAsEuZojTW5o7ox4NE+LEH7vwa+hIm15bou56gjlmWqLJpQ
         W+ng==
X-Gm-Message-State: AFuF++kyGIlI68kYF1+b+6U/i7+2BRMH3CD2pfvk1u2+3TM+SwjJHFr5
	dWJxKgMb1R7k2zupNKoP4gopJ0tsjXravwqgLwT6Ac21+2SzZNcnw3oMmfa3kjdB
X-Gm-Gg: AR+sD10a66XAte3heIrQSlbKsgo1pzNFkH0XgEWMLr2jnp9INbYGJ0HwI+cqO3bg5vs
	FPd8+LE5YvrxbP+nOIascajvrHDR4T2fbGTQIU0lJn6GPoGw3d0FFEoEiYNTu+RwRpG2EzOvlhw
	It8X7SELqHtsu0tqe4nS+xRBUquNPoOXgXEcxv0siBl9ZJOAoqeuuKoTTtXL9rH2OoCy+uV4cuB
	CZe3EoXPw0K7LfMp+74SOWSNKp2Xf9jFelkVpYpwfeAiZuPD7WfZzLv8zffRrv1cZhzyP/5Jg3K
	DSHymUpZD3/zuLNlkzB9VTK8efcFYlwM6Z3fiCZNsUbzKIp0QfE8PAoOukfL7aiLZhLvxPHqXfC
	QkjWg/yUpxCTOjLUikAUzEvXTMOTNUgU2yeOILGjsEl+Xp6Sr3IooHYvpXeI/xiRYl+KFoEdV51
	NqjXsSvkj/qCfBjksYWpWdqJ4JYGwN8q+1qXMaMCiHoEhUgyVQL3pqP98Y4SHk8wNKpABsSIEbZ
	ia6MEJ6zny2H6Vm1TxSR6NrqJTOF+BL8dFFpRJVjEb9
X-Received: by 2002:a05:600c:498a:b0:499:b81d:f580 with SMTP id 5b1f17b1804b1-49b0dea670dmr77990135e9.2.1787854600144;
        Thu, 27 Aug 2026 11:16:40 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dbf33sm11328702f8f.23.2026.08.27.11.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:16:38 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 4/4] platform/x86: x86-android-tablets: Add Yoga Book audio GPIOs
Date: Thu, 27 Aug 2026 20:16:27 +0200
Message-ID: <20260827181627.2427880-5-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181627.2427880-1-mauriziocasciano7@gmail.com>
References: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
 <20260827181627.2427880-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91F/L uses two GPIOs provided by the RT5677 codec
itself. GPIO2 enables the second speaker amplifier and GPIO4 enables the
headphone path, but ACPI does not map either signal.

Add lookup entries for the codec device so the Yoga Book ASoC machine
driver can request both controls by function name. Register and remove
the table with the tablet description lifetime.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 88693b9a1b01..8a69194a724e 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -345,6 +345,16 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
 	},
 };
 
+static struct gpiod_lookup_table lenovo_yb1_x91_rt5677_gpios = {
+	.dev_id = "i2c-10EC5677:00",
+	.table = {
+		/* GPIO2 drives the second speaker amp; GPIO4 drives headphones. */
+		GPIO_LOOKUP("rt5677", 2, "speaker-enable2", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("rt5677", 4, "headphone-enable", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 #define YB1_X91_DRV2604_0_DEVICE "i2c-DRV2604:00"
 #define YB1_X91_DRV2604_1_DEVICE "i2c-DRV2604:01"
 
@@ -392,6 +402,8 @@ static void lenovo_yb1_x91_remove_haptics_props(int index)
 
 static int __init lenovo_yb1_x91_init(struct device *dev)
 {
+	gpiod_add_lookup_table(&lenovo_yb1_x91_rt5677_gpios);
+
 	lenovo_yb1_x91_add_haptics_props(dev, 0, YB1_X91_DRV2604_0_DEVICE);
 	lenovo_yb1_x91_add_haptics_props(dev, 1, YB1_X91_DRV2604_1_DEVICE);
 
@@ -402,6 +414,7 @@ static void lenovo_yb1_x91_exit(void)
 {
 	lenovo_yb1_x91_remove_haptics_props(1);
 	lenovo_yb1_x91_remove_haptics_props(0);
+	gpiod_remove_lookup_table(&lenovo_yb1_x91_rt5677_gpios);
 }
 
 const struct x86_dev_info lenovo_yogabook_x91_info __initconst = {
-- 
2.53.0

