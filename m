Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762928;
	b=CE8ccn3qxUM7i0yyHmlzClM8dG22pCY+8TmXl7xGBt5EnD+AQfbr12hXTor1QoveEQ1s
	 BL0XgNzuStuBr9HfStEo44aUjijNbLeZS9CKJOC0ZcifRYSXTG9iH1NsX9USn1s6BEyMi
	 88UMB93JVuJOTMH+q884zsbPOhnRV1UsL7EjXjR9lKpwFITWLOSTXJ8ADsl6v7S4GYUg1
	 ffWUjXt6u0zi69dHx64UgbdNPvE+7DFBTb47KuHDxWEkHs4bBttRbYnM0ZeftADMBjO5i
	 z5U1Rdi/HZxATOMk5F0OtSptK4Jg6R+6pImIffuHdo0V9v/5HIQVPcba/wyRXNRcc0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762928;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q9OshZpZ6Xbm0RzcjcXP1mi6mpScozMSu4jma4fkoug=;
	b=M638a5LNcfjH2RWiSXIwR3fD0IbgCmlPNL74GalyXm3esb/Cvu2Gn7aALVyPlZV7w3Jg
	 r4LG+8aHbUl85qfwc2/f/mqlOmgmhG7YgECf7Diso4XjA5Q1wTTOqkc4ZHlkxSItYWCSP
	 zDqvW/RESuh8dMauAB4KBaOp3DTPK3m/uEp1ETmDzFBp7solUOmvMyIGi2atc3i2yDm7X
	 vW+1hj6kgvvxgHwDOKhQb8iP14KdUxurUvINLvV9z/0Bi1yNyDj6q+WfYEvBeOGE3BlGw
	 M3woNvJ60XqlM8OBCfzRy4nnNrQWpG3ymab5XN85mJT0O5kFD+jFW/3iM+VpvtMXPYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312ED606A31C;
	Fri, 27 Nov 2026 07:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 312ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6d6ac00eea3011f19a56ed5b684f684d-20261127
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:e271c7c6-bc63-49c4-af5d-fd1a08cf63b6,IP:0,U
	RL:0,TC:0,Content:6,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:6
X-CID-META: VersionHash:7db8b62,CLOUDID:6794218b6fa874c9ba983300f155a2b1,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|136|850|865|898,TC:nil,Content:4|1
	5|50|99,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6d6ac00eea3011f19a56ed5b684f684d-20261127
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1574153354; Fri, 27 Nov 2026 15:01:54 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Vishnu Sankar <vishnuocv@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Henrique de Moraes Holschuch <hmh@hmh.eng.br>,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	klorico2@lenovo.com,
	vsankar@lenovo.com,
	huangwei@kylinos.cn
Subject: Re: [PATCH] platform/x86: thinkpad acpi: Fix fan speed reporting on X9 Gen 1
Date: Fri, 27 Nov 2026 15:01:50 +0800
Message-Id: <20261127070150.3655628-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126085937.53711-1-vishnuocv@gmail.com>
References: <20261126085937.53711-1-vishnuocv@gmail.com>
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

On Thu, Nov 26, 2026 at 08:59:37AM +0000, Vishnu Sankar wrote:
> On the ThinkPad X9-14 Gen 1 and X9-15 Gen 1, the EC reports fan1 RPM
> in registers 0x84/0x85 and fan2 RPM in 0x82/0x83, and does not use
> bit 0 of 0x31 as a fan select. As a result fan2 reports fan1's speed,
> and every fan read overwrites an EC-owned bit.

For context from the other side of this history: we ran into the X9-14
Gen 1 EC layout back in August from the thermal side (bug 221228),
tried to reuse the non-standard quirk-table offsets at the time, and
reverted after the EC data showed the X9 has its own register layout -
so it's good to see the fan side done right this time, based on what
the EC actually implements.

Verified against the current source:

- The new quirk bits (TPACPI_FAN_2REG 0x0100, TPACPI_FAN_UNLATCH 0x0200)
  don't collide with the existing fan quirk flags (0x0002/0x0004).
- With 2REG, fan_select_fan1()/fan_select_fan2() become no-ops, which
  removes both problems in one go: fan2 no longer aliases fan1's
  registers, and the 0x31 writes that clobbered an EC-owned bit are
  gone.
- The UNLATCH re-read (MSB, LSB, MSB again until stable) is the right
  guard for a non-latching register pair.

One thing worth a line in the commit message, maybe: the unlatched
path reads the MSB first, while the latched path keeps the "read 0x84
before 0x85" ordering that older EC firmware requires. Your testing
shows the X9 EC doesn't have that old quirk, but a note that the read
order is intentionally different would save the next person some
archaeology.

Either way, that's a nit, not an objection:

Reviewed-by: Huang Wei <huangwei@kylinos.cn>
