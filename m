Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9270C3EDAC9
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 12:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787746134; cv=pass; b=dCCZkHZRt89LVFpRJS8h/zoblysKVj/YaFcnk2sO0P7xIir23P8iN5CN8jcDs5eZLZ2MgXbb3bf1Sm7faUkDqdAugsSqb1bo8BFcTAvHfHsqSNhkvOXIFr4cWkcBdedA4+TTCU6/N+yhrynpUY8n8zCDomBZK1E6pIaJOh+OJ5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787746134; c=relaxed/simple;
	bh=i2OBV9PJtp75LOyDi8vplM+hJv6BpBM8NhmGfbSk/38=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=L0fvNSUauajAKrFrj0jaebnqP+yeab61cWa7gb8qkDEIzNMT5PilwvHEbI30xujyI53j1KH6I88vs6BPdhNWX6maI2qxxfmXBh0g0jvpgvX0kRE90V3FM1lUv08YfbgyJJrF6BDnCm4prQkVVFK5rTTZ0XpZgXg0bUbzay1hYns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p0nEHtiO; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p0nEHtiO"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7ec1e9d3359so601286a34.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 05:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787746125; cv=none;
        d=google.com; s=arc-20260327;
        b=oeyXdQVFAWOtAHHfsZGtp6xTbgEn5fqL3H4qVi0xD6OzX+p8dybNT6Q3LKUCFvO770
         rjklw1WLPrBbZTdGCk0h5wgUO4b8fwnsO01QkBY1XE5gKsJ+nVd2oYQ1z7iR214BCy6G
         WE+7bcndwMZwNT64W60rmWw9YqRpEVKZp2k5k9xMbGW1pHHmp0Zn8H9qU/hc1NPTIgo3
         2fqehaUFpn5/eWK9kqHFBE7rnrIFa/lCb48oES4jy0WCaf3ntCKQ2kfg/vV2fz+e9vGs
         EAOR0o2AikPiF8B7QpqoWE4Pldb0Iq6kA0xClF5RrsO8JPx9jImvq5ptFH4zPupjfiLG
         nqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=i2OBV9PJtp75LOyDi8vplM+hJv6BpBM8NhmGfbSk/38=;
        fh=B7dC3TaicGz8Xe1C1D/QdLT78ouLn/jUfgk9eIrhocg=;
        b=MLBC3TC/2mzwX/TjoQwyGQc9abtLIwiSydcIr7pIHiwyrv8WTwloNlri9njdVWxj35
         P8CM2MtJdWIcl3NYgY1g3p4r4SWcTZ9z/FbOjn4fNWnvGyLYUOq5ncvDp8oup9ImoSl8
         6mgKeJqAZIFUZxQwdH8zWT5rEhLfWzn+DqNEV7idQwhgRDErqBg7vmv3UNVijiPzolHh
         +qPAkrH9ap/Jg+En1k2wgtjVDGBXeHEq7DVTcQry0bggZbLOeBDSAWPOjXY57ib9xuqZ
         fQK0o6AptESs+Fy8g8n84O+yi7AL5s156M8ojLiJC83VEspljziLems1q9xzpDN1dfWb
         O6aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787746125; x=1788350925; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i2OBV9PJtp75LOyDi8vplM+hJv6BpBM8NhmGfbSk/38=;
        b=p0nEHtiOTwcy7nA6y766SFPKk/697EvWtNgOn14ii0wEN3yPCf6fDCOktpE5+RrdF/
         xE0XXCJ6zHz7kxxdzGvEod3GXia8qk/r/2VDUzy3N1hLazadUYARS5ENDbwBK9ALOKpQ
         HgIpXsGUdiKkbyXWe/kWPwlFw08k+N4Sh39bGdl9cAdkMzJ+GgYiHRCZqZn5ClQ9/C0p
         54/mM89s1m1vCQq4UjSq0NglVsTdGT8fnZgaytGusLqI9ni+geWbzagZMxxwOIpREc6f
         tdidJKJS2aSWjSDARTcOXD4OCU/w1ay4Ui2e5d0+3J3DlBvf81B1Z6hE8bRsuBH+idqK
         yePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787746125; x=1788350925;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i2OBV9PJtp75LOyDi8vplM+hJv6BpBM8NhmGfbSk/38=;
        b=pNji7v1swvvnzH4wezSDvFOM2sarw369Qnz6CIfZf58lTpI3HHxi4kCMwfaEO8P3wH
         3cUAn239a60oDb5n/i68k05WF8MQQfB3YA5LeOq0eq3+LhYGVcg1J1OxWPBdRUgCLa4q
         OS232Nq9W7oiwDGrXjzJ+zw9hm9XPq+3Qz0n8XhYrEPBd0UDTSzQwRCTGU0LEAeKO8ld
         3fTLUiKLhdG5XIHYJMyUYYNLcnkZgIjqLeEsRD7/3OaQpcl2To2+71f7jZEZkVwx24ZV
         3F9DNEr9DET5RnXGxV6Nvwufi+H6N2/6WHRJ4+zCMdr5J5hUbqd82FG3exSx5LOx3HDa
         c4oQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSVcgFoq3fNSzX2e8gYz0YXttwEbcYyiRNc7AFxQ4x4AOZd5VFPrOJ1MW8bXeHSrbhPCVkjP2a4wI8PbRuagYDtvhW@vger.kernel.org
