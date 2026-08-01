Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853C53911AF
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Aug 2026 14:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785595560; cv=none; b=dQCv57+xDIrLz5tJLoUrR6qXCE73iGAGrdO6w8bWnECp9QsbAXwnIvg15jS9bShJutFOuRxvLY0pb++AIfA32oD6rCVG10depRNOHvfJWbWHS5LFTbv+n5ahK8e4hqv60jwaxdT0jm9plM7QZ+wtdTLnMyjfuNxHEIguhayOst8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785595560; c=relaxed/simple;
	bh=KQOed2pypt6Ma/meVK6i5cx6qB9B0YpNenFSdwTXauE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OC6RmwV/aCjzy2XPNLpgxL9Z1zepjU7Xg/Uslg9wicFis93hSn+DGEuewaTzogxlsOcj3mFxje7D2YfkH69cBIBhXRJukZkgTi2slEZJc1+m4DULivX9bk55vm5J9lz8G5tKwU1uohbuqhIbkM8zAZCWeyQue+I9eaQgyC8aKWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethicsbowl.ca; spf=pass smtp.mailfrom=ethicsbowl.ca; dkim=fail (0-bit key) header.d=ethicsbowl.ca header.i=@ethicsbowl.ca header.b=HxLyMeVq reason="key not found in DNS"; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethicsbowl.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethicsbowl.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ethicsbowl.ca header.i=@ethicsbowl.ca header.b="HxLyMeVq"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84874b52eabso2781622b3a.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 01 Aug 2026 07:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ethicsbowl.ca; s=google; t=1785595558; x=1786200358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5QyIVdP2jnluVAcr0hBunwnf19HKMctrMwfdu/rLVKU=;
        b=HxLyMeVqGACqscfB4UO9ldH4YUq1k/L5iHCBGK6vK4amcPdziGyQrGzCGzkF7ZP9a9
         B/WGg5+7gR5eczn1PwN1hFbms8O59BhsnNvKNAdcVWxKuRX7Iz2FqNrnTHu17jybXB9H
         EQ0nf6xKgoky3F8XFFiWVnPfhpLfro5p6+vTWLGVIGxAUaH01TvWF1IlJ/cCdD+aYgGx
         Y6UVZYDeFxnplYh+ZQZ0KTkuKCLqulm20+mOWOK+8Kn45+uB/tZYQHdZglFnp76j2mQ+
         j/ypOvatbUQUw6+WWHbOx+Pc8oanMUCy6VoxTSuL3uMd2mPf97LZ0Xy9D6sb9Y38Ah0x
         6fCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785595558; x=1786200358;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QyIVdP2jnluVAcr0hBunwnf19HKMctrMwfdu/rLVKU=;
        b=XKa1gFmyRfA8XZohGz9vNIfQ4aDzyqR3US+U7xgXr+ESYmU1v8+f7y4nG7y00jYS6a
         BmXpzkidMvkNewpty30oi90Guo55lSrH90oUmbP5lnx0IaxrK31F2QUWTj8VFZnWtnz+
         gT3jTIY+DF8Tjuv4XJmji1pz6t5PzMWGVy2s2PKYww9LeM89lP8hxCtSE/jrpDgtWKAP
         bGxOPY/AaKA8GyX2CR/eNbyyrl1g6R/REOdsi+lrSBnYq9J1w82wTKxUX2UeWH6s9f3p
         NdCTOeSvSlYJjtnqD9EY2rbe/fEdW64rJ1MWEnaepCWHLAso57Iqrmvo52qUIt0avyrf
         ZpMw==
X-Forwarded-Encrypted: i=1; AHgh+RqcqgKcpGsD+dSD7tPVA2z2X74RMv8zE9IRbaMKcxY/W6nYsrKA+wEddTzLo0+8tGFvCn5IJWsvRo7xhVFFnmo3Xw2v@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1kUVIXiRaegtOLDAPE/izkCx6Q+r0SUg+upWk5lU2mcTDE6SV
	01+9XBBQs1HqFPoo6UAYqz6qYxTx9LYFQJBu2lJDZLglQkzaQgW3u6k9kZn/M1tyo/I=
