Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619536;
	b=q8JDf3UTIpLPp9vC1xPsgIGHxLE0wyDqhf/siYTL5JaJrctg0YEPKMk8Y3xFx4rJ2tqm
	 +L8ebMvmPk8LMkEf5sdJSp2jX8uYEsqa3S3+hBNu0WLwQPVyUz2D/tA5T5RKASyNZzCAw
	 kyFnIDDSOm0FfhEb7vsQTqpve2ZwFiavW9SExxycT444EvFuP2gDkP4hDEKR4EXBR+K4S
	 5vyt0AQS1OJMPBkKoXpvH1y02U1RywaVX/0nu/F9Mbs/LHlFcdlI+0Lp1vTGBecDHMv7B
	 xsPZWt87cYBwHBnzzRjhY/1Hm4CfH6NAIyWvjcC1NvWhDYtcuNp5/E1Kalu0MB++4Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ElgVmBZSI40ArvK7n+gAM2cqYteYpfiSDzMahlW/TpY=;
	b=D5zqQ7tEsqgJr+KDYioXFiP2fLCWndbOGES+6rETxH8lSVtShbYRzkXiYS0DWdyt8/30
	 Lk2IFxZcxJf7GM3xcBCgDfRC8mAySmPoxTpIrb7vn9y88cllM0LmGAAK4mV9SPbAnylaa
	 cygiIkE3Q7AjJrFyLsnUXTIx8VKaIMgD5EQCqP5LLYAzwBWMgGmdBQkkRR7HhxFHOId87
	 bReOALoj9zI64lRoj6PcBGAZ8QScf6bkK6BcNS2bmz8/67zJRF/94Rd5s2jV36BwV2rOw
	 19pOBye6dD0FJPMeH4YwbU5aPodb45z+8Kmsil8eNGMgX/UvLx8Kfzkaomn/5H5VMqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="n5/MBIhn";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E849606A31E
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 15:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E849606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n5/MBIhn
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so9785576c88.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 07:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795619535; x=1796224335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ElgVmBZSI40ArvK7n+gAM2cqYteYpfiSDzMahlW/TpY=;
        b=n5/MBIhnCL/zVOA4b/c1x6qcbGRbxNI+kGSh4sg5AuoYqgX66GuM/5qxAAePmcoMoV
         osD3sDhJa5TKAF1RlU1uYAerep9tcobEaSKo2BHJL0zaOE0oA2/+NicnVx7unk0eAi+L
         o6e61z/0F5neL7/Uy+NZbmX8gSB4ZLcdw3TZIhof1b0RA0Tw29Xy8LDwYJ7q52IjkFmE
         ykVr4O4PveiSYxZJJDLI0FqrjIaQESglA0qc2+Vu5GJhc3FIK8WSM9gPZqtox2NYTCEg
         YaWdzcXJifRAw9G1KVRRiiPub1FqE8NfnhV+CpmX6Nos276Ym7MgiADCx63dQiqzQ+nI
         2UBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619535; x=1796224335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElgVmBZSI40ArvK7n+gAM2cqYteYpfiSDzMahlW/TpY=;
        b=wtnfivnoAmrp32dZ35OoX7tLMqR2b7C0Eb6BZ8x5c8EpHy8MqkGBLjFDQqgd102x8A
         vcO6XxP+FOmPtwQvJ/txlpSrJaZrHwxdB8hT4VS3b37PC2Vy/Oxmuus+rn0kgzCg2fpz
         lfqS0EcuxIqUSC6YVRa5SsaWtJ1N0OU3K0uOT3q1T7t1FaC7AJThvP9k8JmcxcZ4yCQd
         IC2krSmaliP8yZBEnXn0tZytg5zOSBJ8vTEaQvvdPTBl1RiQOI7gipG33beSdSyVuoCV
         YDydcYFaOKdQkbQ6k/MpZaENnrRQ4LXGG4xcqEev3wyrPlaQYmMER9f0E9g29AHFVBVS
         Xp9Q==
X-Forwarded-Encrypted: i=1; AL+hErGd+qiiHzM2BlzqC7CuzNWGtaG5uPMFnfynnDY6nRsH+b8dG+gXYkI3v4pMMubyeNxugHpwqUIFHSaw2McfpQwiggKM@vger.kernel.org
X-Gm-Message-State: APuU4Z9G7jklwjtzvkDCq/GrJHDWxWMUzn3X9PiIsVQnW6voxL6sKKHe
	j+8OCYW8aq/buEeihinn8tRYZLnhz5FU6woHRnMX9w2Zl0Z0ryM05m3h