X-Gm-Message-State: AFuF++mmxUBeRsCQsaXaz6hVvpe3mj2kKXt5N559dRG92ATvbf5upouS
	g5TDi+T9I2J5CV0DSJmr/umugT9vCztOvc1N1zq7boY45tr+EAUQ4z94qfSuhrN/OyOZGlL78aR
	vJ9pLJKnEHpqi/SEIenm65UjAUrjM80ZRe8nnQH4=
X-Gm-Gg: AR+sD10FQccrm8i71dQHXsYRzuOKj0vLdER4Ylx7rQ+rrX89ondleTD+W1DRdiiKHgX
	xCo5a3tBM1xmFAk5HaKH2Is8hkrk3Z3DqX168Ni+nGS+WuW2YibRPZxdf435P5LeCrKzrIDnPFt
	9lUujESJBlRQJnDqskGPrtj5PM9t0OJmg3SKTUaQD/Tqk/Sk36OjzwHKHLmtYQujnfTQbwoqqGx
	4jdmK6AwN5uh8X2PvKEgUv/IX169SrlF5c7ukOBDUlToU+xT5OiXns2gihZjsa+20FoTFMN8K+x
	hjX61ZOEXqMuxT5/azOl8gfmoLxWoJ4aV1fiuWIY1dG9pq2EPepufT6L5ywM1w+QN24S6tPljPn
	6
X-Received: by 2002:a05:6830:210a:b0:7ec:2fe:1ec0 with SMTP id
 46e09a7af769-7f4c4de4a6bmr5725547a34.4.1787746125153; Wed, 26 Aug 2026
 05:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Arjun Mandal <mm3885525@gmail.com>
Date: Wed, 26 Aug 2026 17:38:34 +0530
X-Gm-Features: AcwNN1Vl7IHW3jESAI1MQOR2zQa4VgwRUTCYOiRWBjlVoU_ok_SgBgeUaLs-7Vg
Message-ID: <CAD12wXtZK_YLV543sfbB-CoXe6ij7Ku_OBqeW-E54q=XhPNCsQ@mail.gmail.com>
Subject: bitland-mifs-wmi: platform_profile write fails with "Operation not
 supported" on RedmiBook 15 Pro (i5-11300H)
To: "qby140326@gmail.com" <qby140326@gmail.com>
Cc: W_Armin@gmx.de, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mingyou, Armin,

I'm using the bitland-mifs-wmi driver on a Xiaomi RedmiBook 15 Pro
(India Market, 2021 model, Intel Core i5-11300H, Iris Xe, 8GB RAM),
running CachyOS with kernel 7.1.8-1-cachyos.

Reading platform profiles works fine, but writing any value fails with
"Operation not supported":

$ cat /sys/firmware/acpi/platform_profile_choices
low-power balanced balanced-performance performance

$ echo performance | sudo tee /sys/firmware/acpi/platform_profile
tee: /sys/firmware/acpi/platform_profile: Operation not supported

This happens for every profile value I've tried (performance,
balanced-performance), even on both barrel DC charger, so it doesn't
appear to be the AC-type restriction mentioned for "Full Speed" mode.
dmesg produces no output at all when the write fails - I ran `dmesg
-C` immediately beforehand to confirm nothing was logged.

As a result, power-profiles-daemon fails to switch profiles entirely:

Failed to communicate with power-profiles-daemon: g-io-error-quark:
GDBus.Error:org.gtk.GDBus.UnmappedGError.Quark._g_2dio_2derror_2dquark.Code15:
Failed to activate platform driver 'platform_profile': Failed to write
to acpi_platform_profile: Error writing
'/sys/firmware/acpi/platform_profile': Operation not supported (15)

For comparison: on the same hardware running kernel
6.18.42-1-cachyos-lts (which predates this driver),
power-profiles-daemon works correctly, using only the intel_pstate CPU
driver, since /sys/firmware/acpi/platform_profile doesn't exist on
that kernel at all.

System details:
- uname -r: 7.1.8-1-cachyos
- Model: Xiaomi RedmiBook 15 Pro (base 2021 model - not the later
"RedmiBook Pro" 14/15/16 line)
- WMI device path:
/sys/devices/pci0000:00/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4/
- Distro: CachyOS
- System product name: RedmiBook 15 Pro
- Baseboard manufacturer: TIMI
- Baseboard product name: TM2039

I suspect this may be because my model predates the newer RedmiBook
Pro hardware the driver seems to target, and may use a slightly
different WMI method layout - but I don't know enough about the WMI
internals to confirm that myself.

Happy to provide anything else that would help - dynamic debug output,
ACPI/WMI table dumps, dmidecode, etc. Just let me know what's useful.

Thanks for the work on this driver.

Best,
Arjun Mandal.