X-Gm-Gg: AR+sD10eT/5FmQKWeUP013oPtMXZAf9XM6cqw0sTeKYomKQ3K5I9ZnHL+QerZZberPB
	/hyzFJG3bK1zrfgR0PTMP8NpnCVKh7fLmD28oHWbbVQfeCd5H2dqaMwSupfTr2xTwKsn2MsVwVE
	8Ru3CYOKu0nx5y8HWmn7+X4fwynuoLASVs6JyyZXhBYpRV5pX8WtypD0tXBssP51B1HQq8sEQKa
	BTbAVxxvi1jswsgp7P62XLzrY6/PooApMkVn+t3j2cm0B9G7tfocxJ4bfa/Y0GlkK3iGelbiFSR
	6/76ctUr8MWXEeD9yVvuxexDb3T8/PGxxK8PtP3Ohmge4j3rDCiO5JFrRjkQFWYNBpoKPBAOGWY
	ScGLIVPkTjyyQI8xuiCtHPGGHEND9Dq0mOKz6MpO0ID9fsASU+wDYws+DeI86X6WgpLNRUhtlZS
	YieVb3LD0RZSiI5cgH5n2eNQ/vWg8iAzRaznaioupJ3GcsSjG8ly2isNqD76utbxC9h71jyzK8A
	g==
X-Received: by 2002:a05:6a00:4146:b0:845:44c7:5e28 with SMTP id d2e1a72fcca58-84ee4834c90mr3325978b3a.31.1785595557756;
        Sat, 01 Aug 2026 07:45:57 -0700 (PDT)
Received: from [192.168.1.90] ([64.180.107.235])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39e9f22fsm1739760a12.22.2026.08.01.07.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 07:45:56 -0700 (PDT)
Message-ID: <977f3650-326d-4df9-843c-5e12194afc1f@ethicsbowl.ca>
Date: Sat, 1 Aug 2026 07:44:52 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Robert Munro <robert.munro@ethicsbowl.ca>
Subject: Re: [REGRESSION] bitland-mifs-wmi: power-saver write is accepted but
 profile remains balanced on Redmi Book Pro 14 2022
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Gladyshev Ilya <foxido@foxido.dev>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 regressions@lists.linux.dev, Mingyou Chen <qby140326@gmail.com>
References: <ae3f4f58-0326-45a2-bbee-b71ec44cd28a@ethicsbowl.ca>
 <e9fc777e-fccf-4173-a564-3846396ba6dd@leemhuis.info>
 <036a5e30-1eee-4dca-8fd0-268a1d6536eb@gmail.com>
Content-Language: en-US
In-Reply-To: <036a5e30-1eee-4dca-8fd0-268a1d6536eb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-07-21, Thorsten Leemhuis wrote:
> Side note: Robert, have you tried if latest 7.2-rc works any better?

No. I have now reproduced the same failure on:

     Kernel: 7.2.0-rc5-1-cachyos-rc
     bitland_mifs_wmi srcversion: 9A432DB17D1453AA4DD476C
     power-profiles-daemon: 0.30-3
     kernel taint: 0

Starting from balanced:

     $ powerprofilesctl set power-saver
     $ echo $?
     0
     $ powerprofilesctl get
     balanced
     $ cat /sys/firmware/acpi/platform_profile
     balanced
     $ cat 
/sys/devices/system/cpu/cpufreq/policy0/energy_performance_preference
     balance_power

I polled platform_profile every 20 ms around the request, which took
249 ms, and only observed "balanced"; it never transiently reported
"low-power". All CPU policies reported "balance_power". No relevant
kernel or power-profiles-daemon messages appeared.

Unlike my 7.1.3 report, the EPP is now "balance_power" rather than
"balance_performance", so the CPU-side behaviour is different. However,
7.2-rc5 does not fix the platform-profile part of the regression: the
request still returns success while platform_profile remains "balanced".

I asked the sol-max agent what the standard way to report this issue was 
and this mailing-list format is what it insisted I use. My apologies for 
that.


Regards,
Robert Munro
