Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365442;
	b=Ikkr081Z/An0ED3mEhUCGEtyApEUElM1YjSvgTh8YOQWm5pPQzzrV+uG9tqK9VJRmRhh
	 gajcSzXjPPhnEJHyJuDpuCZlNVl9iPw8dfWaECoRksZqyF3tsnfYJw4+faTYi/tTeRycg
	 Fs2ZJad9hmA/4L7DA18Vz4KYk+O/1xYIn7CUSBx9XAqXc2zYEZ6oC6YSnUlJSYYlpUYGQ
	 YmCh87lFdLC8VkNdaFBUhO2/AAmVP4SkiZgS1+0OQy2Ihnd424p4k8EM9nqVfs0nVLq7N
	 QjwV/D1MWl4jVSDT1wcOQYzVSz9lYlj6AIRg4EtmczBqec3DTLvSdo/ChuFpVHbX8DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8ufGsgXYRoTqCqKkjsY7U1unPcdM+P1wYZp31Z9S+g4=;
	b=SnO6Wd7azV5eGsKbu5l5zdHjtEpHqfp63M6YSS7xxVTjciV3dyhm6QX3VcDRoU4woHys
	 nUuWhye1rr8Zcor7J+7rCorhXULwcA0rViCx9lyBKR/FwoSrZEGrAbfQEzrYN3CiV5BOt
	 xiGCMojX+BAM3YZcR3veAYs2ItPvEJZfWre2DsKJBquwrG9R5XJWysdSfoowuJZp0Q9DN
	 pTFrXjeqNyXE4FFHc7Lv+6JLlY7lJC4aHNxPMaxF/wxH5xeat+NAFAkyOwCFUox2WFtv/
	 UuZEiwZiAzZTK2uUrdboy0+8MGVftsEW4xXVz4jYfNo6sAg1WkZZSbweQZEOl15mQVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d5Frq663;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5350E606A32C
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 16:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5350E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d5Frq663
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1326585f8f.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 08:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795365441; x=1795970241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ufGsgXYRoTqCqKkjsY7U1unPcdM+P1wYZp31Z9S+g4=;
        b=d5Frq663VF/DKXgvILXztLu+WE4FqNgzcIj03Tsxs49CAKNwK5MgZFxPEJl8EPFpNI
         QMJP/LhqR9QhIKyPEZjzx/Bi+xBoeZUlctU73dWqHpxOIlnsee4drR+e5dDPA1l9ggbV
         c28n/eGzDTHopgLB7+5Y/CGxUFc8NRpKWTZL9z6mhIcx6XNfUt2R/sD6xCSjIg96Nkm9
         TdGUWrMYJFbzUewCttfGNVTdvd9YeGGTVcBciBw7NzEOzASt+WiK0pqPY1RcI6crfASB
         6O79VqKxrA3pKhxWUJO8fD7l5pIHD7QKjhHq4tkgtppHMdimfcBUbysDNBplCQnakpJn
         +x2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795365441; x=1795970241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ufGsgXYRoTqCqKkjsY7U1unPcdM+P1wYZp31Z9S+g4=;
        b=O51W1BX8CP4UP1pSO6xCAg/3qxWj5mHdMKXq1iTM369P45x4dDbvLzfaL/1TfRIjwa
         Hbl22rcD5z/U621YwJOWxJEEjnISxtiUCkl7Unz7GQS1AgexN1hf5qmbctUbcwSNIGwV
         ih8q0Ey/00dyRNFRAzNyi5PRCXEXy+jlcu9NLKi0IG2DX7mjMdKuOG1yUIBN3TCr/RsG
         k98CZXB1SsPcbypzF0nL/hO7hoaPDUv4y/0sqzt7bVuC5yMViePsn2EselCJR6gIhMNz
         i6iw2rck3SqiCl3403vKTvk97ohMwle/mYiCBj1ITb3ivFydtGK97Zvs6YFWGl22FQb5
         cduQ==
