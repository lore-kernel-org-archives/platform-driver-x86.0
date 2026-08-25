Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F4F3B14A7
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 06:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787637905; cv=pass; b=nHMkWiPXd9/FFvMke+w0VzQAeNeoMT9urDpJYkysqhDjsw4PJ1xhjqVLzu1YkhxEsREB69fU3DhV5nTbFdLBiH/9gguieYed/m94Yx0lnj6cFf4GP+YZYq92QCEkvfs1/WlBOVdG6sGxIUS2drChHHtJhk1b16wTSmj87bAaGy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787637905; c=relaxed/simple;
	bh=i1TLdRs0xvVQY2qYBQu3WRBEQRUuGbBAqV53djjO+y8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TCrcIW3bMaH6x9OfJsE1Qv2zh1QMWxrzvyZZ09Fg+4ACOJY0VdYu8R8wd/ih85EYPsPJuax0Z2OqEXHHbirzXgJSOrnB6t+0ckJQHTPoIR0tYZeyuQLD92QaPNyPBxRNs0YQCTGRRpvF7X7ogEUJHF6qJ8kX7SpuH8UuYQAaDss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXR9GhXv; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXR9GhXv"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c9bb9d2fbso35955021fa.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 23:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787637901; cv=none;
        d=google.com; s=arc-20260327;
        b=FDJmR+k9RyPbsR5CcpArdlI5pXR12mb4tB1CFd69zYwXPTkUk2LagLTMufF1345XYv
         GKw6LMd1yHRfd51kShuNJOOv20rYF9Wrjn+SJBeWToykItSrUQ+j4Q9KSUWTipuyEwni
         HU0QQGDkA9thCGIXQDOv4LzixKcPZmUqawlNFK6NGPN1nu941gtYBLgBBJRQ4u+HvkGx
         FVpcOz5oBDNoOZ50YvQmouGZRa7HdMO3Pq4niS6PxIIypvidx4t4iFZCbb1AEmC4C6rI
         YnJbLGXkpzpVcGwpXetSxS360j7lDJEx0WSjhwu8rEeYg/LHjxRdVdCxroOSEllQwsdS
         sIXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qwCE/LcNVtFE5cc83vVMjtuCZ6OIyoZtk2/U0S/YbqA=;
        fh=Mi537mPjWsaSu1lPMNRmzZaC/NzhC+I1xSwowzI/+qw=;
        b=biExBzpK+Rk0aRcuAOOKaeCu5w/OPiGShY3SGENDdxC2dEHgIB/rW0uV7X5dQR0MTs
         p3izNv+yEA60PMq7Ubc9P+lJVV28aLD81JGuX3hy0cD/552IpnLaQDX1bpJ+m+kvk7aH
         3433hOR9Ejxny2ClH6cXMvS8ZjegZbOkw8N16E01f5l75w6tssYFtlVFZPblpJ9Rd4D4
         ZmkmpUAIF7zduz46zHb0S9rcU5FrgfSKNYpHt3kmK0lNnw+xtFhjTXHZLLGudfHHsx26
         5EuYW2WTAEwUEYB0gLUHDPygzq3uLjZCRSqnz96gx4Jn8gYU4Dd2ji/3CN/kvCuzU/de
         GSqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787637901; x=1788242701; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qwCE/LcNVtFE5cc83vVMjtuCZ6OIyoZtk2/U0S/YbqA=;
        b=WXR9GhXvn2nn8WW9IwYZITXqR25Fn4P2Lsi0GUG6yosgrX5ZFftZLKzZo2b1WvInUR
         YiL4f2OxFaokbecp1tlU3nfo+L2aFl/5+YmRnAYH61zg3GREyTOQtvJFF1CZ4nF+uS1Z
         YkPj8pOtCkI1JoINmPOpIrReHBRoZt/j+y0PsXA3EjUudeB5XmsnSACCiHHkwoHOMgYp
         2QZ+n5VJOJ4U6B/sV6FYNSdbov4Bya08P4TaOTqD1lzIuIw65bW3DpUOkpZVc5Z9x8CR
         sKIKcKdMZk7BWZkkp9/PPX0UeJA0TFd8RxjG7NBiaXbEZ8WaW+r3GgGJnksFCOKGZ8+m
         PBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787637901; x=1788242701;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qwCE/LcNVtFE5cc83vVMjtuCZ6OIyoZtk2/U0S/YbqA=;
        b=KeN5i8/kjCAFc4vuEv+3ePkjd7/XJxM0C4dCONZoNHXzAm7oRNmGof8yUPlBx6t4t3
         TYrrHlaZoKpp0afta2+2bKR6tmsQrOFtJHyIwNYwSCLAYCtwKngFiNzCZfjvL2Nzsz6V
         39X899JVRMsxgtpSk8D8IOVooxaB3VaFmh9dnWThof9C8aexcTm/XIhAlju9FvHrbk24
         dULQYTYStVUQRdFCMLuQTBXgJof3ompCtdZT788x/1TyXnnIFa7YLy8cd26/JdCbF2Bq
         PgS/DpyZjG6nsatkd1yu+BO7xlojr7BuqyrY/H8ChVU9f+7qhG60brfWo3DjMYrX42Sz
         wnIw==
