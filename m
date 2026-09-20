Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7664D31D39A
	for <platform-driver-x86@vger.kernel.org>; Sun, 20 Sep 2026 06:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789886236; cv=none; b=AB2KmVBtk5DESIa/o2gv2NSD4KBH0dt7C1IP2qw5jazeetZA0OD6jqwVYinNZDTE7CDZaBXKP0OAmeLy4GWO9Ghi0+kNLsoXvIV1kkc3I3E27mjYs1vwTMsd4vEmgoikIDpyDDsFwQ4sQAibNgupWZtKwX8QN7MwyFfSMtPCk0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789886236; c=relaxed/simple;
	bh=cPVi0xJfBEiLqCtm3UOfyLxn+P7c3BdOroSZ3AH7Hqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UOC00sCBIoORLpjf3PvkWfDTHhpPEY8oUvjOMSkWc39WuQ/VkFT2AtGg6IoQA3CZSmIq/PmO62TJkF70sIdPqgjhteejmGAmrly+lqddWiTk9Y0pJtCzo5BVxvi1RqmecHEDxKbQpiBqU+I110h6mlGA/+RLVrhi+cFQqZJP8yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RC4EMiDH; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RC4EMiDH"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so1654786a12.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 19 Sep 2026 23:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789886235; x=1790491035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPVi0xJfBEiLqCtm3UOfyLxn+P7c3BdOroSZ3AH7Hqc=;
        b=RC4EMiDHBv0Fb/J5GP+qlU9ArEm7Kx3E2JbZlSPcErhIRx1cuq8SGaSLoz4nhC0R1v
         /H+9I1rxesKqqVtYVEaHgUSXEezM5lQ0MeO0UDVtluaJaCExe+sinoPJtfiDu6fSvi40
         2feFAOy/SzOObS/hCKTWmaDIkn60jpt2fA9BUJrT0eHHnVi9VYPt2RYm7NwAdJlaU55H
         oFR1vagBFPYMInxJfWnWipzvRRSgajVa4c98VGxUMXhqhrsEFtZmwXKZdYqheovsCvCV
         /3sWb0hdYq5+zeCZGwDL9slQ0UDCbINGMs7uqZsiJVya0VjJstID9UHr59G7+0g6xhr1
         EEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789886235; x=1790491035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cPVi0xJfBEiLqCtm3UOfyLxn+P7c3BdOroSZ3AH7Hqc=;
        b=ZXwPQHVevvIQoGCuJu6a0XZTUPoj188BkCwiaTnEVvPyyrchBi0JlAxWXWQaVyzymD
         0rz7CfGDXuX6pLM/1w+EUqPQNd8lIhhQ9qgX3SBQhenaZVzzNIW72TB/8VdUjq93aGIS
         D1xzfmH8y9kCBVhThWjD2c9QjDjg1vRS0fI2oo6f49dmMXtMO6WG1e+Nd7PrJGN3kxQn
         VThAGVycKL5PSUxvZ8glTD9F2KVQ+UHAXin4T2Sv9DfR9dZZhJ1Hyi8+PooyXtbBpfRJ
         J7dIUxSdOZ1aCjyHYis9WK8jn/Njby10p6yCuBnK+xUKj9c9wIeWC7ccdlqtVodHIJOY
         vPBw==
X-Forwarded-Encrypted: i=1; AKwUvByfI2lh21knACxeah2HwY99Gs4PUM3TOo9BG9wRBqjqkzXEPWkdWjpQiDb7ofcXgkJIYneEoGhTou67xKKR74zt4A6B@vger.kernel.org
X-Gm-Message-State: AFuF++kypkZ708tm9myIwuwl1A9MEtKpFYx093C8tzPVK1A+XtvUY648
	8L0jsOxXTvsv39Q4m16V/VSSXEzgvzSQklj45BdxWsRoXoyuIdhHNunCnaZwRvwN
X-Gm-Gg: AYBFou1Cb6KCgw4IEhDP4Jx0lZTwwtvMlE2TDrOtMXamqKb/LviSQ31Z5+k9MUHHo8n
	ZJllxsnKUITRiThOwJWPOKaHHa5sdbzbbVIH6c+F75e9PFgpSgnounx5v3qHhQajWDt0t+01nQB
	9rGBIS19992XWjb6S0RvzGpYIDEHil8uqFePdXgcZbKczv4n7+URvrnGsMZkZrv2dEENGzgM4s7
	IHuIZxX9J0CZv12+MS0D2FtSn/J6ZR8UF9UfaFxrvm4ViTuH15axMQinzUXmku3gDf6zKGhJBli
	eZTovrc7upOsTKR8JKPUvl8Rk68x4H4BWAp5T/TP/PJUhTHzv5KeOdOJYW8dPwbxSqKKvVV0Y8n
	gQXt2j4X+hpJn2y6Q9Ol3Z84t9hVkDrcALb52gLomiwe76KmtNam4wiG6HDDbyti16uTnxPyb81
	MFinhxQwk8lkcvAvLMKDP8CRQR6NFrBJXhJ85M6LG6oyKBv6q7VB8nPf08HNyVEaOiLgkyAR9Hg
	1W4ZvmAxTE+pO2mrnXJFC7GVi2OVKo9yA==
X-Received: by 2002:a05:6a20:9e4a:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd8c3f80bcmr12893395637.2.1789886234714;
        Sat, 19 Sep 2026 23:37:14 -0700 (PDT)
Received: from archlinux ([223.188.166.241])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aea2da9sm1666420a12.18.2026.09.19.23.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 23:37:13 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: baoshuwen2013@outlook.com
Cc: emreleno@gmail.com,
	hansg@kernel.org,
	hello@kursatabayli.dev,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	radheykalra901@gmail.com,
	technosfan14@gmail.com
Subject: Re: [PATCH] platform/x86: hp-wmi: add support for OMEN 16-am2xxx boards
Date: Sun, 20 Sep 2026 12:06:31 +0530
Message-ID: <20260920063631.142985-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <SI2PR04MB58957D08A31E56D73C751885A2862@SI2PR04MB5895.apcprd04.prod.outlook.com>
References: <SI2PR04MB58957D08A31E56D73C751885A2862@SI2PR04MB5895.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Sep 19, 2026 at 09:24:25 +0800, Shuwen Bao wrote:
> Add 8F1C to the OMEN thermal profile board list. On this platform
> the EC firmware also arms its own thermal profile revert timer (EC
> offset 0x63, armed with 0x5a when performance is selected) and
> switches back to the balanced profile once it expires, so also add
> the board to omen_timed_thermal_profile_boards in order to have the
> driver clear the timer and set the NOTIMER|TURBO flags when
> switching to the performance profile. Testing further showed that
> this board uses v0 commands, so also add it to
> omen_thermal_profile_force_v0_boards.

Thanks for the patch.

It is slightly unusual to see a board ID ending up in all 3 arrays.
(I believe no other board is present in the base, force v0 and
timed thermal profile simultaneously.)

But, it has been explained well in the commit message and tested,
so it is completely plausible.

Oh, and since the first revision of this patch had a corrupted
patch file (stated by the maintainer), I did apply it to check,
and it works.

LGTM.

Reviewed-by: Suryansh Singh <technosfan14@gmail.com>