X-Gm-Message-State: APuU4Z/oKriqTKzb7OmBTBc8AYcFxVg6W8tKSJhEIxqMtnMrRFBhCOHt
	UIuxKESA/5RJkFPQlcnfpAAOCWhFYNBEzHu3nzH+hxQDUsGjq1tD6OWROQKAu3z+o7oBk30g
X-Gm-Gg: AZFdTZeWua5PDU23jzzMXCOBlaLmpR/1MyAtL8wNyw22tLoo7bnZ2RUHvKfAJf4RZTW
	7X4cKhdz3KAWLn1X0HNtrheBp3UsctnomTjdgoZwhRKfL2IOMu8Jdn5NVYwCIlprnNOnYdRsBg3
	4WPkNmXsbtHqhugo+HYnegHFhEVSPTj58GGtiCdfl0Caeffki7eQux1xIkmjJrAi0LpW3AGh85P
	cdX+rw8ZQtuZKnDcpEnjfcjlzTunjTo5Umowi+Mym+jeeeRzHNw5WRNEUtnFLNrnbnnTMUOKDq7
	0rUNQ5Ch9kZuiBFuTXVGsVCcOhaqETXHKCNfJgAhphfmupxL9GJXDrvnLwgj4e2yfTV/iDD20z2
	8D6UdURuBUDWHKvFTOZQT71RCksFgHHWNSsG+kCL0m0nblX5u+WLrTkAw0bdanSdMTHZKkkiNMM
	jE1xxEeo05nDbgC/lvNprl82K6lE9FwxdiwkXPzS8VGjY+Rz9WcJ0isjD+J1hh/mbzaERdva4Ca
	bWkKOUjcnSF2pnv7nms2/EzhV+/bWFQ9oVH91MPru1sy9VMCw2ETczkbu0g0KHVH0geyIsyQkW/
	hSHT5APNgDnVAKcQizZTLZZtnA==
X-Received: by 2002:a05:6000:2b93:b0:4a4:c39a:1d51 with SMTP id ffacd0b85a97d-4abb4b85ac7mr11098704f8f.44.1795365440425;
        Sun, 22 Nov 2026 08:37:20 -0800 (PST)
Received: from archlinux ([84.233.195.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm15813953f8f.18.2026.11.22.08.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:37:20 -0800 (PST)
From: Martiya Aryan Mehr <martiya.ar@gmail.com>
X-Google-Original-From: Martiya Aryan Mehr <Martiya.ar@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: qby140326@gmail.com,
	ilya.gladyshev@linux.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Subject: [PATCH 0/1] platform/x86: bitland-mifs-wmi: add TM2309 profile support
Date: Sun, 22 Nov 2026 20:06:57 +0330
Message-ID: <20261122163658.23920-1-Martiya.ar@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Add platform profile support for the Xiaomi Redmi Book Pro 16 2024
(TM2309) using its firmware QFAN values:

  QFAN 2: low-power
  QFAN 1: balanced
  QFAN 3: performance
  QFAN 4: max-power

The firmware can report QFAN 0 as a stale balanced state after
resume. The entry maps it to balanced for readback but marks it
non-settable, ensuring that selecting balanced writes QFAN 1.

A battery-specific performance entry keeps performance selectable
on battery. The AC-type check is skipped because this firmware
does not implement that WMI function.

Testing:
- Exercised the profile/QFAN mappings on TM2309 using the local
  development driver. That build contains additional local changes;
  this exact standalone patch was not independently loaded.
- Built both patched and unmodified bitland-mifs-wmi.o against
  linux-next-20261120. Both builds completed without warnings.
- Full module link/modpost and runtime testing of this exact
  standalone patch have not been performed.

AI assistance:
ChatGPT (GPT-6) assisted with source analysis, interpretation of
firmware observations, drafting the profile table and DMI match,
and preparation of the changelog. The submitter reviewed the
resulting changes and performed the hardware and build tests.

Martiya Aryan Mehr (1):
  platform/x86: bitland-mifs-wmi: add profile support for Xiaomi TM2309

 drivers/platform/x86/bitland-mifs-wmi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)


base-commit: 2268d837dea13a78639fa3dad60472bb67478709
-- 
2.56.1

