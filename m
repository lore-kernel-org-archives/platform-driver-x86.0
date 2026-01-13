Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F573342CB1
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jan 2026 18:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768328772; cv=none; b=cNB+OQh9bxOkWj0QqmKkqQCMwWrtszEHdaO5inXRw/ja/ntratGUpx1fSQAC8vnEJ+WvEqCrKpqODuFZ0ekrTGsreNrp1Ll+umFJVxE+SliSQhIuPqth3EEl7DqLKW7dLUmmMUQVMuG3n4M2tm9m6XxAMaqpeKJ9bY/gc6ARArk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768328772; c=relaxed/simple;
	bh=8SG04s9wQYx06v1A2VucKK65RR3078S+mLducKByYyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InaH3WUB9zqO8roIHqplNTikXZLyFjOPbRZU198TSos/ovSwQU3Vf87tEi5XsadmpUODBILBRL1apeKNJ+P3qraYp903+DZXCiot2LAOPeqvxznX2mkFjgDz3Wf+NpeyWLDNSBRXpXeAhxkq9VvV/vzZjsXksJAgelYJk912CUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAj5Jbaf; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAj5Jbaf"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0834769f0so54426385ad.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jan 2026 10:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768328771; x=1768933571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVL5kQVjLvoD/ErJctce5eQhwMrJFWi7sp0O/aTTvPY=;
        b=LAj5Jbaf3tH3ZOPinDUKttFEHryfCmi8vtG4VBC0PRmGZle6BlLzU5iydHWQBHgpUl
         b2B1XiZECW6HekCE43fWzx6q6P+aIHsA/5e8qws0Wu00ElGKU9vanenmOqMx6abhyXYu
         g8W0PleRpuGEhoLi1ZsMwVXP6bLq7bk5DkBWnK2+yiaqE62UFX2V05F62H/ZixPYhtnx
         iFf1Fqx42zkuFOM+ry7LCX5cH2lQDJSKEPVdIPYziM9trNs9ltmgTqXj+SfphYivfEcb
         nzeNp3Xt7eHXddYtrXosBVhQ1X2pltSt1C4Cyad1GWp3dT2KpoNo34f3ifbggpgMbd8k
         jmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768328771; x=1768933571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OVL5kQVjLvoD/ErJctce5eQhwMrJFWi7sp0O/aTTvPY=;
        b=Un3bVk5hlhH1BjzCzrp2uMdX9SJUW3hySb/8YtcsbClBpZSQU9thZNPzqX/i2ACqQq
         slTVJQVL33xK0lBAw7BIDhYqdXGeyNExPg37yHJPzHBAFOz4Wq16WFeOm89zwfN0SLbZ
         TSwix9gafE+0NYobcp3hz3FXnjFOTM+ZTOI1ULa5IJcajLEsUD+aX6QH1Eqcu+lwcZot
         dYcrYMxOxutBVHLW06M955mTMZeMX94lmXN15Jd0K4f66UaUujpYctE4aecBVo1vJC3V
         mI4ZfgbSt5jjeGdqfsZE8iURKzp6nVWAsYfojvo0KsOk3AkIn+2pj+8269AulAjv6DK5
         2WKA==
X-Gm-Message-State: AOJu0Yyh57eAXdsvKwj16yo5L9a5LDDHxzD4jrmor6ylVHq2o+FaCBD4
	53/1R0FaE0I1q/csX5EcWpsf8ENS+U/hvxErJr5ZaolsFRfP70daX1IM
X-Gm-Gg: AY/fxX6++diSzi/422yiof8cfI8IvnQfcrW21qRjRUeVCKg6bhWu0LnFNm9eTeJ1Qxc
	eGKFi7S7UydsSstxQWgZFBVNb0YG4A6atibaySa/VgFQgKbdryZyOmKdqffd/nJpd4eR2twqpqy
	WbRavtNaIl2X8xDZOqyUPJzmDckeqo7+wYcIL6zLJFZ3UloFJPIKAPGC4Go2i4egg5bmi/gc1VS
	V91btSbf7VVM9LSycCDUPYA/ffaBTy8r6CPNYJX6YIFNHjbSomWy1zBgp+8LnCe75awIVcVNmZd
	40NhhjznUKLR58gSUMz1gACQSXLDEXUnLLYOeapl8e0OvWzUXPooa7RuP1LXVkZipBS5DxfkASz
	IiJmMuSv+ie5KPZ6FHJ/og3YnlcOJCDhPqHiwXzMqEI+XxLeJ+YgRecVssKG3rbk1yAePS8pJ3N
	3icYv3uZ5jPLVl1FvcHuo=
X-Google-Smtp-Source: AGHT+IGRfmH6saOe9CZzzdAQ/1Q0vye7WX6SW2Dbcu2Y1E+DmSdsjhhQQ2GsUI7YpF5idi2k7aovjQ==
X-Received: by 2002:a17:903:46c5:b0:2a3:e89c:593e with SMTP id d9443c01a7336-2a3ee41f181mr228894765ad.4.1768328770715;
        Tue, 13 Jan 2026 10:26:10 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88f1sm204032685ad.78.2026.01.13.10.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 10:26:10 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v5 0/2] Fix Omen 16-wf1xxx thermal profile and add EC readback
Date: Tue, 13 Jan 2026 23:56:02 +0530
Message-ID: <20260113182604.115211-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218124303.22024-1-krishna.chomal108@gmail.com>
References: <20251218124303.22024-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes incorrect thermal profile parameters sent for HP Omen
16-wf1xxx and implements hardware readback support for Victus S thermal
profiles.

The first patch refactors the DMI handling for Victus S boards. By
moving from simple string list to DMI system id table with driver_data,
we can now map each board to its correct thermal parameters.

The second patch implements "get" callback for the platform profile API.
It reads the hardware state from EC register 0x59. This ensures that the
driver stays in sync with the hardware during driver init and power
source change events.

Changes in v5:
- Improved platform_profile_victus_s_get_ec() to support multiple EC
  layouts by iteratively probing offsets.
Changes in v4:
- Fixed driver load failure caused in v3
- Handle err after calling victus_s_gpu_thermal_profile_get()
- Fixed wrong function call victus_s_powersource_event()
Changes in v3:
- Moved DMI lookup to hp_wmi_init()
- Marked DMI table as __initconst
- Renamed `eco` to `low_power`
- Added second patch to implement "get" support for Victus S devices
Changes in v2:
- Refactored victus_s_thermal_profile_boards to use DMI table
- Implemented driver_data to handle thermal profile parameters
- Moved enum definitions earlier in the file for thermal profile
  parameters
Changes in v1:
  Initial fix for Omen 16-wf1xxx thermal profile values

Krishna Chomal (2):
  platform/x86: hp-wmi: fix platform profile values for Omen 16-wf1xxx
  platform/x86: hp-wmi: Add EC offsets to read Victus S thermal profile

 drivers/platform/x86/hp/hp-wmi.c | 275 ++++++++++++++++++++++++-------
 1 file changed, 214 insertions(+), 61 deletions(-)

-- 
2.52.0

