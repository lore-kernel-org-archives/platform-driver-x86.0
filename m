Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400CB2F691D
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Oct 2026 06:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791180079; cv=pass; b=eUCUWM8qjlqHiWP9hJ3hW4SGBYxwz2ai1BW9UVTvBVV6G8rEmnlv+3cVRzW3Ad2O5SDPLrC5DD7wE1awhtmKL5njkZom8Qf/WggFHGeSZh8DrcvbqO7ftR1sE53RkJlvrIplFMvloGPU4U7zx5mx9ch43qWOW1n/ooxEwv+appU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791180079; c=relaxed/simple;
	bh=GTID0RY8P8IY/bjf1M1IYhmSe2KeQ6UR8ZDcIpVVyh4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=DKMV7h1YrgtFBpJz8a30IxSAUDfz3J8zQZ0bLUwKVJ7aPN4LnFNOVz0gVVCUSn0yexLSM1uZLbtAEsvaVRWvjfgehYXdENXPwLdpigu0aClXSbjdtGk7nI9lfKdIcU0oq1+6fRKfLUCmAmBvIZAmLkJTZEDYxHvf6rf1NFCnj1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ozU4s5hs; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozU4s5hs"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91219376dd6so23030416d6.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 04 Oct 2026 23:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791180077; cv=none;
        d=google.com; s=arc-20260327;
        b=OYjgYNfLeqTDvcVCorq7Ob3yQGS8QffOXF/zKsV9oInZxdyNlVu2in0ZJTPC1pjC08
         cDCo78quAj35JLSQxsSr9DMjat4ge6UhWzMan8b53cHimI4QLzfkIBhXo0JauFQkx+Ci
         HxHAIlsEHWQirKfuZgMixJhZgkPiSNseTSzzQY2IihU4RD60cO3IbeEGnkXnhBSwiU2T
         vIhTpT2lnhZPJHxj7DF2dlGZZae3B795d7QLEWflXtKMq11I4lT+zK2TDo1Ws+0iC5ZS
         CtoeKlzzQP07/ALkaoSBH0XA+jD56OLqts/U8eVU5Bj0rZ9XlA8ycbuGnFWNz08ZdBpB
         UQyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Ld5/fX5W6z0SgiJe8TVQR+gFiVM3d4IWodLzS6BeG6Y=;
        fh=LAtpHtVR30q6rinFeyskR7Ff9QyURHB8q3bpp5R7hcA=;
        b=jhArWHG1+E8ZXwMGbCnX1YK74NVRHvqf+3nDO7oXJdrMrzl+XhbZmQafNhlOpuLC4p
         YwC1XQSCjvf2lx8bz0Kn2PhUxKa+umFxPAtYUBKSU7WErlxLMA/JzFINgH2ThMNFedAM
         fTNDVtBbKsMlfBTu9k4KBto6qB1gp4whJDvepAKofy06p6e332s6m5ZFI6cBYnTYEaJI
         njcEZV5Iuck84rWdLRQ/Syu9Bm+i1vAPV4m7Ai0SHCNjCv9BKHczdH20Dlv5nsyIiPoS
         gss7dj6kesUmXBerrjZZeGs+19T8HMj066AD/i5u0cNXO/fFXMSss/4Gzm+cCquvjGeg
         ZMpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791180077; x=1791784877; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ld5/fX5W6z0SgiJe8TVQR+gFiVM3d4IWodLzS6BeG6Y=;
        b=ozU4s5hs9wV0Mopa+WZ3EbAgfKPr8txCT73q1WqWF2iNdSQBuhbdom4ssXKJCZGkEQ
         xTulC0P56iMp+Z0OS6KdbxgHWAbSTy7vWZd5brXDpKgLNh8/Kj4jc4DvFlsB/mBviObt
         zNoQUSYYOOFCImb0XRUDpxsPpR5KAaCuiRGbzEt01M1GAdCiIX7B8KQZK+Nsktcxq8oJ
         SG3KqLLQizi3JobCulod+5iVl1IFVfzYD0UOZByrxrw3ZeiV4SskuOYoy/SXYx3ZmuIC
         fyjRT4xX9yEYCyCs7I9BMf4wVF4fd4NbweUowz/vGFWyVzAc5cEJ/Q7Jxy9QJ8jAN+ZO
         5RzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791180077; x=1791784877;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ld5/fX5W6z0SgiJe8TVQR+gFiVM3d4IWodLzS6BeG6Y=;
        b=c6TU/TxOmnWFu7PLDnS18y3G5E87MmkbBVlhhpTaIKzEQr0r45Z4vzkhtWGsyMCw7y
         0uqGRia9btISb0fuyrW9rQMG7umomEPEnO6NYt2xi9aN45R3pYU+AD9dlzhWVBHcPtID
         kj8mVbAmsfJD3Sn7E0ji5K6ZWnBHhSnq89jt8iWaiyPvy6Q3BuROf4IFmSnUGnNpscM0
         7DFwabhzZKKrTrP7ksQ6YdusT6VSJZbN7rmJcwt58oiJaJQmQkAiCMeMys0ABOM/iKfz
         JZDpGoiB97n9mCZxgII6TBe/CY8YHYOZhDqHfV1j01Hyu+fmMqdDq1jmnmc13viHDakP
         6iqw==
