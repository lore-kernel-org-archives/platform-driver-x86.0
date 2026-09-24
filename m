Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B051C477E2E
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 12:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251219; cv=none; b=YHkcCPDXPB8JZwoRUXnhq8+nGoZEzA1O4QSH62TYKo0l6ndlvOmyHGdlWlR0aEXpYdVtson8OwMgLQyRY728kqrns7bYmwSOMQzx59aMn2OJE3wm+FtUKjxu2cagdlVKwghyBUUcF4Y9dGrJyeGxXthy062tPFWtKINLVaYBWq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251219; c=relaxed/simple;
	bh=J6nno5Y+Nv4ZJ8xMncCY49LKHkGy/vKwQRGCxQSr7xw=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=WtEhnT5C0/xeWUKgECswVMfkYL4ahwO7evbDGpapQMJ0I30RqKDr9xrdYHpUE/iCOb7pNjFeszL/hvQbFoa0X1PLZZOH9Nzn7RJhaKf1GKj4JB+HtctCRgZ4AaeQrJ3DJVH7FKJm67NNYPesgMN5hYaQYdpeftq0rGeRbMjT+wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qz9ahSz6; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qz9ahSz6"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3115c4451c8so596626eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 05:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790251216; x=1790856016; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type:date
         :to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JqbjpHsZvLxuDuXa0a1cBTU8FOKAon5Sln1OXlXpRyE=;
        b=qz9ahSz6ubIQeH3ixs0fiimS0gLYLgFRvKdAuMY1+1Z4dNUw3DQR/VUQ6RBPCrKSJx
         A8fHyf9aI7U8fpcCBYttpqLJarb/VdYU5CyoE6zDXZyzdFx3uL+zv71Zo8aGp6JLm5eR
         hgpGEXR2EAPB+kwggZomSqapKeee6bcxbQflBXbRtZqoG8Qigcou9hexTTQfv7bsEJyH
         m9cKBX754m+Nddk0pnfpDrQRx+uFN15UigArsFQlNA+irQ1YVlP86DvjeSl22+Q2ozdL
         l0a9PQkyJKBfQOooN2mhEm40B0a6xe8B/p0MJn3DsK6znih05wG7+w9+UvWrbv7cjvRv
         5tcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251216; x=1790856016;
        h=mime-version:user-agent:content-transfer-encoding:content-type:date
         :to:from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JqbjpHsZvLxuDuXa0a1cBTU8FOKAon5Sln1OXlXpRyE=;
        b=LPK59D2H9NMQInEt7Vc58KmIUzZKsBvtHclbeqSlyjTfVeahC0b8jNpf6HHv0VY+8Y
         Lnna6rrpnd5SIq39v6mugAEQtaBV6BKMVvIai/TtsvUBIKmX7JivaQ+j1LGV6/tOsA0M
         WWv2KhD8S8sgekjWgX5HXkQo8rr5LBDQKmiMtnhZYpZ+swhi+wyrGXRumr3viFnbvkRD
         jaTl55s7pCRlLzuM4S8r62pbjET6FP33JLSfj8bs9jv4xo8vr5jVuAqENh+UjR45VyEt
         ARBHcpJkvuAlbTHJIXYzMTaAw+yxa1zBTOEymuBbDYL+Gn2v7JrUOOlJL6zUTUkJejVI
         +xYw==
X-Gm-Message-State: AFuF++kM+WrPiFIgpQimwvD7igU/2AV/r2MsE0PQotbcSjr23dTw6TuI
	4kbL2CeJmfzvIb/pqrtKP4DSgZxRcXS+VlmgLRUerhm2t/mLe9cHneWStcuC2w==
X-Gm-Gg: AYBFou1R+cCdX9JFPuEX49mGqIFKOt1bxmOTuN0dFLv6XSyOh7Ol+0Bz+Zjy/nEgwmv
	FQeL/yHqvMAGuFLHlkvvhXDChLbJtWA0SQEYyu1ykLrWacpB5gQ+mgy1Neuw5QTC2sTQA70J/fq
	gZfTnngaqgXp+OydFJzrhhHcyh2h7MSiNfqdjUqS1Rh3qBjtYudvRERximBo+wvF0G9+422WhQ3
	117GYyuBgQvcHQN6WQu0gaw0FeeJRSAY1tv2L6u0ZYc2koTp1RR7wpURJhhrsMbmvyeWSMank7B
	ObI1ssN+W0DcUYoy1yTsCYR8nDFGW26zj4yLEGT6rb3ToGXKYHYe3QgtR6CYR/yJvA40PlaUjP2
	S4/A7VZJy8Vd8auAzIwLocGVVv9iEBb8cEoKbGXjvSk/RkCDXqBf2zSQdJBOmcZPBRmct1pBT3K
	Wqj+qj1w2YG8DU/ZfB/wmYa3OsVfMBDMhoWXy28ZHk5iyB1KFh2Fku+dnjZq/HlVcPR2v3kvNWo
	zFYunmMcueM5QVnrmsDeZznCvYUpsXqU97GCLHJBL1x7HEWZPnlpWvG/uPR
X-Received: by 2002:a05:693c:6205:b0:333:75a5:10d8 with SMTP id 5a478bee46e88-340068719b6mr1709209eec.27.1790251216147;
        Thu, 24 Sep 2026 05:00:16 -0700 (PDT)
Received: from ?IPv6:2409:40f3:10cb:40e1:409c:45f8:1bb8:1dec? ([2409:40f3:10cb:40e1:409c:45f8:1bb8:1dec])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96952605sm13973692eec.22.2026.09.24.05.00.13
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:00:15 -0700 (PDT)
Message-ID: <da17da33edc92ca4a33a760ac05815a46c767844.camel@gmail.com>
Subject: [RFC] acer-wmi: add Aspire A715-79G WMI GUIDs and EC fan profile
 support
From: Muhammed Anas <muhammedanaspaika@gmail.com>
To: platform-driver-x86@vger.kernel.org
Date: Thu, 24 Sep 2026 17:30:10 +0530
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi all,

The Acer Aspire A715-79G (ITE 8222 EC) exposes Acer WMI GUIDs
ABBC0F6B/ABBC0F6C/ABBC0F6D which are absent from acer-wmi's device
table, so the driver does not bind. Consequence on Linux: the EC
stays in its default (quiet) thermal profile and the fans never spin
automatically at idle (60-75 C); on Windows they are presumably
activated by the NitroSense driver via the EC profile command
(unverified).

Reverse-engineering of the platform (DSDT + register experiments)
shows the EC selects its fan profile through the \_SB.WMI SCMD ACPI
method:
  SCMD(0x69, BIT(profile-1)) with profile numbers 1-4 mapping to bit
  values 1/2/4/8: 1=3Dquiet 2=3Dbalanced 3=3Dperformance 4=3Dgaming
Setting a profile at boot restores automatic fan control (verified on
7.1.13 and 7.2.5: ~2700 RPM idle, ramps under heavy sustained
all-core load; partial-core loads do not move the fan on any profile).

Proposal:
1. Add the three GUIDs to acer_wmi_id_table[] in
   drivers/platform/x86/acer-wmi.c.
2. On probe (or via platform_profile), select the EC profile so stock
   kernels control the fans automatically.

Full evidence and a runnable reference module live here:
  https://github.com/ancxanas/acer-ec (docs/reverse-engineering.md)

Happy to test patches.

--=20
Muhammed Anas <muhammedanaspaika@gmail.com>