X-Gm-Message-State: AFuF++lj2+b16FVcwhicuLMD7U8zvtIhUVFWn4vZm3Rjrghjliv9TsyV
	AZmc3Z48iEYn7A8h0vJ6pO/PePakGDOSyMsZaRUgsuqt0H2P0w8PJRZrlXM7EwSyk8dt82oLsE3
	lCZmQ0FiYdvRI7yzGqWBPQ8wFJ5hKs+uPhDJ9xx8=
X-Gm-Gg: AR+sD11zMuApx3v4xAL9tPhcyDBnoVL6K0Wul2BJMtkNgnT3m5683xq5yLpULhSvnGv
	xjC8l0k6q5J35LUfpRYv1JlbXvczNd11PdKn8z/Yr0frFi9GLxId65H6keEdKWWjIPoh0Qr+qpo
	6fenfNjCUTY2cvv301V6JI+xsJ2YbickH2zDCWap3ZoWJoa2td9RLWTAJbwE4Xo8X+T26X2kgwO
	K1az5NXCmSlDKjDudxCUEireGQ4hhBZm1Bni4G3FN17eTtVWmx8ZA9/zRl8Usn1UBOJLLmvNiWi
	xfkR/yZG89mhp90d90B6XzW5O3yN149+a+yCH9i5TBnZkWVwR9iB2VrE
X-Received: by 2002:a05:651c:a10a:20b0:394:635:70b1 with SMTP id
 38308e7fff4ca-3a1ef4dd8e7mr5809871fa.3.1787637901115; Mon, 24 Aug 2026
 23:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?0JDQu9C10LrRgdC10Lk=?= <korn3r@gmail.com>
Date: Tue, 25 Aug 2026 09:04:49 +0300
X-Gm-Features: AcwNN1UpEr-OwUa_gL65bHv5DWe5fGCxnkJcdQ5vmT_ieDqOLaE2bVj-UD6vPFw
Message-ID: <CADnoEWSR1T+-EjhPtiDuDzETvm5jWcn6aFC_u5LJxNaq1EoM2Q@mail.gmail.com>
Subject: (text) ASUS Vivobook 15 X1504VAP support request (WMI payloads attached)
To: platform-driver-x86@vger.kernel.org
Cc: luke@ljones.dev, corentin.chary@gmail.com, hdegoede@redhat.com, 
	ilpo.jarvinen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Hello. I would like to participate in adding my laptop to list of supported.

dmidecode -s system-product-name: "ASUS Vivobook 15 X1504VAP_X1504VA"

currently neither ppd nor asusd cant properly set performance mode
(powerlimit seems to be set, but not governor). confirmed by tests.

got a dump of WMI calls under Windows

mounting debugfs and doing next commands made power consumption go to
proper values (above 40w power on cpu package versus 15w cap with
either asusd or platform-profile-daemon setting Performance profile)
echo "0x00110019" > /sys/kernel/debug/asus-nb-wmi/dev_id
echo "0x00000002" > /sys/kernel/debug/asus-nb-wmi/ctrl_param

Summary of captured WMI commands for ASUS Vivobook 15 X1504VAP_X1504VA

All commands use the "DEVS" (Device Status) WMI method.

| Function                 | Device ID (hex) | Value (hex) | Value
(dec) | Action                          |
|--------------------------|-----------------|-------------|-------------|---------------------------------|
| Performance Profile      | 0x00110019      | 00          | 0
  | Balanced mode                   |
| Performance Profile      | 0x00110019      | 01          | 1
  | Quiet mode                      |
| Performance Profile      | 0x00110019      | 02          | 2
  | Performance mode                |
| Touchpad                 | 0x00100013      | 00          | 0
  | Lock / Disable                  |
| Touchpad                 | 0x00100013      | 01          | 1
  | Unlock / Enable                 |
| Fn Key Mode              | 0x00100023      | 00          | 0
  | Hotkey mode (inverted Fn)       |
| Fn Key Mode              | 0x00100023      | 01          | 1
  | Normal mode (standard Fn)       |
| Battery Charging         | 0x00120057      | 50          | 80
  | Safe Charge ON / Limit to 80%   |
| Battery Charging         | 0x00120057      | 64          | 100
  | Safe Charge OFF / Charge to 100%|
| Battery Charging         | 0x00120057      | 80          | 128
  | Full charge for next 24h ON     |

Raw Payloads:

Performance:    44 45 56 53 08 00 00 00 19 00 11 00 02 00 00 00
Balanced:       44 45 56 53 08 00 00 00 19 00 11 00 00 00 00 00
Quiet:          44 45 56 53 08 00 00 00 19 00 11 00 01 00 00 00
Touchpad Lock:  44 45 56 53 08 00 00 00 13 00 10 00 00 00 00 00
Touchpad Unlock:44 45 56 53 08 00 00 00 13 00 10 00 01 00 00 00
Fn Hotkey mode: 44 45 56 53 08 00 00 00 23 00 10 00 00 00 00 00
Fn Normal mode: 44 45 56 53 08 00 00 00 23 00 10 00 01 00 00 00
SafeCharge Off: 44 45 56 53 08 00 00 00 57 00 12 00 64 00 00 00
SafeCharge On:  44 45 56 53 08 00 00 00 57 00 12 00 50 00 00 00
Full charge 24h On:  44 45 56 53 08 00 00 00 57 00 12 00 80 00 00 00

Sorry if too many people in CC, deepseek suggested to add you too.