X-Gm-Message-State: AFuF++lSrcvwZ+YIV9VRUDMIEfjbIPtObqWSOYfBgYM9g64MQNUI+mHj
	HfmO8O7SlJJIdJctV7PGkFfesr35ikyczs/0EnbrC9DKhXmXTWUgOOSj26q5GyFS+Gn1sr9jGhG
	IFvtQQLU6NeFiPDm45QPysz8UckU/D1KXv/qEAUo=
X-Gm-Gg: AYBFou2ZOEZqy7y6QH9JR1kgQUQcY+oQoaJS6gXAZP8aXqaXDZKW5TMEjDaNbrFRDeC
	zjHzKkHnCZcBw9tUQR1kH04Zch/YfgdAr3kkR7h4TDhV4Kt8a2Wz7DBNT4XhqcDxKMGdYCIDuD5
	vxZ7GlYVNvN/ny/GpNcHTbrpkIv836fwlddWpg8KV++lDSdvQVCsWyj/NAP4oQKJ4YNLJr+teLh
	isDAUkImjz8eJIJwB257RE72HVba/51vKcuNvRtrsBXPvDT5rHaIU1knVr6F99O7Q97kD8nS3s7
	gQ7pudhM6oePpYq5UsE4tpldGcIZaC8w1p9NLwcoZ/Amx9zrbDB6h1UBe6t147HeXBtd3TUduHL
	0MLOLLOIsZc1mmWLLAwsESWY=
X-Received: by 2002:a05:6214:d6f:b0:915:e732:33b4 with SMTP id
 6a1803df08f44-917c009e2cfmr189764566d6.19.1791180076810; Sun, 04 Oct 2026
 23:01:16 -0700 (PDT)
Received: from unknown named unknown by gmailapi.google.com with HTTPREST;
 Mon, 5 Oct 2026 06:01:15 +0000
Received: from unknown named unknown by gmailapi.google.com with HTTPREST;
 Mon, 5 Oct 2026 06:01:15 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Piyush Kumar <aryanbabupiyushbabu@gmail.com>
Date: Mon, 5 Oct 2026 06:01:15 +0000
X-Gm-Features: AclHuK8KYHOIwrooZ356Qpe5ERx6NlVdXoIq-BbN-cD0J42bGb3MzPi-FBuXJs8
Message-ID: <CAC604MZ_ssUJO+BFjvDXxTCt_uUGveQeH-TmrBdvJrGGBGYh9w@mail.gmail.com>
Subject: [BUG] hp-wmi: Mute and mic-mute LEDs not supported on HP Laptop
 15-fc0xxx (board 8DC9)
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am writing to report an issue where the speaker mute LED (F5) and
mic-mute LED (F8) are non-functional under Linux on the HP Laptop
15-fc0xxx (Motherboard DMI: 8DC9), although audio muting itself works
fine and the LEDs function properly under Windows.

This issue is tracked on Kernel Bugzilla under Bug 222044.

Hardware Environment:
- Laptop: HP Laptop 15-fc0xxx
- Motherboard DMI: 8DC9
- Subsystem ID: 103c:8dc9
- BIOS Version: F.25
- Audio Codec: Realtek ALC236 (103c:8dc9)
- Kernel: 7.2.6-zen2-1-zen x86_64

Diagnostic Summary:
1. ALC236 Codec Control Ruled Out:
   Direct hda-verb coefficient writes (node 0x20, verbs 0x500/0x400 on
indices 0x0b, 0x19, 0x34) return 0x0 with no effect on the LEDs,
indicating the LEDs are electrically decoupled from the Realtek codec.
2. The LEDs appear to be handled via ACPI / EC under hp-wmi, but lack
the necessary quirk/table definitions for board ID 8DC9.

Diagnostic logs and WMI/DMI details are available on the ticket.
Please let me know if any further dumps or testing of patches are
needed.

Best regards,
Piyush