X-Gm-Gg: AZFdTZfIj363ujBymUPgVPTAouyEamLpAPKNqovYOJFcWH8h3dhUTnynLSvDnZpMNNT
	GFT1Cas8/pQ8zOF3h3Ao6ARZMN+8x7TLzdk6NT04NlcvFB/8fpckz5atQD2hY+EseeLpHG2ub70
	0Tlkyn67nsBMB11M7hpfzqCi+JJ3fpC/9y4Vhxvw9jlIfVzANn5WA3j69H/KAC0hQSTfEdsgulq
	LtzK0+3D6WJZv8bUgrMSwP8xiL2Q3YxURgnq6AWoBBxSsl59camHGiq/JYmkLPJ3THs+67cK4Dg
	AtrgVEOnCytOOvXM3bSovNzlo9iUEjDwP+uNbVt9YNpNYqQIQKt/zpvQUGLDVjRSnWBS88fWeMm
	FN2x98WUChN5AxQQPr5geZp+4Pk0GS/nesWWhOgPlLeaxwhnY3Z2ximzQmRB/uaUukQzHASjdG4
	vKFMjDOFApBx1Sx1gZkwPI3yMLraVzriaZqkhENuLbvmVEBjKTVWf3NoiX3whQOYHEtU1nXi3wN
	Si5Xci7/baaLbZx2ognA0H5oq2ovRyhIgHI6tKrdXDAljX7TSLYeOKIVIk9coqgwz9Zb1vVj82K
	AIOhpLPtooyPHBwK
X-Received: by 2002:a05:701a:c9c1:10b0:15e:6541:3099 with SMTP id a92af1059eb24-1b55687eb4dmr16271046c88.7.1795619535175;
        Wed, 25 Nov 2026 07:12:15 -0800 (PST)
Received: from arch ([179.255.154.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm51090121eec.13.2026.11.25.07.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:12:14 -0800 (PST)
From: Zheng Shuyang <yhshzh0@gmail.com>
To: =?UTF-8?q?Eren=20=C3=96zen?= <erenozen@protonmail.com>,
	Fuwei Xie <12313607@mail.sustech.edu.cn>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 0/5] platform/x86: huawei-wmi: expose native firmware power profiles
Date: Wed, 25 Nov 2026 23:11:49 +0800
Message-ID: <20261125151211.83173-1-yhshzh0@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <Tf4l0QLSFWfEcunMVtUNowKIhzNRJjmjCYJKXUFzo-5xhOXhZpn-sUEN57KHkDgKanu1FrS-JHBYcI3K7Mjv176Tg0kMQ4QPIUoEcsYKQig=@protonmail.com>
References: <4F34E5193B4633F6+20261124172651.37716-1-12313607@mail.sustech.edu.cn> <Tf4l0QLSFWfEcunMVtUNowKIhzNRJjmjCYJKXUFzo-5xhOXhZpn-sUEN57KHkDgKanu1FrS-JHBYcI3K7Mjv176Tg0kMQ4QPIUoEcsYKQig=@protonmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Eren and Fuwei,

On Wed, Nov 25, 2026 at 08:17:27AM +0000, Eren Özen wrote:
> Zheng, did your s2idle test on FMB-P start in performance mode?

Yes, my earlier v2 s2idle test started in performance mode. I just ran
dedicated s2idle and fast-write checks on FMB-P (BIOS 1.16, Arch
7.3.5-arch1-1) with power-profiles-daemon stopped, on both unmodified v3
and v3 with your two changes folded in:

Unmodified RFC v3:
- s2idle starting in performance (plugged in, ~9 s): on resume, FMB-P
  preserved performance (cached=performance, GTUB=1, ODVP2=1). Unlike
  CREM-WXX9, BIOS 1.16 does not clear Turbo across a plugged-in s2idle.
- s2idle starting in performance with AC unplugged during sleep (~11 s):
  on wake (AC=0), cached platform_profile, GTUB, and ODVP all matched
  balanced (GTUB=0, ODVP1=1).
- Fast writes (6 rounds x 50 balanced/performance pairs, alternating
  final mode): 0/6 stale rounds (cached == GTUB after every round).

RFC v3 + both of your changes (method resume sync + 0x2a0/0x2a1 using
huawei_wmi_profile_sync()):
- Built with W=1 without warnings.
- Fast writes (same 6 x 50 pairs): 0/6 stale rounds.
- Fn+P and s2idle starting in performance (~7 s) kept cached
  platform_profile, GTUB, and ODVP in sync with no kernel warnings, and
  module unload/reload was clean.

So on FMB-P, \GTUB is already updated by the time 0x2a0/0x2a1 arrives,
and both of your changes work cleanly here without regressions.

Note: Gemini helped with the test scripts and drafting this report; I
performed the physical steps on the machine and verified the results.

Thanks,
Zheng Shuyang
