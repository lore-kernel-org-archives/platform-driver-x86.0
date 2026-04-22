Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BBB18FC97
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 Apr 2026 00:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776817141; cv=none; b=khbzZz3Axk5FUD6kvfCFIOPKN0Qk3hrYfizojzV0zefdUT0IYBOTBz/ziN7bLTx0uxUXFa+pqNB26Q7OQ8j/xjaj6uLyNxh7lRm3gc+pRp0YkBmrcYcFC0ftUldG97sApl0/jKbRUy8UC6Iw9ypoD/CelBLj4K089jK2MW04Ieo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776817141; c=relaxed/simple;
	bh=VM/AU8fqs/tbU/gzohS8srZPcMcGr9URI0nFagfdoeI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=fEcYs5PnkWJscOkpnaIyefWAAvKfaTOBZMgEb4TAG5g8VS1TqYx5+xhzE7zzgFX+I72PDYwQhzOSNXYMS5/aFBCno2/lZ0UeYg4vHbCfcEeeN10rKqxBQ8KXPeqa4fnuuqeshRhyxoEzagrDkftFCjJmdPYVDFw41YI8x9JIbbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hViDBVyF; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hViDBVyF"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8a3342d301aso49403916d6.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 17:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776817139; x=1777421939; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91WM7bcY0FPG+GvQUi/O55GfvYUTGmEFOiTffbaQo94=;
        b=hViDBVyFS0krDXp5cXsijMJIM9eqYQoglN3XQkOQt3uxc17kBk28M1IubJ+qQDLGTQ
         YOyr7v3Gc2BF001SBjktbaC1QIBClTFi4X8GUSVEmG5X2qefdUNQHRxBpwKxJevFtdi9
         YxZ3mFn9976kEBILvmm5biHTJSIqRwHMVGXchK8DpAQwp9Sdza4WUJW6IFVm8T50jw80
         YmqIXMfB33N1jSQqvEwEdlurRqo8niRqFLxEMfBBSg/onaJ0KM4iFEbpz3YeOPq8+Hf9
         5pLcwADNWESNkoHBs1gFBoqg+DnqKzDeRkISQmfPwFID9QJogZUG6s8Z5/YsLuuavYLk
         o6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776817139; x=1777421939;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=91WM7bcY0FPG+GvQUi/O55GfvYUTGmEFOiTffbaQo94=;
        b=enaghrTDacQHMcekPviiLuNuFsUE5vfHR1hyFs2uWni68HyDJRq5aNOxY4sLud6/vE
         2ITtezptG7E0eMMkGrw0Qzm51WAsrZYktBpPZkchowfzAAiUlVIlfk8AY+4RPTOUs+kN
         AP4dRv1m3J4lr4gfvOwJoG21NOmFtVDwBU7ITINKAYKxyfg//ysq392ahX+DqdVKCzMc
         c91SOyYIQJ7kmFRqdUgFc2TfmMNv11kB0q6yCe3uGOt0Tv9GitVnWsuzc8LyciIqU2aj
         +hUlzWz1NbzZSE6uV/rzpLOn6KboFfAds+5P89kPOwN2Z2mi812/wujDpE1rdPchvblG
         hqsQ==
X-Gm-Message-State: AOJu0YyPn0zLkh+vwG80Dp9Rkmu9UKb2Q4WAlFzooiauMzGeGBjFGZLr
	i0vBoOW1NQw9Rs6NjU7wctmWpYClHYYT5dn1jsKpAJD8fLeJp3q2LfLnAEIYn86lq5Q=
X-Gm-Gg: AeBDievzA9x1nRy82ZIOs/VuZvRiwHR1fVfuLh5dizXEuRa6+BOGRfJzVDhQ2YEAB2k
	UlL6R/zJRcFVL6yZ6x7BdfUBbTuf2rFcITzGl5OF8X20LyqvX6v/gh+OuHiFpGi+/t/JC4hbB46
	5cerI42J7z3XAKdvkf7XTh1xbcsr4IGaWmZjiHbjaE/WXLZf4Z8Mzhwnney01Gybg3N3c/JeeDl
	KRAAzMYc9H2BdpOORpXzYAoz3fa3mtIBqyiKIexvFxdzSTRfp5t5czoW+521fb2wI6Pna4Ad98t
	7bY8GW0WYB2d1Oncp36RHI6QhLk1pxx1z4Buah2eeH0RNVFaN6sLRjj9sIlwuFcDByzVuYN8I15
	c0LbQF4v3J7YR8ZOky18ojtMDnv3Le3vP3NATpYEhNQQZsInneEhsa4mFnkxeHV7iKjS23LQJJt
	WkifvRIJizI0vY7e7MZJOBidx6S4VpZHYQZmERFlRdmKZcS8rWWIQx6BI1fIhZq+RM+T3SqR1uY
	SaXHJhK
X-Received: by 2002:a05:6214:5b87:b0:8ac:ab13:8f15 with SMTP id 6a1803df08f44-8b027ff994cmr357712266d6.7.1776817139095;
        Tue, 21 Apr 2026 17:18:59 -0700 (PDT)
Received: from ?IPV6:2601:154:8300:ee0:1853:44ea:a4d0:a8a5? ([2601:154:8300:ee0:1853:44ea:a4d0:a8a5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae7d79esm113799706d6.36.2026.04.21.17.18.58
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 17:18:58 -0700 (PDT)
Message-ID: <4ae4d7f9-f1db-4394-b0d9-c75dc39afcf8@gmail.com>
Date: Tue, 21 Apr 2026 20:18:58 -0400
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: platform-driver-x86@vger.kernel.org
From: Benjamin Young <benj.n.yng@gmail.com>
Subject: hp-wmi: Fix thermal profile board classification for HP Omen Max 16
 (8D41)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Subject: hp-wmi: Fix thermal profile board classification for HP Omen 
Max 16 (8D41)

Board 8D41 (HP Omen MAX Gaming Laptop 16t-ah000) was incorrectly added
to victus_s_thermal_profile_boards in kernel 7.0, causing hp-wmi probe
to fail with -EINVAL.

The fix is to remove 8D41 from victus_s_thermal_profile_boards and add
it to omen_thermal_profile_boards whitelist instead.

Tested on HP Omen MAX Gaming Laptop 16t-ah000, BIOS F.21, kernel
7.0.0-1-cachyos-bore. After the fix, hp_wmi registers successfully as
a platform profile handler.

